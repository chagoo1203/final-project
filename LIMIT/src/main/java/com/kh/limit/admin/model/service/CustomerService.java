package com.kh.limit.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.admin.model.dao.CustomerDao;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.PageInfo;

@Service
public class CustomerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CustomerDao customerDao;

	public int selectNoticeCount() {
		return customerDao.selectNoticeCount(sqlSession);
	}

	public ArrayList<Notice> selectQnaList(PageInfo pi) {
		return customerDao.selectQnaList(sqlSession, pi);
	}

	public int increaseCount(int noticeNo) {
		return customerDao.increaseCount(sqlSession, noticeNo);
	}

	public Notice selectNotice(int noticeNo) {
		return customerDao.selectNotice(sqlSession, noticeNo);
	}

	public int selectQnaCount() {
		return customerDao.selectQnaCount(sqlSession);
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return customerDao.selectNoticeList(sqlSession, pi);
	}

}
