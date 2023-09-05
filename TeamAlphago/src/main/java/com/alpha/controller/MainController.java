package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.NoticeService;
import com.alpha.service.TeacherService;
import com.alpha.vo.Criteria;

@RequestMapping("/alpha/*")
@RestController
public class MainController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	TeacherService teacherService;

	@GetMapping("main")
	public ModelAndView main(Criteria cri) {
		
		ModelAndView mav = new ModelAndView("/main/main");
		mav.addObject("noticeVOList", noticeService.getMainNoticeList(cri));
		mav.addObject("contentList", teacherService.getMainContentList(cri));
		return mav;
	}
	
	
	@GetMapping("policy/service")
	public ModelAndView service() {
		
		ModelAndView mav = new ModelAndView("/main/service");
		return mav;
	}
	
	
	@GetMapping("policy/privacy")
	public ModelAndView privacy() {
		
		ModelAndView mav = new ModelAndView("/main/privacy");
		return mav;
	}
	
	
	@GetMapping("policy/teamIntro")
	public ModelAndView teamIntro() {
		
		ModelAndView mav = new ModelAndView("/main/teamIntro");
		return mav;
	}
	
	
	@GetMapping("/guide")
	public ModelAndView guide() {
		
		ModelAndView mav = new ModelAndView("/main/guide");
		return mav;
	}
	
}
