package com.kh.limit.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.member.model.dao.MemberDao;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.product.model.vo.Product;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
}
