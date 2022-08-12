package com.kh.limit.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.admin.model.dao.AdminDao;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.PageInfo;

@Service
public class AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;

	public int insertQna(Notice n) {
		return adminDao.insertQna(sqlSession, n);
	}

	public ArrayList<Notice> selectNoticeList(String type, PageInfo pi) {
		return adminDao.selectNoticeList(sqlSession, type, pi);
	}

	public int selectNoticeCount(String type) {
		return adminDao.selectNotcieCount(sqlSession, type);
	}

	public Notice selectNotice(int noticeNo) {
		return adminDao.selectNotice(sqlSession, noticeNo);
	}

	public int deleteNotice(int noticeNo) {
		return adminDao.deleteNotice(sqlSession, noticeNo);
	}

	public int updateNotice(Notice n) {
		return adminDao.updateNotice(sqlSession, n);
	}

	
	
	
	
	
	
	
}
