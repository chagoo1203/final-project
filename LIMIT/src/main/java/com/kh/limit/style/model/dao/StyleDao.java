package com.kh.limit.style.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.style.model.vo.Style;


@Repository

public class StyleDao {

	public ArrayList<Style> selectStyleList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds= new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("styleMapper.selectStyleList",null, rowBounds);
	}
	
	public int insetStyle(SqlSessionTemplate sqlSession, Style style) {
		return sqlSession.insert("styleMapper.insertStyle", style);
	}
	
	
	public int insertStyleAttachment(SqlSessionTemplate sqlSession, Attachment img) {
		return sqlSession.insert("styleMapper.insertStyleAttachment",img);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("styleMapper.selectListCount");
	}


	

}
