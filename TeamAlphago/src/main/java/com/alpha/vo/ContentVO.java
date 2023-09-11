package com.alpha.vo;

import lombok.Data;

@Data
public class ContentVO {
	
	private String c_no; 
	private String c_name; 
	private String c_level; 
	private String level; 
	private String c_able; 
	private int c_price; 
	private String c_discount; 
	private int c_sellprice; 
	private String c_content; 

	private String poss_able; 
	private String savepath; 
}
