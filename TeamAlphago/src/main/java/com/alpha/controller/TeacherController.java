package com.alpha.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.TeacherService;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.GroupsVO;
import com.alpha.vo.PageDto;
import com.alpha.vo.SubscribeVO;

@RestController
@RequestMapping("/alpha/*")
public class TeacherController extends CommonRestController {
	
	@Autowired 
	TeacherService service;
	
	@GetMapping("/teacher") //콘텐츠 조회 페이지(아직 검색x)
	public ModelAndView teacher(Criteria cri) {
		

		int totalCnt = service.totalCnt(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		System.out.println("연결");
		System.out.println(pageDto);
		ModelAndView mav = new ModelAndView("/teacher/teacher");
		mav.addObject("pageDto", pageDto);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("contentList", service.getContentList(cri));
	
		return mav;
	}
	
	@RequestMapping(value="/teacher/detail",method = RequestMethod.GET) //c_id로 상세페이지 연결
	public ModelAndView detail(String c_id) {
		
		ModelAndView mav = new ModelAndView("/teacher/contentDetail");
		System.out.println(c_id);
		mav.addObject("contentList", service.getContentDetail(c_id));
		
		return mav;
	}
	
	@RequestMapping(value = "/teacher/insertContent", method= RequestMethod.POST) //결제 후 인서트
	public void insertPayAction(SubscribeVO subVO, HttpServletRequest request) {

		String sub_id = request.getParameter("sub_id");
		String sub_c_id = request.getParameter("sub_c_id");
		String t_m_id = request.getParameter("t_m_id");
		String sub_name = request.getParameter("sub_name");
		String sub_date = request.getParameter("sub_date");
		String sub_price = request.getParameter("sub_price");
		String sub_able = request.getParameter("sub_able");
		String sub_current = request.getParameter("sub_current");
		
		System.out.println(sub_id);
		System.out.println(sub_c_id);
		System.out.println(t_m_id);
		System.out.println(sub_name);
		System.out.println(sub_date);
		System.out.println(sub_price);
		System.out.println(sub_able);
		System.out.println(sub_current);
		
		int res = service.insertPayAction(subVO);
		
		if(res>0) {
			System.out.println("insert 성공");
		} else {
			System.out.println("inset 중 오류 발생");
		}
	}
	
	@GetMapping("/mysubList") //구독내역 페이지
	public ModelAndView mysubList(String t_m_id) {
		
		System.out.println(t_m_id);
		System.out.println("연결");
		
		
		
		ModelAndView mav = new ModelAndView("/teacher/subList");
		mav.addObject("subList", service.mySubList(t_m_id));

	
		return mav;
	}
	
	   @RequestMapping(value="/delete", method=RequestMethod.POST)
	   public void cancelPay(HttpServletRequest request) {
		   
		   String imp_uid = request.getParameter("imp_uid");

		   System.out.println("del : "+imp_uid);
		   
		        int res = service.cancelPay(imp_uid);
		        if (res > 0) {
		        	System.out.println("delete 성공");
		        } else {
		        	System.out.println("delete 중 오류 발생");
		        }

		   
	   }
	   
	   @GetMapping("/group") //그룹관리 페이지
		public ModelAndView group(String t_m_id) {
		   
		   
			System.out.println("연결");
			System.out.println(t_m_id);

			ModelAndView mav = new ModelAndView("/teacher/group");
			mav.addObject("groupList", service.getmyGroupList(t_m_id));
			mav.addObject("subList", service.mySubList(t_m_id));
			return mav;
		}
	   
	   @GetMapping("/group/getSubOne/{sub_id}") //그룹에 콘텐츠 연결
	   public Map<String, Object> GetSubOne(@PathVariable("sub_id") String sub_id) {
		   
		   System.out.println("==============");
		   System.out.println(sub_id);
		   
		   try {
				SubscribeVO subscribeVO = service.getSubOne(sub_id);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("subscribeVO", subscribeVO);
				System.out.println(subscribeVO);
				
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		   
		   
	   }
	   
	   @PostMapping("/group/insert/{t_m_id}")
		public Map<String, Object> register(@RequestBody GroupsVO groupVO) {
		   
		   System.out.println("==============넘어옴");

			try {
				int res = service.insertGroups(groupVO);
				
				Map<String, Object> map = responseWriteMap(res);
				System.out.println(groupVO);
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		}
	   
	   

}
