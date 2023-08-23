package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;

@Mapper
public interface TeacherMapper {
	
	public List<ContentVO> getContentList(Criteria cri); //콘텐츠 리스트 조회
	public int totalCnt(Criteria cri); //콘텐츠 총 건수 조회

}
