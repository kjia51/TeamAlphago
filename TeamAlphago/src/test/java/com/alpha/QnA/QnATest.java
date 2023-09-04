package com.alpha.QnA;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alpha.mapper.QnAMapper;
import com.alpha.notice.NoticeTest;
import com.alpha.vo.QnAVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnATest {

	@Autowired
	QnAMapper qnAMapper;
	
	@Test
	public void answerList() {
		List<QnAVO> list = qnAMapper.getAList("Q0001");
		log.info(list);
	}
	
}
