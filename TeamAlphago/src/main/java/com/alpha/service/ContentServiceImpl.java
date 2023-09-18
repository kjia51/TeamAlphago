package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.ContentMapper;
import com.alpha.vo.CartVO;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.SalesVO;

@Service
public class ContentServiceImpl implements ContentService {
	
	@Autowired
	ContentMapper contentMapper;

	@Override
	public List<ContentVO> getContentList() {
		// TODO Auto-generated method stub
		return contentMapper.getContentList();
	}

	@Override
	public int insertContent(ContentVO contentVO) {
		// TODO Auto-generated method stub
		return contentMapper.insertContent(contentVO);
	}

	@Override
	public ContentVO getContentOne(String c_id) {
		// TODO Auto-generated method stub
		return contentMapper.getContentOne(c_id);
	}

	@Override
	public int updateContent(ContentVO contentVO) {
		// TODO Auto-generated method stub
		return contentMapper.updateContent(contentVO);
	}

	@Override
	public int deleteContent(String c_id) {
		// TODO Auto-generated method stub
		return contentMapper.deleteContent(c_id);
	}

	@Override
	public List<SalesVO> salesContent(String c_level) {
		// TODO Auto-generated method stub
		return contentMapper.salesContent(c_level);
	}
 
	@Override
	public int addCart(CartVO cartVO) {
		// TODO Auto-generated method stub
		return contentMapper.addCart(cartVO);
	}

	@Override
	public List<CartVO> getCartList(String cr_c_no) {
		// TODO Auto-generated method stub
		return contentMapper.getCartList(cr_c_no);
	}

	@Override
	public int addCartListCnt(CartVO cartVO) {
		// TODO Auto-generated method stub
		return contentMapper.addCartListCnt(cartVO);
	}

	@Override
	public List<SalesVO> salesDate(String startdate, String enddate) {
		// TODO Auto-generated method stub
		return contentMapper.salesDate(startdate, enddate);
	}

	@Override
	public List<CartVO> getMyCart(String cr_m_no) {
		// TODO Auto-generated method stub
		return contentMapper.getMyCart(cr_m_no);
	}

	@Override
	public int deleteCart(String cr_m_no, String cr_c_no, String cnt) {
		// TODO Auto-generated method stub
		return contentMapper.deleteCart(cr_m_no, cr_c_no, cnt);
	}

	@Override
	public int cartCnt(String cr_m_no) {
		// TODO Auto-generated method stub
		return contentMapper.cartCnt(cr_m_no);
	}

	@Override
	public List<SalesVO> salesLevel(String c_level) {
		// TODO Auto-generated method stub
		return contentMapper.salesLevel(c_level);
	}

	@Override
	public ContentVO contentGetOne(ContentVO contentVO) {
		// TODO Auto-generated method stub
		return contentMapper.contentGetOne(contentVO);
	}

	@Override
	public int deleteFile(String c_id) {
		// TODO Auto-generated method stub
		return contentMapper.deleteFile(c_id);
	}

	@Override
	public int salesCount(Criteria cri) {
		// TODO Auto-generated method stub
		return contentMapper.salesCount(cri);
	}

	@Override
	public List<SalesVO> salesDateReverse(String startdate, String enddate, Criteria cri) {
		// TODO Auto-generated method stub
		return contentMapper.salesDateReverse(startdate, enddate, cri);
	}


}
