<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<script src="/resources/js/joinGroup.js"></script>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>
<script src="/resources/js/learner/homeworkAssess.js"></script>
<meta charset="UTF-8">
<title>그룹 가입 신청</title>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">

<body>
	<%@ include file="../common/header.jsp"%>
	숙제 평가 페이지 
	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 평가(학습지도자)</h2>
					<input name="l_m_id" id="memberId" type="hidden" value="${memberVO.m_id}"> 
					<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
				</div>

				<!--그룹명-->
				<form class="searchWrap searchWrap_wide" onSubmit="return false;">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="groupNameList" name="g_name" id="grpSelectBox"
											onchange="selectGroup(this.value);" value="">
											<option value="selectop">선택</option>
											<c:forEach items="${grpNameList}" var="group">
												<option value="${group.g_name}">${group.g_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td style="border-left: none;">
									<button class="btn btn-default" id="writebtn">저장</button>
								</td>
							
							</tr>
						</tbody>
					</table>
				</form>

				<div id="groupInfoDiv">
					<div class="entry" id="homeworkInfo">
						<table class="table table-bordered">
							<caption>그룹 정보</caption>
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="30%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th>선택</th>
									<th>학습자명</th>
									<th>숙제제출기한</th>
									<th>제출일자</th>
									<th>학습내용</th>
									<th>평가</th>
								</tr>
							</thead>

							<tbody>
								<c:set var="isMember" value="${memberVO.m_id}" />
								<c:if test="${isMember == null}">
									<tr>
										<td colspan="5" style="text-align: center;">
										로그인 후 이용 가능합니다.</td>
									</tr>
								</c:if>
								<c:set var="isTeacher" value="${memberVO.m_division}" />
								<c:if test="${isTeacher == 1}">
									<tr>
										<td colspan="6" style="text-align: center;">
										그룹을 선택하여 주세요.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- //content close -->
		</div>
	</div>
	<!-- container close -->
	<%@ include file="../common/footer.jsp"%>
	<script type="text/javascript">
//get방식 
function fetchGet(url,callback){
	console.log(url);
	console.log(callback);
	
	try {
	//url 요청
	fetch(url)
		//요청 결과json 문자열을 javascript 객체로 반환
		.then(response => response.json())
		//매개로 받은 콜백함수 실행
		.then(map => callback(map));
		
	} catch (e) {
		consol.log('fetchGet', e);
	}

}

// fetch Post 방식
function fetchPost(url, obj, callback){
	try {
	fetch(url, {method : 'post', headers : {'Content-Type' : 'application/json'}, body : JSON.stringify(obj)})
	.then(response => response.json())
	.then(map => callback(map));
		
	} catch (e) {
		consol.log('fetchPost',e);
	}
}

//그룹 선택시 이벤트 발생 
function selectGroup(g_no) {
	console.log("g_no", g_no); 
 var url = '';
	    $.ajax({
	        url: '/alpha/giveHomework/' + g_no,
	        method: 'GET',
	        success: function(response) {
	        	// 성공 시 작업
				var url = '/alpha/giveHomework/' + g_no;
	        	fetchGet(url, displayLearnerList)
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	        	console.log(error)
	        }
	    });
} 

 
 
//선택 그룹에 따른 그룹 정보 리스트 출력
function displayLearnerList(map) {
	console.log("map", map)
	let LearnerList = map.LearnerList;
	console.log("LearnerList", LearnerList)
	
	learnerInfo.innerHTML='';
	let pageBlock = ''; // 기존 내용 초기화
	         pageBlock += ''                                                                        
						+'	<div class="entry">                                                     '
						+'	<table class="table table-bordered">                                    '
						+'		<caption>학습자 정보</caption>                                         '
						+'		<colgroup>                                                          '
						+'			<col width="10%" />                                             '
						+'			<col width="15%" />                                             '
						+'			<col width="15%" />                                             '
						+'			<col width="15%" />                                             '
						+'			<col width="30%" />                                             '
						+'			<col width="10%" />                                             '
						+'		</colgroup>                                                         '
						+'		<thead>                                                             '
						+'			<tr>                                                            '
						+'				<th align="center"><input type="checkbox" id="checkboxAll"  '
						+'				name="myCheckbox" onclick="selectAll(this)" value="checked"></th> '
						+'				<th>학습자명</th>                                           '
						+'				<th>제출기한</th>                                             '
						+'				<th>제출일자</th>                                            '
						+'				<th>학습내용</th>                                            '
						+'				<th>평가</th>                                            '
						+'			</tr>                                                           '
						+'		</thead>                                                            '
						+'		<tbody>';
	if(LearnerList != null){
		LearnerList.forEach((Learner)=>{
 		console.log('Learner', Learner.m_name);
 		pageBlock += ''					
						+'				<tr>                                                        '
						+'					<th align="center"><input type="checkbox" id="checkbox" '
						+'						name="myCheckbox" value="'+Learner.l_no+'"></th>    '
						+'					<td align="center" class="row">'+Learner.m_name+'</td>  '
						+'					<td align="center">'+Learner.c_name+'</td>              '
						+'					<td align="center">'+Learner.g_start+'</td>             '
						+'					<td align="center">'+Learner.g_end+'</td>'
						+'<td style="display: none">'
						+'<input type="hidden" name="h_c_no" id="contentNo" value="'+ Learner.h_c_no +'">'
						+'</td>'
						+'<td style="display: ">'
						+'<input type="text" name="l_m_id" id="learnerId" data-lno="'+Learner.l_no+'" value="'+ Learner.l_m_id +'">'
						+'</td>'
						+'<td style="display: none">'
						+'<input type="hidden" name="h_g_no" id="groupNo" value="'+ Learner.h_g_no +'">'
						+'</td>'
						+'</tr>';
		})
						
						
			pageBlock += ''			
						+'		</tbody>                                                            '
						+'	</table>                                                                '
						+'</div>';
	} else {
			pageBlock +='<tr>'
						+'<td colspan="6" style="text-align: center;">그룹을 선택하여 주세요.</td>'
						+'</tr>';
	}
			learnerInfo.innerHTML += pageBlock;
}

//체크 박스 전체 선택 이벤트
function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('myCheckbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}



    

 

</script>
</body>
</html>