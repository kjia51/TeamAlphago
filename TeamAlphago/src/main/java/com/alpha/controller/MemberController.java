package com.alpha.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		ModelAndView mav = new ModelAndView("/login/login");
		return mav;
	}
	
	@PostMapping("/loginAction")
	public ResponseEntity<String> loginAction(@RequestBody MemberVO memberVO,
	                                          HttpSession session) {

	    try {
	        memberVO = memberService.login(memberVO);

	        if (memberVO != null) {
	            session.setAttribute("memberVO", memberVO);
	            return ResponseEntity.ok("로그인이 완료되었습니다.");
	        } else {
	            return ResponseEntity.badRequest().body("로그인 정보가 올바르지 않습니다.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.badRequest().body("로그인 중 오류가 발생했습니다.");
	    }
	}

	@GetMapping("/logout")
	 public ModelAndView logoutMainGET(HttpServletRequest request) throws Exception{
	        
       HttpSession session = request.getSession();
       session.invalidate();
       
       ModelAndView mav = new ModelAndView("redirect:/alpha/main");
	   return mav;
       
	    }
	
	
	@GetMapping("/signup_step1")
	public ModelAndView signup_step1() {
		
		ModelAndView mav = new ModelAndView("/login/signup_step1");
		return mav;
	}
	
	
	@GetMapping("/signup_step2")
	public ModelAndView signup_step2() {
		
		ModelAndView mav = new ModelAndView("/login/signup_step2");
		return mav;
	}
	
	@PostMapping("/register")
	public Map<String, Object> register(@RequestBody MemberVO memberVO) {
	    try {
	    	
	    	System.out.println("memberVO : " + memberVO);
	        int res = memberService.insert(memberVO);
	        if (res > 0) {
	            return responseMapMessage("success", "회원가입이 완료되었습니다..");
	        } else {
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
