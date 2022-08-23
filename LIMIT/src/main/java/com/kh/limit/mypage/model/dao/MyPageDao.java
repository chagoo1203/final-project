package com.kh.limit.mypage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.product.model.vo.Product;


@Repository
public class MyPageDao {

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("mypageMapper.updateMember", m);
	}
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("mypageMapper.deleteMember", userId);
	}
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("mypageMapper.nickCheck", checkNick);

	}
	
	public int inteSelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("mypageMapper.inteSelectListCount");
	}
	
	
	public ArrayList<Product> InteList(SqlSessionTemplate sqlSession, PageInfo pi, String userId) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.inteList", userId , rowBounds);
	}
	


}
