package com.kh.limit.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.limit.product.model.dao.ProductDao;
import com.kh.limit.product.model.vo.Brand;
import com.kh.limit.product.model.vo.Collection;

@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Brand> selectBrand() {
		return productDao.selectBrand(sqlSession);
	}

	public ArrayList<Collection> selectCollection() {
		return productDao.selectCollection(sqlSession);
	}

}
