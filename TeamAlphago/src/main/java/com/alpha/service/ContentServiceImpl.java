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


}
