package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alpha.vo.ContentVO;

public interface ContentMapper {
	public List<ContentVO> getContentList();
	
	public int insertContent(ContentVO contentVO);
	
	public ContentVO getContentOne(String c_id);

	public int updateContent(ContentVO contentVO);
	
	public int deleteContent(String c_id);
	
	public int salesContent();
	
	public int addCart(@Param("m_id") String m_id, @Param("c_no") String c_no);
	
}
