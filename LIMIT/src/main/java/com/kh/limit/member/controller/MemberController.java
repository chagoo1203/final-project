package com.kh.limit.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.kh.limit.member.model.dao.MemberDao;
import com.kh.limit.member.model.service.MemberService;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.product.model.vo.Product;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	
	private NaverLoginBo naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBo naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@RequestMapping(value = "login.me", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginUser(Model model, HttpSession session) {
		/* ????????????????????? ?????? URL??? ???????????? ????????? naverLoginBO???????????? getAuthorizationUrl????????? ?????? */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        //  System.out.println("?????????:" + naverAuthUrl);
        
        //????????? 
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


		//System.out.println("????????? : " + encPwd);

		if(loginUser != null && bCryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			//????????? ??????
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			//????????? ??????
			mv.addObject("errorMsg","?????????").setViewName("common/errorPage");
		}		
		return mv;		
	}
	
	@RequestMapping(value = "callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {
        System.out.println("????????? callback");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //????????? ????????? ????????? ????????????.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        JSONParser jsonParse = new JSONParser();        
        JSONObject jsonObj = (JSONObject) jsonParse.parse(apiResult);
        
        jsonObj = (JSONObject) jsonParse.parse(jsonObj.get("response").toString());
        String pwd = jsonObj.get("id").toString();
        
        //ID ??? Pwd ??? ????????????
        
        Member check = new Member();
        
        check.setUserPwd(pwd);
        
        Member loginUser = memberService.checkMember(check);
        
        if(loginUser != null) {
        	session.setAttribute("loginUser", loginUser);
        	return "redirect:/";
        }else {
        	String currentTime = new SimpleDateFormat("HHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000) + 100;
        	String id = "naverUser" + ranNum;
            String gender = jsonObj.get("gender").toString();        
            String nickName = id;
            String email = jsonObj.get("email").toString();
            String name = jsonObj.get("name").toString();
            String phone = jsonObj.get("mobile").toString();
            String birthDate = jsonObj.get("birthyear").toString() + "-" + jsonObj.get("birthday").toString();
            
                    
            Member loginNaver = new Member(id, pwd, name, email, gender, birthDate, phone, nickName);
            
            model.addAttribute("loginNaver", loginNaver);
     
            /* ????????? ????????? ?????? ????????? View ?????? */
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
	public String insertMember(Member m, Model model, HttpSession session, boolean loginNaver) {
		if(loginNaver == false) {
			//????????? ??????(???????????? ???4???????????? ??????)
			System.out.println(m);
			String encPwd = bCryptPasswordEncoder.encode(m.getUserPwd());
			System.out.println(encPwd);
			
			m.setUserPwd(encPwd);
		}
		int result = memberService.insertMember(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "??????????????? ????????????~");
			return "redirect:/";
		}else { 
			//???????????? ????????????
			model.addAttribute("errorMsg","???????????? ??????");
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


	
	@RequestMapping("idPwFind.me")
	public String viewIdPwFind() {
		return "member/id_pwFind";
	}
	@RequestMapping("idFind.me")
	public String viewIdFind() {
		return "member/idSearch";
	}
	@RequestMapping("pwFind.me")
	public String findPwView() {
		return "member/pwSearch";
	}
	@RequestMapping("findIdResult.me")
	public ModelAndView viewIdFindResult(HttpSession session, String member_name, String member_phone, ModelAndView mv) {
		
		
		HashMap<String, String> map = new HashMap();
		map.put("member_name", member_name);
		map.put("member_phone", member_phone);
		
		Member idFindList = memberService.selectIdPhoneList(map);
		
		//System.out.println(idFindList);
		
		if(idFindList != null) {
			session.setAttribute("idFindList", idFindList);
			mv.setViewName("member/idResult");
		}else {
			mv.addObject("errorMsg","???????????? ????????? ????????????!").setViewName("common/errorPage");
		}
		
		return mv;

	}
		
	@RequestMapping(value="pwResult.me", method=RequestMethod.POST)
	public String findPw(Member memberVO,Model model) throws Exception{
		
		logger.info("memberId"+memberVO.getUserId());
		logger.info("memberEmail"+memberVO.getEmail());
		
		if(memberService.findPwCheck(memberVO)==0) {
			model.addAttribute("msg", "???????????? ???????????? ??????????????????");
			
			return "member/pwSearch";
		}else {
	
		memberService.findPw(memberVO.getEmail(),memberVO.getUserId());
		model.addAttribute("memberEmail", memberVO.getEmail());
		
		return"member/pwResult";
		}
	}


}


