package com.kh.limit.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.ProductResell;
import com.kh.limit.product.model.vo.Product;

@Repository
public class AdminDao {

	public int insertQna(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public int selectNotcieCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectNoticeCount");
	}

	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int selectQnaCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectQnaCount");
	}

	public ArrayList<Notice> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
			
		return (ArrayList)sqlSession.selectList("noticeMapper.selectQnaList", null, rowBounds);
	}

	public ArrayList<CommonName> selectCategory(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectCategory");
	}

	public ArrayList<CommonName> selectBrand(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBrand");
	}

	public ArrayList<CommonName> selectCollection(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectCollection");
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.insert("adminMapper.insertProduct", product);
	}

	public Product selectProduct(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectProduct");
	}

	public int insertResellImges(SqlSessionTemplate sqlSession, Attachment img) {
		return sqlSession.insert("adminMapper.insertResellImges", img);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}

	public int insertSize(SqlSessionTemplate sqlSession, ArrayList<ProductResell> list) {
		
		for(ProductResell ps : list) {
			System.out.println(ps);
		}
		
		return sqlSession.insert("adminMapper.insertSize", list);
	}

	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectProductList", null, rowBounds);
	}

	public int selectProdCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectProdCount");
	}

	public int searchProdCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.searchProdCount", map);
	}

	public ArrayList<Product> searchProdList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchProdList", map, rowBounds);
	}

	public String selectClothingPayment(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectClothingPayment");
	}

	public String selectShoosePayment(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectShoosePayment");
	}

	public String selectOtherPayment(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectOtherPayment");
	}

	public String selectSumPayment(SqlSessionTemplate sqlSession, HashMap<String, String> dates) {
		return sqlSession.selectOne("adminMapper.selectSumPayment",dates);
	}



}
