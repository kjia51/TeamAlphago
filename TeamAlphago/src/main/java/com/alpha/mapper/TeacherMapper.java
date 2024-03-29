package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.GrpVO;
import com.alpha.vo.LearnerVO;
import com.alpha.vo.SubscribeVO;

@Mapper
public interface TeacherMapper {
	
	public List<ContentVO> getContentList(Criteria cri); //콘텐츠 리스트 조회
	public List<ContentVO> getMainContentList(Criteria cri); //메인 콘텐츠 리스트 조회
	public int totalCnt(Criteria cri); //콘텐츠 총 건수 조회
	public List<ContentVO> getContentDetail(String c_no); //콘텐츠 상세리스트
	public int insertPayAction(SubscribeVO subVO); //콘텐츠 구매
	public List<SubscribeVO> mySubList(@Param("t_m_id") String t_m_id, @Param("cri") Criteria cri); //구독내역 조회
	public int totalCntSub(@Param("t_m_id") String t_m_id, @Param("cri") Criteria cri); //총 구독 건수 조회
	public int cancelPay(String sub_id); //구독 환불&삭제
	public List<GrpVO> getmyGroupList(@Param("t_m_id") String t_m_id, @Param("cri") Criteria cri); //그룹 조회
	public List<GrpVO> conGroupList(String sub_no); //패키지에서 연결된 그룹 조회
	public int insertGroups(GrpVO groupVO); //그룹 등록
	public List<SubscribeVO> subContent(String t_m_id); //패키지랑 연결되지 않은 구독 리스트
	public SubscribeVO getSubOne(String sub_no); //선택된 패키지 구독 정보 출력
	public GrpVO getGroupOne(String g_no); //선택된 그룹 정보 출력
	public List<LearnerVO> getGroupLearner(@Param("g_no") String g_no); //그룹에 속한 학습자 정보 출력
	public List<LearnerVO> JoinGroupLearner(@Param("g_no") String g_no); //그룹 가입 신청자 정보 출력
	public int deleteGroupLearner(@Param("g_no") String g_no, @Param("l_no") String l_no); //그룹에서 학습자 탈퇴
	public int updateGroupLearner(@Param("g_no") String g_no, @Param("l_no") String l_no); //그룹 가입 신청자 승인
	public int updateMemCnt(String g_no); //그룹 학습자 인원 업데이트
	public int insertGroupupdatesub(@Param("sub_no") String sub_no, @Param("sub_connection") String sub_connection); //그룹 연결 패키지 구독내역 연결여부 yn
	public int getContentCnt(String c_no);//콘텐츠 상세리스트 갯수
	public int totalCntLearner(String g_no);//그룹학습인원수
	public int totalCntJoin(String g_no);//그룹가입신청인원수
	public int totalCntGrp(@Param("t_m_id") String t_m_id, @Param("cri") Criteria cri);//그룹갯수
	public int updateGrpName(@Param("g_no") String g_no, @Param("g_name") String g_name); //그룹명 바꾸기
	public List<LearnerVO> homeworkAlert(String l_m_id); //학습자 숙제 리스트 알림
	public LearnerVO homework(String l_m_id); //학습자 숙제 리스트 알림

	
}
