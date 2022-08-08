package com.kh.limit.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.service.AdminService;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.template.Pagination;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// admin 메인화면 연결 / product 리스트
	@RequestMapping("admin.ad")
	public ModelAndView prodSelectList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		mv.setViewName("admin/adminProduct/adminProductListView");
		
		return mv;
	}
	
	// admin Q&A 리스트 
	@RequestMapping("list.qna")
	public ModelAndView qnaSelectList(@RequestParam(value="page", defaultValue="1") int currentPage,
									  @RequestParam(value="type", defaultValue="Q") String type, ModelAndView mv) {
	
		System.out.println(type);
		
		//PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(), currentPage, 5, 10);
		
		mv.addObject("list", adminService.selectNoticeList(type))
		  .setViewName("admin/adminNotice/adminQnaListView");
		
		return mv;
	}
	
	//Q&A 글작성 하는 곳으로 연결시키는 메소드
	@RequestMapping("enrollForm.qna")
	public String enrollForm() {
		return "admin/adminNotice/qnaEnrollForm";
	}
	
	//Q&A 글등록후 리스트에 뿌려주는 메소드
	@RequestMapping("insert.qna")
	public ModelAndView insertQna(Notice n, ModelAndView mv, HttpSession session) {
		
		//System.out.println(n);
		int result = adminService.insertQna(n);
		
		if(result > 0) {	// 성공 => qna 등록 성공 => qna 리스트 페이지로 이동
			session.setAttribute("alertMsg", "Q&A 등록을 완료 되었습니다.");
			mv.setViewName("redirect:list.qna");
		} else {	// 실패 => 에러페이지
			mv.addObject("errorMsg","Q&A 등록을 실패 하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	

}
