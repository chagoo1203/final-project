package com.kh.limit.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.ResellInfo;
import com.kh.limit.common.model.vo.Trade;
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
	public ModelAndView selectDetailBuyProduct(ModelAndView mv, int pno) {
		
		Product p = productService.selectResellProduct(pno);
		ArrayList<Product> list = productService.selectDetailProduct(pno);
		
		mv.addObject("list", list)
		  .addObject("p", p)
		  .setViewName("product/resellProductBuy");
		
		return mv;
		
	}
	
	@RequestMapping("resellSell.resell")
	public ModelAndView selectDetailSellProduct(ModelAndView mv, int pno) {
		
		Product p = productService.selectResellProduct(pno);
		ArrayList<Attachment> list = productService.selectAttachmentList(pno);
		
		mv.addObject("p", p)
		  .addObject("list", list)
		  .setViewName("product/resellProductSell");
		
		return mv;
		
	}
	
	@RequestMapping("insertSellProduct.resell")
	public ModelAndView insertSellProduct(ModelAndView mv, ResellInfo ri) {
		
		int result = productService.insertSellProduct(ri);
		
		if(result > 0) {
			mv.setViewName("redirect:/resellDetail.resell?pno=" + ri.getProductNo());
		} else {
			mv.addObject("errorMsg", "비상~ 비상~")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("insertInterest.resell")
	public String insertInterestProduct(Interested i, Model model) {
		
		int count = productService.selectInterestProduct(i); 
		
		int result = 0;
		
		if(count > 0) {
			result = productService.deleteInterestProduct(i) * productService.reduceInterestProduct(i);
		} else {
			result = productService.insertInterestProduct(i) * productService.updateInterestProduct(i);
		}
		
		if(result > 0) {
			return "redirect:/resellDetail.resell?pno=" + i.getProductNo();
		} else {
			model.addAttribute("errorMsg", "비상~");
			return "common/errorPage";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("priceGraph.resell")
	public ArrayList<Trade> priceGraph(int productNo, Model model){
		
		ArrayList<Trade> list = productService.priceGraph(productNo);
		model.addAttribute("list", list);
		for(Trade t : list) {
			System.out.println(t);
		}
		return list;
		
	}

}
