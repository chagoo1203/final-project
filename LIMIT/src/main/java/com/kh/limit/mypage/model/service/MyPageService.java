package com.kh.limit.mypage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.member.model.dao.MemberDao;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.mypage.model.dao.MyPageDao;

@Service
public class MyPageService {
	@Autowired
	private MyPageDao myPageDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		
		Member loginUser = myPageDao.loginMember(sqlSession, m);
		return loginUser;
	}
	
	public int updateMember(Member m) {
		return myPageDao.updateMember(sqlSession, m);
	}
	public int deleteMember(String userId) {
		return myPageDao.deleteMember(sqlSession, userId);
	}
	public int nickCheck(String checkNick) {
		return myPageDao.nickCheck(sqlSession, checkNick);
	}

}



