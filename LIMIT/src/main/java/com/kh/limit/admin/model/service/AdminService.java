package com.kh.limit.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.dao.AdminDao;
import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.ProductResell;
import com.kh.limit.product.model.vo.Product;

@Service
public class AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;

	public int insertQna(Notice n) {
		return adminDao.insertQna(sqlSession, n);
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return adminDao.selectNoticeList(sqlSession, pi);
	}

	public int selectNoticeCount() {
		return adminDao.selectNotcieCount(sqlSession);
	}

	public Notice selectNotice(int noticeNo) {
		return adminDao.selectNotice(sqlSession, noticeNo);
	}

	public int deleteNotice(int noticeNo) {
		return adminDao.deleteNotice(sqlSession, noticeNo);
	}

	public int updateNotice(Notice n) {
		return adminDao.updateNotice(sqlSession, n);
	}

	public int selectQnaCount() {
		return adminDao.selectQnaCount(sqlSession);
	}

	public ArrayList<Notice> selectQnaList(PageInfo pi) {
		return adminDao.selectQnaList(sqlSession, pi);
	}

	public ArrayList<CommonName> selectCategory() {
		return adminDao.selectCategory(sqlSession);
	}

	public ArrayList<CommonName> selectBrand() {
		return adminDao.selectBrand(sqlSession);
	}

	public ArrayList<CommonName> selectCollection() {
		return adminDao.selectCollection(sqlSession);
	}

	public int insertProduct(Product product) {
		return adminDao.insertProduct(sqlSession, product);
	}

	public Product selectProduct() {
		return adminDao.selectProduct(sqlSession);
	}

	public int insertResellImges(ArrayList<Attachment> imgList) {
		int result = 1;
		
		for(Attachment img : imgList) {
			result *= adminDao.insertResellImges(sqlSession, img);
		}
		return result;
	}

	public int insertNotice(Notice n) {
		return adminDao.insertNotice(sqlSession, n);
	}

	public int insertSize(ArrayList<ProductResell> list) {
		return adminDao.insertSize(sqlSession, list);
	}

	public ArrayList<Product> selectProductList(PageInfo pi) {
		return adminDao.selectProductList(sqlSession, pi);
	}

	public int selectProdCount() {
		return adminDao.selectProdCount(sqlSession);
	}

	public int searchProdCount(HashMap<String, String> map) {
		return adminDao.searchProdCount(sqlSession, map);
	}

	public ArrayList<Product> searchProdList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.searchProdList(sqlSession, map, pi);
	}

	public String selectClothingPayment() {
		return adminDao.selectClothingPayment(sqlSession);
	}

	public String selectShoosePayment() {
		return adminDao.selectShoosePayment(sqlSession);
	}

	public String selectOtherPayment() {
		return adminDao.selectOtherPayment(sqlSession);
	}
	

	public String selectSumPayment(HashMap<String, String> dates) {
		return adminDao.selectSumPayment(sqlSession, dates);
	}

	
	
	
	
	
	
	
}
