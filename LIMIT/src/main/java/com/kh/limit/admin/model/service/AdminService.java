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
import com.kh.limit.common.model.vo.Trade;
import com.kh.limit.member.model.vo.Member;
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

	public Product selectProductDetail(int productNo) {
		return adminDao.selectProductDetail(sqlSession, productNo);
	}

	public ArrayList<Attachment> selectAttachment(int productNo) {
		return adminDao.selectAttachment(sqlSession, productNo);
	}

	public int updateProduct(Product product) {
		return adminDao.updateProduct(sqlSession, product);
	}

	public int updateAttachment(Attachment attachment) {
		return adminDao.updateAttachment(sqlSession, attachment);
	}

	public int deleteAttachment(int fileNo) {
		return adminDao.deleteAttachment(sqlSession, fileNo);
	}

	public int insertUpdateImgs(ArrayList<Attachment> imgList, int productNo) {
		int result = 1;
		for(Attachment img : imgList) {
			img.setRefNo(productNo);
			result *= adminDao.insertUpdateImgs(sqlSession, img);
		}
		return result;
	}

	public int deleteProduct(int productNo) {
		return adminDao.deleteProduct(sqlSession, productNo);
	}

	public int restoreProduct(int productNo) {
		return adminDao.restoreProduct(sqlSession, productNo);
	}

	public int selectMemberCount() {
		return adminDao.selectMemberCount(sqlSession);
	}

	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return adminDao.selectMemberList(sqlSession, pi);
	}

	public int searchMemberCount(HashMap<String, String> map) {
		return adminDao.searchMemberCount(sqlSession, map);
	}

	public ArrayList<Member> searchMemberList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.searchMemberList(sqlSession, map, pi);
	}

	public Member selectMember(String userId) {
		return adminDao.selectMember(sqlSession, userId);
	}

	public int deleteMember(String userId) {
		return adminDao.deleteMember(sqlSession, userId);
	}

	public int restoreMember(String userId) {
		return adminDao.restoreMember(sqlSession, userId);
	}

	public int deletedMemberCount() {
		return adminDao.deletedMemberCount(sqlSession);
	}

	public ArrayList<Member> deletedMemberList(PageInfo pi) {
		return adminDao.deletedMemberList(sqlSession, pi);
	}

	public int searchDeletedMemCount(HashMap<String, String> map) {
		return adminDao.searchDeletedMemCount(sqlSession, map);
	}

	public ArrayList<Member> searchDeletedMemList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.searchDeletedMemList(sqlSession, map, pi);
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

	public int deliveryCount() {
		return adminDao.deliveryCount(sqlSession);
	}

	public ArrayList<Trade> deliveryList(PageInfo pi) {
		return adminDao.deliveryList(sqlSession, pi);
	}

	public int searchDeliveryCount(HashMap<String, String> map) {
		return adminDao.searchDeliveryCount(sqlSession, map);
	}

	public ArrayList<Trade> searchDeliveryList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.searchDeliveryList(sqlSession, map, pi);
	}

	public Trade selectDelivery(int tradeNo) {
		return adminDao.selectDelivery(sqlSession, tradeNo );
	}

	public int updateDelivery(HashMap<String, String> map) {
		return adminDao.updateDelivery(sqlSession, map);
	}

}
