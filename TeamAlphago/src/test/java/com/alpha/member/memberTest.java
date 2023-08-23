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
		memberVO.setM_name("Å×½ºÆ®1");

		
		log.info(memberVO);
		
		int res = memberMapper.insert(memberVO);
		assertEquals(1, res);
	}
	
}
