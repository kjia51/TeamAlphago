package com.alpha.mapper;

import java.util.List;

import com.alpha.vo.ContentVO;

public interface ContentMapper {
	public List<ContentVO> getContentList();
	
	public int insertContent(ContentVO contentVO);
}
