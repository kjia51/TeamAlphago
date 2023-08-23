package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.SubscribeVO;

@Mapper
public interface TeacherMapper {
	
	public List<ContentVO> getContentList(Criteria cri); //콘텐츠 리스트 조회
	public int totalCnt(Criteria cri); //콘텐츠 총 건수 조회
	public List<ContentVO> getContentDetail(String c_id); //콘텐츠 상세리스트
	public int insertPayAction(SubscribeVO subVO); //콘텐츠 구매
	public List<SubscribeVO> mySubList(Criteria cri); //구독내역 조회
	public int cancelPay(String sub_id); //구독 환불&삭제
}
