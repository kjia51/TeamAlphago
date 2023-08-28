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
		System.out.println("���������� ����");
		
		ModelAndView mav = new ModelAndView("/main/main");
		return mav;
	}
	
}
