package com.alpha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.mapper.NoticeMapper;
import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;
import com.alpha.vo.PageDto;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> getNoticeList(Criteria cri, Model model) {
		
		List<NoticeVO> list = noticeMapper.getNoticeList(cri);
		int totalCnt = noticeMapper.getTotalCnt(cri);
		
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		
		return null;
	}

	@Override
	public int getTotalCnt(Criteria cri) {
		return noticeMapper.getTotalCnt(cri);
	}

	@Override
	public NoticeVO getNoticeOne(String n_no) {
	
		return noticeMapper.getNoticeOne(n_no);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		return noticeMapper.insertNotice(noticeVO);
	}

	@Override
	public int editNotice(NoticeVO noticeVO) {
		
		return noticeMapper.editNotice(noticeVO);
	}

	@Override
	public int deleteNotice(String n_no) {
		return noticeMapper.deleteNotice(n_no);
	}

}
