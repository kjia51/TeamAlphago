package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.ContentMapper;
import com.alpha.vo.ContentVO;

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
	public int salesContent() {
		// TODO Auto-generated method stub
		return contentMapper.salesContent();
	}


}
