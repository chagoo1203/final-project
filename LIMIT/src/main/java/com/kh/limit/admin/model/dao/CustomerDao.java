package com.kh.limit.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.PageInfo;

@Repository
public class CustomerDao {

	public int selectNoticeCount(SqlSessionTemplate sqlSession, String type) {
		return sqlSession.selectOne("noticeMapper.selectNoticeCount", type);
	}

	public Object selectList(SqlSessionTemplate sqlSession, PageInfo pi, String type) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", type, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

}
