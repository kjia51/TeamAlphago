package com.alpha.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.TeacherMapper;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.GrpVO;
import com.alpha.vo.LearnerVO;
import com.alpha.vo.SubscribeVO;

@Service
public class TeacherServiceImpl implements TeacherService {

	
	@Autowired 
	private TeacherMapper mapper;

	@Override
	public List<ContentVO> getContentList(Criteria cri) {
		return mapper.getContentList(cri);
	}

	@Override
	public int totalCnt(Criteria cri) {
		return mapper.totalCnt(cri);
	}

	@Override
	public List<ContentVO> getContentDetail(String c_no) {
		return mapper.getContentDetail(c_no);
	}

	@Override
	public int insertPayAction(SubscribeVO subVO) {
		return mapper.insertPayAction(subVO);
	}

	@Override
	public int cancelPay(String imp_uid) {
		
		String sub_id = imp_uid;
		return mapper.cancelPay(sub_id);
	}

	@Override
	public List<GrpVO> getmyGroupList(String t_m_id, Criteria cri) {

		return mapper.getmyGroupList(t_m_id, cri);
	}

	@Override
	public int insertGroups(GrpVO groupVO) {
		return mapper.insertGroups(groupVO);
	}

	@Override
	public SubscribeVO getSubOne(String sub_no) {
		return mapper.getSubOne(sub_no);
	}

	@Override
	public GrpVO getGroupOne(String g_no) {
		return mapper.getGroupOne(g_no);
	}

	@Override
	public List<LearnerVO> getGroupLearner(String g_no, Criteria cri) {
		return mapper.getGroupLearner(g_no, cri);
	}

	@Override
	public int getContentCnt(String c_no) {
		return mapper.getContentCnt(c_no);
	}

	@Override
	public int deleteGroupLearner(String g_no, String l_no) {
		return mapper.deleteGroupLearner(g_no, l_no);
	}

	@Override
	public List<LearnerVO> JoinGroupLearner(String g_no, Criteria cri) {
		return mapper.JoinGroupLearner(g_no, cri);
	}

	@Override
	public int updateGroupLearner(String g_no, String l_no) {
		return mapper.updateGroupLearner(g_no, l_no);
	}

	@Override
	public List<SubscribeVO> subContent(String t_m_id) {
		return mapper.subContent(t_m_id);
	}

	@Override
	public int insertGroupupdatesub(String sub_no, String sub_connection) {
		return mapper.insertGroupupdatesub(sub_no, sub_connection);
	}

	@Override
	public List<SubscribeVO> mySubList(String t_m_id, Criteria cri) {
		return mapper.mySubList(t_m_id, cri);
	}

	@Override
	public int totalCntSub(String t_m_id, Criteria cri) {
		return mapper.totalCntSub(t_m_id, cri);
	}

	@Override
	public int totalCntLearner(String g_no) {
		return mapper.totalCntLearner(g_no);
	}

	@Override
	public int totalCntJoin(String g_no) {
		return mapper.totalCntJoin(g_no);
	}

	@Override
	public int totalCntGrp(String t_m_id, Criteria cri) {
		return mapper.totalCntGrp(t_m_id, cri);
	}

	@Override
	public List<GrpVO> conGroupList(String sub_no) {
		return mapper.conGroupList(sub_no);
	}

	@Override
	public int updateGrpName(String g_no, String g_name) {
		return mapper.updateGrpName(g_no, g_name);
	}

	@Override
	public List<ContentVO> getMainContentList(Criteria cri) {
		return mapper.getMainContentList(cri);
	}

	@Override
	public int updateMemCnt(String g_no) {
		return mapper.updateMemCnt(g_no);
	}

	@Override
	public List<LearnerVO> homeworkAlert(String l_m_id) {
		return mapper.homeworkAlert(l_m_id);
	}
	

}
