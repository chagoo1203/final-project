package com.kh.limit.style.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StyleController {
	
	@RequestMapping("style.bo")
	public String styleList() {
		
		return "style/styleListView.jsp";
	}
	
	
	
	
}
