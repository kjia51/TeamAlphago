package com.alpha.vo;

import lombok.Data;

@Data
public class GrpVO {
   private String g_id; // 학습그룹id
   private String t_m_id; // 학습지도자 id
   private String g_c_id; // 콘텐츠 id
   private String g_name; // 그룹명
   private String g_cnt; // 그룹인원
   private String g_start; // 학습시작일
   private String g_end; // 학습종료일   
   
   // 그룹 가입 신청
   private String m_name; // 회원 이름(학습지도자 이름)
   private String g_period; // 학습 기간
   private String g_AppCnt; // 신청 현황(인원)
   
   
}        