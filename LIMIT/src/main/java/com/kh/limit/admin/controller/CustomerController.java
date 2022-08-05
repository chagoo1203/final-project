package com.kh.limit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.service.CustomerService;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.template.Pagination;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("customer.ct")
	public ModelAndView qnaSelectList(@RequestParam(value="qpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		String type = "Q";
		
		PageInfo pi = Pagination.getPageInfo(customerService.selectListCount(type), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", customerService.selectList(pi,type))
		  .setViewName("notice/qnaListView");
		
		return mv;
	}
	
	@RequestMapping("notice.ct")
	public ModelAndView noticeSelectList(@RequestParam(value="npage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		String type = "N";
		
		mv.setViewName("notice/noticeListView");
		
		return mv;
	}
	
	
}
