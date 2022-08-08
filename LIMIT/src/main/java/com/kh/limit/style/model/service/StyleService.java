package com.kh.limit.style.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.style.model.dao.StyleDao;
import com.kh.limit.style.model.vo.Style;

@Service
public class StyleService {

	@Autowired
	private StyleDao styleDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	
	public ArrayList<Style> selectStyleList(PageInfo pi){
		return styleDao.selectStyleList(sqlSession, pi);
	}
	
	
	public int insertStyle(Style style) {
		return styleDao.insetStyle(sqlSession, style);
	}
	
	
	
	public int insertStyleAttachment(ArrayList<Attachment> list) {
		int result = 1;
		for(Attachment img : list) {
			result*= styleDao.insertStyleAttachment(sqlSession, img);
		}
		return result;
	}


	public int seletListCount() {
		return styleDao.selectListCount(sqlSession);
	}
	
	
	
	

	
	
}
