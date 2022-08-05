package com.kh.limit.usedboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.usedboard.model.dao.UsedBoardDao;

@Service
public class UsedBoardService {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UsedBoardDao usedBoardDao;
	
	public ArrayList<CommonName> selectCategory() {							
		return usedBoardDao.selectCategory(sqlSession);
	}

	public ArrayList<CommonName> selectBrand() {
		return usedBoardDao.selectBrand(sqlSession);
	}

	public ArrayList<CommonName> selectCollection() {
		return usedBoardDao.selectCollection(sqlSession);
	}

}
