package com.kh.limit.usedboard.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.SelectUsedBoardVo;
import com.kh.limit.common.template.Pagination;
import com.kh.limit.usedboard.model.service.UsedBoardService;
import com.kh.limit.usedboard.model.vo.UsedBoard;

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
	
	@RequestMapping("insert.used")
	public String inserUsedBoard(HttpSession session, MultipartFile[] usedImg, UsedBoard usedBoard, Model model) {
		//ImgFile 이 반드시 있다는것을 전재		
		
		ArrayList<Attachment>imgList = saveFile(usedImg, session);
		
		int result = boardService.insertUsedBoard(usedBoard);
		for(Attachment a : imgList) {
			System.out.println(a);
		}
		result *= boardService.insertUsedBoardImges(imgList);
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 입력 성공 !");
			return "redirect:list.used";
		}else {
			model.addAttribute("errorMsg", "게시글 실패");
			return "common/errorPage";
		}
				
	}
	
	@ResponseBody
	@RequestMapping(value = "aJaxLoadtoUsedBoard.used", produces="application/json; charset=UTF-8")	
	public String aJaxLoadtoUsedBoard(SelectUsedBoardVo subv) {
						
		return new Gson().toJson(boardService.selectBoard(subv));
	}
	
	
	
	@ResponseBody
	@RequestMapping("aJaxLoadtoUsedBoardPaging.used")	
	public PageInfo aJaxLoadtoUsedBoardPaging(SelectUsedBoardVo subv, int cpage) {				
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(subv), cpage, 10, 20);						
		return pi;		
	}
	
	public ArrayList<Attachment> saveFile(MultipartFile[] usedImg,HttpSession session) { //실제 넘어온 파일을 이름을 변경해서 서버에 업로드
		//여러파일을 입력받고싶을때 mulitpartFile을 배열로 받는다 
		String originName;
		String currentTime;
		int ranNum;
		String ext;
		int index = 0;
		String changeName;
		ArrayList<Attachment>imgList = new ArrayList<Attachment>();					
		String savePath;
		int fileLevel = 1;
		
		for(MultipartFile img : usedImg) {		
			if(index != 0) fileLevel = 2;
			if(index+1 == usedImg.length) break;
			originName = img.getOriginalFilename();
			currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			ranNum = (int)(Math.random() * 90000) + 10000;
			ext = originName.substring(originName.lastIndexOf("."));
			changeName =  currentTime + ranNum + ext;
			savePath = session.getServletContext().getRealPath("/resources/usedBoardImges/");			
			try {
				img.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}			
			imgList.add(new Attachment(originName, changeName, "resources/usedBoardImges/", fileLevel));		
			index++;
		}
		 		 										
		return imgList;
	}
	
	
}
