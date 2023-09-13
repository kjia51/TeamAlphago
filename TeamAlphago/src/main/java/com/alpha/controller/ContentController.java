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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alpha.service.ContentService;
import com.alpha.service.FileuploadService;
import com.alpha.service.MemberService;
import com.alpha.vo.CartVO;
import com.alpha.vo.ContentVO;
import com.alpha.vo.MemberVO;
import com.alpha.vo.SalesVO;

@RestController
@RequestMapping("/alpha/*")
public class ContentController extends CommonRestController {
	
	   @Autowired
	   ContentService contentService;
	   
	   @Autowired
	   FileuploadService service;
	   
	   @Autowired
	   MemberService memberService;
	   
	   	
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
	   
	   @GetMapping("/mypage")
	   public ModelAndView mypage() {
		   
		   ModelAndView mav = new ModelAndView("/member/myPage");
		   
		   return mav;
	   }
	   
	   @GetMapping("/saleList") 
	   public ModelAndView salesLIST() {
		   ModelAndView mav = new ModelAndView("/content/saleList");
		   return mav;
	   }
	   
	   @GetMapping("/mycart") 
	   public ModelAndView myCart() {
		   ModelAndView mav = new ModelAndView("/content/myCart");
		   return mav;
	   }
	   

	   //등록
		@PostMapping("/content/insert")
		public Map<String, Object> register(@RequestBody ContentVO contentVO) {

			try {
				int res = contentService.insertContent(contentVO);
				contentVO = contentService.contentGetOne(contentVO);
				System.out.println(res);
				Map<String, Object> map = responseWriteMap(res);
				map.put("c_no", contentVO.getC_no());
				System.out.println("==============================================");
				System.out.println(contentVO.getC_no());
				return map;

			} catch (Exception e) {
				e.printStackTrace();
				return responseResultMap(REST_FAIL, "등록 중 오류 발생");
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
					return responseResultMap(REST_FAIL, "수정 중 오류 발생");
				}
		   }
		   
		   //조회
		   @GetMapping("/content/list/{c_no}")
		   public Map<String, Object> contentList(@PathVariable("c_no") String c_no) {
		      
				try {
					ContentVO contentVO = contentService.getContentOne(c_no);
					System.out.println("====================================================="+contentVO);
					Map<String, Object> map = responseVo(contentVO);
					map.put("contentVO", contentVO);
					map.put("url", "/alpha/teacher");
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseResultMap(REST_FAIL, "조회 중 오류 발생");
				}
		   }
		   
		   //수정 action
		   @PutMapping("/content/EditAction")
			public Map<String, Object> update(@RequestBody ContentVO contentVO) {

				try {
					System.out.println(contentVO);
					int res = contentService.updateContent(contentVO);
					System.out.println(res);
					Map<String, Object> map = responseEditMap(res);
					map.put("c_no", contentVO.getC_no());
					return map;

				} catch (Exception e) {
					e.printStackTrace();
					return responseResultMap(REST_FAIL, "수정 중 오류 발생");
				}
			}
		   
		   //콘텐츠 삭제 action
		   @DeleteMapping("/content/DeleteAction/{c_no}")
		   public Map<String, Object> delete(@PathVariable("c_no") String c_no) {
			   
			   try {
				   int res = contentService.deleteContent(c_no);
				   Map<String, Object> map = responseDeleteMap(res);
				   return map;
				   
			   } catch (Exception e) {
				   e.printStackTrace();
				   return responseResultMap(REST_FAIL, "구매된 상품이 존재합니다.");
			   }
		   }
		   
		   //콘텐츠 삭제 action
		   @DeleteMapping("/content/DeleteFile/{c_no}")
		   public Map<String, Object> deleteFile(@PathVariable("c_no") String c_no) {
			   
			   try {
				   int res = contentService.deleteFile(c_no);
				   Map<String, Object> map = responseDeleteMap(res);
				   return map;
				   
			   } catch (Exception e) {
				   e.printStackTrace();
				   return responseResultMap(REST_FAIL, "구매된 상품이 존재합니다.");
			   }
		   }
		   
		   //장바구니 삭제 action
		   @DeleteMapping("/content/DeleteCart/{cr_c_no}/{cr_m_no}/{cnt}")
		   public Map<String, Object> delete(@PathVariable("cr_c_no") String cr_c_no, @PathVariable("cr_m_no") String cr_m_no, @PathVariable("cnt") String cnt) {
			   
			   try {
				   int res = contentService.deleteCart(cr_m_no, cr_c_no, cnt);
				   Map<String, Object> map = responseDeleteMap(res);
				   return map;
				   
			   } catch (Exception e) {
				   e.printStackTrace();
				   return responseResultMap(REST_FAIL, "삭제 중 오류 발생");
			   }
		   }
		   
		   //장바구니 담기
		   @PostMapping("/cart/insert")
		   public Map<String, Object> cartList(@RequestBody CartVO cartVO ) {
		      System.out.println("===================================================================================================================================");
				try {
						int res = contentService.addCartListCnt(cartVO);
						if(res<1) {
							contentService.addCart(cartVO);
							Map<String, Object> map = responseResultMap(REST_SUCCESS, "장바구니에 상품이 담겼습니다\r\n"+
																					"장바구니로 이동하시겠습니까?");
							return map;
						} else {
							return responseResultMap(REST_FAIL, "장바구니에 이미 동일한 상품이 존재합니다.");
						}
					//}
				} catch (Exception e) {
					e.printStackTrace();
					return responseResultMap(REST_FAIL, "장바구니 담기 중 오류 발생");
				}
		   }
		   
		   //장바구니 조회
		   @GetMapping("/cart/list/{cr_c_no}")
		   public Map<String, Object> cartList(@PathVariable("cr_c_no") String cr_c_no) {
		      
				try {
					List<CartVO> list = contentService.getCartList(cr_c_no);
					Map<String, Object> map = responseCartList(list);
					map.put("list", list);
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseResultMap(REST_FAIL, "조회 중 오류 발생");
				}
		   }
		   // 내 장바구니 조회
		   @GetMapping("/mycart/list/{cr_m_no}")
		   public Map<String, Object> myCart(@PathVariable("cr_m_no") String cr_m_no) {
			   
			   try {
				   System.out.println("=================================================================");
				   System.out.println(cr_m_no);
				   List<CartVO> cartList = contentService.getMyCart(cr_m_no);
				   Map<String, Object> map = responseCartList(cartList);
				   map.put("cartList", cartList);
				   return map;
				   
			   } catch (Exception e) {
				   e.printStackTrace();
				   return responseResultMap(REST_FAIL, "조회 중 오류 발생");
			   }
		   }
		   
		   @GetMapping("/content/chartDate/{startdate}/{enddate}") 
		   public Map<String, Object> chartDView(@PathVariable("startdate") String startdate, @PathVariable("enddate") String enddate) {
				try {
					Map<String, Object> map = new HashMap<String, Object>();
					List<SalesVO> dateList = contentService.salesDate(startdate, enddate);
					System.out.println(dateList);
					map.put("dateList", dateList);
					return map;
	
				} catch (Exception e) {
					e.printStackTrace();
					return responseResultMap(REST_FAIL, "조회 중 오류 발생");
				}
		   }
		   @GetMapping("/content/chartContent/{c_level}") 
		   public Map<String, Object> chartCView(@PathVariable("c_level") String c_level) {
			   try {
				   Map<String, Object> map = new HashMap<String, Object>();
				   List<SalesVO> levelList = contentService.salesLevel(c_level);
				   List<SalesVO> contentList = contentService.salesContent(c_level);
				   System.out.println(contentService.salesLevel(c_level));
				   map.put("levelList", levelList);
				   map.put("contentList", contentList);
				   return map;
				   
			   } catch (Exception e) {
				   e.printStackTrace();
				   return responseResultMap(REST_FAIL, "조회 중 오류 발생");
			   }
		   }

		   
		 //멤버 조회
		   @GetMapping("/member/list")
		   public Map<String, Object> memberList(HttpSession session) {
		      
				try {
					String m_id = (String)session.getAttribute("m_id");
					MemberVO vo = memberService.memberOne(m_id);
					
					System.out.println("====================================================="+m_id);
					Map<String, Object> map = responseVo(vo);
					map.put("vo", vo);
					return map;

				} catch (Exception e) {
					e.printStackTrace();
					return responseResultMap(REST_FAIL, "조회 중 오류 발생");
				}
		   }
		   
		   

}
