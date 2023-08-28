package com.alpha.service;

import java.util.List;

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
	public List<SubscribeVO> mySubList(String t_m_id) {
		return mapper.mySubList(t_m_id);
	}

	@Override
	public int cancelPay(String imp_uid) {
		
		String sub_id = imp_uid;
		return mapper.cancelPay(sub_id);
	}

	@Override
	public List<GrpVO> getmyGroupList(String t_m_id) {
		System.out.println("qqqqqqqqqqqqqqq");
		System.out.println(t_m_id);
		System.out.println(mapper.getmyGroupList(t_m_id));
		return mapper.getmyGroupList(t_m_id);
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
	public int updateGroupLearner(LearnerVO learnerVO) {
		return mapper.updateGroupLearner(learnerVO);
	}

	@Override
	public int getContentCnt(String c_no) {
		// TODO Auto-generated method stub
		return mapper.getContentCnt(c_no);
	}

	

}
