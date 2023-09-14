package com.alpha.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.alpha.vo.MemberVO;

@Service
public interface MemberService {

	public MemberVO login(MemberVO memberVO);
	
	public MemberVO memberOne(String m_id);
	
	public int insert(MemberVO memberVO);

	public int checkDuplicate(MemberVO memberVO);
	
	public List<MemberVO> findId(String m_email);
	
	public MemberVO findPw(MemberVO memberVO);
	
	public void sendTemporaryPasswordByEmail(String m_email, String m_name, String temporaryPassword);
	
	public int updatePw(MemberVO memberVO);
	
	public int updateMember(MemberVO memberVO);
}
