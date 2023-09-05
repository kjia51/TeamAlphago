<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/learner.css">
<%@ include file="../common/header.jsp"%>   
<meta charset="UTF-8">
<title>학습자 숙제 내역</title>
</head>
<body>
<div id="container">
	<div class="wrap">
		<div class="content_wrap">
			<div class="titleBox">
				<h2 class="t_title">학습자 숙제 내역</h2>
				<input name="t_m_id" id="memberId" type="hidden" value="${memberVO.m_id}">
				<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
			</div>



	<!-- 숙제 내역 리스트 -->
	<div id="learnerInfo">
			<div>학습자 : ${memberVO.m_name}</div> 
		<div class="entry" Style="">
			<table class="table table-bordered">
				<caption>숙제 내역</caption>
				<colgroup>
					<col width="5%" />
					<col width="25%" />
					<col width="10%" />
					<col width="20%" />
					<col width="15%" />
					<col width="25%" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align: center;"><input type="checkbox"
							id="checkboxAll" name="myCheckboxAll" value="Checked"></th>
						<th>학습콘텐츠</th>
						<th>학습지도자</th>
						<th>숙제내용</th>
						<th>제출기한</th>
						<th>학습내용</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${homeworkList != null}">
						<c:forEach items="${homeworkList}" var="list" >
						
							<tr>
								<th align="center"><input type="checkbox" id="checkbox"
									name="myCheckbox" value="isChecked">
								</th>
								<td align="center" class="row">${list.c_name}</td>
								<td align="center">${list.m_name}</td>
								<td align="center">${list.h_homework}</td>
								<td align="center">${fn:substring(list.h_limit, 0, 10)}</td>
								<td align="center">
								<textarea name="h_content" id="hContent" rows="5" cols="10" style="width: 90%;">
								학습내용을 입력하세요.
								</textarea></td>
							</tr>
							
						</c:forEach>
					</c:when>
					</c:choose>
					<c:if test="${homeworkList == null}">
						<tr>
							<td colspan="6" style="text-align: center;">숙제가 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		<!-- 제출버튼 -->
		<div class="btnArea-center" style="border:0; padding-top:0;">
                     <span class="btn btn-grayline btn-lg"><a onclick="submitHomework()">제출하기</a></span>
                 </div>
			<div class="paging">
				<a href='/' class="current">1</a> <a href='/'>2</a>
			</div>
		</div>
	</div>
	</div>
	</div>
</div> <!-- container -->
</body>
<script>
// post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'post'
					,headers : {'Content-Type' : 'application/json'} 
					,body  : JSON.stringify(obj)
			  })
			//요청 결과json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			//매개로 받은 콜백함수 실행
			.then(map => callback(map))
			
		} catch (e) {
			console.log(e);
		}
}
// 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		var memberId = $('#memberId').val();
		window.location.href = "/alpha/submitHomework?l_m_id=" + memberId;
	} else {
		alert(map.msg);
	}
		
}
function submitHomework(){
	console.log("input:checkbox[name=myCheckbox]",$('input:checkbox[name=myCheckbox]'));
	
	// 체크박스 선택 검증
	if($('input:checkbox[name=myCheckbox]:checked').length==0){
			alert('제출할 숙제를 선택해주세요.');
			// 입력 버튼 비활성화 처리 
		} else{
			
			
		 
		 
	 }
	
}


</script>
</html>
<%@ include file="../common/footer.jsp"%>