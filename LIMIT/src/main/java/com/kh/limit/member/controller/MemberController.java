package com.kh.limit.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.limit.common.model.vo.PageInfo;
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
	
	@RequestMapping("login.me")
	public String loginUser() {
		return "member/loginForm";
	}
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
	
	
	
	
}
