package com.alpha.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.alpha.vo.CartVO;
import com.alpha.vo.ContentVO;
import com.alpha.vo.SalesVO;

@Service
public interface ContentService {
	public List<ContentVO> getContentList();
	
	public int insertContent(ContentVO contentVO);
	
	public ContentVO getContentOne(String c_id);
	
	public int updateContent(ContentVO contentVO);
	
	public int deleteContent(String c_id);
	
	public int cartCnt(String cr_m_no);
	
	public int deleteCart(String cr_m_no, String cr_c_no, String cnt);
	
	public List<SalesVO> salesContent(String c_level);
	
	public List<SalesVO> salesLevel(String c_level);
	
	public List<SalesVO> salesDate(String startdate, String enddate);
	
	public int addCart(CartVO cartVO);
	
	public List<CartVO> getCartList(String cr_c_no);
	
	public List<CartVO> getMyCart(String cr_m_no);
	
	public int addCartListCnt(CartVO cartVO);
}
