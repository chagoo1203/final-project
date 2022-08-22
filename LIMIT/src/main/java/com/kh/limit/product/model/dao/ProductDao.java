package com.kh.limit.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.ResellInfo;
import com.kh.limit.common.model.vo.SelectUsedBoardVo;
import com.kh.limit.common.model.vo.Trade;
import com.kh.limit.product.model.vo.Product;
import com.kh.limit.style.model.vo.Style;


@Repository
public class ProductDao {

	public ArrayList<CommonName> selectBrand(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectBrand");
	}

	
	public ArrayList<CommonName> selectCollection(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectCollection");
	}
	
	public ArrayList<Product> selectResellList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectResellList");
	}


	public int increaseCount(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.increaseCount", productNo);
	}


	public Product selectResellProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectResellProduct", productNo);
	}


	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectAttachmentList", productNo);
	}


	public ArrayList<Product> selectDetailProduct(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectDetailProduct", productNo);
	}

	public int selectInterestProduct(SqlSessionTemplate sqlSession, Interested i) {
		return sqlSession.selectOne("productMapper.selectInterestProduct", i);
	}

	public int insertInterestProduct(SqlSessionTemplate sqlSession, Interested i) {
		return sqlSession.insert("productMapper.insertInterestProduct", i);
	}

	public int deleteInterestProduct(SqlSessionTemplate sqlSession, Interested i) {
		return sqlSession.delete("productMapper.deleteInterestProduct", i);
	}


	public int updateInterestProduct(SqlSessionTemplate sqlSession, Interested i) {
		return sqlSession.update("productMapper.updateInterestProduct", i);
	}


	public int reduceInterestProduct(SqlSessionTemplate sqlSession, Interested i) {
		return sqlSession.update("productMapper.reduceInterestProduct", i);
	}


	public int insertSellProduct(SqlSessionTemplate sqlSession, ResellInfo ri) {
		return sqlSession.insert("productMapper.insertSellProduct", ri);
	}


	public ArrayList<Trade> priceGraphWeek(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.priceGraphWeek", productNo);
	}


	public ArrayList<Trade> priceGraphMonth(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.priceGraphMonth", productNo);
	}


	public ArrayList<Trade> priceGraphYear(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.priceGraphYear", productNo);
	}


	public ResellInfo selectResellInfo(SqlSessionTemplate sqlSession, int resellNo) {
		return sqlSession.selectOne("productMapper.selectResellInfo", resellNo);
	}


	public int insertTrade(SqlSessionTemplate sqlSession, Trade t) {
		return sqlSession.insert("productMapper.insertTrade", t);
	}


	public int updateResellInfo(SqlSessionTemplate sqlSession, int resellNo) {
		return sqlSession.update("productMapper.updateResellInfo", resellNo);
	}


	public int updateProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.updateProduct", productNo);
	}


	public ArrayList<Product> selectResellListCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectResellListCount");
	}


	public ArrayList<Product>selectResellListLikes(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectResellListLikes");
	}


	public ArrayList<Product> selectResellListTrade(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectResellListTrade");
	}


	public ArrayList<Product> selectResellListDate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectResellListDate");
	}


	public int selectListCount(SqlSessionTemplate sqlSession, SelectUsedBoardVo subv) {
		return sqlSession.selectOne("productMapper.selectListCount", subv);
	}


	public ArrayList<Product> selectBoard(SqlSessionTemplate sqlSession, SelectUsedBoardVo subv) {
		return (ArrayList)sqlSession.selectList("productMapper.selectBoard", subv);
	}


	public int selectCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("productMapper.selectCount");
	}

	public ArrayList<Style> productNoStyle(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("productMapper.productNoStyle", pno);
	}

	public Product selectProductList(SqlSessionTemplate sqlSession, String l) {
		return sqlSession.selectOne("productMapper.selectProductList", l);
	}
	
	
	

}
