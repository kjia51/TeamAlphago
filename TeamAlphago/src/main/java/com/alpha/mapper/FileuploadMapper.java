package com.alpha.mapper;

import com.alpha.vo.FileuploadVO;

public interface FileuploadMapper {
	
	public int insert(FileuploadVO vo);
	
	public int update(FileuploadVO vo);
	
	public FileuploadVO selectOne(String c_no);
	
}
