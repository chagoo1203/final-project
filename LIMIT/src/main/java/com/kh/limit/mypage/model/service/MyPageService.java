package com.kh.limit.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.member.model.dao.MemberDao;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.mypage.model.dao.MyPageDao;
import com.kh.limit.product.model.vo.Product;

@Service
public class MyPageService {
	@Autowired
	private MyPageDao myPageDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int updateMember(Member m) {
		return myPageDao.updateMember(sqlSession, m);
	}
	public int deleteMember(String userId) {
		return myPageDao.deleteMember(sqlSession, userId);
	}
	public int nickCheck(String checkNick) {
		return myPageDao.nickCheck(sqlSession, checkNick);
	}
	public int inteselectListCount() {
		return myPageDao.inteSelectListCount(sqlSession);
	}
	public ArrayList<Product> InteList(PageInfo pi, String userId) {
		return myPageDao.InteList(sqlSession, pi, userId);
	}
	

}



