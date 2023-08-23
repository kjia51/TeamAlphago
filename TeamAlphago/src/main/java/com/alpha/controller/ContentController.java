package com.alpha.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.ContentService;
import com.alpha.vo.ContentVO;

@RestController
@RequestMapping("/alpha/*")
public class ContentController extends CommonRestController {
	
	   @Autowired
	   ContentService contentService;
	   
	   @GetMapping("/content")
	   public ModelAndView teacher() {
	      
	      ModelAndView mav = new ModelAndView("/content/content");
	      mav.addObject("list",contentService.getContentList());
	      return mav;
	   }
	   
		@PostMapping("/container/insert")
		public Map<String, Object> register(@RequestBody ContentVO contentVO) {

			try {
				int res = contentService.insertContent(contentVO);
				
				Map<String, Object> map = responseWriteMap(res);
				map.put("url", "/alpha/main");
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록중 예외사항이 발생 하였습니다.");
			}
		}

}
