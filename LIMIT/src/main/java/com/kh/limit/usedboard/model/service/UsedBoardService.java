package com.kh.limit.usedboard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.SelectUsedBoardVo;
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

	

	public int selectListCount(SelectUsedBoardVo subv) {
		return usedBoardDao.selectListCount(sqlSession, subv);
	}

	public ArrayList<UsedBoard> selectBoard(SelectUsedBoardVo subv) {
		return usedBoardDao.selectList(sqlSession, subv);
	}

	public UsedBoard selectBoardDetail(int boardNo) {
		return usedBoardDao.selectBoardDetail(sqlSession, boardNo);
	}

	public ArrayList<Attachment> selectBoardDetailImges(int boardNo) {
		return usedBoardDao.selectBoardDetailImges(sqlSession, boardNo);
	}

	public int deleteUsedBoard(int boardNo) {
		return usedBoardDao.deleteUsedBoard(sqlSession, boardNo);
	}

	

}
