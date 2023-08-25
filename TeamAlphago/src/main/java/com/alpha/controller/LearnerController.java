package com.alpha.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@RestController
@RequestMapping("/alpha/*")
public class LearnerController {
			
	@GetMapping("/joinGroup")
	public ModelAndView main() {
		System.out.println("----------------");
		ModelAndView mav = new ModelAndView("/learner/joinGroup");
		return mav;
	}
//	@PostMapping("joinGroup")
//	public Map<String, Object> groupList(@RequestBody LearnerVO learnerVO , Model model, HttpServletRequest request){
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		return map;
//
//		
//	}
}
