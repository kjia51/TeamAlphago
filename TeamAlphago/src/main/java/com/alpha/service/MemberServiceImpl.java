package com.alpha.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.mapper.MemberMapper;
import com.alpha.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	JavaMailSender mailSender;

	@Override
	public MemberVO login(MemberVO paramMemberVO) {
		MemberVO memberVO = memberMapper.login(paramMemberVO);
				
		if (memberVO != null) {
			boolean res = memberVO.getM_password().equals(paramMemberVO.getM_password());	
	    	if(res) {
	    		return memberVO;
	        } else {
	        	return null;
	        }
		}
		
		return null;
	}
	

	@Override
	public int insert(MemberVO memberVO) {
		return memberMapper.insert(memberVO);
	}

	@Override
	public int checkDuplicate(MemberVO memberVO) {
		return memberMapper.checkDuplicate(memberVO);
	}


	@Override
	public List<MemberVO> findId(String m_email) {
		
		return memberMapper.findId(m_email);
	}


	@Override
	public int checkEmail(MemberVO memberVO) {
		
		return memberMapper.checkEmail(memberVO);
	}


	@Override
	public MemberVO findPw(MemberVO memberVO) {
		return memberMapper.findPw(memberVO);
	}


	@Override
	public void sendTemporaryPasswordByEmail(String m_email, String m_name, String temporaryPassword) {
		SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(m_email); // 수신자 이메일 주소
        message.setSubject("임시 비밀번호 발송"); // 이메일 제목
        message.setText("안녕하세요, " + m_name 
                + "님!\n입력하신 이메일 주소로 임시 비밀번호가 발송되었습니다.\n임시 비밀번호: " + temporaryPassword);

        // 이메일 전송
        mailSender.send(message);		
	}

}
