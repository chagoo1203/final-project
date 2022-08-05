package com.kh.limit.usedboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.CommonName;
@Repository
public class UsedBoardDao {

	public ArrayList<CommonName> selectCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("usedBoardMapper.selectCategory");
	}

	public ArrayList<CommonName> selectBrand(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("usedBoardMapper.selectBrand");
	}

	public ArrayList<CommonName> selectCollection(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("usedBoardMapper.selectCollection");
	}



}
