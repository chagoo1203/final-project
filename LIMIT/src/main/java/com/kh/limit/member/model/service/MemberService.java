package com.kh.limit.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.member.model.dao.MemberDao;
import com.kh.limit.member.model.vo.Member;

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
}
