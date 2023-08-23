package com.alpha.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		System.out.println("�α��������� ����");
		
		ModelAndView mav = new ModelAndView("/login/login");
		return mav;
	}
	
	@PostMapping("/loginAction")
	public String loginAction(@RequestBody MemberVO memberVO,
	                           Model model,
	                           HttpSession session) {

		
		System.out.println("m_id  : " + memberVO.getM_id());
		System.out.println("m_password  : " + memberVO.getM_password());
    // ����ڰ� �Է��� ���̵�� ��й�ȣ�� �����ϱ� ���� MemberService�� �޼��带 ȣ���մϴ�.
	    memberVO = memberService.login(memberVO);
	     
	    if (memberVO != null) {
	       	// ���� ����: ���ǿ� ����� ������ �����ϰ� home �������� �����̷�Ʈ�մϴ�.
	        
	        // �α��� ����
	    	    
	       session.setAttribute("memberVO", memberVO);
	              
	        return "redirect:/main";
	    } else {
	        // �α��� ����
	        model.addAttribute("errorMSG", "�߸��� ���̵� �Ǵ� ��й�ȣ �Դϴ�.");
	        return "/login";
	    }
	}
	
	@GetMapping("/signup_step1")
	public ModelAndView signup_step1() {
		System.out.println("ȸ������1 ����");
		
		ModelAndView mav = new ModelAndView("/login/signup_step1");
		return mav;
	}
	
	
	@GetMapping("/signup_step2")
	public ModelAndView signup_step2() {
		System.out.println("ȸ������2 ����");
		
		ModelAndView mav = new ModelAndView("/login/signup_step2");
		return mav;
	}
	
	@PostMapping("/register")
	public Map<String, Object> register(@RequestBody MemberVO memberVO) {
	    try {
	    	
	    	System.out.println("memberVO : " + memberVO);
	        // ȸ������ ���� ȣ��
	        int res = memberService.insert(memberVO);
	        if (res > 0) {
	            // ȸ������ ���� �� success �޽����� ��ȯ
	            return responseMapMessage("success", "ȸ�������� �Ϸ�Ǿ����ϴ�.");
	        } else {
	            // ȸ������ ���� �� fail �޽����� ��ȯ
	            return responseMapMessage("fail", "ȸ�����Կ� �����Ͽ����ϴ�. �ٽ� Ȯ���ϼ���.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return responseMapMessage("fail", "��� �� ���ܻ����� �߻��Ͽ����ϴ�.");
	    }
	}

	private Map<String, Object> responseMapMessage(String result, String msg) {
		Map<String, Object> response = new HashMap<>();
		response.put("result", result);
		response.put("msg", msg);
		return response;
	}
	
}
