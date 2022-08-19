package com.kh.limit.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.kh.limit.admin.model.vo.Notice;
import com.kh.limit.common.model.vo.Attachment;
import com.kh.limit.common.model.vo.CommonName;
import com.kh.limit.common.model.vo.PageInfo;
import com.kh.limit.common.model.vo.ProductResell;
import com.kh.limit.common.model.vo.Trade;
import com.kh.limit.member.model.vo.Member;
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

	public Product selectProductDetail(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("adminMapper.selectProductDetail", productNo);
	}

	public ArrayList<Attachment> selectAttachment(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAttachment", productNo);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product product) {
		return sqlSession.update("adminMapper.updateProduct", product);
	}

	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment attachment) {
		return sqlSession.update("adminMapper.updateAttachment", attachment);
	}

	public int deleteAttachment(SqlSessionTemplate sqlSession, int fileNo) {
		return sqlSession.delete("adminMapper.deleteAttachment", fileNo);
	}

	public int insertUpdateImgs(SqlSessionTemplate sqlSession, Attachment img) {
		return sqlSession.insert("adminMapper.insertUpdateImgs", img);
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("adminMapper.deleteProduct", productNo);
	}

	public int restoreProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("adminMapper.restoreProduct", productNo);
	}

	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectMemberCount");
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}

	public int searchMemberCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.searchMemberCount", map);
	}

	public ArrayList<Member> searchMemberList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchMemberList", map, rowBounds);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("adminMapper.selectMember", userId);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminMapper.deleteMember", userId);
	}

	public int restoreMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("adminMapper.restoreMember", userId);
	}

	public int deletedMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.deletedMemberCount");
	}

	public ArrayList<Member> deletedMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.deletedMemberList", null, rowBounds);
	}

	public int searchDeletedMemCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.searchDeletedMemCount", map);
	}

	public ArrayList<Member> searchDeletedMemList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchDeletedMemList", map, rowBounds);
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

	public int deliveryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.deliveryCount");
	}

	public ArrayList<Trade> deliveryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.deliveryList", null, rowBounds);
	}

	public int searchDeliveryCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.searchDeliveryCount", map);
	}

	public ArrayList<Trade> searchDeliveryList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchDeliveryList", map, rowBounds);
	}

	public Trade selectDelivery(SqlSessionTemplate sqlSession, int tradeNo) {
		return sqlSession.selectOne("adminMapper.selectDelivery", tradeNo);
	}

	public int updateDelivery(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		Set<String> keySet = map.keySet();        
		for (String key : keySet) {           
			System.out.println(key + " : " + map.get(key));
		}
		
		int result = sqlSession.update("adminMapper.updateDelivery", map);
		
		System.out.println(result);	
		
		
		return result;
	}

}
