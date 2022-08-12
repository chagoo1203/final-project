package com.kh.limit.admin.model.service;

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

	public int selectNoticeCount(String type) {
		return customerDao.selectNoticeCount(sqlSession, type);
	}

	public Object selectList(PageInfo pi, String type) {
		return customerDao.selectList(sqlSession, pi, type);
	}

	public int increaseCount(int noticeNo) {
		return customerDao.increaseCount(sqlSession, noticeNo);
	}

	public Notice selectNotice(int noticeNo) {
		return customerDao.selectNotice(sqlSession, noticeNo);
	}

}
