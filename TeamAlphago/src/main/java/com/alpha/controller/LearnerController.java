package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	/* 그룹 가입 신청 페이지 */
	// 그룹 이름 리스트 	 
	@GetMapping("/joinGroup")
	public ModelAndView groupName(String g_name) {
		ModelAndView mav = new ModelAndView("/learner/joinGroup");
		try {
			mav.addObject("list", learnerService.groupName(g_name));
			
		} catch (Exception e) {
			// TODO: handle exception
			
		}
		return mav; 
	}
	
	// 그룹 정보 리스트
	@GetMapping("/joinGroup/{g_name}")
	public Map<String, Object> groupInfo(@PathVariable("g_name") String g_name, LearnerVO vo, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		if(id != null) {
			vo.setL_m_id(id);
		}else {
			vo.setL_m_id("");
		}
		
		List<LearnerVO> grplist = learnerService.groupInfo(g_name);
		System.out.println(grplist);
		map.put("grplist", grplist);
		
		return map;
	}




}
