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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.template.Pagination;
import com.kh.limit.style.model.service.StyleService;
import com.kh.limit.style.model.vo.Like;
import com.kh.limit.style.model.vo.Reply;
import com.kh.limit.style.model.vo.Style;

@Controller
public class StyleController {
	
	
	@Autowired
	private StyleService styleService;
	
	@RequestMapping("style.bo")
	public ModelAndView selectStyleList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(styleService.seletListCount(), currentPage, 5, 12);
		ArrayList<Style> list = styleService.selectStyleList(pi);

		
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
	
	@RequestMapping("stdetail.bo")
	public String selectStyle(Model model, int sno) {
		
		
		int result = styleService.increaseCount(sno);
		
		
		if(result > 0){
			
			Style s = styleService.selectStyle(sno);
			ArrayList<Attachment> attlist = styleService.selectAtt(sno);
			
			model.addAttribute("s", s);
			model.addAttribute("attlist", attlist);
			
			return "style/styleDetailView";
					
		}else {
			// 조회수 증가실패
			// 에러문구 담아서 에러페이지 포워딩

			model.addAttribute("errorMsg", "조회실패");
			return "common/errorPage";
		}
		
		
		
		
	
	}
	
	
	@RequestMapping("stLike.bo")
	public String StyleLike(int styleNo, String userId, Model model, HttpSession session) {
		
		Like like = new Like(userId, styleNo);
		
		int count = styleService.selectLike(like);
		int result = 0;
		
		if(count > 0) {
			result = styleService.deleteLike(like);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "좋아요 취소");
				return "redirect:stdetail.bo?sno=" + styleNo;
				
			}else {
				model.addAttribute("errorMsg", "좋아요 취소 실패");
				return "common/errorPage";
			}
			
			
		}else {
			
			result = styleService.insertLike(like);
			if(result > 0) {
				session.setAttribute("alertMsg", "좋아요!");
				return "redirect:stdetail.bo?sno=" + styleNo;
				
			}else {
				model.addAttribute("errorMsg", "좋아요  실패");
				return "common/errorPage";
			}
		}
		
		
		
		
	}
	
	@ResponseBody
	@RequestMapping(value= "rlist.bo" , produces="application/json; charset=UTF-8" )
	public String ajaxSelectReplyList(int sno) {
		// ArrayList<Reply> list = boardService.selectReplyList(bno);
		
		return new Gson().toJson(styleService.selectReplyList(sno));
	}
	
	
	
	@ResponseBody
	@RequestMapping("rinsert.bo")
	public String ajaxInsertReply(Reply r) { // 성공했을때는 success 실패했을떄는 fail
		return styleService.insertReply(r) > 0 ? "success" : "fail";
	}
	
	
	
	
	@RequestMapping("delete.st")
	public String deleteStyle(int sno, Model model,HttpSession session) {
		
		int result = styleService.deleteStyle(sno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제성공");
			return "redirect:style.bo";
		}else {
			return "common/errorPage";
		}
		
		
	}
	
	
	@RequestMapping("updateForm.st")
	public String updateForm(Model model, int sno) {
		
		Style s = styleService.selectStyle(sno);
		ArrayList<Attachment> attlist = styleService.selectAtt(sno);
		
		model.addAttribute("attlist", attlist);
		model.addAttribute("s", s);
		return "style/styleUpdateForm";
	}
	
	
	
	@RequestMapping("update.st")
	public String updateStyle(Style s, Model model,HttpSession session) {
		
		int result = styleService.updateStyle(s);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정성공");
			return "redirect:stdetail.bo?sno="+ s.getStyleNo();
		}else {
			return "common/errorPage";
		}
		
		
		
	}
	

	
	
	
	
}
