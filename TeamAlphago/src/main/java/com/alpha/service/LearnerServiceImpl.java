package com.alpha.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.alpha.mapper.LearnerMapper;
import com.alpha.vo.Criteria;
import com.alpha.vo.LearnerVO;
@Service
public class LearnerServiceImpl implements LearnerService {
	@Autowired
	private LearnerMapper learnerMapper;
	
	// 그룹 이름 리스트
	@Override
	public List<LearnerVO> groupName(String g_name) {
		return learnerMapper.groupName(g_name);
	}
	
	// 학습지도자 별 그룹 리스트 조회
	@Override
	public List<LearnerVO> groupNameForT(String t_m_id) {
		return learnerMapper.groupNameForT(t_m_id);
	}
	// 그룹별 정보 리스트 
	@Override
	public List<LearnerVO> groupInfo(String g_name, String l_m_id) {
		return learnerMapper.groupInfo(g_name, l_m_id);
	}

	// 전체 그룹 리스트 
	@Override
	public List<LearnerVO> grouplistAll(String l_m_id, Criteria cri) {
		return 	learnerMapper.grouplistAll(l_m_id,cri);
	}

	// 그룹 가입 신청
	@Override
	public int insertGrp(LearnerVO learnerVO) {
		return learnerMapper.insertGrp(learnerVO);
	}
	// 그룹별 학습자 리스트 조회
	@Override
	public List<LearnerVO> grpLearnerList(String g_no, String t_m_id) {
		return learnerMapper.grpLearnerList(g_no);
	}
	
	// 숙제 요청 내역 저장
	@Override
	public int insertHomework(LearnerVO learnerVO) {
		return learnerMapper.insertHomework(learnerVO);
	}
	// 학습자 숙제 내역
	@Override
	public List<LearnerVO> homeworkList(String l_m_id) {
		return learnerMapper.homeworkList(l_m_id);
	}
	// 학습자 숙제 제출
	@Override
	public int subitHomework(String h_no, String h_content) {
		return learnerMapper.subitHomework(h_no, h_content);
	}
	// 전체 리스트 갯수
	@Override
	public int grpTotalCnt(Criteria cri) {
		return learnerMapper.grpTotalCnt(cri);
	}
		
	
 
}