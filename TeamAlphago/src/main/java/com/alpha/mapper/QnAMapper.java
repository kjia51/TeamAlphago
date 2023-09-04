package com.alpha.mapper;

import java.util.List;

import com.alpha.vo.Criteria;
import com.alpha.vo.QnAVO;

public interface QnAMapper {

	public List<QnAVO> getQList(Criteria cri);
	
	public int getQTotalCnt(Criteria cri);
	
	public QnAVO getQOne(String q_no);
	
	public int insertQ(QnAVO qnAVO);
	
	public int editQ(QnAVO qnAVO);
	
	public int deleteQ(String q_no);
	
	
	public List<QnAVO> getAList(String a_q_no);
	
	public int insertA(QnAVO qnAVO);

	public int editA(QnAVO qnAVO);

	public int deleteA(String a_no);
}
