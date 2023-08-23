package com.alpha.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.MemberService;
import com.alpha.vo.MemberVO;


@RequestMapping("/alpha/*")
@RestController
public class MemberController {
	
	@Autowired
	MemberService memberService;

	@GetMapping("/login")
	public ModelAndView login() {
		System.out.println("로그인페이지 연결");
		
		ModelAndView mav = new ModelAndView("/login/login");
		return mav;
	}
	
	@GetMapping("/signup_step1")
	public ModelAndView signup_step1() {
		System.out.println("회원가입1 연결");
		
		ModelAndView mav = new ModelAndView("/login/signup_step1");
		return mav;
	}
	
	
	@GetMapping("/signup_step2")
	public ModelAndView signup_step2() {
		System.out.println("회원가입2 연결");
		
		ModelAndView mav = new ModelAndView("/login/signup_step2");
		return mav;
	}
	
	@PostMapping("/register")
	public Map<String, Object> register(@RequestBody MemberVO memberVO) {
	    try {
	    	
	    	System.out.println("memberVO : " + memberVO);
	        // 회원가입 서비스 호출
	        int res = memberService.insert(memberVO);
	        if (res > 0) {
	            // 회원가입 성공 시 success 메시지를 반환
	            return responseMapMessage("success", "회원가입이 완료되었습니다.");
	        } else {
	            // 회원가입 실패 시 fail 메시지를 반환
	            return responseMapMessage("fail", "회원가입에 실패하였습니다. 다시 확인하세요.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return responseMapMessage("fail", "등록 중 예외사항이 발생하였습니다.");
	    }
	}

	private Map<String, Object> responseMapMessage(String result, String msg) {
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("msg", msg);
		return response;
	}
	
}
