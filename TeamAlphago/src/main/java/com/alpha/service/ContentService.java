package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alpha.vo.ContentVO;

@Service
public interface ContentService {
	public List<ContentVO> getContentList();
	
	public int insertContent(ContentVO contentVO);
	
	public ContentVO getContentOne(String c_id);
	
	public int updateContent(ContentVO contentVO);
	
	public int deleteContent(String c_id);
}
