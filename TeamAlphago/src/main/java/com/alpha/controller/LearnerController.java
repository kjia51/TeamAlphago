package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alpha.service.LearnerService;
import com.alpha.vo.LearnerVO;
import com.alpha.vo.MemberVO;

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
	public ModelAndView groupName(String g_name, String l_m_id) {
	
		System.out.println(l_m_id);
		ModelAndView mav = new ModelAndView("/learner/joinGroup");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			mav.addObject("list", learnerService.groupName(g_name));
			mav.addObject("listAll", learnerService.grouplistAll());
			
		} catch (Exception e) {
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return mav; 
	}
	
	// 그룹 정보 리스트
	@GetMapping("/joinGroup/{g_name}")
	public Map<String, Object> groupInfo(@PathVariable("g_name") String g_name, MemberVO vo 
																	){
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			List<LearnerVO> grplist = learnerService.groupInfo(g_name);
			System.out.println(grplist);
			map.put("grplist", grplist);
			
		} catch (Exception e) {
			// TODO: handle exception
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return map;
	}
	// 그룹 가입 신청
	@PostMapping("/groupApply")
	public void groupApply(@RequestBody LearnerVO learnerVO) {
		System.out.println("그룹가입페이지 연결");
		
		learnerService.insertGrp(learnerVO);
		System.out.println("learnerVO:"+learnerVO);
	}

 
}
