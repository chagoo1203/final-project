package com.kh.limit.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.template.NaverLoginBo;
import com.kh.limit.common.template.Pagination;
import com.kh.limit.member.model.service.MemberService;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.product.model.vo.Product;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	private NaverLoginBo naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@RequestMapping(value = "login.me", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginUser(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
        
		return "member/loginForm";
	}
//	@RequestMapping("login.me")
//	public String loginUser() {
//		return "member/loginForm";
//	}
	@RequestMapping("loginForm.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		Member loginUser = memberService.loginMember(m);		
		//String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		
		//System.out.println("암호문 : " + encPwd);
		
		if(loginUser != null && bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			//로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			//로그인 실패
			mv.addObject("errorMsg","취소함").setViewName("common/errorPage");
		}		
		return mv;		
	}
	
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {
        System.out.println("여기는 callback");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        JSONParser jsonParse = new JSONParser();        
        JSONObject jsonObj = (JSONObject) jsonParse.parse(apiResult);
        
        jsonObj = (JSONObject) jsonParse.parse(jsonObj.get("response").toString());
        String id = jsonObj.get("id").toString();
        
        Member check = new Member();
        check.setUserId(id);
        Member loginUser = memberService.loginMember(check);
        if(loginUser != null) {
        	session.setAttribute("loginUser", loginUser);
        	return "redirect:/";
        }else {
            String gender = jsonObj.get("gender").toString();        
            String nickName = jsonObj.get("nickname").toString();
            String email = jsonObj.get("email").toString();
            String name = jsonObj.get("name").toString();
            String phone = jsonObj.get("mobile").toString();
            String birthDate = jsonObj.get("birthyear").toString() + "-" + jsonObj.get("birthday").toString();
            
                    
            Member loginNaver = new Member(id, name, email, gender, birthDate, phone, nickName);
            
            model.addAttribute("loginNaver", loginNaver);
     
            /* 네이버 로그인 성공 페이지 View 호출 */
            return "member/enrollFormUser";
        }
    }
	@RequestMapping("logout.me")
	public String logoutUser(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollFormUser() {
		
		return "member/enrollFormUser";
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String ajaxCheckId(String checkId) {
		
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String ajaxCheckNick(String checkNick) {
		
		return memberService.nickCheck(checkNick) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		//암호화 작업(암호문을 만4들어내는 과정)
		System.out.println(m);
		String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println(encPwd);
		
		m.setUserPwd(encPwd);
		int result = memberService.insertMember(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입~");
			return "redirect:/";
		}else { 
			//포워딩은 할줄알아
			model.addAttribute("errorMsg","회원가입 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "topList.pr", produces="application/json; charset=UTF-8")
	public String ajaxTopBoardList() {
		return new Gson().toJson(memberService.selectTopBoardList());
	}
	
	
	@RequestMapping("getSearchProduct.pr")
	public String searchResult(String condition, String keyword, int currentPage, HttpServletRequest request) {
		HashMap<String, String> map = new HashMap();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = memberService.searchInput(map);
		int pageLimit = 10;
		int boardLimit = 8;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Product> list = memberService.selectSearchList(map, pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		
		return "product/resellBoardList";
	}
	@RequestMapping("myPage.me")
	public String myPage() {
		
		return "mypage/myPage";
	}
	// 정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", memberService.loginMember(m));
			
			session.setAttribute("alertMsg", "회원정보수정 성공");
			return "redirect:myPage.me";
			
			
		}else {
			model.addAttribute("errorMsg","정보수정실패");
			return "common/errorPage";
		}
	}
	
	// 회원탈퇴
	@RequestMapping("delete.me")
	public String deleteMember(String userId, String userPwd, HttpSession session) {
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();		
		if(bCryptPasswordEncoder.matches(userPwd, encPwd)) {
			
			int result = memberService.deleteMember(userId);
			if(result > 0) {
					session.removeAttribute("loginUser");
					session.setAttribute("alertMsg", "그동안  LIMIT를 사랑해주셔서 감사합니다.");
					return "redirect:/";
				
			}else {
				session.setAttribute("errorMsg", "실패했습니다." );
				return "common/errorPage";
				
			}
			
		}else {
			session.setAttribute("alertMsg", "비밀번호가 틀렸습니다");
			return "redirect:myPage.me";
		}
	
	
	}
	
	

	

	
}

