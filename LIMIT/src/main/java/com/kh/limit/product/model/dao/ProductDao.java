package com.kh.limit.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.Interested;
import com.kh.limit.product.model.vo.Product;


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


	
	
	

}
