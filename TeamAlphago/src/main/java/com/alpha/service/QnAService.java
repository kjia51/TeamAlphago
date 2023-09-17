package com.alpha.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.vo.Criteria;
import com.alpha.vo.QnAVO;

@Service
public interface QnAService {

	public List<QnAVO> getQList(Criteria cri, Model model);
	
	public int getQTotalCnt(Criteria cri);
	
	public QnAVO getQOne(String q_no);

	public int insertQ(QnAVO qnAVO);
	
	public int editQ(QnAVO qnAVO);
	
	public int deleteQ(String q_no);
	
	public int updateAnswerYN(String q_no);
	
	
	public Map<String, Object> getAList(String a_q_no);
	
	public int insertA(QnAVO qnAVO);
	
	public int editA(QnAVO qnAVO);

	public int deleteA(String a_no);
}
