package com.alpha.vo;

import lombok.Data;

@Data
public class LearnerVO {
	private String h_no; // 숙제 ID
	private String t_m_id; // 학습지도자 ID
	private String h_c_no; // 콘텐츠 ID
	private String l_m_id; // 학습자 ID
	private String h_g_no; // 학습그룹 ID
	private String h_limit; // 제출기한 
	private String h_homework; // 숙제 내용
	private String h_regidate; // 제출일자
	private String h_content; // 학습내용
	private String h_review; // 관리자 평가
	
	
	private String g_no; // 학습그룹번호
	private String sub_no; // 구독내역번호
	private String g_name; // 그룹명
	private int g_cnt; // 그룹인원
	private String g_start; // 학습시작일
	private String g_end; // 학습종료일   
	private int sub_able; // 학습가능인원   
	
	
	// 그룹 가입 신청
	private String t_m_name; // 회원 이름(학습지도자 이름)
	private String g_period; // 학습 기간
	private int g_AppCnt; // 신청 현황(인원)
	
	//그룹 가입 승인
	private String m_name;
	private String l_g_no;
	private String l_no;
	   
	
	
}                            
