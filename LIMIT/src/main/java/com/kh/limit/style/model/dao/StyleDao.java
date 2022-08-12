package com.kh.limit.style.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.product.model.vo.Product;
import com.kh.limit.style.model.vo.Like;
import com.kh.limit.style.model.vo.Reply;
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

	public int increaseCount(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.update("styleMapper.increaseCount", sno);
	}
	
	public Style selectStyle(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.selectOne("styleMapper.selectStyle", sno);
	}

	public ArrayList<Attachment> selectAtt(SqlSessionTemplate sqlSession, int sno) {
		return (ArrayList)sqlSession.selectList("styleMapper.selectAtt", sno);
	}

	public int selectLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.selectOne("styleMapper.selectLike", like);
	}
	
	public int insertLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.insert("styleMapper.insertLike", like);
	}

	public int deleteLike(SqlSessionTemplate sqlSession, Like like) {
		return sqlSession.delete("styleMapper.deleteLike", like);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int sno) {
		return (ArrayList)sqlSession.selectList("styleMapper.selectReplyList", sno);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("styleMapper.insertReply", r);
	}

	public int deleteStyle(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.update("styleMapper.deleteStyle", sno);
	}

	public int updateStyle(SqlSessionTemplate sqlSession, Style s) {
		return sqlSession.update("styleMapper.updateStyle", s);
	}

	public ArrayList<Product> selectProdictList(SqlSessionTemplate sqlSession, String[] productNoList) {
		return (ArrayList)sqlSession.selectList("styleMapper.selectProductList", productNoList);
	}

	public ArrayList<Product> searchProductList(SqlSessionTemplate sqlSession, String keyWord) {
		return (ArrayList)sqlSession.selectList("styleMapper.searchProductList", keyWord);
	}

	



	

}
