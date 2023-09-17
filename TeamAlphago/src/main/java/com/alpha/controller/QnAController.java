package com.alpha.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.QnAService;
import com.alpha.vo.Criteria;
import com.alpha.vo.NoticeVO;
import com.alpha.vo.QnAVO;

import lombok.extern.log4j.Log4j;

@RequestMapping("/alpha/QnA/*")
@RestController
@Log4j
public class QnAController extends CommonRestController {
	
	@Autowired
	QnAService qnAService;
	
	@GetMapping("/question")
	public ModelAndView getQList(Criteria cri, Model model) {
		ModelAndView mav = new ModelAndView("/QnA/question_list");
		qnAService.getQList(cri, model);
		
		log.info("cri : " + cri);
		
		return mav;
	}
	

	@GetMapping("/question_view")
	public ModelAndView getQOne(String q_no) {
		ModelAndView mav = new ModelAndView("/QnA/question_view");
		QnAVO qnAVO = qnAService.getQOne(q_no);
		mav.addObject("QnAVO", qnAVO);
		
		System.out.println(q_no);
		System.out.println(qnAVO);
		return mav;
	}
	
	
	@GetMapping("/question_write")
	public ModelAndView insertQ(QnAVO qnAVO) {
		ModelAndView mav = new ModelAndView("/QnA/question_write");
		return mav;
	}
	
	
	@PostMapping("/question_write")
	public Map<String, Object> insertQAction(QnAVO qnAVO) {
		
		int res = qnAService.insertQ(qnAVO);
		
		return responseWriteMap(res);		
	}
	
	
	@GetMapping("/question_edit")
	public ModelAndView editQ(QnAVO qnAVO) {
		ModelAndView mav = new ModelAndView("/QnA/question_edit");
		
		qnAVO = qnAService.getQOne(qnAVO.getQ_no());
		mav.addObject("QnAVO", qnAVO);
		return mav;
	}
	
	@PostMapping("/question_edit")
	public Map<String, Object> editQAction(QnAVO qnAVO) {
		int res = qnAService.editQ(qnAVO);
		return responseEditMap(res);
	}
	
	
	@DeleteMapping("/question_delete/{q_no}")
	public Map<String, Object> deleteQ(@PathVariable String q_no){
		
		int res = qnAService.deleteQ(q_no);
		
		return responseDeleteMap(res);
	}
	
	@GetMapping("/answer")
	public Map<String, Object> getAList(String a_q_no) {
		
		return qnAService.getAList(a_q_no);
	}
	
	
	
	@GetMapping("/answer_write")
	public void insertA(QnAVO qnAVO) {
		
	}
	
	
	@PostMapping("/answer_write")
	public Map<String, Object> insertAAction(QnAVO qnAVO) {
		qnAService.updateAnswerYN(qnAVO.getQ_no());
		
		int res = qnAService.insertA(qnAVO);
		
		return responseWriteMap(res);		
	}
	
	
	
	
	@PostMapping("/answer_edit")
	public Map<String, Object> editAAction(QnAVO qnAVO) {
		
		int res = qnAService.editA(qnAVO);
		
		return responseEditMap(res);		
	}

	

	@DeleteMapping("/answer_delete/{a_no}")
	public Map<String, Object> deleteA(@PathVariable String a_no){
		
		int res = qnAService.deleteA(a_no);
		
		return responseDeleteMap(res);
	}
	
	
}
