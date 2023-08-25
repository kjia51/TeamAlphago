package com.alpha.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.LearnerService;
import com.alpha.vo.LearnerVO;

@RestController
@RequestMapping("/alpha/*")
public class LearnerController {

	@Autowired
	LearnerService learnerSevice;
			
	@GetMapping("/joinGroup")
	public ModelAndView main() {
		System.out.println("----------------");
		ModelAndView mav = new ModelAndView("/joinGroup");
		return mav;
	}
	@PostMapping("joinGroup")
	public Map<String, Object> groupList(@RequestBody LearnerVO learnerVO , Model model, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();

		return map;

		
	}
}
