package com.alpha.vo;

import lombok.Data;

@Data
public class Criteria{
	
	private String searchField; //검색조건
	private String searchWord;  //검색어
	private String searchDate1; //날짜검색
	private String searchDate2; //날짜검색
	private String order; //정렬 조건
	private String c_level; //정렬 조건


	
	private int pageNo = 1;		//요청 페이지 번호
	private int amount = 9;	//한 페이지당 게시물 수
	
	private int startNo = 0;
	private int endNo 	= 9;

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		if(pageNo>0) {
			endNo = pageNo * amount;
			startNo = (pageNo - 1) * amount;
		}
	}
}
