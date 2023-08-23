package com.alpha.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	   public ModelAndView content() {
	      
	      ModelAndView mav = new ModelAndView("/content/content");
	      mav.addObject("list",contentService.getContentList());
	      return mav;
	   }
	   
	   
		@PostMapping("/content/insert")
		public Map<String, Object> register(@RequestBody ContentVO contentVO) {

			try {
				int res = contentService.insertContent(contentVO);
				
				Map<String, Object> map = responseWriteMap(res);
				map.put("url", "/alpha/main");
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		}
		
		
		
		   @GetMapping("/content/update/{c_id}")
		   public Map<String, Object> contentEdit(@PathVariable("c_id") String c_id) {
		      
				try {
					ContentVO contentVO = contentService.getContentOne(c_id);
					
					Map<String, Object> map = responseVo(contentVO);
					map.put("contentVO", contentVO);
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "등록 중 오류 발생");
				}
		   }
		   
		   @GetMapping("/content/contentEdit")
		   public ModelAndView contentEdit() {
		      
		      ModelAndView mav = new ModelAndView("/content/contentEdit");
		      return mav;
		   }
		   
		   
		   
		   @PutMapping("/content/EditAction/{c_id}")
			public Map<String, Object> update(@PathVariable("c_id") String c_id) {

				try {
					int res = contentService.updateContent(c_id);
					
					Map<String, Object> map = responseEditMap(res);
					map.put("url", "/alpha/main");
					return map;

				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "등록 중 오류 발생");
				}
			}
		

}
