package com.alpha.vo;

import lombok.Data;

@Data
public class FileuploadVO {
	public String uploadpath;
	public String filename;
	public String filetype;
	public String c_no;
	private String savePath;
}
