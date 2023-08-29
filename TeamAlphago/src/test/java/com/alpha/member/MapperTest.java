package com.alpha.member;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alpha.mapper.LearnerMapper;
import com.alpha.vo.LearnerVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTest {

	@Autowired
	LearnerMapper learnerMapper;
	
	@Test
	public void groupInfo() {
		LearnerVO learnerVO = new LearnerVO();
		learnerVO.setG_name("3학년1반");
		learnerVO.setT_m_name("김첨지");
		learnerVO.setG_period("2023.08.15~09.02");
		
		log.info(learnerVO);
		assertNotNull(learnerVO);
		
	}
}
