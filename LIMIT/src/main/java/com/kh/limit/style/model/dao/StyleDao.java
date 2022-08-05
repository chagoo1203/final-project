package com.kh.limit.style.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.style.model.vo.Style;


@Repository

public class StyleDao {

	public ArrayList<Style> selectStyleList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("styleMapper.selectStyleList");
	}
	
	public int insetStyle(SqlSessionTemplate sqlSession, Style style) {
		return sqlSession.insert("styleMapper.insertStyle", style);
	}
	
	
	public int insertStyleAttachment(SqlSessionTemplate sqlSession, Attachment img) {
		return sqlSession.insert("styleMapper.insertStyleAttachment",img);
	}


	

}
