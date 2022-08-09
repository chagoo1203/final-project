package com.kh.limit.style.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.template.Pagination;
import com.kh.limit.style.model.service.StyleService;
import com.kh.limit.style.model.vo.Style;

@Controller
public class StyleController {
	
	
	@Autowired
	private StyleService styleService;
	
	@RequestMapping("style.bo")
	public ModelAndView selectStyleList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(styleService.seletListCount(), currentPage, 5, 12);
		ArrayList<Style> list = styleService.selectStyleList(pi);
		
		for(Style s : list) {
			System.out.println(s.toString());
		}
		
		mv.addObject("pi", pi)
		  .addObject("list", styleService.selectStyleList(pi))
		  .setViewName("style/styleListView");
		
		return mv;
		

	}
	
	@RequestMapping("styleEnrollForm.bo")
	public String styleEnrollForm() {
		return "style/styleEnrollForm";
	}
	
	
	
	
	
	
	@RequestMapping("insertStyle.bo")
	public String insertStyle(HttpSession session, MultipartFile[] styleImg, Style style, Model model ) {
		
						
		ArrayList<Attachment> list = saveFile(styleImg,session);
		System.out.println(styleImg.toString());
		int result = styleService.insertStyle(style);
		result *= styleService.insertStyleAttachment(list);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "스타일 작성 성공 !");
			return "redirect:style.bo";
		}else {
			model.addAttribute("errorMsg", "스타일 작성 실패");
			return "common/errorPage";
		}
		
	}
	
	

	
	
					
	public ArrayList<Attachment> saveFile(MultipartFile[] styleImg, HttpSession session) { 
		System.out.println(styleImg.length);
		ArrayList<Attachment>list = new ArrayList<Attachment>();					
		String originName;
		String currentTime;
		int ranNum;
		String ext;
		String changeName;
		String filePath;
		int fileLevel = 1;
		int i = 0;
		
		System.out.println(styleImg.length);
		
		for(MultipartFile img : styleImg) {
			if(img.getOriginalFilename().equals("")) break;
			if(i != 0) fileLevel = 2;
			originName = img.getOriginalFilename();
			currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			ranNum = (int)(Math.random() * 90000) + 10000;
			ext = originName.substring(originName.lastIndexOf("."));
			changeName =  currentTime + ranNum + ext;
			
			filePath = session.getServletContext().getRealPath("/resources/styleImges/");
			
			System.out.println(filePath);
			try {
				img.transferTo(new File(filePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}		

			list.add(new Attachment(originName, changeName, "resources/styleImges/", fileLevel));
			i++;
		 		 										
		}
		return list;
	
	}
	
	
	
	
}
