package com.alpha.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.ContentService;
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
	
    @Autowired
    ContentService contentService;
	
	@GetMapping("/teacher") //콘텐츠 조회 페이지
	public ModelAndView teacher(Criteria cri) {
		

		int totalCnt = service.totalCnt(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		List<ContentVO> contentList = service.getContentList(cri);
		System.out.println("연결");
		System.out.println(pageDto);
		ModelAndView mav = new ModelAndView("/teacher/teacher");
		mav.addObject("pageDto", pageDto);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("contentList", contentList);
		for (ContentVO contentVO : contentList) {
			String convertedPath = contentVO.getSavepath().replace("\\", "/");
			contentVO.setSavepath(convertedPath);
		}
	
		return mav;
	}
	
	@RequestMapping(value="/teacher/detail",method = RequestMethod.GET) //c_no로 상세페이지 연결
	public ModelAndView detail(String c_no) {
		
		ModelAndView mav = new ModelAndView("/teacher/contentDetail");
		System.out.println(c_no);
		List<ContentVO>	contentList = service.getContentDetail(c_no);
		for (ContentVO contentVO : contentList) {
			String convertedPath = contentVO.getSavepath().replace("\\", "/");
			contentVO.setSavepath(convertedPath);
		}
		mav.addObject("contentVO", contentService.getContentOne(c_no));
		mav.addObject("contentList", contentList);
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
		String sub_month = request.getParameter("sub_month");
		
		System.out.println(sub_no);
		System.out.println(sub_c_no);
		System.out.println(t_m_id);
		System.out.println(sub_date);
		System.out.println(sub_price);
		System.out.println(sub_able);
		System.out.println(sub_month);
		
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
		   
		   System.out.println("원래:"+groupVO.getSub_connection());
		   int sub_connection = Integer.parseInt(groupVO.getSub_connection())-1;
		   
		   System.out.println(sub_connection);
		   groupVO.setSub_connection(Integer.toString(sub_connection));


			try {
				int res = service.insertGroups(groupVO);
				
				Map<String, Object> map = responseWriteMap(res);
				System.out.println(groupVO);
				
				System.out.println("계산 후:"+groupVO.getSub_connection());
				int res2 = service.insertGroupupdatesub(groupVO.getSub_no(), groupVO.getSub_connection());
				
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
		   
		   int res = service.updateMemCnt(g_no);
		   
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

			List<LearnerVO> list = service.getGroupLearner(g_no);
			

		    Map<String, Object> responseData = new HashMap<>();
		    responseData.put("LearnerCnt", LearnerCnt);
		    responseData.put("list", list);

		    return ResponseEntity.ok(responseData);
		}
	   
	   @GetMapping("/group/getJoin/list/{g_no}") //그룹의 신청자 정보 가져오기
	   public ResponseEntity<Map<String, Object>> JoinGrouplist(@PathVariable("g_no") String g_no, Criteria cri, Model model) {
		   
		   System.out.println("join==============");
		   System.out.println(g_no);
		   
		   GrpVO grpVO = service.getGroupOne(g_no);
			Map<String, Object> map = new HashMap<String, Object>();
		   
			int JoinCnt = service.totalCntJoin(g_no);
			PageDto JoinpageDto = new PageDto(cri, JoinCnt);
			System.out.println(JoinCnt);

			model.addAttribute("JoinCnt", JoinCnt);
			model.addAttribute("JoinpageDto", JoinpageDto);

			List<LearnerVO> list = service.JoinGroupLearner(g_no);
		   
			Map<String, Object> responseData = new HashMap<>();
		    responseData.put("JoinCnt", JoinCnt);
		    responseData.put("list", list);
		    responseData.put("grpVO", grpVO);

		    return ResponseEntity.ok(responseData);
	}


	   @DeleteMapping("/group/getGroupOne/delAction/{g_no}/{l_no}")  //그룹의 학습자 정보 삭제(내보내기)
		public Map<String, Object> Groupupdate(@PathVariable("l_no") String l_no, @PathVariable("g_no") String g_no) {

		   System.out.println("delete==============");
		   System.out.println(l_no);
		   System.out.println(g_no);

		   
			try {
				int res =  service.deleteGroupLearner(g_no, l_no);
				Map<String, Object> map = responseEditMap(res);
				
				int res2 = service.updateMemCnt(g_no);
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "삭제 중 오류 발생");
			}
		}
	   
	   @PutMapping("/group/getGroupOne/updateAction/{g_no}/{l_no}")  //그룹 학습자 승인
		public Map<String, Object> JoinGroup(@PathVariable("l_no") String l_no, @PathVariable("g_no") String g_no) {

		   System.out.println("update==============");
		   System.out.println(l_no);
		   System.out.println(g_no);

		   
			try {
				int res =  service.updateGroupLearner(g_no, l_no);
				Map<String, Object> map = responseEditMap(res);
				
				int res2 = service.updateMemCnt(g_no);
				
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "승인 중 오류 발생");
			}
		}
	   
	   @GetMapping("/test")
		public ModelAndView test() {

			ModelAndView mav = new ModelAndView("/teacher/test");
		
			return mav;
		}
	   
	   @GetMapping("/group/getGrpList/{sub_no}") //그룹 정보 가져오기
	   public List<GrpVO> SubGroupList(@PathVariable("sub_no") String sub_no) {
		   
		   System.out.println("==============");
		   System.out.println(sub_no);
		   

				List<GrpVO> list = service.conGroupList(sub_no);
				System.out.println(list);
				return list;

	   }
	   
	   @PostMapping("/group/insertsub/{t_m_id}") //그룹 생성(구독리스트에서)
		public Map<String, Object> Listregister(@RequestBody GrpVO groupVO) {
		   
		   System.out.println("==============넘어옴");
		   
		   System.out.println("원래:"+groupVO.getSub_connection());
		   int sub_connection = Integer.parseInt(groupVO.getSub_connection())-1;
		   
		   System.out.println(sub_connection);
		   groupVO.setSub_connection(Integer.toString(sub_connection));


			try {
				int res = service.insertGroups(groupVO);
				
				Map<String, Object> map = responseWriteMap(res);
				System.out.println(groupVO);
				
				System.out.println("계산 후:"+groupVO.getSub_connection());
				int res2 = service.insertGroupupdatesub(groupVO.getSub_no(), groupVO.getSub_connection());
				
				if(res2>0) {
					return map;					
				}
				
				return responseMap(REST_FAIL, "등록 중 오류 발생"); 

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		}
	   
	   @PostMapping("/group/updateName/{g_no}")
	   public Map<String, Object> updateName(
	       @PathVariable("g_no") String g_no,
	       @RequestBody Map<String, Object> obj) { // @RequestBody 어노테이션 사용

	       System.out.println("update==============");
	       System.out.println("g_no: " + g_no);
	       System.out.println("g_name: " + obj.get("g_name")); // obj에서 g_name 값을 가져옴

	       try {
	           String g_name = (String) obj.get("g_name"); // g_name 값을 추출
	           int res = service.updateGrpName(g_no, g_name);
	           Map<String, Object> map = responseEditMap(res);
	           return map;
	       } catch (Exception e) {
	           e.printStackTrace();
	           return responseMap(REST_FAIL, "등록 중 오류 발생");
	       }
	   }
	   
	   @GetMapping("/homeworkAlert/{l_m_id}")
	   public ModelAndView homeworkAlert(@PathVariable("l_m_id") String l_m_id) {
			
			System.out.println("숙제내역연결=================");
			
			ModelAndView mav = new ModelAndView("/teacher/homeworkAlert");
			
			 List<LearnerVO> homeworkAlertList = service.homeworkAlert(l_m_id);
			
			System.out.println(homeworkAlertList);
			System.out.println(l_m_id);
			
			mav.addObject("homeworkalert", homeworkAlertList);

			return mav;
		}
	   
	   @GetMapping("/homeworkable/{l_m_id}")
	    public ResponseEntity<List<String>> homeworkable(@PathVariable("l_m_id") String l_m_id) {
		   List<LearnerVO> homeworkAlertList = service.homeworkAlert(l_m_id);
		    List<String> hHomeworkList = new ArrayList<>();

		    for (LearnerVO learnerVO : homeworkAlertList) {
		        String hHomework = learnerVO.getH_content();
		        hHomeworkList.add(hHomework);
		    }

		    if (!hHomeworkList.isEmpty()) {
		        System.out.println("a=========================");
		        System.out.println("h_homework 값 리스트: " + hHomeworkList);
		        return ResponseEntity.ok(hHomeworkList);
		    } else {
		    	
		        return ResponseEntity.notFound().build();
		    }
	    }


}
