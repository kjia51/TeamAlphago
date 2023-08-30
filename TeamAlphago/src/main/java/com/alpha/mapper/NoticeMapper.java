package com.alpha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getNoticeList(Criteria cri);
	
	public int getTotalCnt(Criteria cri);
	
	public NoticeVO getNoticeOne(String n_no);
	
	public int insertNotice(NoticeVO noticeVO);
	
	public int editNotice(NoticeVO noticeVO);
	
	public int deleteNotice(String n_no);
	
}
