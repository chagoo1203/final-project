package com.kh.limit.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.common.model.vo.ResellInfo;
import com.kh.limit.common.model.vo.SelectUsedBoardVo;
import com.kh.limit.common.model.vo.Trade;
import com.kh.limit.product.model.dao.ProductDao;
import com.kh.limit.product.model.vo.Product;
import com.kh.limit.style.model.vo.Style;

@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CommonName> selectBrand() {
		return productDao.selectBrand(sqlSession);
	}

	public ArrayList<CommonName> selectCollection() {
		return productDao.selectCollection(sqlSession);
	}
	
	public ArrayList<Product> selectResellList(){
		return productDao.selectResellList(sqlSession);
	}

	public int increaseCount(int productNo) {
		return productDao.increaseCount(sqlSession, productNo);
	}

	public Product selectResellProduct(int pno) {
		return productDao.selectResellProduct(sqlSession, pno);
	}

	public ArrayList<Attachment> selectAttachmentList(int productNo) {
		return productDao.selectAttachmentList(sqlSession, productNo);
	}

	public ArrayList<Product> selectDetailProduct(int productNo) {
		return productDao.selectDetailProduct(sqlSession, productNo);
	}

	public int insertInterestProduct(Interested i) {
		return productDao.insertInterestProduct(sqlSession, i);
	}

	public int selectInterestProduct(Interested i) {
		return productDao.selectInterestProduct(sqlSession, i);
	}

	public int deleteInterestProduct(Interested i) {
		return productDao.deleteInterestProduct(sqlSession, i);
	}

	public int updateInterestProduct(Interested i) {
		return productDao.updateInterestProduct(sqlSession, i);
	}

	public int reduceInterestProduct(Interested i) {
		return productDao.reduceInterestProduct(sqlSession, i);
	}

	public int insertSellProduct(ResellInfo ri) {
		return productDao.insertSellProduct(sqlSession, ri);
	}

	public ArrayList<Trade> priceGraphWeek(int productNo) {
		return productDao.priceGraphWeek(sqlSession, productNo);
	}

	public ArrayList<Trade> priceGraphMonth(int productNo) {
		return productDao.priceGraphMonth(sqlSession, productNo);
	}

	public ArrayList<Trade> priceGraphYear(int productNo) {
		return productDao.priceGraphYear(sqlSession, productNo);
	}

	public ResellInfo selectResellInfo(int resellNo) {
		return productDao.selectResellInfo(sqlSession, resellNo);
	}

	public int insertTrade(Trade t) {
		return productDao.insertTrade(sqlSession, t);
	}

	public int updateResellInfo(int resellNo) {
		return productDao.updateResellInfo(sqlSession, resellNo);
	}

	public int updateProduct(int productNo) {
		return productDao.updateProduct(sqlSession, productNo);
	}

	public Object selectResellListCount() {
		return productDao.selectResellListCount(sqlSession);
	}

	public Object selectResellListLikes() {
		return productDao.selectResellListLikes(sqlSession);
	}

	public Object selectResellListTrade() {
		return productDao.selectResellListTrade(sqlSession);
	}

	public Object selectResellListDate() {
		return productDao.selectResellListDate(sqlSession);
	}

	public ArrayList<Product> selectBoard(SelectUsedBoardVo subv) {
		return productDao.selectBoard(sqlSession, subv);
	}

	public int selectListCount(SelectUsedBoardVo subv) {
		return productDao.selectListCount(sqlSession, subv);
	}

	public int selectCount() {
		return productDao.selectCount(sqlSession);
	}
	
	public ArrayList<Style> productNoStyle(int pno) {
		return productDao.productNoStyle(sqlSession, pno);
	}

	public Product selectProductList(String l) {
		return productDao.selectProductList(sqlSession, l);
	}

}
