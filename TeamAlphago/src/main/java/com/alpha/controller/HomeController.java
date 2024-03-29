package com.alpha.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.NoticeService;
import com.alpha.service.TeacherService;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;

@RestController
@RequestMapping("/")
public class HomeController {
		   
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	TeacherService teacherService;
	
		   @GetMapping("/")
		   public ModelAndView main(Criteria cri) {
				ModelAndView mav = new ModelAndView("/main/main");
				mav.addObject("noticeVOList", noticeService.getMainNoticeList(cri));
				List<ContentVO> contentList = teacherService.getMainContentList(cri);
				for (ContentVO contentVO : contentList) {
					String convertedPath = contentVO.getSavepath().replace("\\", "/");
					contentVO.setSavepath(convertedPath);
				}
				mav.addObject("contentList", contentList);
				return mav;
		   }
}
