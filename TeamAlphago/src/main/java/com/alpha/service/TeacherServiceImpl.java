package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.TeacherMapper;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.GroupsVO;
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
	public List<GroupsVO> getmyGroupList(String t_m_id) {
		return mapper.getmyGroupList(t_m_id);
	}

	@Override
	public int insertGroups(GroupsVO groupVO) {
		return mapper.insertGroups(groupVO);
	}

	@Override
	public SubscribeVO getSubOne(String sub_id) {
		return mapper.getSubOne(sub_id);
	}

	

}
