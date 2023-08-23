package com.alpha.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.TeacherService;
import com.alpha.vo.Criteria;
import com.alpha.vo.PageDto;
import com.alpha.vo.SubscribeVO;

@RestController
@RequestMapping("/alpha/*")
public class TeacherController {
	
	@Autowired 
	TeacherService service;
	
	@GetMapping("/teacher") //페이지 연결
	public ModelAndView teacher(Criteria cri) {
		

		int totalCnt = service.totalCnt(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		System.out.println("연결");
		System.out.println(pageDto);
		ModelAndView mav = new ModelAndView("/teacher/teacher");
		mav.addObject("pageDto", pageDto);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("contentList", service.getContentList(cri));
	
		return mav;
	}
	@RequestMapping(value="/teacher/detail",method = RequestMethod.GET)
	public ModelAndView detail(String c_id) {
		
		ModelAndView mav = new ModelAndView("/teacher/contentDetail");
		System.out.println(c_id);
		mav.addObject("contentList", service.getContentDetail(c_id));
		
		return mav;
	}
	
	@RequestMapping(value = "/teacher/insertContent", method= RequestMethod.POST)
	public void insertPayAction(SubscribeVO subVO, HttpServletRequest request) {

		String sub_id = request.getParameter("sub_id");
		String sub_c_id = request.getParameter("sub_c_id");
		String t_m_id = request.getParameter("t_m_id");
		String sub_name = request.getParameter("sub_name");
		String sub_date = request.getParameter("sub_date");
		String sub_price = request.getParameter("sub_price");
		String sub_able = request.getParameter("sub_able");
		String sub_current = request.getParameter("sub_current");
		
		System.out.println(sub_id);
		System.out.println(sub_c_id);
		System.out.println(t_m_id);
		System.out.println(sub_name);
		System.out.println(sub_date);
		System.out.println(sub_price);
		System.out.println(sub_able);
		System.out.println(sub_current);
		
		service.insertPayAction(subVO);
		
//		if(res>1) {
//			System.out.println("insert 성공");
//		} else {
//			System.out.println("inset 중 오류 발생");
//		}
//		
		
	}
	
	

}
