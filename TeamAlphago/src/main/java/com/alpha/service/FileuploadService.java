package com.alpha.service;

import org.springframework.stereotype.Service;

import com.alpha.vo.FileuploadVO;


@Service
public interface FileuploadService {

	public int insert(FileuploadVO vo);
	
	public int fileupload(FileuploadVO vo) throws Exception;

}
