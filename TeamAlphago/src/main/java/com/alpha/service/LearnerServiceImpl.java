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

	// 전체 그룹 리스트 
	@Override
	public List<LearnerVO> grouplistAll() {
		return 	learnerMapper.grouplistAll();
	}

	// 그룹 가입 신청
	@Override
	public int insertGrp(LearnerVO learnerVO) {
		return learnerMapper.insertGrp(learnerVO);
	}
	

		
	
 




}
