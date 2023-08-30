package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.QnAService;
import com.alpha.vo.Criteria;

import lombok.extern.log4j.Log4j;

@RequestMapping("/alpha/*")
@RestController
@Log4j
public class QnAController {
	
	@Autowired
	QnAService qnAService;
	
	@GetMapping("/QnA")
	public ModelAndView getQList(Criteria cri, Model model) {
		ModelAndView mav = new ModelAndView("/QnA/question_list");
		qnAService.getQList(cri, model);
		
		log.info("cri : " + cri);
		
		return mav;
	}
	

	@GetMapping("/QnA/view")
	public ModelAndView getNoticeOne(String n_no, Model model) {
		ModelAndView mav = new ModelAndView("/QnA/question_view");
		qnAService.getQOne(n_no, model);
		return mav;
	}

}
