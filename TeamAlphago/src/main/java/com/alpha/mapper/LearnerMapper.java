package com.alpha.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.alpha.vo.LearnerVO;

@Mapper
public interface LearnerMapper {

	// 그룹 이름 리스트 
	public List<LearnerVO> groupName(String g_name);

	// 그룹 정보 리스트
	public List<LearnerVO> groupInfo(@Param("g_name") String g_name, @Param("l_m_id") String l_m_id);
	
	// 전체 그룹 리스트 
	public List<LearnerVO> grouplistAll();

	// 그룹 가입 신청
	public int insertGrp(LearnerVO learnerVO);
	


	
 

}
