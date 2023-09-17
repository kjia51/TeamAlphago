package com.alpha.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.mapper.QnAMapper;
import com.alpha.vo.Criteria;
import com.alpha.vo.PageDto;
import com.alpha.vo.QnAVO;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	QnAMapper qnAMapper;
	
	@Override
	public List<QnAVO> getQList(Criteria cri, Model model) {
		List<QnAVO> list = qnAMapper.getQList(cri);
		int qTotalCnt = qnAMapper.getQTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri, qTotalCnt);
		
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", qTotalCnt);
		model.addAttribute("pageDto", pageDto);
		
		return null;
	}

	@Override
	public int getQTotalCnt(Criteria cri) {
		return qnAMapper.getQTotalCnt(cri);
	}

	@Override
	public QnAVO getQOne(String q_no) {

		return qnAMapper.getQOne(q_no);
	}

	@Override
	public int deleteQ(String q_no) {
		return qnAMapper.deleteQ(q_no);
	}

	@Override
	public int insertQ(QnAVO qnAVO) {
		return qnAMapper.insertQ(qnAVO);
	}

	@Override
	public int editQ(QnAVO qnAVO) {
		return qnAMapper.editQ(qnAVO);
	}

	@Override
	public Map<String, Object> getAList(String a_q_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QnAVO> answerList = qnAMapper.getAList(a_q_no);
		map.put("answerList", answerList);
		return map;
	}

	@Override
	public int insertA(QnAVO qnAVO) {
		return qnAMapper.insertA(qnAVO);
	}

	@Override
	public int editA(QnAVO qnAVO) {
		return qnAMapper.editA(qnAVO);
	}

	@Override
	public int deleteA(String a_no) {
		return qnAMapper.deleteA(a_no);
	}

	@Override
	public int updateAnswerYN(String q_no) {
		return qnAMapper.updateAnswerYN(q_no);
	}

}
