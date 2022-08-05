package com.kh.limit.style.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.style.model.vo.Style;

@Controller
public class StyleController {
	
	@RequestMapping("style.bo")
	public String styleList() {
		
		return "style/styleListView";
	}
	
	@RequestMapping("styleEnrollForm.bo")
	public String styleEnrollForm() {
		return "style/styleEnrollForm";
	}
	
	@RequestMapping("insertStyle.bo")
	public String insertStyle(HttpSession session, MultipartFile[] styleImg, Style style, Model model ) {
		
			
			for(int i = 0; i <= styleImg.length; i ++ ) {
				
				if(! styleImg[i].getOriginalFilename().equals("")) {
						
					ArrayList list = saveFile(styleImg,session);
					
					
					
					styleImg[i]
				}
				
				
			}
			
		
		
		
		return "main";
	}
	
	

	
	
					
	public ArrayList<Attachment> saveFile(MultipartFile[] styleImg, HttpSession session) { // 실제 넘어온 파일을 이름변경해서 서버에 업로드
		
		ArrayList<Attachment> list = new ArrayList();
		String originName;
		String currentTime;
		int ranNum;
		String ext;
		String changeName;
		String saveParh;
		
		
		for(MultipartFile img : styleImg) {
			
			
			// 파일 명 수정 후 서버에 업로드시키기("스프링순서도.jpg" => "20220722352355.jpg"
			originName = img.getOriginalFilename();
			// 202207220242455(년월일시분초)
			currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			// 12312(5자리 랜덤값)
			ranNum = (int)(Math.random() * 90000) + 10000;
			// 확장자
			ext = originName.substring(originName.lastIndexOf("."));
			changeName = currentTime + ranNum + ext;
			// 업로드 시키고자 하는 폴더의 물리적인 주소
			String savePath = session.getServletContext().getRealPath("/resources/styleImges/");
			try {
				img.transferTo(new File(savePath + changeName)); // 저장되게하는 내용
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			list.add(new Attachment(originName, changeName, savePath, 3));
			
			
		}
		return list;
	}
	
	
	
	
	
	
}
