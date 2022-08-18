package com.kh.limit.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.limit.member.model.vo.Member;
import com.kh.limit.mypage.model.service.MyPageService;
import com.kh.limit.member.model.service.MemberService;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService mypageService;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	

@RequestMapping("myPage.me")
public String myPage() {
	
	return "mypage/myPage";
}

	
//정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = mypageService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", mypageService.loginMember(m));
			
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
	
	@ResponseBody
	@RequestMapping("renickCheck.me")
	public String ajaxCheckNick(String checkNick) {
		
		return mypageService.nickCheck(checkNick) > 0 ? "NNNNN" : "NNNNY";
		}
	}
	
	

    

