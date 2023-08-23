package com.alpha.member;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alpha.mapper.MemberMapper;
import com.alpha.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class memberTest {

	@Autowired
	MemberMapper memberMapper;
	
	@Test
	public void signup() {
		MemberVO memberVO = new MemberVO();
		memberVO.setM_id("test1");
		memberVO.setM_password("1234");
		memberVO.setM_name("테스트1");
		memberVO.setM_division(1);
		memberVO.setM_phone("010-9876-5432");
		memberVO.setM_email("test1@a.com");
		memberVO.setM_address("서울시 마포구");
		memberVO.setM_birth("2000-01-01");
		
		log.info(memberVO);
		
		int res = memberMapper.insert(memberVO);
		assertEquals(1, res);
	}
	
}
