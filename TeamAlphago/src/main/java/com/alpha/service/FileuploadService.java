package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.vo.FileuploadVO;


@Service
public interface FileuploadService {

	public int insert(FileuploadVO vo);

	public int update(FileuploadVO vo);
	
	public int delete(String c_no);
	
	public int fileEdit(List<MultipartFile> files, String c_no) throws Exception;
	
	public int fileupload(List<MultipartFile> files, String c_no) throws Exception;

	public FileuploadVO selectOne(String c_no);
}
