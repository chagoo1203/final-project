package com.kh.limit.member.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.member.model.dao.MemberDao;
import com.kh.limit.member.model.vo.MailUtils;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.member.model.vo.TempKey;
import com.kh.limit.product.model.vo.Product;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Inject
	private JavaMailSender mailSender;
	
	public Member loginMember(Member m) {
		
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}
	
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}
	public int insertMember(Member m) {
		
		int result = memberDao.insertMember(sqlSession, m);
		return result;
	}
	public ArrayList<Product> selectTopBoardList() {
		
		return memberDao.selectTopBoardList(sqlSession);
	}
	
	public int searchInput(HashMap<String, String> map){
		return memberDao.searchInput(sqlSession, map);
	}
	
	public ArrayList<Product> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return memberDao.selectSearchList(sqlSession, map, pi);
	}
	public Member selectIdPhoneList(HashMap<String, String> map){
		return memberDao.selectIdPhoneList(sqlSession, map);
	}
	public int findPwCheck(Member member){
		System.out.println(member);
		return memberDao.findPwCheck(member, sqlSession);
	}
	
	public void findPw(String email,String userId) throws MessagingException, IOException{
		String memberKey = new TempKey().getKey(6,false);
		String userPw = BCrypt.hashpw(memberKey,BCrypt.gensalt());
		System.out.println(userPw);
		 memberDao.findPw(email,userId,userPw, sqlSession);
		 MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[LIMIT사이트 임시 비밀번호 입니다.]"); //메일제목
			sendMail.setText(
					"<h1>임시비밀번호 발급</h1>" +
							"<br/>"+userId+"님 "+
							"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
							"<br/>임시비밀번호 :   <h2>"+memberKey+"</h2>"+
							"<br/>로그인 후 비밀번호 변경을 해주세요."+
							"<a href='http://localhost:8989/limit/login.me'"+
							">로그인 페이지</a>");
			sendMail.setFrom("bbeenn97@gmail.com", "LIMIT");
			sendMail.setTo(email);
			sendMail.send();
	}
	
}
