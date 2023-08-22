package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.vo.ContentVO;

@Mapper
public interface TeacherMapper {
	
	public List<ContentVO> getContentList(); //콘텐츠 리스트 조회

}
