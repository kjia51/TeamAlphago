package com.alpha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.ContentService;

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
}
