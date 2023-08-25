package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.LearnerMapper;
import com.alpha.vo.LearnerVO;

@Service
public class LearnerServiceImpl implements LearnerService {

	@Autowired
	private LearnerMapper learnerMapper;
	
	// 그룹 이름 리스트 
	@Override
	public List<LearnerVO> grourpName(String g_name) {
		return learnerMapper.grourpName(g_name);
	}
	
	// 그룹 정보 리스트 
	@Override
	public List<LearnerVO> groupInfo(LearnerVO learnerVO) {
		return learnerMapper.groupInfo(learnerVO);
		
	}





}
