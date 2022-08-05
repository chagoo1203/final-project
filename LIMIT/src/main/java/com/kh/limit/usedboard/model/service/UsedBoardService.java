package com.kh.limit.usedboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.usedboard.model.dao.UsedBoardDao;
import com.kh.limit.usedboard.model.vo.UsedBoard;

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

	public int insertUsedBoard(UsedBoard usedBoard) {
		return usedBoardDao.insertUsedBoard(sqlSession, usedBoard);
	}

	public int insertUsedBoardImges(ArrayList<Attachment> imgList) {
		int result = 1;
		for(Attachment img : imgList) {
			result *= usedBoardDao.insertAttachment(sqlSession, img);
		}
		return result;
	}

	

}
