package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
		ModelAndView mav = new ModelAndView("/notice/notice_list");
		noticeService.getNoticeList(cri, model);
		
		log.info("cri : " + cri);
		
		return mav;
	}
	
	
	@GetMapping("/notice/view")
	public ModelAndView getNoticeOne(String n_no, NoticeVO noticeVO, Model model) {
		ModelAndView mav = new ModelAndView("/notice/notice_view");
		noticeService.getNoticeOne(n_no, model);
		return mav;
	}
	
	
	@GetMapping("/notice/write")
	public ModelAndView insertNotice(NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView("/notice/notice_write");
		return mav;
	}
	
	@PostMapping("/notice/write")
	public void insertNoticeAction(NoticeVO noticeVO) {
		int res = noticeService.insertNotice(noticeVO);
	}
	
	
	
	@GetMapping("/notice/edit")
	public ModelAndView editNotice(NoticeVO noticeVO) {
		ModelAndView mav = new ModelAndView("/notice/notice_edit");
		mav.addObject("noticeVO", noticeVO);
		return mav;
	}
	
	@PostMapping("/notice/edit")
	public void editNoticeAction(NoticeVO noticeVO) {
		int res = noticeService.editNotice(noticeVO);
	}
	
	
	@DeleteMapping("/notice/delete/{n_no}")
	public void deleteNotice(@PathVariable String n_no) {
	    int res = noticeService.deleteNotice(n_no);
	}
	
}
