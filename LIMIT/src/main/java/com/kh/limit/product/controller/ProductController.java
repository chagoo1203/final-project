package com.kh.limit.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("resellList.resell")
	public ModelAndView resellList(ModelAndView mv) {
		
		mv.addObject("brand", productService.selectBrand());
		mv.addObject("collection", productService.selectCollection());
		
		System.out.println(productService.selectBrand());
		System.out.println(productService.selectCollection());
		
		mv.setViewName("product/resellBoardList");
		
		return mv;
		
	}

}
