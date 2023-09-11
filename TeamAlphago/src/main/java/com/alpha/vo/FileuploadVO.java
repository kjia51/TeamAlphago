package com.alpha.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileuploadVO {
	public String uuid;
	public String uploadpath;
	public String filename;
	public String filetype;
	public String c_no;
	public MultipartFile file;
	private String savePath;
	private String s_savePath;
}
