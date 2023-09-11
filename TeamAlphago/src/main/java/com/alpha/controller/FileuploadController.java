package com.alpha.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.service.FileuploadService;
import com.alpha.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/alpha/*")
@Log4j
public class FileuploadController extends CommonRestController{

	public static final String ATTACHES_DIR = "c:\\upload\\";

	@Autowired
	FileuploadService service;
	
	@PostMapping("/fileupload")
	public @ResponseBody Map<String, Object> fileupload(@RequestBody FileuploadVO vo) throws Exception {
		System.out.println("fileupload");
		int insertRes = service.fileupload(vo);
		System.out.println(insertRes);
		if(insertRes>1) {
			
			log.info("업로드 건수 ====================================" + insertRes);
		}
		return responseMap("success", "사진 등록이 완료되었습니다");
	}
}
