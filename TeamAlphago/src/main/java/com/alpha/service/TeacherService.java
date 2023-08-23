package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;

@Service
public interface TeacherService {
	
	public List<ContentVO> getContentList(Criteria cri); //콘텐츠 리스트 조회
	public int totalCnt(Criteria cri); //콘텐츠 총 건수 조회

}
