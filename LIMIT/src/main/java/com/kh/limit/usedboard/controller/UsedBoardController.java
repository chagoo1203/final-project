package com.kh.limit.usedboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.usedboard.model.service.UsedBoardService;

@Controller
public class UsedBoardController {
	
	@Autowired
	private UsedBoardService boardService;
	
	@RequestMapping("enrollForm.used")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		
		ArrayList<CommonName> categoryList = boardService.selectCategory();
		ArrayList<CommonName> brandList = boardService.selectBrand();
		ArrayList<CommonName> collectionList = boardService.selectCollection();
		mv.setViewName("/usedboard/usedBoardEnrollForm");
		mv.addObject("categoryList",categoryList);
		mv.addObject("brandList",brandList);
		mv.addObject("collectionList",collectionList);
		
		return mv;
	}
	@RequestMapping("list.used")
	public String listView() {
		return "/usedboard/usedBoardList";
	}
	
	
	
}
