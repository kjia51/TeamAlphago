package com.alpha.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.vo.LearnerVO;

@Mapper
public interface LearnerMapper {

	// 그룹 이름 리스트 


	public List<LearnerVO> groupName(String g_name);
	
	// 그룹 정보 리스트
	//public List<LearnerVO> groupInfo(LearnerVO learnerVO);
	


}
