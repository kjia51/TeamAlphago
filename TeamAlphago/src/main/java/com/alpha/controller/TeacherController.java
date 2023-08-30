package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	
	@GetMapping("/teacher") //콘텐츠 조회 페이지
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
	public ModelAndView mysubList(String t_m_id, Criteria cri) {
		
		System.out.println(t_m_id);
		System.out.println("구독내역연결=================");
		
		int totalCnt = service.totalCntSub(t_m_id, cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		ModelAndView mav = new ModelAndView("/teacher/subList");
		mav.addObject("pageDto", pageDto);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("subList", service.mySubList(t_m_id, cri));

	
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
		public ModelAndView group(String t_m_id, Criteria cri) {
		   
		   
			System.out.println("그룹관리연결");
			System.out.println(t_m_id);
			
			int totalCnt = service.totalCntGrp(t_m_id, cri);
			PageDto pageDto = new PageDto(cri, totalCnt);
			
			ModelAndView mav = new ModelAndView("/teacher/group");
			mav.addObject("pageDto", pageDto);
			mav.addObject("totalCnt", totalCnt);
			mav.addObject("groupList", service.getmyGroupList(t_m_id,cri));
			mav.addObject("subList", service.subContent(t_m_id));
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
				System.out.println(map);
				
				
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
				
				int res2 = service.insertGroupupdatesub(groupVO.getSub_no());
				
				if(res2>0) {
					return map;					
				}
				
				return responseMap(REST_FAIL, "등록 중 오류 발생"); 

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		}
	   
	   
	   @GetMapping("/groupSingup") //가입승인 페이지
		public ModelAndView groupSingup(String t_m_id, Criteria cri) {
		   
		   
		    System.out.println(t_m_id);
			System.out.println("그룹승인연결");
			System.out.println(service.getmyGroupList(t_m_id,cri));
			int totalCnt = service.totalCntGrp(t_m_id, cri);
			PageDto pageDto = new PageDto(cri, totalCnt);

			ModelAndView mav = new ModelAndView("/teacher/groupSingup");
			mav.addObject("groupList", service.getmyGroupList(t_m_id,cri));
			mav.addObject("pageDto", pageDto);
			mav.addObject("totalCnt", totalCnt);
			
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
	   public ResponseEntity<Map<String, Object>> GetGroupLearner(@PathVariable("g_no") String g_no, Criteria cri, Model model) {
		   
		   System.out.println("list==============");
		   System.out.println(g_no);
		   

			int LearnerCnt = service.totalCntLearner(g_no);
			PageDto pageDto = new PageDto(cri, LearnerCnt);


			model.addAttribute("LearnerCnt", LearnerCnt);
			model.addAttribute("pageDto", pageDto);
			
			System.out.println(LearnerCnt);

			List<LearnerVO> list = service.getGroupLearner(g_no, cri);

		    Map<String, Object> responseData = new HashMap<>();
		    responseData.put("LearnerCnt", LearnerCnt);
		    responseData.put("list", list);

		    return ResponseEntity.ok(responseData);
		}
	   
	   @GetMapping("/group/getJoin/list/{g_no}") //그룹의 신청자 정보 가져오기
	   public ResponseEntity<Map<String, Object>> JoinGrouplist(@PathVariable("g_no") String g_no, Criteria cri, Model model) {
		   
		   System.out.println("join==============");
		   System.out.println(g_no);
		   
			int JoinCnt = service.totalCntJoin(g_no);
			PageDto JoinpageDto = new PageDto(cri, JoinCnt);
			System.out.println(JoinCnt);

			model.addAttribute("JoinCnt", JoinCnt);
			model.addAttribute("JoinpageDto", JoinpageDto);

			List<LearnerVO> list = service.JoinGroupLearner(g_no, cri);
		   
			Map<String, Object> responseData = new HashMap<>();
		    responseData.put("JoinCnt", JoinCnt);
		    responseData.put("list", list);

		    return ResponseEntity.ok(responseData);
	}


	   @DeleteMapping("/group/getGroupOne/delAction/{l_no}")  //그룹의 학습자 정보 삭제(내보내기)
		public Map<String, Object> Groupupdate(@PathVariable("l_no") String l_no) {

		   System.out.println("delete==============");
		   System.out.println(l_no);

		   
			try {
				int res =  service.deleteGroupLearner(l_no);
				Map<String, Object> map = responseEditMap(res);
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "삭제 중 오류 발생");
			}
		}
	   
	   @PutMapping("/group/getGroupOne/updateAction/{l_no}")  //그룹의 학습자 정보 삭제(내보내기)
		public Map<String, Object> JoinGroup(@PathVariable("l_no") String l_no) {

		   System.out.println("update==============");
		   System.out.println(l_no);

		   
			try {
				int res =  service.updateGroupLearner(l_no);
				Map<String, Object> map = responseEditMap(res);
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "삭제 중 오류 발생");
			}
		}
	   
	   @GetMapping("/test")
		public ModelAndView test() {

			ModelAndView mav = new ModelAndView("/teacher/test");
		
			return mav;
		}



}
