package com.kh.limit.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.admin.model.vo.Notice;

@Repository
public class AdminDao {

	public int insertQna(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.insertQna", n);
	}

	public Object selectNoticeList(SqlSessionTemplate sqlSession, String type) {
		return sqlSession.selectList("adminMapper.selectNoticeList", type);
	}

}
