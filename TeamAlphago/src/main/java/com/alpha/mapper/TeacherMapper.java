package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.GrpVO;
import com.alpha.vo.LearnerVO;
import com.alpha.vo.SubscribeVO;

@Mapper
public interface TeacherMapper {
	
	public List<ContentVO> getContentList(Criteria cri); //콘텐츠 리스트 조회
	public int totalCnt(Criteria cri); //콘텐츠 총 건수 조회
	public List<ContentVO> getContentDetail(String c_no); //콘텐츠 상세리스트
	public int insertPayAction(SubscribeVO subVO); //콘텐츠 구매
	public List<SubscribeVO> mySubList(String t_m_id); //구독내역 조회
	public int cancelPay(String sub_id); //구독 환불&삭제
	public List<GrpVO> getmyGroupList(String t_m_id); //그룹 조회
	public int insertGroups(GrpVO groupVO); //그룹 등록
	public SubscribeVO getSubOne(String sub_no); //선택된 패키지 구독 정보 출력
	public GrpVO getGroupOne(String g_no); //선택된 그룹 정보 출력
	public List<LearnerVO> getGroupLearner(String g_no); //그룹에 속한 학습자 정보 출력
	public int updateGroupLearner(LearnerVO learnerVO); //그룹에서 학습자 탈퇴
	public int getContentCnt(String c_no);//콘텐츠 상세리스트 갯수
	
}
