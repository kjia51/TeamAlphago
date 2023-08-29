package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.ContentService;
import com.alpha.vo.CartVO;
import com.alpha.vo.ContentVO;
import com.alpha.vo.MemberVO;

@RestController
@RequestMapping("/alpha/*")
public class ContentController extends CommonRestController {
	
	   @Autowired
	   ContentService contentService;
	   
	   	
	   @GetMapping("/")
	   public ModelAndView main() {
		   
		   ModelAndView mav = new ModelAndView("/main/main");
		   
		   return mav;
	   }
	   
	   @GetMapping("/content")
		public ModelAndView teacher() {

			ModelAndView mav = new ModelAndView("/content/content");
		
			return mav;
		}
	   
	   @GetMapping("/salesList") 
	   public ModelAndView salesLIST() {
		   ModelAndView mav = new ModelAndView("/content/salesList");
		   return mav;
	   }
	   
	   @GetMapping("/myContentPage") 
	   public ModelAndView myContentPage() {
		   ModelAndView mav = new ModelAndView("/content/myContentPage");
		   return mav;
	   }
	   
	   //등록
		@PostMapping("/content/insert")
		public Map<String, Object> register(@RequestBody ContentVO contentVO) {

			try {
				int res = contentService.insertContent(contentVO);
				System.out.println(res);
				Map<String, Object> map = responseWriteMap(res);
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseMap(REST_FAIL, "등록 중 오류 발생");
			}
		}
		
		
		// 수정 시 조회
		   @GetMapping("/content/edit/{c_no}")
		   public Map<String, Object> contentEdit(@PathVariable("c_no") String c_no) {
		      
				try {
					ContentVO contentVO = contentService.getContentOne(c_no);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("contentVO", contentVO);
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "수정 중 오류 발생");
				}
		   }
		   
		   //조회
		   @GetMapping("/content/list/{c_no}")
		   public Map<String, Object> contentList(@PathVariable("c_no") String c_no) {
		      
				try {
					ContentVO contentVO = contentService.getContentOne(c_no);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("contentVO", contentVO);
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "조회 중 오류 발생");
				}
		   }
		   
		   //수정 action
		   @PutMapping("/content/EditAction")
			public Map<String, Object> update(@RequestBody ContentVO contentVO) {

				try {
					int res = contentService.updateContent(contentVO);
					Map<String, Object> map = responseEditMap(res);
					return map;

				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "삭제 중 오류 발생");
				}
			}
		   
		   //삭제 action
		   @DeleteMapping("/content/DeleteAction/{c_no}")
		   public Map<String, Object> delete(@PathVariable("c_no") String c_no) {
			   
			   try {
				   int res = contentService.deleteContent(c_no);
				   Map<String, Object> map = responseDeleteMap(res);
				   return map;
				   
			   } catch (Exception e) {
				   e.printStackTrace();
				   return responseMap(REST_FAIL, "삭제 중 오류 발생");
			   }
		   }
		   
		   //장바구니 담기
		   @PostMapping("/cart/insert")
		   public Map<String, Object> cartList(@RequestBody CartVO cartVO ) {
		      System.out.println("===================================================================================================================================");
				try {
					//if(cartVO.getCr_m_no()!=null){
						int res = contentService.addCart(cartVO);
						Map<String, Object> map = responseWriteMap(res);
						return map;
					//}
				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "등록 중 오류 발생");
				}
		   }
		   
		   //조회
		   @GetMapping("/cart/list/{cr_c_no}")
		   public Map<String, Object> cartList(@PathVariable("cr_c_no") String cr_c_no) {
		      
				try {
					List<CartVO> list = contentService.getCartList(cr_c_no);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("list", list);
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseMap(REST_FAIL, "조회 중 오류 발생");
				}
		   }
		   


}
