package com.alpha.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.vo.FileuploadVO;

@Service
public interface FileuploadService {

	public int insert(@Param("file") List<MultipartFile> file, @Param("c_no") String c_no);
}
