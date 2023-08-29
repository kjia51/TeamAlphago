package com.alpha.mapper;

import java.util.List;

import com.alpha.vo.CartVO;
import com.alpha.vo.ContentVO;

public interface ContentMapper {
	public List<ContentVO> getContentList();
	
	public int insertContent(ContentVO contentVO);
	
	public ContentVO getContentOne(String c_id);

	public int updateContent(ContentVO contentVO);
	
	public int deleteContent(String c_id);
	
	public int salesContent();
	
	public int addCart(CartVO cartVO);
	
	public List<CartVO> getCartList(String cr_c_no);
	
}
