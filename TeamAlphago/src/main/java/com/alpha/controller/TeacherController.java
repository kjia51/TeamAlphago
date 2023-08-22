package com.alpha.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/alpha/*")
public class TeacherController {
	
	@GetMapping("/teacher")
	public String teacher() {
		
		System.out.println("연결");
		return "teacher/teacher";
	}

}
