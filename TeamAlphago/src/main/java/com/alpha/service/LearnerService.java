package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alpha.vo.LearnerVO;

@Service
public interface LearnerService {

	// 그룹 이름 리스트 
	public List<LearnerVO> groupName(String g_name);

	// 그룹 정보 리스트
	public List<LearnerVO> groupInfo(String g_name, String l_m_id);
	
	// 전체 그룹 리스트 
	public List<LearnerVO> grouplistAll(LearnerVO learnerVO);

	// 그룹 가입 신청
	public int insertGrp(LearnerVO learnerVO);

	// 그룹별 학습자 조회
	public List<LearnerVO> grpLearnerList();

 
}
