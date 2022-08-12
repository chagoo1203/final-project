package com.kh.limit.style.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.product.model.vo.Product;
import com.kh.limit.style.model.dao.StyleDao;
import com.kh.limit.style.model.vo.Like;
import com.kh.limit.style.model.vo.Reply;
import com.kh.limit.style.model.vo.Style;

@Service
public class StyleService {

	@Autowired
	private StyleDao styleDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	
	public ArrayList<Style> selectStyleList(PageInfo pi){
		return styleDao.selectStyleList(sqlSession, pi);
	}
	
	
	public int insertStyle(Style style) {
		return styleDao.insetStyle(sqlSession, style);
	}
	
	
	
	public int insertStyleAttachment(ArrayList<Attachment> list) {
		int result = 1;
		for(Attachment img : list) {
			result*= styleDao.insertStyleAttachment(sqlSession, img);
		}
		return result;
	}


	public int seletListCount() {
		return styleDao.selectListCount(sqlSession);
	}


	public Style selectStyle(int sno) {
		return styleDao.selectStyle(sqlSession, sno);
		
	}


	public ArrayList<Attachment> selectAtt(int sno) {
		return styleDao.selectAtt(sqlSession, sno);
	}


	public int increaseCount(int sno) {
		return styleDao.increaseCount(sqlSession, sno);
	}


	public int selectLike(Like like) {
		return styleDao.selectLike(sqlSession, like);
	}
	
	public int insertLike(Like like) {
		return styleDao.insertLike(sqlSession, like);
	}


	public int deleteLike(Like like) {
		return styleDao.deleteLike(sqlSession, like);
	}


	public ArrayList<Reply> selectReplyList(int sno) {
		return styleDao.selectReplyList(sqlSession, sno);
	}


	public int insertReply(Reply r) {
		return styleDao.insertReply(sqlSession, r);
	}


	public int deleteStyle(int sno) {
		return styleDao.deleteStyle(sqlSession, sno);
	}


	public int updateStyle(Style s) {
		return styleDao.updateStyle(sqlSession, s);
	}


	public Product selectProductList(String l) {
		return styleDao.selectProdictList(sqlSession, l);
	}


	public ArrayList<Product> searchProductList(String keyWord) {
		return styleDao.searchProductList(sqlSession, keyWord);
	}


	
	
	
	

	
	
}
