package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;

@Service
public interface NoticeService {

	public List<NoticeVO> getNoticeList(Criteria cri, Model model);
	
	public List<NoticeVO> getMainNoticeList(Criteria cri);
	
	public int getTotalCnt(Criteria cri);
	
	public NoticeVO getNoticeOne(String n_no);
	
	public int insertNotice(NoticeVO noticeVO);
	
	public int editNotice(NoticeVO noticeVO);
	
	public int deleteNotice(String n_no);

	
}
