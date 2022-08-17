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
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.product.model.vo.Product;
import com.kh.limit.usedboard.model.vo.UsedBoard;

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
	
	// 회원 리스트 
	@RequestMapping("member.ad")
	public ModelAndView selectMemberList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectMemberCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.selectMemberList(pi))
		  .setViewName("admin/adminMember/adminMemberListView");
		
		return mv;
	}
	
	// 회원 검색 메소드
	@RequestMapping("searchMem.ad")
	public ModelAndView searchMember(@RequestParam(value="page", defaultValue="1") int currentPage,
								     String condition, String keyword, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(adminService.searchMemberCount(map), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.searchMemberList(map, pi))
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("admin/adminMember/adminMemberListView");
		
		return mv;
	}
	
	// 회원 상세 조회 메소드
	@RequestMapping("detail.ad")
	public ModelAndView selectMember(String userId, ModelAndView mv) {
		
		Member m = adminService.selectMember(userId);
		
		if(m != null) {
			mv.addObject("m", m).setViewName("admin/adminMember/adminMemberDetailView");
		} else {
			mv.addObject("errorMsg", "회원 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 회원 삭제 메소드
	@RequestMapping("delete.ad")
	public String deleteMember(String userId, Model model, HttpSession session) {
		
		int result = adminService.deleteMember(userId);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "아이디가" + userId +"인 회원의 탈퇴 처리가 완료 되었습니다.");
			return "redirect:member.ad";
		} else {
			model.addAttribute("errorMsg", "회원 탈퇴처리에 실패 하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 회원 복구 메소드
	@RequestMapping("restore.ad")
	public String restoreProduct(String userId, HttpSession session, Model model) {
		
		int result = adminService.restoreMember(userId);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원 복구에 성공하였습니다.");
			return "redirect:member.ad";
		} else {
			model.addAttribute("errorMsg", "회원 복구에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	// 탈퇴회원 리스트
	@RequestMapping("deletedMember.ad")
	public ModelAndView deletedMemberList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv) {
		
		PageInfo pi = Pagination.getPageInfo(adminService.deletedMemberCount(), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.deletedMemberList(pi))
		  .setViewName("admin/adminMember/adminDeletedMemberList");
		
		return mv;
	}
	
	// 탈퇴 회원 검색 메소드
	@RequestMapping("searchDeletedMem.ad")
	public ModelAndView searchDeletedMember(@RequestParam(value="page", defaultValue="1") int currentPage,
								     String condition, String keyword, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		PageInfo pi = Pagination.getPageInfo(adminService.searchDeletedMemCount(map), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.searchDeletedMemList(map, pi))
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("admin/adminMember/adminDeletedMemberList");
		
		return mv;
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
			model.addAttribute("p", p);
			return "admin/adminProduct/adminSizeEnrollForm";
			
		} else {
			model.addAttribute("errorMsg", "리셀 상품 등록 실패");
			return "common/errorPage";
		}
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
		
		PageInfo pi = Pagination.getPageInfo(adminService.searchProdCount(map), currentPage, 5, 10);
		
		mv.addObject("pi", pi)
		  .addObject("list", adminService.searchProdList(map, pi))
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("admin/adminProduct/adminProductListView");
		
		return mv;
	}
	
	// 리셀 상품 수정 할수 있는 화면을 보여주는 메소드
	@RequestMapping("detail.rs")
	public ModelAndView selectProductDetial(int pno, ModelAndView mv) {
		
		Product p = adminService.selectProductDetail(pno);
		ArrayList<CommonName> categoryList = adminService.selectCategory();
		ArrayList<CommonName> brandList = adminService.selectBrand();
		ArrayList<CommonName> collectionList = adminService.selectCollection();
		
		System.out.println(p);
		
		if( p != null) {
			
			ArrayList<Attachment> list = adminService.selectAttachment(pno);
			mv.addObject("p", p)
			  .addObject("list", list)
			  .addObject("categoryList",categoryList)
			  .addObject("brandList",brandList)
			  .addObject("collectionList",collectionList)
			  .setViewName("admin/adminProduct/adminProductDetailView");
			
		} else {
			mv.addObject("errorMsg", "등록된 상품이 없습니다").setViewName("common/errorPage");
		}
		return mv;	
	}
	
	// 리셀 상품 수정 메소드
	@RequestMapping("updateProduct.rs")
	public ModelAndView updateProduct(Product p, ModelAndView mv, MultipartFile[] resellImg, HttpSession session, int[] fileNo) {
		
		System.out.println(p.getProductNo());
		ArrayList<Attachment> originFileList = adminService.selectAttachment(p.getProductNo());
		System.out.println(originFileList.size());
		
		ArrayList<Attachment> imgList = saveFile(resellImg, session, originFileList, fileNo);
		
		int result1 = adminService.updateProduct(p);
		int result2 = adminService.insertUpdateImgs(imgList, p.getProductNo());
		
		if(result1 * result2 > 0) {
			mv.setViewName("redirect:admin.ad");
		} else {
			mv.addObject("errorMsg", "상품 수정에 실해하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 상품 삭제 메소드
	@RequestMapping("delete.rs")
	public String deleteProduct(int rno, HttpSession session, Model model) {
		
		int result = adminService.deleteProduct(rno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "상품 삭제 성공");
			return "redirect:admin.ad";
		} else {
			model.addAttribute("errorMsg", "상품 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 상품 복구 메소드
	@RequestMapping("restore.rs")
	public String restoreProduct(int rno, HttpSession session, Model model) {
		
		int result = adminService.restoreProduct(rno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "상품 복구 성공");
			return "redirect:admin.ad";
		} else {
			model.addAttribute("errorMsg", "상품 복구 실패");
			return "common/errorPage";
		}
	}
	
	// 프로덕트 사진 파일 등록할때 파일 이름 바꾸기
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
	
	// 프로덕트 사진 파일 수정할때 파일 이름 바꾸기
	private ArrayList<Attachment> saveFile(MultipartFile[] resellImg, HttpSession session,
										   ArrayList<Attachment> originFileList, int[] fileNo) {
		
		String originName;
		String currentTime;
		int ranNum;
		String ext;		
		String changeName;
		ArrayList<Attachment>imgList = new ArrayList<Attachment>();					
		String savePath = session.getServletContext().getRealPath("/resources/resellListImges/");
		int fileLevel = 1;
		
		for(int i = 0; i < resellImg.length; i++) { 
			
			if(i != 0) fileLevel = 2;			
			
			if(!resellImg[i].getOriginalFilename().equals("")) { 				
				originName = resellImg[i].getOriginalFilename();
				currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				ranNum = (int)(Math.random() * 90000) + 10000;
				ext = originName.substring(originName.lastIndexOf("."));
				changeName =  currentTime + ranNum + ext;				
				
				try {
					resellImg[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				if(i < originFileList.size()) {
					
					new File(savePath+originFileList.get(i).getChangeName()).delete(); //원본파일 삭제
					
					if(!(adminService.updateAttachment(new Attachment(originFileList.get(i).getFileNo(),
													   originName,
													   changeName
													   )) > 0)) return null;
					
				}else { 
					imgList.add(new Attachment(originName, changeName, "resources/resellListImges/", fileLevel));
					
				}								
			}										
		}
		
		if(resellImg.length <= originFileList.size()) {					
			
			for(int i = 0; i < fileNo.length; i++) {
				for(int j = 0; j < originFileList.size(); j++) {
					if(originFileList.get(j).getFileNo() == fileNo[i]) {
						originFileList.remove(j);
					}
				}								
			}
			
			for(int i = 0; i < originFileList.size(); i++) {												
				new File(savePath+originFileList.get(i).getChangeName()).delete();		
				if(!(adminService.deleteAttachment(originFileList.get(i).getFileNo()) > 0)) return null;
			}
		}
		
		return imgList;
	}
	
	
	
	
}
