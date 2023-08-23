package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.TeacherMapper;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;

@Service
public class TeacherServiceImpl implements TeacherService {

	
	@Autowired 
	private TeacherMapper mapper;

	@Override
	public List<ContentVO> getContentList(Criteria cri) {
		return mapper.getContentList(cri);
	}

	@Override
	public int totalCnt(Criteria cri) {
		return mapper.totalCnt(cri);
	}
	

}
