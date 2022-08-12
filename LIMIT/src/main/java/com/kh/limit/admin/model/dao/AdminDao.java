package com.kh.limit.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.PageInfo;

@Repository
public class AdminDao {

	public int insertQna(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertQna", n);
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, String type, PageInfo pi) {
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", type);
	}

	public int selectNotcieCount(SqlSessionTemplate sqlSession, String type) {
		return sqlSession.selectOne("noticeMapper.selectNoticeCount", type);
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}



}
