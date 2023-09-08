package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.vo.FileuploadVO;

public interface FileuploadMapper {
	
	public int insert(@Param("file") List<MultipartFile> file, @Param("c_no") String c_no);
	
	public int contentfileupload(List<MultipartFile> files) throws Exception;
}
