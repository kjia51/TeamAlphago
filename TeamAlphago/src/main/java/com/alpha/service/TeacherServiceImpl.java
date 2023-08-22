package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.TeacherMapper;
import com.alpha.vo.ContentVO;

@Service
public class TeacherServiceImpl implements TeacherService {

	
	@Autowired 
	private TeacherMapper mapper;
	
	@Override
	public List<ContentVO> getContentList() {
		return mapper.getContentList();
	}

}
