package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.TeacherService;

@RestController
@RequestMapping("/alpha/*")
public class TeacherController {
	
	@Autowired 
	TeacherService service;
	
	@GetMapping("/teacher") //페이지 연결
	public ModelAndView teacher() {
		
		//model.addAttribute("contentList", service.getContentList());

		System.out.println("연결");
		ModelAndView mav = new ModelAndView("/teacher/teacher");
		mav.addObject("contentList", service.getContentList());
	
		return mav;
	}

}
