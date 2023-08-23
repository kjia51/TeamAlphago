package com.alpha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.mapper.MemberMapper;
import com.alpha.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public int insert(MemberVO memberVO) {
		int res = memberMapper.insert(memberVO);
		return res;
	}

	@Override
	public MemberVO login(MemberVO paramMemberVO) {
		MemberVO memberVO = memberMapper.login(paramMemberVO);
		
		System.out.println(paramMemberVO.getM_password() + " ============== " + memberVO);
		
		if (memberVO != null) {
			boolean res = memberVO.getM_password().equals(paramMemberVO.getM_password());	
			         // 비밀번호가 일치하면 로그인 성공
	    	if(res) {
	    		return memberVO;
	        }
		}
		
		return null;
	}

}
