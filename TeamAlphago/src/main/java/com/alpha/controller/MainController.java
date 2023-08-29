package com.alpha.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/alpha/*")
@RestController
public class MainController {

	@GetMapping("main")
	public ModelAndView main() {
		
		ModelAndView mav = new ModelAndView("/main/main");
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
