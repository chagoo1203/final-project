package com.kh.limit.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public ModelAndView qnaSelectList(@RequestParam(value="page", defaultValue="1") 
									  int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectQnaCount(), currentPage, 5, 5);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.selectQnaList(pi))
		  .setViewName("admin/adminNotice/adminQnaListView");

		return mv;
	}
	
	//Q&A 글작성 하는 곳으로 연결시키는 메소드
	@RequestMapping("enrollForm.qna")
	public String qnaEnrollForm() {
		return "admin/adminNotice/qnaEnrollForm";
	}
	
	//Q&A 글등록후 리스트에 뿌려주는 메소드
	@RequestMapping("insert.qna")
	public ModelAndView insertQna(Notice n, ModelAndView mv, HttpSession session) {
		
		int result = adminService.insertQna(n);
		
		if(result > 0) {	// 성공 => qna 등록 성공 => qna 리스트 페이지로 이동
			session.setAttribute("alertMsg", "Q&A 등록을 완료 되었습니다.");
			mv.setViewName("redirect:list.qna");
		} else {	// 실패 => 에러페이지
			mv.addObject("errorMsg","Q&A 등록을 실패 하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// Q&A 글 상세 보기
	@RequestMapping("detail.qna")
	public ModelAndView selectQna(int qno, ModelAndView mv) {
		
		Notice n = adminService.selectNotice(qno);
		
		if(n != null) {
			mv.addObject("n", n).setViewName("admin/adminNotice/adminQnaDetailView");
		} else {
			mv.addObject("errorMsg", "Q&A 글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// Q&A 글 삭제
	@RequestMapping("delete.qna")
	public String deleteQna(int qno, Model model, HttpSession session) {
		
		int result = adminService.deleteNotice(qno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "Q&A 글삭제 완료");
			return "redirect:list.qna";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// Q&A 글 수정
	@RequestMapping("update.qna")
	public String updateQna(Notice n, Model model, HttpSession session) {
		
		System.out.println(n);
		
		int result = adminService.updateNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "Q&A 글수정 완료");
			return "redirect: detail.qna?qno="+n.getNoticeNo();
		} else {
			model.addAttribute("errorMsg", "Q&A 글 수정 실패");
			return "common/errorPage";
		}
	}

	// admin 공지사항 리스트 
		@RequestMapping("list.no")
		public ModelAndView noticeSelectList(@RequestParam(value="page", defaultValue="1") 
											 int currentPage, ModelAndView mv) {
			
			PageInfo pi = Pagination.getPageInfo(adminService.selectNoticeCount(), currentPage, 5, 5);
			
			mv.addObject("pi", pi)
			.addObject("list", adminService.selectNoticeList(pi))
			.setViewName("admin/adminNotice/adminNoticeListView");

			return mv;
		}
	
	// 공지사항 글작성 하는 곳으로 연결시키는 메소드
	@RequestMapping("enrollForm.no")
	public String noticeEnrollForm() {
		return "admin/adminNotice/noticeEnrollForm";
	}
	
		
	
	
	
	
	
	
	
	
	
}
