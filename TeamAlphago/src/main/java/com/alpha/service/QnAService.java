package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.vo.Criteria;
import com.alpha.vo.QnAVO;

@Service
public interface QnAService {

	public List<QnAVO> getQList(Criteria cri, Model model);
	
	public int getQTotalCnt(Criteria cri);
	
	public QnAVO getQOne(String q_no, Model model);
	
	public int deleteQ(String q_no);
	
}
