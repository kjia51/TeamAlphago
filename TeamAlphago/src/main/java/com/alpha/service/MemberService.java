package com.alpha.service;

import org.springframework.stereotype.Service;

import com.alpha.vo.MemberVO;

@Service
public interface MemberService {

	public int insert(MemberVO memberVO);

	public MemberVO login(MemberVO paramMemberVO);
	
}
