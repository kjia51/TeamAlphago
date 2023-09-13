package com.alpha.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.alpha.service.FileuploadService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/alpha/*")
@Log4j
public class FileuploadController extends CommonRestController{

	public static final String ATTACHES_DIR = "c:\\upload\\";
//	public static final String ATTACHES_DIR = "/home/ubuntu/tomcat/apache-tomcat-9.0.80/webapps/upload";
	@Autowired
	FileuploadService service;
	
	@PostMapping("/fileupload")
	public @ResponseBody Map<String, Object> fileupload(@RequestParam List<MultipartFile> files,@RequestParam String c_no) throws Exception {
		System.out.println("fileupload");
		System.out.println(files);
		System.out.println(c_no);
		int insertRes = service.fileupload(files, c_no);
		System.out.println(insertRes);
		if(insertRes>1) {
			
			log.info("업로드 건수 ====================================" + insertRes);
		}
		return responseMap("success", "사진 등록이 완료되었습니다");
	}
	@PostMapping("/fileEdit")
	public @ResponseBody Map<String, Object> fileEdit(@RequestParam List<MultipartFile> files,@RequestParam String c_no) throws Exception {
		System.out.println("fileupload");
		System.out.println(files);
		System.out.println(c_no);
		int insertRes = service.fileEdit(files, c_no);
		System.out.println(insertRes);
		if(insertRes>1) {
			
			log.info("업로드 건수 ====================================" + insertRes);
		}
		return responseMap("success", "사진 등록이 완료되었습니다");
	}
	
	@GetMapping("/display")
	// 이미지를 화면에 보여줍니다
	public ResponseEntity<byte[]> display(String fileName) {
		log.info("=====fileName : " + fileName);
		
		try {
			// 파일 객체를 생성
			File file = new File(ATTACHES_DIR+fileName);
			HttpHeaders headers = new HttpHeaders();
			
			// 이미지 파일이 존재하면 파일을 이미지를 다운로드
			if(file.exists()) {
				// Mime타입을 설정
				headers.add("Content-Type",Files.probeContentType(file.toPath()));
				return new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
			}else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
		} catch (IOException e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
}
