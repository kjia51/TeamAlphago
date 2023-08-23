package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.TeacherService;
import com.alpha.vo.Criteria;
import com.alpha.vo.PageDto;

@RestController
@RequestMapping("/alpha/*")
public class TeacherController {
	
	@Autowired 
	TeacherService service;
	
	@GetMapping("/teacher") //페이지 연결
	public ModelAndView teacher(Criteria cri) {
		

		int totalCnt = service.totalCnt(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		System.out.println("연결");
		System.out.println(pageDto);
		System.out.println("연결");
		ModelAndView mav = new ModelAndView("/teacher/teacher");
		mav.addObject("pageDto", pageDto);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("contentList", service.getContentList(cri));
	
		return mav;
	}

}
