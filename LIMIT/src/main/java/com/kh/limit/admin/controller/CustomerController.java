package com.kh.limit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.service.CustomerService;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.template.Pagination;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	// 고객센터 Q&A 리스트 
	@RequestMapping("customer.ct")
	public ModelAndView qnaSelectList(@RequestParam(value="qpage", defaultValue="1") 
									  int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(customerService.selectQnaCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", customerService.selectQnaList(pi))
		  .setViewName("notice/qnaListView");
		
		return mv;
	}
	
	// 고객센터 Q&A 글 상세 보기
	@RequestMapping("detail.cqa")
	public ModelAndView selectQna(int qno, ModelAndView mv) {
		
		// 해당 Q&A의 조회수 증가용 서비스를 호출 결과 받기 (update)
		int result = customerService.increaseCount(qno);
		
		if(result > 0 ) {	//조회수 증가 성공
			Notice n = customerService.selectNotice(qno);
			mv.addObject("n", n).setViewName("notice/qnaDetailView");
		} else {
			mv.addObject("errorMsg", "Q&A 게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
		
	// 고객센터 공지사항 리스트
	@RequestMapping("notice.ct")
	public ModelAndView noticeSelectList(@RequestParam(value="npage", defaultValue="1") 
										 int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(customerService.selectNoticeCount(), currentPage, 5, 10);
														
		mv.addObject("pi", pi)
		  .addObject("list", customerService.selectNoticeList(pi))
		  .setViewName("notice/noticeListView");
		
		return mv;
	}
	
	// 고객센터 Q&A 글 상세 보기
		@RequestMapping("detail.cno")
		public ModelAndView selectNotice(int nno, ModelAndView mv) {
			
			// 해당 Q&A의 조회수 증가용 서비스를 호출 결과 받기 (update)
			int result = customerService.increaseCount(nno);
			
			if(result > 0 ) {	//조회수 증가 성공
				Notice n = customerService.selectNotice(nno);
				mv.addObject("n", n).setViewName("notice/noticeDetailView");
			} else {
				mv.addObject("errorMsg", "Q&A 게시글 조회 실패").setViewName("common/errorPage");
			}
			return mv;
		}
	

	
}
