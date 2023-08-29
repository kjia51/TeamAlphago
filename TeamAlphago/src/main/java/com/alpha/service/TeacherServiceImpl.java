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
	public List<LearnerVO> getGroupLearner(String g_no) {
		return mapper.getGroupLearner(g_no);
	}

	@Override
	public int getContentCnt(String c_no) {
		return mapper.getContentCnt(c_no);
	}

	@Override
	public int deleteGroupLearner(String l_no) {
		return mapper.deleteGroupLearner(l_no);
	}

	@Override
	public List<LearnerVO> JoinGroupLearner(String g_no) {
		return mapper.JoinGroupLearner(g_no);
	}

	@Override
	public int updateGroupLearner(String l_no) {
		return mapper.updateGroupLearner(l_no);
	}

	@Override
	public List<SubscribeVO> subContent(String t_m_id) {
		return mapper.subContent(t_m_id);
	}

	@Override
	public int insertGroupupdatesub(String sub_no) {
		return mapper.insertGroupupdatesub(sub_no);
	}

	@Override
	public List<SubscribeVO> mySubList(String t_m_id, Criteria cri) {
		return mapper.mySubList(t_m_id, cri);
	}

	@Override
	public int totalCntSub(String t_m_id, Criteria cri) {
		return mapper.totalCntSub(t_m_id, cri);
	}

	

}
