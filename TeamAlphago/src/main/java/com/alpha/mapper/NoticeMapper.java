package com.alpha.mapper;

import java.util.List;

import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getNoticeList(Criteria cri);
	
	public int getTotalCnt();
	
}
