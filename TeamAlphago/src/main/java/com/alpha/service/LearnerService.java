package com.alpha.service;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.alpha.vo.Criteria;
import com.alpha.vo.LearnerVO;
@Service
public interface LearnerService {
	
	// 그룹 가입 신청 조회
	public int searchJoinGrp(String l_m_id);
	
	// 그룹 이름 리스트 
	public List<LearnerVO> groupName(String g_name);
	
	// 학습지도자별 그룹 이름 리스트 
	public List<LearnerVO> groupNameForT(String t_m_id);
	
	// 그룹별 가입 신청 리스트 
	public List<LearnerVO> groupInfo(@Param("g_name") String g_name, @Param("l_m_id") String l_m_id);

	// 그룹 전체 리스트 
	public List<LearnerVO> grouplistAll(@Param("l_m_id") String l_m_id, @Param("cri") Criteria cri);

	// 그룹 가입 전체 갯수
	public int grpTotalCnt(Criteria cri);
	
	// 그룹 가입 신청
	public int insertGrp(LearnerVO learnerVO);
	
	// 그룹별 학습자 리스트
	public List<LearnerVO> grpLearnerList(@Param("g_no") String g_no, @Param("t_m_id") String t_m_id);
	
	// 숙제 요청 내역 저장
	public int insertHomework(LearnerVO learnerVO);
	
	// 학습자 숙제 내역
	public List<LearnerVO> homeworkList(String l_m_id);
	
	// 학습자 숙제 제출
	public int subitHomework(@Param("h_no") String h_no, @Param("h_content") String h_content);
	
	// 학습지도자별 숙제 제출 리스트 조회
	public List<LearnerVO> submittedList(@Param("g_no") String g_no, @Param("t_m_id") String t_m_id);
	
	// 숙제 평가 내역 저장
	public int updateAssess(@Param("h_no") String h_no, @Param("h_review") String h_review);
	
	// 마이페이지 학습 내역
	public List<LearnerVO> myClassList(LearnerVO learnerVO);
 
}