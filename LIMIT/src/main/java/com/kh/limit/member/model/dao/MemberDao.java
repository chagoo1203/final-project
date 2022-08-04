package com.kh.limit.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.limit.member.model.vo.Member;

@Repository
public class MemberDao {
	public Member loginMember(SqlSession sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

}
