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
	public List<LearnerVO> groupName(String g_name) {
		return learnerMapper.groupName(g_name);
	}

	// 그룹 정보 리스트 
	@Override
	public List<LearnerVO> groupInfo(String g_name) {
		return learnerMapper.groupInfo(g_name);
	}

	

		
	





}
