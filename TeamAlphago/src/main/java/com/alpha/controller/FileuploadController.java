package com.alpha.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alpha.service.FileuploadService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/alpha/*")
@Log4j
public class FileuploadController extends CommonRestController{

	public static final String ATTACHES_DIR = "c:\\upload\\";

	@Autowired
	FileuploadService service;
	
	@PostMapping("/fileupload")
	public @ResponseBody Map<String, Object> PenssionloadActionFetch(List<MultipartFile> files, String c_no, RedirectAttributes rttr) throws Exception {
		int insertRes = service.insert(files, c_no);
		if(insertRes>1) {
			
		}
		log.info("업로드 건수 ====================================" + insertRes);
		return responseMap("success", "사진 등록이 완료되었습니다");
	}
}
