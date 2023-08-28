package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.MailService;
import com.alpha.service.MemberService;
import com.alpha.vo.MemberVO;


@RequestMapping("/alpha/*")
@RestController
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MailService mailService;

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
	            return responseMapMessage("success", "회원가입이 완료되었습니다.");
	        } else {
	            return responseMapMessage("fail", "회원가입에 실패하였습니다. 다시 확인하세요.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return responseMapMessage("fail", "등록 중 예외사항이 발생하였습니다.");
	    }
	}
	
	@PostMapping("/check-duplicate")
	public Map<String, Object> checkDuplicate(@RequestBody MemberVO memberVO) {
		try {
			
			System.out.println("memberVO : " + memberVO);
			int res = memberService.checkDuplicate(memberVO);
			if (res != 1) {
				return responseMapMessage("success", "사용 가능한 아이디입니다.");
			} else {
				return responseMapMessage("fail", "이미 사용중인 아이디입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return responseMapMessage("fail", "중복확인 중 예외사항이 발생하였습니다.");
		}
	}

	

	@GetMapping("/find_id")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView("/login/find_id");
		return mav;
	}
	
	@PostMapping("/find_id_check")
	public Map<String, Object> findIdCheck(@RequestBody MemberVO memberVO) {

		Map<String, Object> response;

        // 이메일 주소가 데이터베이스에 있는지 확인
        List<MemberVO> list = memberService.findId(memberVO.getM_email());  // findIdCheck 메서드 활용

        System.out.println(list);
        
        if (list != null && !list.isEmpty()) {
            response = responseMapMessage("success", "이메일 주소가 확인되었습니다.");
        } else {
            response = responseMapMessage("fail", "가입 정보가 없습니다.");
        }

        response.put("list", list);

        return response;
	}
	

	@GetMapping("/find_pw")
	public ModelAndView findPw() {
		ModelAndView mav = new ModelAndView("/login/find_pw");
		return mav;
	}
	
	
	@PostMapping("/find_pw_check")
	public Map<String, Object> findPwCheck(@RequestBody MemberVO paramMemberVO) {

		Map<String, Object> response;

        // 이메일 주소가 데이터베이스에 있는지 확인
        MemberVO memberVO = memberService.findPw(paramMemberVO);  // findIdCheck 메서드 활용

        System.out.println(memberVO);
        
        if (memberVO != null) {
        	// 임시 비밀번호 생성
	         String temporaryPassword = RandomPassword(8);
	         
	         mailService.findPwSendMail(memberVO.getM_id(), memberVO.getM_email(), memberVO.getM_name(), temporaryPassword);
	         
	         System.out.println(memberVO.getM_id());
	         System.out.println(memberVO.getM_email());
	         System.out.println(memberVO.getM_name());
	         System.out.println(temporaryPassword);
	         
            response = responseMapMessage("success", "임시 비밀번호가 발송되었습니다.");
        } else {
            response = responseMapMessage("fail", "가입 정보가 없습니다.");
        }

        return response;
	}
	

	
	private String RandomPassword(int length) {
	     String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
	     StringBuilder randomPassword = new StringBuilder(length);
	     ThreadLocalRandom random = ThreadLocalRandom.current();

	     for (int i = 0; i < length; i++) {
	         int randomIndex = random.nextInt(chars.length());
	         randomPassword.append(chars.charAt(randomIndex));
	     }

	     return randomPassword.toString();
	 }
	
	

	private Map<String, Object> responseMapMessage(String result, String msg) {
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("msg", msg);
		return response;
	}
	
	
	
}
