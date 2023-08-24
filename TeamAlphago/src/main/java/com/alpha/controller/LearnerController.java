package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.LearnerService;

@RestController
@RequestMapping("/alpha/*")
public class LearnerController { 
	
//	@Autowired
//	LearnerService learnerSevice;
			
	@GetMapping("/joinGroup")
	public ModelAndView learner(){
		ModelAndView mv = new ModelAndView("/learner/joinGroup");
		return mv;
	}
}
