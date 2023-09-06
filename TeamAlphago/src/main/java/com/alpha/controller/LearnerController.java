package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.LearnerService;
import com.alpha.vo.Criteria;
import com.alpha.vo.LearnerVO;
import com.alpha.vo.PageDto;

@RestController
@RequestMapping("/alpha/*")
public class LearnerController extends CommonRestController {

	@Autowired
	private LearnerService learnerService;	
	
	
	// 그룹 이름 리스트 및 그룹 전체 리스트	 
	@GetMapping("/joinGroup")
	public ModelAndView groupName(String g_name, String l_m_id, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView("/learner/joinGroup");
		try {

			System.out.println("그룹 이름 리스트 연결");
			int totalCnt = learnerService.grpTotalCnt(cri);
			PageDto pageDto = new PageDto(cri, totalCnt);
			
			// 그룹 이름 리스트 
			mav.addObject("list", learnerService.groupName(g_name));
			
			// 그룹 전체 리스트 
			mav.addObject("listAll", learnerService.grouplistAll(l_m_id, cri));
			System.out.println(learnerService.grouplistAll(l_m_id, cri));
			System.out.println("g_name : "+ g_name);
			System.out.println("l_m_id :"+ l_m_id);
			
			mav.addObject("pageDto", pageDto);
			mav.addObject("totalCnt", totalCnt);
			System.out.println("totalCnt : "+totalCnt);
			System.out.println("pageDto : "+pageDto);
		} catch (Exception e) {
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return mav; 
	}
	
	// 그룹별 그룹가입 리스트
	@GetMapping("/joinGroup/{g_name}")
	public Map<String, Object> groupInfo(@PathVariable("g_name") String g_name, HttpSession session){
		System.out.println("그룹 정보 리스트 연결");
		Map<String, Object> map = new HashMap<String, Object>();

		String mId = session.getAttribute("m_id") == null? "":session.getAttribute("m_id").toString();
		
		try {
			System.out.println("mId : "+ mId);
			List<LearnerVO> grplist = learnerService.groupInfo(g_name, mId);
			System.out.println(grplist);
			map.put("grplist", grplist);

			
		} catch (Exception e) {
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return map;
	}
	
	// 그룹 가입 신청
	@PostMapping("/groupApply")
	public void groupApply(@RequestBody LearnerVO learnerVO) {
		System.out.println("그룹가입페이지 연결");
		learnerService.insertGrp(learnerVO);
		System.out.println("learnerVO:"+learnerVO);
		System.out.println(learnerVO.getT_m_id());
	}
	
	// 그룹 이름 리스트 조회
	@GetMapping("/giveHomework")
	public ModelAndView groupNameList(String t_m_id) {
		System.out.println("숙제전송 - 그룹 이름 리스트 연결");
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView("/learner/giveHomework");
		
		try {
			mav.addObject("grpNameList", learnerService.groupNameForT(t_m_id));

			System.out.println("t_m_id : "+ t_m_id);
			
		} catch (Exception e) {
			
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return mav; 
	}
	// 그룹별 학습자 리스트 조회
	@GetMapping("/giveHomework/{g_no}")
	public Map<String, Object> grpLearnerList(@PathVariable("g_no") String g_no, HttpSession session){
		System.out.println("그룹별 학습자 리스트 연결");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String t_m_id = session.getAttribute("m_id") == null? "":session.getAttribute("m_id").toString();
		
		try {
			System.out.println("학습지도자 아이디 : "+ t_m_id);
			List<LearnerVO> LearnerList = learnerService.grpLearnerList(g_no, t_m_id);
			System.out.println("LearnerList : "+LearnerList);
			map.put("LearnerList", LearnerList);

		} catch (Exception e) {
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return map;
	}
	
	// 숙제 요청 내역 저장
	@PostMapping("/giveHomework/save")
	public Map<String, Object> insertHomework(@RequestBody LearnerVO learnerVO) {
		System.out.println("===숙제 요청 페이지===");
		try {
			int res = learnerService.insertHomework(learnerVO);
			System.out.println("res:"+res);
			Map<String, Object> map = responseWriteMap(res);
			
			if(res > 0) {
				map.put(REST_SUCCESS, "숙제를"+ res +"건 전송하였습니다.");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return responseResultMap(REST_FAIL, "요청 중 오류 발생");
		}
	}
	// 학습자 숙제 내역 
	@GetMapping("/submitHomework")
	public ModelAndView HomeworkList(LearnerVO learnerVO, String l_m_id) {
		System.out.println("학습자 숙제 제출 페이지 연결");
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView("/learner/submitHomework");
		
		try {
			mav.addObject("homeworkList", learnerService.homeworkList(l_m_id));
			System.out.println("homeworkList"+learnerVO);
			System.out.println("l_m_id : "+ l_m_id);
			
		} catch (Exception e) {
			
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return mav; 
	}
	
	// 학습자 숙제  제출(update)
	@PostMapping("/submitHomework/submit")
	public Map<String, Object> submitHomework(@RequestBody LearnerVO learnerVO) {
		System.out.println("===숙제 제출 ===");
		
		try {
			int res = learnerService.subitHomework(learnerVO.getH_no(), learnerVO.getH_content());
			System.out.println("res:"+res);
			Map<String, Object> map = responseWriteMap(res);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return responseResultMap(REST_FAIL, "요청 중 오류 발생");
		}
	}
	
	// 숙제 평가 페이지
	@GetMapping("/homeworkAssess")
	public ModelAndView homeworkGrpName(String t_m_id) {
		System.out.println("숙제평가 - 그룹 이름 리스트 연결");
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView("/learner/homeworkAssess");
		
		try {
			mav.addObject("grpNameList", learnerService.groupNameForT(t_m_id));

			System.out.println("t_m_id : "+ t_m_id);
			
		} catch (Exception e) {
			
			map.put(REST_FAIL, "오류가 발생하였습니다.");
		}
		return mav; 
	}
	
}
