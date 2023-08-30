package com.alpha.service;

import java.util.List;

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
	public QnAVO getQOne(String q_no, Model model) {

		QnAVO qnAVO = qnAMapper.getQOne(q_no);
		
		model.addAttribute("QnAVO", qnAVO);

		return null;
	}

	@Override
	public int deleteQ(String q_no) {
		return qnAMapper.deleteQ(q_no);
	}

}
