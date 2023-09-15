package com.alpha.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class CommonRestController {
	
	private final String REST_WRITE = "등록";
	private final String REST_EDIT = "수정";
	private final String REST_DELETE = "삭제";
	private final String REST_SELECT = "조회";
	protected final String REST_SUCCESS = "success";
	protected final String REST_FAIL = "fail";
	protected final String REST_NULL = "";
	
	
	/**
	 * 입력, 수정, 삭제의 경우 int 값을 반환합니다.
	 * 결과를 받아서 Map을 생성후 반환 합니다.
	 * @return
	 */
	// map을 생성후 result, msg세팅
	public Map<String, Object> responseMap(int res, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res > 0) {
			System.out.println("res>0=======================================");
			map.put("result", REST_SUCCESS);
			map.put("msg", msg+" 되었습니다.");
		}else {
			map.put("result", REST_FAIL);
			map.put("msg", msg+"중 예외가 발생하였습니다");

		}
		
		return map;
	}
	
	public Map<String, Object> responseResultMap(String result, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
	
	
		map.put("result", result);
		map.put("msg", msg);

	
	return map;
}
	
	public Map<String, Object> responseWriteMap(int res){
		return responseMap(res,REST_WRITE);
	}
	
	public Map<String, Object> responseEditMap(int res){
		return responseMap(res,REST_EDIT);
	}
	
	public Map<String, Object> responseDeleteMap(int res){
		return responseMap(res,REST_DELETE);
	}
	
	public Map<String, Object> responseNo(int res){
		Map<String, Object> map = new HashMap<String, Object>();
		if(res > 0) {
			System.out.println("res>0=======================================");
			map.put("result", REST_SUCCESS);
			map.put("msg", "");
		}else {
			map.put("result", REST_FAIL);
			map.put("msg", "");

		}
		
		return map;
	}
	
	public Map<String, Object> responseMap(String result, String msg){
			Map<String, Object> map = new HashMap<String, Object>();
		
			map.put("result", result);
			map.put("msg", msg);
		
		return map;
	}

		//어떤 list를 받을지 모르기때문에 ? 로 저장

	public Map<String, Object> responseList(List<?> list){
		
		int res = list != null ? 1 : 0 ;
		Map<String, Object> map = responseMap(res, REST_SELECT);
		map.put("list",list);
		return map;
		}
	
	public Map<String, Object> responseCartList(List<?> list){
		
		int res = list != null ? 1 : 0 ;
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res > 0) {
			map.put("msg", " 상품이 장바구니에 담겼습니다\r\n" + 
					"장바구니로 이동하시겠습니까?");
		}else {
			map.put("msg", "");

		}
		
		return map;
	}
	public Map<String, Object> responseMemberList(int res){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res > 0) {
			map.put("msg", " 정보를 수정하셨습니다.\r\n" + 
					"다시 로그인해 주세요.");
		}else {
			map.put("msg", "");
			
		}
		
		return map;
	}
	
	public Map<String, Object> responseVo(Object vo) {
	    int res = vo != null ? 1 : 0;
	    System.out.println(res);
	    Map<String, Object> map = responseMap(res, REST_SELECT);
	    map.put("vo", vo);
	    return map;
	}
	
	
	
}
