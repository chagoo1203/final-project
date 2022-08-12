package com.kh.limit.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.product.model.dao.ProductDao;
import com.kh.limit.product.model.vo.Product;

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

}
