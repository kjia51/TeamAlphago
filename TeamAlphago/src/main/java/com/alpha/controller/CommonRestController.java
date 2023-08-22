package com.alpha.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;



public class CommonRestController {
	
	private final String REST_WRITE = "���";
	private final String REST_EDIT = "����";
	private final String REST_DELETE = "����";
	private final String REST_SELECT = "��ȸ";
	protected final String REST_SUCCESS = "success";
	protected final String REST_FAIL = "fail";
	
	
	/**
	 * �Է�, ����, ������ ��� int ���� ��ȯ�մϴ�.
	 * ����� �޾Ƽ� Map�� ������ ��ȯ �մϴ�.
	 * @return
	 */
	// map�� ������ result, msg����
	public Map<String, Object> responseMap(int res, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res > 0) {
			map.put("result", REST_SUCCESS);
			map.put("msg", msg+" �Ǿ����ϴ�.");
		}else {
			map.put("result", REST_FAIL);
			map.put("msg", msg+"�� ���ܰ� �߻��Ͽ����ϴ�");

		}
		
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
	
	public Map<String, Object> responsememberDeleteMap(int res){
		return responseMap(res,REST_DELETE);
	}
	
	public Map<String, Object> responseMap(String result, String msg){
			Map<String, Object> map = new HashMap<String, Object>();
		
		
			map.put("result", result);
			map.put("msg", msg);

		
		return map;
	}

		//� list�� ������ �𸣱⶧���� ? �� ����
	public Map<String, Object> responseListMap(List<?> list){
	
	int res = list != null ? 1 : 0 ;
	Map<String, Object> map = responseMap(res, REST_SELECT);
	map.put("list",list);
	return map;
	}
	
	public Map<String, Object> responsePensionBListMap(List<?> list){
		
		int res = list != null ? 1 : 0 ;
		Map<String, Object> map = responseMap(res, REST_SELECT);
		map.put("list",list);
		return map;
		}
	
	public Map<String, Object> responseReviewListMap(List<?> list
			, List<?> reviewerList){

	int res = list != null ? 1 : 0;
	Map<String, Object> map = responseMap(res, REST_SELECT);
	map.put("list", list);
	map.put("reviewerList", reviewerList);
	return map;
	}
	
	public Map<String, Object> responseMemberListMap(List<?> list
	){
	
	int res = list != null ? 1 : 0;
	Map<String, Object> map = responseMap(res, REST_SELECT);
	map.put("list", list);
	return map;
	}
	
	public Map<String, Object> responsePensionBListMap(List<?> list
			, List<?> list2){
			
			int res = list != null ? 1 : 0;
			Map<String, Object> map = responseMap(res, REST_SELECT);
			map.put("list", list);
			map.put("list", list2);
			return map;
	}
	
	
	
}
