package com.kh.limit.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.admin.model.dao.AdminDao;
import com.kh.limit.admin.model.vo.Notice;

@Service
public class AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;

	public int insertQna(Notice n) {
		return adminDao.insertQna(sqlSession, n);
	}

	public Object selectNoticeList(String type) {
		return adminDao.selectNoticeList(sqlSession, type);
	}
	
	
	
	
	
	
	
}
