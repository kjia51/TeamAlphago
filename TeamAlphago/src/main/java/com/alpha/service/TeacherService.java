package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alpha.vo.ContentVO;

@Service
public interface TeacherService {
	
	public List<ContentVO> getContentList(); //콘텐츠 리스트 조회

}
