package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.NoticeService;
import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/alpha/*")
@RestController
@Log4j
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/notice")
	public ModelAndView getNoticeList(Criteria cri, Model model) {
		ModelAndView mav = new ModelAndView("/board/notice_list");
		noticeService.getNoticeList(cri, model);
		
		log.info("cri : " + cri);
		
		return mav;
	}
	
	
	@GetMapping("/notice/view")
	public ModelAndView getNoticeOne(String n_no, NoticeVO noticeVO, Model model) {
		ModelAndView mav = new ModelAndView("/board/notice_view");
		noticeService.getNoticeOne(n_no, model);
		return mav;
	}
	
}
