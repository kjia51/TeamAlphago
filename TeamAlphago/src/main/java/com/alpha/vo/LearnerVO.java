package com.alpha.vo;

import lombok.Data;

@Data
public class LearnerVO {
	private String h_id; // 숙제 ID
	private String t_m_id; // 학습지도자 ID
	private String h_c_id; // 콘텐츠 ID
	private String l_m_id; // 학습자 ID
	private String h_limit; // 제출기한 
	private String h_homework; // 숙제 내용
	private String h_regidate; // 제출일자
	private String h_content; // 학습내용
	private String h_review; // 관리자 평가
	private String g_id; // 학습그룹 ID
}                            
