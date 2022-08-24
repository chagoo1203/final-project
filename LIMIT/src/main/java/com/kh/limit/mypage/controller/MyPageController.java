package com.kh.limit.mypage.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.limit.member.model.vo.Member;
import com.kh.limit.mypage.model.service.MyPageService;
import com.kh.limit.product.model.vo.Product;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.Trade;
import com.kh.limit.common.template.Pagination;
import com.kh.limit.member.model.service.MemberService;

@Controller

public class MyPageController {
	@Autowired
	private MyPageService mypageService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private MemberService memberService;
	

@RequestMapping("myPage.me")
public String myPage() {
	
	return "mypage/myPage";
}

	
//정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = mypageService.updateMember(m);
		
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
			
			int result = mypageService.deleteMember(userId);
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

	//myPageInte?currentPage=
	
	@RequestMapping("myPageInte.me")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, String userId) {
		
		//System.out.println("cpage : " + currentPage);
		
		//int listCount = mypageService.selectListCount();
		//int pageLimit = 10;
		//int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(mypageService.inteselectListCount(), currentPage, 10, 5);
		
		ArrayList<Product> list = mypageService.InteList(pi,userId);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "mypage/myPageInte";
	
	
	}
	@RequestMapping ("myPageBuy.me")
		public String BuyselectList(@RequestParam(value="bpage", defaultValue="1") int currentPage, Model model, String buyer) {
			
		PageInfo pi = Pagination.getPageInfo(mypageService.buyselectListCount(), currentPage, 10, 5);
		
		ArrayList<Trade> list = mypageService.BuyList(pi,buyer);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "mypage/myPageBuy";
		}

		
	
	
	@RequestMapping("myPageSell.me")
	public String myPageSell() {
		
		return"mypage/myPageSell";
	}
	
	
	
	


}
