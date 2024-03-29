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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alpha.service.LearnerService;
import com.alpha.service.MailService;
import com.alpha.service.MemberService;
import com.alpha.vo.MemberVO;


@RequestMapping("/alpha/*")
@RestController
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	LearnerService learnerService;
	
	@Autowired
	MailService mailService;

	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("/login/login");
		return mav;
	}
	
	@PostMapping("/loginAction")
	public ResponseEntity<Map<String, Object>> loginAction(@RequestBody MemberVO memberVO, String l_m_id,
	                                      HttpSession session) {
	    Map<String, Object> response = new HashMap<>();

	    try {
	        memberVO = memberService.login(memberVO);

	        if (memberVO != null) {
	            session.setAttribute("memberVO", memberVO);
	            session.setAttribute("m_id", memberVO.getM_id());

	            // 학습자가 로그인 시 그룹 가입되어 있지 않으면 그룹 가입 화면 이동
	            int res = learnerService.searchJoinGrp(memberVO.getM_id());
	            if (memberVO.getM_division() == 2 && res == 0) {
	            	response.put("message", "그룹 가입 화면으로 이동해야 합니다.");
	                response.put("url", "/alpha/joinGroup");
	                return ResponseEntity.ok(response);
	            } else {
	                response.put("message", "로그인이 완료되었습니다.");
	                response.put("url", "/alpha/main");
	                return ResponseEntity.ok(response);
	            }
	        } else {
	            response.put("error", "로그인 정보가 올바르지 않습니다.");
	            return ResponseEntity.badRequest().body(response);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.put("error", "로그인 중 오류가 발생했습니다.");
	        return ResponseEntity.badRequest().body(response);
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
	
	
	
	@PostMapping("/signup_step3")
	public ModelAndView signup_step3(@ModelAttribute("email") String email) {
	    ModelAndView mav = new ModelAndView("/login/signup_step3");
	    mav.addObject("email", email);
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
	         
	         memberVO.setM_password(temporaryPassword);
	         memberService.updatePw(memberVO);
	         
	         System.out.println(memberVO.getM_id());
	         System.out.println(memberVO.getM_email());
	         System.out.println(memberVO.getM_name());
	         System.out.println(memberVO.getM_password());
	         System.out.println(temporaryPassword);
	         
            response = responseMapMessage("success", "임시 비밀번호가 발송되었습니다.");
        } else {
            response = responseMapMessage("fail", "가입 정보가 없습니다.");
        }

        return response;
	}
	
	
	@PostMapping("/email_check")
    public Map<String, Object> emailCheck(@RequestBody Map<String, String> requestData) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            String email = requestData.get("email");
            String temporaryPassword = RandomPassword(6);
            
            mailService.emailCheckSendMail(email, temporaryPassword);

            response.put("temporaryPassword", temporaryPassword);
            
            response.put("status", "success");
            response.put("message", "인증 메일이 발송되었습니다.");
        } catch (Exception e) {
            response.put("status", "fail");
            response.put("message", "인증 메일 발송에 실패했습니다.");
        }
        
        
        return response;
    }
	
	
	@PostMapping("/email_check_confirm")
	public Map<String, Object> emailCheckConfirm(@RequestBody Map<String, String> requestData) {
	    Map<String, Object> response = new HashMap<>();
	    
	    try {
	        String enteredVerificationCode = requestData.get("verificationCode");
	        String serverVerificationCode = requestData.get("temporaryPassword");

	        // 사용자가 입력한 인증 번호와 서버에서 생성한 인증 번호를 비교
	        if (enteredVerificationCode.equals(serverVerificationCode) && !serverVerificationCode.equals("")) {
	            response.put("status", "success");
	            response.put("message", "인증이 완료되었습니다.");
	        } else {
	            response.put("status", "fail");
	            response.put("message", "인증 번호가 일치하지 않습니다.");
	        }
	    } catch (Exception e) {
	        response.put("status", "fail");
	        response.put("message", "인증 처리 중 오류가 발생했습니다.");
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
