package com.kh.limit.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.product.model.vo.Brand;
import com.kh.limit.product.model.vo.Collection;

@Repository
public class ProductDao {

	public ArrayList<Brand> selectBrand(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectBrand");
	}

	
	public ArrayList<Collection> selectCollection(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectCollection");
	}
	
	

}
