package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alpha.vo.LearnerVO;

@Service
public interface LearnerService {

	// 그룹 이름 리스트 
	public List<LearnerVO> grourpName(String g_name);
	
	// 그룹 정보 리스트
	public List<LearnerVO> groupInfo(LearnerVO learnerVO);
}
