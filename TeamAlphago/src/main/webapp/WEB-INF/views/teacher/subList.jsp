<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 내역</title>
</head>
<style>
.main-box {
    width: 1280px;
    height: 100%;
    background-color: #fff;
    border: 1px solid #d8dfe6;
    margin: 0 auto;
    justify-content: center;
}

#my_modal {
    display: none;
    width: 750px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}

#my_modal .modal_close_btn {
    border: 1px solid black;
    padding: 10px;
    border-radius: 5px;
}


</style>
<body>

<%@ include file="../common/header.jsp" %>

<%-- 모달창 --%>
<div id="my_modal">

	<nav id="topMenu" >
		<ul>
			<button><a class="" onclick="getContent()">콘텐츠 정보</a></button>
			<button><a class="" onclick="conGrp()">연결 그룹 관리</a></button>
			<button><a class="" onclick="createGrp()">그룹 생성</a></button>

		</ul>
	</nav>

		<div id="getSub">
		</div>
		<hr>
	   	<br>
		<div class="btn">
		    <button><a class="modal_close_btn">닫기</a></button>
    	</div>
    	
    	
</div>
<%-- --------------------------------------------------------------  --%>



<div class="main-box">
총 ${totalCnt } 건

<div id="container">
    <div class="wrap">

             <form  method="get" name="searchForm" class="content_wrap">
			<input name="t_m_id" id="m_id" type="text" value="${memberVO.m_id }">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <div class="titleBox">
                <h2 class="t_title">콘텐츠 조회</h2>
            </div>
            
            <div class="searchWrap searchWrap_wide searchWrap_normal">
                    <div class="searchBox searchBox-mid searchBox-center">
                        <fieldset>
                            <input type="hidden" name="p" value="1">
                            <legend>전체 검색</legend>
                            <select title="검색 분류" name="searchField" value="${pageDto.cri.searchField }">
                                <option value="c_no">콘텐츠명</option>
                            </select>
                            <input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." 
                            		name="searchWord" value="${pageDto.cri.searchWord }" />
                            <input type="submit" class="btn btn-primary" value="검색" />
                        </fieldset>
                    </div>
            </div>           
        </form>


<div class="entry">
	<table class="table table-bordered">
		<caption>구독 내역</caption>
			<thead>
    			<tr>
			        <th>구독ID</th>
			        <th>패키지명</th>
			        <th>구독일</th>
			        <th>구독료</th>
			        <th>인원</th>
			        <th></th>
    			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${subList != null && fn:length(subList) > 0 }">
						<c:forEach  var="sub" items="${subList }" varStatus="status">
						
						<tr>
						<%--
                            	<c:if test="${fn:length(sub.sub_no) > 1}">
									<td><input type="text" class="index" id="sub_no" data-subuid="${status.index}" value="${fn:substring(sub.sub_no,4,16)}" readonly></td>
								</c:if>
						 --%>
						 
                   			<td><input type="text" class="index" id="sub_no" data-subuid="${status.index}" value="${sub.sub_no}" readonly></td>
                            <th align="left"> <input type="text" id="c_name" value="${sub.c_name }"readonly></th>
                            <td align="center"><input type="text" class="index" id="sub_date" data-sub_date="${status.index}" value="${sub.sub_date }"readonly></td>
                            <td align="center"><input type="text" class="index" id="sub_price" data-sub_price="${status.index}" value="${sub.sub_price }"readonly></td>
                            <td align="center">${sub.sub_able }</td>        
                            
                            <td align="center">
                            <button onclick="connection(${status.index})">그룹관리 </button>                                           
                            <button onclick="cancelPay(${status.index})">콘텐츠환불</button></td>
                            
                           
                        </tr>
						
						
						</c:forEach>
					</c:when>
				<c:otherwise>
					<tr>
				 		<td>존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>

         	</tbody>
        </table> 
    </div>
</div>
<!-- //content close -->

</div>
</div>

<script>
function modal(id) { //모달창 띄우기
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
            // 레이어 색갈은 여기서 바꾸면 됨
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

//get방식 요청
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
		console.log(e);
	}

}

function connection(index) {
	var i = index;
	console.log(i);
	modal('my_modal');
	
    var sub_no = $('input[data-subuid="'+index+'"]').val();
    console.log(sub_no);

  	fetchGet('/alpha/group/getSubOne/'+sub_no, resultList)

}

/////////////////////그룹 정보
function getContent(sub_no) {
	
    var sub_no =  $('#sub_no').val();

    console.log(sub_no);
  	fetchGet('/alpha/group/getSubOne/'+sub_no, resultList)

}
/////////////////////연결 그룹 리스트
function conGrp(sub_no) {
	
    var sub_no =  $('#sub_no').val();

    console.log(sub_no);
  	fetchGet('/alpha/group/getGrpList/'+sub_no, GrpList)

}

////////////모달 패키지 정보 출력////////////////////////////////////////////////////////
var main = document.getElementById('getSub');

function resultList(map){
	main.innerHTML = '';
	let vo = map.subscribeVO;
	console.log(vo);
	
	var sub_no = vo.sub_no;
	var sub_date = vo.sub_date;
	
	var date = sub_date.substr(0,10);
	
	var sub_price = vo.sub_price;
	var sub_able = vo.sub_able;
	var sub_month = vo.sub_month;
	var c_name = vo.c_name;

	var c_level = vo.c_level;
	var sub_lv = "";
	
	if(c_level == '1') {
		sub_lv = "초급";
	} else if (c_level == '2') {
		sub_lv = "중급";
	} else if (c_level == '3') {
		sub_lv = "고급";
	}

	main.innerHTML += ''
		+ '<input type="text"'
		+ 'style="text-align: center; background-color: #ececec; border-bottom: 1px solid #dadada;' 
		+ 'border-top: 1px solid #074691; color: black;'
		+ 'width: 100%; padding: 10px; font-size: 16px;"'
		+ 'value="구독 콘텐츠 정보">'
		+ '<table class="table table-bordered">'
		+ '<thead>'
	    + 	'<tr>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독ID</th>'
	    +			'<td align="left" class="row"><input type="text" id="sub_no" style="width:100%" value="'
	    +			sub_no
	    +			'" readonly></td>'
		+ 		'<th style="padding: 10px 5px; width: 60px; background-color: #f6f7f9;">구독일</th>'
        +			'<td align="center"><input type="text" id="sub_date" style="width:100%" value="'
        +			date
        +			'" readonly></td>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독료</th>'
        +			'<td align="center"><input type="text" id="sub_price" style="width:100%" value="'
        +			sub_price
        +			' 원" readonly></td>'
	    + 	'</tr>'
		+ '</thead>'
		+	'<tbody>'
	    + 	'<tr>'
		+ 		'<th style="padding: 10px 5px; width: 70px; background-color: #f6f7f9;" >콘텐츠명</th>'
        +			'<td align="center" colspan="5" ><input type="text" id="c_name" style="width:100%" value="'
        +			c_name
        +			'" readonly></td>'
	    + 	'</tr>'
	    +	'<tr>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독개월</th>'
        +			'<td align="center"><input type="text" id="sub_month" style="width:100%" value="'
        +			sub_month
        +			' 개월" readonly></td>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">정원</th>'
        +			'<td align="center"><input type="text" id="sub_able" style="width:100%" value="'
        +			sub_able
        +			' 명" readonly></td>'
		+ 		'<th style="padding: 10px 5px; width: 80px; background-color: #f6f7f9;">콘텐츠레벨</th>'
        +			'<td align="center"><input type="text" id="sub_lv" style="width:100%" value="'
        +			sub_lv
        +			'" readonly></td>'
	    +	'</tr>'
		+	'</tbody>'
	    +'</table>' 
}

function GrpList(list){
	
	main.innerHTML = '';

    var tableHTML = '';
    tableHTML += '<table class="table table-bordered">';
    tableHTML += '<thead><th>그룹ID</th><th>그룹명</th><th>학습시작일</th><th>학습종료일</th><th>정원</th><th>학습인원</th></thead>';
    tableHTML += '<tbody>';

    list.forEach(function(member) {
        tableHTML += '<tr>';
        tableHTML += '<td>' + member.g_no + '</td>';
        tableHTML += '<td>' + member.g_name + '</td>';
        tableHTML += '<td>' + member.g_start.substr(0,10); + '</td>';
        tableHTML += '<td>' + member.g_end.substr(0,10); + '</td>';
        tableHTML += '<td>' + member.sub_able + '명</td>';
        tableHTML += '<td>' + member.g_cnt + '명</td>';
        tableHTML += '</tr>';
    });

    tableHTML += '</tbody></table>';

    main.innerHTML += tableHTML; // main 요소에 테이블 추가
}

function cancelPay(index) {
	///////////////////////////환불 가능 여부 검사
	
	var i = index;
	console.log(i);
	
	var date =$('input[data-sub_date="'+index+'"]').val();
	var con = $('input[data-sub_con="'+index+'"]').val();
	var now = new Date();
	
	const getDateDiff = (d1, d2) => { //오늘 날짜와 결제한 날짜 사이의 차이 구하기
		  const date1 = new Date(d1);
		  const date2 = new Date(d2);
		  
		  const diffDate = date1.getTime() - date2.getTime();
		  
		  return Math.floor(Math.abs(diffDate / (1000 * 60 * 60 * 24))); // 밀리세컨 * 초 * 분 * 시 = 일
	}
	
	if(getDateDiff(date, now) > 7) {
		alert('결제 후 7일이 지난 콘텐츠는 환불할 수 없습니다. 관리자에게 문의하세요.');
	} else if (con === 'Y') {
		alert('그룹에 연결한 콘텐츠는 환불할 수 없습니다. 관리자에게 문의하세요.');
	} else {
///////////////////////////환불 실행

		var imp_uid = $('input[data-subuid="'+index+'"]').val();
		var pay = $('input[data-sub_price="'+index+'"]').val();
		
		console.log(imp_uid);
		console.log(pay);
		
		alert('삭제실행');
		
		$.ajax({

		      url: "/payment/cancel", 
		      type: "Post",
		      data: ({
		        imp_uid: imp_uid, //주문번호
		        amount: pay, //결제금액
		        
	      		})
	    }).done(function(result) { // 환불 성공시 로직 
	        console.log("환불 성공");
	    
		        $.ajax({

		            url: "/alpha/delete", 
		            type: "Post",
		            data: ({
		                  imp_uid: imp_uid, //주문번호    
		            })
		        })
	    
	        alert("삭제완료");
		    location.reload();
	    
	    }).fail(function(error) { // 환불 실패시 로직
	    	alert("환불 실패");
	    });

	}
};

function go(page){
	//alert(page);
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/subList";
	document.searchForm.submit();
}
</script>

<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>