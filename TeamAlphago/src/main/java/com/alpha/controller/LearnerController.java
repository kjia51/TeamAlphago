package com.alpha.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.LearnerService;
import com.alpha.vo.Criteria;
import com.alpha.vo.LearnerVO;

@RestController
@RequestMapping("/alpha/*")
public class LearnerController extends CommonRestController {

	@Autowired
	private LearnerService learnerService;

	@GetMapping("/joinGroup")
	public ModelAndView groupInfo() {

		ModelAndView mav = new ModelAndView("/learner/joinGroup");
	
		return mav;
	}

//	@PostMapping("joinGroup")
//	public Map<String, Object> groupInfo(@RequestBody LearnerVO learnerVO) {
//
//		System.out.println("----------------");
//
//		try {
//			List<LearnerVO> res = learnerService.groupInfo(learnerVO);
//			System.out.println(learnerVO);
//			return ;
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return responseMap(REST_FAIL, "등록 중 오류 발생");
//		}
//	}



}
