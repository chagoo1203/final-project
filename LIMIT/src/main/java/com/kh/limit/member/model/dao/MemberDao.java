package com.kh.limit.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.member.model.vo.Member;
import com.kh.limit.product.model.vo.Product;

@Repository
public class MemberDao {
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);

	}
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);

	}
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	public ArrayList<Product> selectTopBoardList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("memberMapper.selectTopBoardList");
	}
	public int searchInput(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectSearchCount", map);
	}
	public ArrayList<Product> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", map, rowBounds);
	}

	public Member selectIdPhoneList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectIdPhoneList", map);
	}
	public int findPwCheck(Member member, SqlSessionTemplate sqlSession){
		System.out.println(member);
		return sqlSession.selectOne("memberMapper.findPwCheck", member);	
	}
	public int findPw(String email, String userId, String userPwd, SqlSessionTemplate sqlSession){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("userId", userId);
		map.put("userPw", userPwd);
		return sqlSession.update("memberMapper.findPw", map);
	}

	
	public Member checkMember(SqlSessionTemplate sqlSession, Member check) {
		return sqlSession.selectOne("memberMapper.checkMember", check);
	}
}
