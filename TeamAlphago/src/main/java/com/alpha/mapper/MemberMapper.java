package com.alpha.mapper;

import java.util.List;

import org.springframework.ui.Model;

import com.alpha.vo.MemberVO;

public interface MemberMapper {

	public MemberVO login(MemberVO memberVO);
	
	public int insert(MemberVO memberVO);
	
	public int checkDuplicate(MemberVO memberVO);
	
	public List<MemberVO> findId(String m_email);
	
	public MemberVO findPw(MemberVO memberVO);
	
	public int checkEmail(MemberVO memberVO);
	
}
