package com.kh.limit.usedboard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.SelectUsedBoardVo;
import com.kh.limit.usedboard.model.vo.UsedBoard;
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

	public int insertUsedBoard(SqlSessionTemplate sqlSession, UsedBoard usedBoard) {
		return sqlSession.insert("usedBoardMapper.insertUsedBoard", usedBoard);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment img) {
		return sqlSession.insert("usedBoardMapper.insertImgUsedBoard", img);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, SelectUsedBoardVo subv) {
		return sqlSession.selectOne("usedBoardMapper.selectListCount", subv);
	}

	public ArrayList<UsedBoard> selectList(SqlSessionTemplate sqlSession, SelectUsedBoardVo subv) {
		return (ArrayList)sqlSession.selectList("usedBoardMapper.selectList", subv);
	}

	public UsedBoard selectBoardDetail(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("usedBoardMapper.selectBoardDetail",boardNo);
	}

	public ArrayList<Attachment> selectBoardDetailImges(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("usedBoardMapper.selectBoardDetailImges", boardNo);
	}



}
