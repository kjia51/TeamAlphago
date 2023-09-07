package com.alpha.vo;

import lombok.Data;

@Data
public class CartVO {
	private String c_no; 
	private String cr_no; 
	private String cr_regdate; 
	private String cr_m_no; 
	private String cr_c_no; 
	private String c_name; 
	private String c_level; 
	private String cnt;
	private int c_price;
	private int c_sellprice;
	private String c_discountrate; 
}
