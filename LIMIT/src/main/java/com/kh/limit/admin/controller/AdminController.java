package com.kh.limit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("admin.ad")
	public ModelAndView prodSelectList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		mv.setViewName("admin/adminProduct/adminProdListView");
		
		return mv;
	}
	
	@RequestMapping("adminQna.qna")
	public ModelAndView qnaSelectList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
	
		mv.setViewName("admin/adminNotice/adminQnaListView");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	

}
