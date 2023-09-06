<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
 
<!DOCTYPE html>
<html>
<script src="/resources/js/learner/submitHomework.js"></script>
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
	<div id="homeworkInfo">
			<div style="margin: 20px; font-style: normal; text-align: left; font-size: medium;">${memberVO.m_name} 님</div>
		<div class="entry" Style="">
			<table class="table table-bordered">
				<caption>숙제 내역</caption>
				<colgroup>
					<col width="5%" />
					<col width="25%" />
					<col width="15%" />
					<col width="30%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align: center;"></th>
						<th>학습콘텐츠</th>
						<th>학습지도자</th>
						<th>숙제내용</th>
						<th>제출기한</th>
						<th>제출현황</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${homeworkList != null}">
						<c:forEach items="${homeworkList}" var="list" >
						
							<tr>
								<th align="center"><input type="checkbox" id="checkbox"
									name="myCheckbox" value="${list.h_no}" data-hno="${list.h_no}"></th>
								<td align="center" class="row">${list.c_name}
									<input type="hidden" name="c_name" id="contentNo" value="${list.c_name}" >
								</td>
								<td align="center">${list.m_name}
									<input type="hidden" name="m_name" id="memberName" value="${list.m_name}" >
								</td>
								<td align="center">${list.h_homework}
									<input type="hidden" name="h_homework" id="homework" value="${list.h_homework}" >
								</td>
								<td align="center">${fn:substring(list.h_limit, 0, 10)}
									<input type="hidden" name="h_limit" id="deadline" value="${list.h_limit}" >
								</td>
								<td align="center">
									 <span id="submissionStatus_${list.h_no}">
									 ${list.h_content == null || list.h_content == '' ? '미완료' : '완료'}</span>
								</td>
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
			 <span class="btn btn-grayline btn-lg">
			 	<button id="writebtn">학습내용 입력</button>
           </span>
        </div>
			<div class="paging">
				<a href='/' class="current">1</a> <a href='/'>2</a>
			</div>
		</div>
	</div>
	</div>
	</div>
</div> <!-- container -->

<%---------------------------------모달창 ------------------------------%>
<div id="assign_modal">
	<div class="titleBox">
		<h3 class="t_title">학습 내용 입력</h3>
		<input name="l_no" id="learnerNo" type="hidden" value="">
	</div>
	<div class="entry">
		<div class="centered-div" style="align-content: center;">
		<table style="border: 1px solid #000, border-collapse: collapse; width:100%; ">
			<tr>
				<td align="center" style="border: 1px solid #000; ">
					<textarea name="h_content" id="hContent">학습 내용을 입력하세요.</textarea>
				</td>
			<tr>
		</table>
		</div>
		<br>
		<div class="btns">
			<button>
				<a class ="submitBtn" onclick="submitHomework()">제출하기</a>
			</button>
			<button>
				<a class="modal_close_btn">닫기</a>
			</button>
		</div>
	</div>
</div>
<%-----------------------------모달창 끝----------------------------------%>
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
//내용 입력 버튼 클릭 시 이벤트
$('#writebtn').on('click', function() {
    // 모달창 띄우기
    modal('assign_modal');
    

});


//선택된 체크박스의 h_no 값을 저장할 배열
var selectedHnos = [];

// 학습 내용 입력 버튼 클릭 시
$('#writebtn').on('click', function() {
    // 초기화: 선택된 h_no 배열 비우기
    selectedHnos = [];

    // 선택된 체크박스 확인
    $('input[name="myCheckbox"]:checked').each(function() {
        var hno = $(this).data('hno');
        selectedHnos.push(hno);
    });

    // 모달창 띄우기
    modal('assign_modal');
});

// 모달창에서 제출하기 버튼 클릭 시
function submitHomework() {
    var hContent = $('#hContent').val(); // 학습 내용 입력
	console.log('hContent',hContent)
    if (selectedHnos.length === 0) {
        alert('숙제를 선택하세요.');
        return;
    }

    // 선택된 각 h_no에 대해 hContent 전송
    selectedHnos.forEach(function(hno) {
        var obj = {
            h_no: hno,
            h_content: hContent
        };
		console.log("obj", obj);
		
        fetchPost('/alpha/submitHomework/submit', obj, function(map) {
            if (map.result === 'success') {
                alert('제출되었습니다.');
                // 제출 현황 업데이트: 완료 표시
                $('#submissionStatus_' + hno).html('완료');
            } else {
                alert('제출에 실패하였습니다.');
            }
        });
    });

    // 모달창 닫기
    $('#assign_modal').hide();
    $('.modal_bg').remove();
}


//모달창 띄우기
function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색상은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('.modal_close_btn')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
}
</script>
<%@ include file="../common/footer.jsp"%>
</html>