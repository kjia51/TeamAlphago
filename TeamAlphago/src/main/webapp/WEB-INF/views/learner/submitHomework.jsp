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
					<col width="20%" />
					<col width="15%" />
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
									name="myCheckbox" value="${list.h_no}"></th>
								<td align="center" class="row">${list.c_name}
									<input type="text" name="c_name" id="contentNo" value="${list.c_name}" >
								</td>
								<td align="center">${list.m_name}
									<input type="text" name="m_name" id="memberName" value="${list.m_name}" >
								</td>
								<td align="center">${list.h_homework}
									<input type="text" name="h_homework" id="homework" value="${list.h_homework}" >
								</td>
								<td align="center">${fn:substring(list.h_limit, 0, 10)}
									<input type="text" name="h_limit" id="deadline" value="${list.h_limit}" >
								</td>
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


//선택된 체크박스의 h_no 값을 저장할 배열
var selectedHNoArray = [];

// 체크박스의 변경 이벤트를 감지하여 배열에 h_no 값을 추가 또는 제거합니다.
$('input:checkbox[name=myCheckbox]').on('change', function() {
    var hNo = $(this).val();
    console.log("hNo", hNo);
    if (this.checked) {
        selectedHNoArray.push(hNo); // 체크된 경우 배열에 추가
    } else {
        var index = selectedHNoArray.indexOf(hNo);
        if (index !== -1) {
            selectedHNoArray.splice(index, 1); // 체크 해제된 경우 배열에서 제거
        }
    }
});

// 제출버튼 클릭 시 update
function submitHomework() {
    // 배열에 선택된 h_no 값이 있는지 확인
    if (selectedHNoArray.length === 0) {
        alert('제출할 숙제를 선택하여 주세요.');
        return;
    }

    // 선택된 h_no 값을 서버로 전달하여 업데이트
    var hContent = $('#hContent').val(); // 업데이트할 내용
    console.log("hContent", hContent);
    var updateData = {
        h_no_array: selectedHNoArray,
        h_content: hContent
    };

    console.log(updateData);	
    // AJAX(fetch) 요청을 사용하여 서버에 데이터 전송
    fetch('/alpha/submitHomework/submit', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(updateData)
    })
    .then(response => response)
    .then(data => {
        if (data.success) {
            alert('완료되었습니다.');
            // 필요한 경우 추가적인 처리나 화면 갱신
        } else {
            alert('실패했습니다.');
        }
    })
    .catch(error => {
        console.error('오류:', error);
    });
}


// 체크 박스 전체 선택 이벤트
function selectAll(selectAll)  {
	const checkboxes = document.getElementsByName('myCheckbox');
	
	checkboxes.forEach((checkbox) => {
	  checkbox.checked = selectAll.checked;
	});
}

</script>
</html>
<%@ include file="../common/footer.jsp"%>