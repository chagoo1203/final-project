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
import com.kh.limit.common.model.vo.Chat;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.SelectUsedBoardVo;
import com.kh.limit.common.template.Pagination;
import static com.kh.limit.common.template.TextChat.*;
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
		
		mv.addObject("categoryList",categoryList);
		mv.addObject("brandList",brandList);
		mv.addObject("collectionList",collectionList);
		mv.setViewName("/usedboard/usedBoardEnrollForm");
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

		result *= boardService.insertUsedBoardImges(imgList);
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 입력 성공 !");
			return "redirect:list.used";
		}else {
			model.addAttribute("errorMsg", "게시글 입력 실패");
			return "common/errorPage";
		}
				
	}
	
	@ResponseBody
	@RequestMapping(value = "aJaxLoadtoUsedBoard.used", produces="application/json; charset=UTF-8")	
	public String aJaxLoadtoUsedBoard(SelectUsedBoardVo subv) {
						
		return new Gson().toJson(boardService.selectBoard(subv));
	}
	
	@ResponseBody
	@RequestMapping("aJaxLoadToInterested.used")
	public String aJaxLoadToInterested(String userId, int usedNo) {
		if(boardService.selectInterested(new Interested(userId, usedNo)) == null) return "N";
		return "Y";
	}
	@ResponseBody
	@RequestMapping("aJaxInsertToInterested.used")
	public String aJaxInsertToInterested(String userId, int usedNo) {
		if(boardService.insertInterested(new Interested(userId, usedNo)) > 0) return "Y";
		return "N";
	}
	@ResponseBody
	@RequestMapping("aJaxDeleteToInterested.used")
	public String aJaxDeleteToInterested(String userId, int usedNo) {
		if(boardService.deleteInterested(new Interested(userId, usedNo)) > 0) return "Y";
		return "N";
	}
	@ResponseBody
	@RequestMapping("aJaxLoadtoUsedBoardPaging.used")	
	public PageInfo aJaxLoadtoUsedBoardPaging(SelectUsedBoardVo subv, int cpage) {				
		PageInfo pi = Pagination.getPageInfo(boardService.selectListCount(subv), cpage, 10, 20);						
		return pi;		
	}
	
	
	@RequestMapping("detail.used")
	public ModelAndView detailUsedBord(int boardNo, ModelAndView mv) {
			
		mv.addObject("usedBoard", boardService.selectBoardDetail(boardNo));
		mv.addObject("usedImgList",boardService.selectBoardDetailImges(boardNo));
		ArrayList<Attachment> list = boardService.selectBoardDetailImges(boardNo);
		for(Attachment img : list) {
			System.out.println(img);
		}
				
		mv.setViewName("usedboard/usedBoardDeatilView");
		
		return mv;
	}
	@RequestMapping("delete.used")
	public String deleteUsedBoard(int boardNo, HttpSession session, Model model) {
		System.out.println(boardNo);
		if(boardService.deleteUsedBoard(boardNo) > 0) {
			session.setAttribute("alertMsg", "삭제 성공 ~");
			return "redirect:list.used";
		}
		else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}				
	}
	@RequestMapping("updateForm.used")
	public ModelAndView updateFormUsedBoard(int boardNo, ModelAndView mv) {
		
		
		mv.addObject("categoryList",boardService.selectCategory());
		mv.addObject("brandList",boardService.selectBrand());
		mv.addObject("collectionList",boardService.selectCollection());
		mv.addObject("usedBoard", boardService.selectBoardDetail(boardNo));
		mv.addObject("usedImgList",boardService.selectBoardDetailImges(boardNo));
		mv.setViewName("usedboard/usedBoardUpdateForm");
		return mv;
	}
	@RequestMapping("update.used")
	public ModelAndView updateUsedBoard(UsedBoard board, ModelAndView mv, MultipartFile[] usedImg, HttpSession session, int[] fileNo) {
		ArrayList<Attachment> originFileList = boardService.selectAttachments(board.getBoardNo());
		
		int result = boardService.updateUsedBoard(board);
		result = boardService.insertUsedBoardImges(saveFile(usedImg, session, originFileList, fileNo), board.getBoardNo());
		mv.setViewName("redirect:list.used");
		return mv;
	}
	@RequestMapping("aJaxNewChatFile.used") // MyChat이 아닌 연락하기 클릭 후 입장전 메모장을 생성해주는 메소드 메모장이 있어도 상관없음
	@ResponseBody
	public void aJaxNewChatFile(String userId, String toUser, ModelAndView mv) {
		if(searchChat(userId, toUser) == null) {
			System.out.println("test");
			if(chatFileInsert(userId +"_" +toUser+".txt", null) == false) {
				System.out.println("Error : " + userId + " " + toUser);
			}
		}								
	}	
	
	@RequestMapping(value = "aJaxloadToChatList.used", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String aJaxloadToChatList(String userId) {
		//제목에 userId를 포함한 모든 메모장의 List를 반환하는 메소드 이 메소드는 chatList 입장시 사용한다.
		String files[] = searchChat(userId);
		if(files == null) return "N";
		ArrayList<String>lastList = chatLastLine(files);
		
		String[] users = filesToUsers(files, userId);
		String lastTexts[] = new String[lastList.size()];
		int index = 0;
		for(String s : lastList) {
			lastTexts[index] = s;
			index++;			
		}
		
		String[][] list = {users, lastTexts};
		
		
		return new Gson().toJson(list); 
	}
	
	@RequestMapping(value = "aJaxLoadToTextList.used", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String aJaxLoadToTextList(String userId, String toUser) {
		//대화방 클릭시 모든 대화를 불러오는 메소드  
		System.out.println(searchChat(userId,toUser));
		return new Gson().toJson(readChat(searchChat(userId,toUser)));
	}
	
	@RequestMapping(value = "aJaxChatInsert.used", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void aJaxChatInsert(String userId, String toUser, String text) {
		//전송 클릭시 사용할 메소드
		//전송한사람, 오늘 날짜, 내용 기입 
		System.out.println(searchChat(userId, toUser));
		chatFileInsert(searchChat(userId, toUser), new Gson().toJson(new Chat(text, "sysdate", userId)));
		
	}
	@RequestMapping("chatListForm.used")
	public String chatListForm() {
		return "usedboard/usedBoardChat";
	}
	
	public ArrayList<Attachment> saveFile(MultipartFile[] usedImg, HttpSession session) { //실제 넘어온 파일을 이름을 변경해서 서버에 업로드
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
			currentTime = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
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
	public ArrayList<Attachment> saveFile(MultipartFile[] usedImg,
										  HttpSession session, 
										  ArrayList<Attachment> originImgeList,
										  int[] fileNo
										  ){ 
		//업데이트시 사용할 메소드
		/*
		 * 
		 * 조건 1 : 기존파일의갯수와 새로운파일의갯수가 같을때 -> update
		 * 
		 * 조건 2 : 기존파일의 갯수보다 새로울파일의 갯수가 적을때 -> delete
		 * 조건 3 : 기존파일의 갯수보다 새로운 파일의 갯수가 많을때 -> insert  
		 * 
		 * 
		 */
		String originName;
		String currentTime;
		int ranNum;
		String ext;		
		String changeName;
		ArrayList<Attachment>imgList = new ArrayList<Attachment>();					
		String savePath = session.getServletContext().getRealPath("/resources/usedBoardImges/");
		int fileLevel = 1;
		
		for(int i = 0; i < usedImg.length-1; i++) { 
			//usedImg는 updateForm 에 존재하는 input type = file 만큼에 길이를 가져온다
			
			if(i != 0) fileLevel = 2;			
			
			if(!usedImg[i].getOriginalFilename().equals("")) { 				
				originName = usedImg[i].getOriginalFilename();
				currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				ranNum = (int)(Math.random() * 90000) + 10000;
				ext = originName.substring(originName.lastIndexOf("."));
				changeName =  currentTime + ranNum + ext;				
				
				try {
					usedImg[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				// getOriginalFilename으로 input type file에 값이 있는지 불러온다.
				if(i < originImgeList.size()) { // 조건 : 1
					//따라서 이 조건문은 file이 있을경우이기 때문에 update해준다.
					//새로운 파일의 정보와 기존 파일의 번호를 넘겨야한다.
					
					new File(savePath+originImgeList.get(i).getChangeName()).delete(); //원본파일 삭제
					
					if(!(boardService.updateAttachment(new Attachment(
												originImgeList.get(i).getFileNo(),
												originName,
												changeName
												)) > 0)) return null;
					//orginImgeList.get(i).getFileNo() = fileNo(수정해야할 파일 번호)
					//originName = 새로운 파일의 이름
					//changeName = 새로운 파일의 설정한 이름
				}else { // 조건 : 2
					//이제부터는 새로 insert해줘야하는 부분이다.
					//새로 insert해야할것은 imgList에 담아 return시킨뒤 insert 메소드를 불러올 것이다. 따라서
					imgList.add(new Attachment(originName, changeName, "resources/usedBoardImges/", fileLevel));
					
				}								
			}										
		}
		
		if(usedImg[0].getOriginalFilename().equals("")) { 
			//Thumbnail imge가 되어야할 파일이  업데이트하며 삭제되었을때 가장 앞에있는 파일을 thubnailImge로 update해주어야한다.
			//따라서 originImageList에 존재하며 fileNo가 가장 낮은것을 update 하여 fileLevel을 1로 수정한다. 
			for(int i = 0; i < originImgeList.size(); i++) {
				if(originImgeList.get(i).getFileNo() == fileNo[0]) {
					if(!(boardService.tumbnailImgeUpdate(originImgeList.get(i).getFileNo())  > 0)) return null;
				}
			}
			
		}
		if(usedImg.length-1 <= originImgeList.size()) {					
			//조건 3 : 새로 입력된 파일들보다 많은 기존의 파일들은 지워준다.
			
			//int[] fileNo 삭제하면 안되는 것들의 fileNo모음
			for(int i = 0; i < fileNo.length; i++) {
				for(int j = 0; j < originImgeList.size(); j++) {
					if(originImgeList.get(j).getFileNo() == fileNo[i]) {
						originImgeList.remove(j);
					}
				}								
			}
			for(int i = 0; i < originImgeList.size(); i++) { // 삭제되야할 갯수만큼 for문이 돌것임.												
				new File(savePath+originImgeList.get(i).getChangeName()).delete(); //원본파일 삭제			
				if(!(boardService.deleteAttachment(originImgeList.get(i).getFileNo()) > 0))return null;
			}
		}
		return imgList;
	}
	
	
}
