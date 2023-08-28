package com.alpha.mapper;

import java.util.List;

import org.springframework.ui.Model;

import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getNoticeList(Criteria cri);
	
	public int getTotalCnt();
	
	public NoticeVO getNoticeOne(String n_no);
	
}
