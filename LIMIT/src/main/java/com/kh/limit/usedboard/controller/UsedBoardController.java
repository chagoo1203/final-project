package com.kh.limit.usedboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsedBoardController {
	
	@RequestMapping("enrollForm.used")
	public String enrollForm() {
		return "/usedboard/usedBoardEnrollForm";
	}
}
