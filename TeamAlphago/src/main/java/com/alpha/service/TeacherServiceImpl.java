package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.TeacherMapper;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.SubscribeVO;

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

	@Override
	public List<ContentVO> getContentDetail(String c_id) {
		return mapper.getContentDetail(c_id);
	}

	@Override
	public int insertPayAction(SubscribeVO subVO) {
		return mapper.insertPayAction(subVO);
	}

	

}
