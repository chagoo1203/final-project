package com.kh.limit.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.service.AdminService;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.ProductResell;
import com.kh.limit.common.template.Pagination;
import com.kh.limit.product.model.vo.Product;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// admin 메인화면 연결 / product 리스트
	@RequestMapping("admin.ad")
	public ModelAndView prodSelectList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectProdCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.selectProductList(pi))
		  .setViewName("admin/adminProduct/adminProductListView");
		
		return mv;
	}
	
	// admin Q&A 리스트 
	@RequestMapping("list.qna")
	public ModelAndView qnaSelectList(@RequestParam(value="page", defaultValue="1") 
									  int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectQnaCount(), currentPage, 5, 10);
		
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
			session.setAttribute("alertMsg", "Q&A 등록이 완료 되었습니다.");
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
			
			PageInfo pi = Pagination.getPageInfo(adminService.selectNoticeCount(), currentPage, 5, 10);
			
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
	
	// 공지사항 글 등록후 리스트에 뿌려주는 메소드
	@RequestMapping("insert.no")
	public ModelAndView insertNotice(Notice n, ModelAndView mv, HttpSession session) {
		
		int result = adminService.insertNotice(n);
		
		if(result > 0) {	// 성공 => qna 등록 성공 => qna 리스트 페이지로 이동
			session.setAttribute("alertMsg", "공지사항 게시글 등록이 완료 되었습니다.");
			mv.setViewName("redirect:list.no");
		} else {	// 실패 => 에러페이지
			mv.addObject("errorMsg","공지사항 등록을 실패 하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 공지사항 글 상세 보기
	@RequestMapping("detail.no")
	public ModelAndView selectNotice(int nno, ModelAndView mv) {
		
		Notice n = adminService.selectNotice(nno);
		
		if(n != null) {
			mv.addObject("n", n).setViewName("admin/adminNotice/adminNoticeDetailView");
		} else {
			mv.addObject("errorMsg", "공지사항 게시글 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공지사항 글 삭제
	@RequestMapping("delete.no")
	public String deleteNotiece(int nno, Model model, HttpSession session) {
		
		int result = adminService.deleteNotice(nno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 게시글 삭제 완료");
			return "redirect:list.no";
		} else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 공지사항 글 수정
	@RequestMapping("update.no")
	public String updateNotice(Notice n, Model model, HttpSession session) {
		
		int result = adminService.updateNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 게시글 수정 완료");
			return "redirect: detail.no?nno="+n.getNoticeNo();
		} else {
			model.addAttribute("errorMsg", "공지사항 게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
		
	
	
	
	
	// 리셀 상품 등록할수 있는 화면에 연결하는 메소드
	@RequestMapping("productEnrollForm.rs")
	public ModelAndView productEnrollForm(ModelAndView mv) {
		
		ArrayList<CommonName> categoryList = adminService.selectCategory();
		ArrayList<CommonName> brandList = adminService.selectBrand();
		ArrayList<CommonName> collectionList = adminService.selectCollection();
		
		mv.addObject("categoryList",categoryList)
		  .addObject("brandList",brandList)
		  .addObject("collectionList",collectionList)
		  .setViewName("admin/adminProduct/adminProductEnrollForm");
		
		return mv;
	}
	
	// 리셀 상품 등록 메소드
	@RequestMapping("insertProduct.rs")
	public String insertProduct(Product product, Model model, MultipartFile[] resellImg, HttpSession session){
		
		int result = adminService.insertProduct(product);
		
		ArrayList<Attachment> imgList = saveFile(resellImg, session);
		
		result *= adminService.insertResellImges(imgList);
		
		if(result > 0) {
			Product p = adminService.selectProduct();
			//System.out.println(p);
			model.addAttribute("p", p);
			return "admin/adminProduct/adminSizeEnrollForm";
			
		} else {
			model.addAttribute("errorMsg", "리셀 상품 등록 실패");
			return "common/errorPage";
		}
	}

	// 프로덕트 사진 파일 INSERT할대 파일 이름 바꾸기
	public ArrayList<Attachment> saveFile(MultipartFile[] resellImg, HttpSession session) { 
		 
		String originName;
		String currentTime;
		int ranNum;
		String ext;
		int index = 0;
		String changeName;
		ArrayList<Attachment>imgList = new ArrayList<Attachment>();					
		String savePath;
		int fileLevel = 1;
		
		for(MultipartFile img : resellImg) {		
			if(index != 0) fileLevel = 2;
			if(img.getOriginalFilename().equals("")) break;
			originName = img.getOriginalFilename();
			currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			ranNum = (int)(Math.random() * 90000) + 10000;
			ext = originName.substring(originName.lastIndexOf("."));
			changeName =  currentTime + ranNum + ext;
			savePath = session.getServletContext().getRealPath("/resources/resellListImges/");		
			
			try {
				img.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}			
			imgList.add(new Attachment(originName, changeName, "resources/resellListImges/", fileLevel));		
			index++;
		}
		 		 										
		return imgList;
	}
	
	// 리셀 상품 사이즈 등록 메소드
	@RequestMapping("insertSize.rs")
	public String insertSize(Product p, String[] sizes, Model model, HttpSession session) {

		ArrayList<ProductResell> list = new ArrayList<>();
		
		for(int i = 0; i < sizes.length; i++) {
			
			list.add(new ProductResell(p.getProductNo(), 0, sizes[i]));	
		}
		int result = adminService.insertSize(list);
		
		if(result >0) {
			session.setAttribute("alertMsg", "리셀 상품 등록이 완료 되었습니다.");
			return "redirect:admin.ad";
		} else {
			model.addAttribute("errorMsg", "리셀 상품 등록에 실패 하였습니다");
			return "common/errorPage";
		}
	}
	
	// admin 등록된 리셀 상품 검색 메소드
	@RequestMapping("searchProd.rs")
	public ModelAndView searchProduct(@RequestParam(value="page", defaultValue="1") int currentPage,
								String condition, String keyword, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		System.out.println(condition + keyword);
		
		PageInfo pi = Pagination.getPageInfo(adminService.searchProdCount(map), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.searchProdList(map, pi))
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("admin/adminProduct/adminProductListView");
		
		return mv;
	}
	
	
	
	
	
	
}
