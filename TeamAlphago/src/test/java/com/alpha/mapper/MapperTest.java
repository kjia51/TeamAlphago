package com.alpha.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alpha.member.MailTest;
import com.alpha.service.TeacherService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {
	@Autowired
	TeacherMapper mapper;
	
	@Test
	public void mapperTest() {
		System.out.println(
		mapper.mySubList("teacher2"));
	}
	
	
	

}
