package com.kh.limit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.member.model.service.MemberService;
import com.kh.limit.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("login.me")
	public String login() {
		
		return "member/loginForm";
	}
	
	@RequestMapping("loginForm.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null) {
			//로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			//로그인 실패
			mv.addObject("errorMsg","취소함").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	@RequestMapping("logout.me")
	public String logoutUser(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
}
