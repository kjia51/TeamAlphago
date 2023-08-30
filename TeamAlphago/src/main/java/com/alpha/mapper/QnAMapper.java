package com.alpha.mapper;

import java.util.List;

import com.alpha.vo.Criteria;
import com.alpha.vo.QnAVO;

public interface QnAMapper {

	public List<QnAVO> getQList(Criteria cri);
	
	public int getQTotalCnt(Criteria cri);
	
	public QnAVO getQOne(String q_no);
	
}
