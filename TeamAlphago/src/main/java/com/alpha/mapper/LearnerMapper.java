package com.alpha.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.alpha.vo.LearnerVO;

@Mapper
public interface LearnerMapper {

	// 그룹 이름 리스트 
	public List<LearnerVO> groupName(String g_name);
	
	// 학습지도자별 그룹 이름 리스트 
	public List<LearnerVO> groupNameForT(String t_m_id);

	// 그룹 정보 리스트
	public List<LearnerVO> groupInfo(@Param("g_name") String g_name, @Param("l_m_id") String l_m_id);
	
	// 전체 그룹 리스트 
	public List<LearnerVO> grouplistAll(LearnerVO learnerVO);

	// 그룹 가입 신청
	public int insertGrp(LearnerVO learnerVO);
	
	// 그룹별 학습자 리스트 
	public List<LearnerVO> grpLearnerList(String g_no);
	
	// 숙제 요청 내역 저장
	public int insertHomework(LearnerVO learnerVO);
	
	// 학습자 숙제 내역
	public List<LearnerVO> homeworkList(String l_m_id);
	

	
 

}
