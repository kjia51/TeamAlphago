package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.TeacherService;
import com.alpha.vo.ContentVO;
import com.alpha.vo.Criteria;
import com.alpha.vo.GrpVO;
import com.alpha.vo.LearnerVO;
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
	
	@RequestMapping(value="/teacher/detail",method = RequestMethod.GET) //c_no로 상세페이지 연결
	public ModelAndView detail(String c_no) {
		
		ModelAndView mav = new ModelAndView("/teacher/contentDetail");
		System.out.println(c_no);
		mav.addObject("contentList", service.getContentDetail(c_no));
		mav.addObject("getContentCnt", service.getContentCnt(c_no));
		
		return mav;
	}
	
	@RequestMapping(value = "/teacher/insertContent", method= RequestMethod.POST) //결제 후 인서트
	public void insertPayAction(SubscribeVO subVO, HttpServletRequest request) {

		String sub_no = request.getParameter("sub_no");
		String sub_c_no = request.getParameter("sub_c_no");
		String t_m_id = request.getParameter("t_m_id");
		String sub_date = request.getParameter("sub_date");
		String sub_price = request.getParameter("sub_price");
		String sub_able = request.getParameter("sub_able");
		String sub_connection = request.getParameter("sub_connection");
		
		System.out.println(sub_no);
		System.out.println(sub_c_no);
		System.out.println(t_m_id);
		System.out.println(sub_date);
		System.out.println(sub_price);
		System.out.println(sub_able);
		System.out.println(sub_connection);
		
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
		System.out.println(service.mySubList(t_m_id));
		
		
		
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
		   
		   
			System.out.println("그룹관리연결");
			System.out.println(t_m_id);

			ModelAndView mav = new ModelAndView("/teacher/group");
			mav.addObject("groupList", service.getmyGroupList(t_m_id));
			mav.addObject("subList", service.mySubList(t_m_id));
			return mav;
		}
	   
	   @GetMapping("/group/getSubOne/{sub_no}") //그룹에 콘텐츠 연결
	   public Map<String, Object> GetSubOne(@PathVariable("sub_no") String sub_no) {
		   
		   System.out.println("==============");
		   System.out.println(sub_no);
		   
		   try {
				SubscribeVO subscribeVO = service.getSubOne(sub_no);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("subscribeVO", subscribeVO);
				System.out.println(subscribeVO);
				
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		   
		   
	   }
	   
	   @PostMapping("/group/insert/{t_m_id}") //그룹 생성
		public Map<String, Object> register(@RequestBody GrpVO groupVO) {
		   
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
	   
	   
	   @GetMapping("/groupSingup") //가입승인 페이지
		public ModelAndView groupSingup(String t_m_id) {
		   
		   
		    System.out.println(t_m_id);
			System.out.println("그룹승인연결");
			System.out.println(service.getmyGroupList(t_m_id));

			ModelAndView mav = new ModelAndView("/teacher/groupSingup");
			mav.addObject("groupList", service.getmyGroupList(t_m_id));
			return mav;
		}
	   
	   @GetMapping("/group/getGroupOne/{g_no}") //그룹 정보 가져오기
	   public Map<String, Object> GetGroupOne(@PathVariable("g_no") String g_no) {
		   
		   System.out.println("==============");
		   System.out.println(g_no);
		   
		   try {
				GrpVO grpVO = service.getGroupOne(g_no);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("grpVO", grpVO);
				System.out.println(grpVO);
				
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}   
	   }
	   
	   @GetMapping("/group/getGroupOne/list/{g_no}") //그룹의 학습자 정보 가져오기
	   public List<LearnerVO> GetGroupLearner(@PathVariable("g_no") String g_no, Model model) {
		   
		   System.out.println("==============");
		   System.out.println(g_no);

				List<LearnerVO> list = service.getGroupLearner(g_no);
				System.out.println(list);
				return list;

	   }
	   
	   @PutMapping("/group/getGroupOne/UpdateAction/{l_g_no}")  //그룹의 학습자 정보 삭제(탈퇴하기) -- 테이블에서 l_g_no = null처리
		public Map<String, Object> Groupupdate(@RequestBody LearnerVO learnerVO ) {

		   System.out.println("update==============");
		   System.out.println(learnerVO);

		   
			try {
				int res =  service.updateGroupLearner(learnerVO);
				Map<String, Object> map = responseEditMap(res);
				System.out.println("map==============="+map);
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "삭제 중 오류 발생");
			}
		}


}
