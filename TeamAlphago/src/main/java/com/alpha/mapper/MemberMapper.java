package com.alpha.mapper;

import com.alpha.vo.MemberVO;

public interface MemberMapper {

	public MemberVO login(MemberVO memberVO);
	
	public int insert(MemberVO memberVO);
	
}
