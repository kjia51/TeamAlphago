package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.LearnerService;
import com.alpha.vo.LearnerVO;

@RestController
@RequestMapping("/alpha/*")
public class LearnerController extends CommonRestController {

	@Autowired
	private LearnerService learnerService;

	// 그룹 가입 신청 페이지
	/*
	 * @GetMapping("/joinGroup") public ModelAndView joinGroup() { ModelAndView mav
	 * = new ModelAndView("/learner/joinGroup"); return mav; }
	 */
	// 학습지도자 숙제 전송 페이지
	@GetMapping("/giveHomework")
	public ModelAndView giveHomework() {
		ModelAndView mav = new ModelAndView("/learner/giveHomework");
		return mav;
	}
	// 학생 숙제 제출 페이지
	@GetMapping("/submitHomework")
	public ModelAndView submitHomework() {
		ModelAndView mav = new ModelAndView("/learner/submitHomework");
		return mav;
	}
	// 그룹 이름 리스트 
	/*
	 * @GetMapping("/learner/joinGroup/{g_name}") public Map<String, Object>
	 * groupName(@PathVariable("g_name") String g_name) { List<LearnerVO> groupNames
	 * = learnerService.groupName(g_name); Map<String, Object> map = new
	 * HashMap<String, Object>(); map.put("list", groupNames); return map; }
	 */
	@GetMapping("/joinGroup")
	public ModelAndView groupName(String g_name) {

		ModelAndView mav = new ModelAndView("/learner/joinGroup");
		mav.addObject("list", learnerService.groupName(g_name));

		return mav;
	}

//	@GetMapping("/joinGroup/{g_name}")
//	public Map<String, Object> groupInfo(@PathVariable("g_name") String g_name) {
//
//		System.out.println("----------------");
//
//		try {
//			LearnerVO learnerVO  = learnerService.groupInfo(g_name);
//			return ;
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			return responseMap(REST_FAIL, "등록 중 오류 발생");
//		}
//   }



}
