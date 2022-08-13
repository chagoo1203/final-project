package com.kh.limit.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.dao.AdminDao;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.CommonName;
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

	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return adminDao.selectNoticeList(sqlSession, pi);
	}

	public int selectNoticeCount() {
		return adminDao.selectNotcieCount(sqlSession);
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

	public int selectQnaCount() {
		return adminDao.selectQnaCount(sqlSession);
	}

	public ArrayList<Notice> selectQnaList(PageInfo pi) {
		return adminDao.selectQnaList(sqlSession, pi);
	}

	public ArrayList<CommonName> selectCategory() {
		return adminDao.selectCategory(sqlSession);
	}

	public ArrayList<CommonName> selectBrand() {
		return adminDao.selectBrand(sqlSession);
	}

	public ArrayList<CommonName> selectCollection() {
		return adminDao.selectCollection(sqlSession);
	}

	
	
	
	
	
	
	
}
