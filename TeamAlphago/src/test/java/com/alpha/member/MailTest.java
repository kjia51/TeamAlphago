package com.alpha.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alpha.service.MailService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MailTest {

	@Test
	public void sendMail() {
		MailService mailService = new MailService();
		mailService.findPwSendMail("alphagoTemp", "alphagoTemp@gmail.com", "한유진", "a123456");
	}
	
}
