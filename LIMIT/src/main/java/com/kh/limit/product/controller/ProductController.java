package com.kh.limit.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.product.model.service.ProductService;
import com.kh.limit.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("resellList.resell")
	public ModelAndView resellList(ModelAndView mv) {
		
		mv.addObject("brand", productService.selectBrand())
		  .addObject("collection", productService.selectCollection())
		  .addObject("list", productService.selectResellList())
		  .setViewName("product/resellBoardList");
		
		return mv;
		
	}
	
	@RequestMapping("resellDetail.resell")
	public ModelAndView selectResellProduct(ModelAndView mv, int pno) {
		
		int result = productService.increaseCount(pno);
		
		if(result > 0) {
			Product p = productService.selectResellProduct(pno);
			ArrayList<Attachment> list = productService.selectAttachmentList(pno);
			mv.addObject("p", p)
			  .addObject("list", list)
			  .setViewName("product/resellBoardDetailView");
		} else {
			mv.addObject("errorMsg", "비상~ 비상~").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("resellBuy.resell")
	public ModelAndView selectDetailProduct(ModelAndView mv, int productNo) {
		
		System.out.println(productNo);
		
		return mv;
		
	}

}
