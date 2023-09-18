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


#my_modal2 {
    display: none;
    width: 300px;
    height: 100px;
    padding: 30px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    text-align: center;
}
#my_modal2 .modal_close_btn1{
	text-align: center;
    padding: 20px 0;
    border-radius: 5px;
    margin: 20px;
}

#searchBtn {
float: right;

}

table td, table th {
    border-left: 1px solid #ececec;
    border-bottom: 1px solid #ececec;
    padding: 3px;
    text-align: center;
}

#modalmenu td {
	padding: 0;
	border: none;
	border-bottom: 2px solid #074691;
}

.topMenu {
    width: 20%;
    float: left;
    border: 2px solid #dddddd;
    border-radius: 5px 5px 0 0;
    height: 45px;
    position: relative;
    z-index: -1;
    border-bottom: none;
    color: darkgrey;
}

.topMenu:hover {
    color: #074691;
}

.my-custom-class {
	border-color: #074691;
	color: #074691;
}

#g_name {
	width: 210px;
	border-bottom: 1px solid #dadada;
}

#startdate, #enddate {
	border: none;
    outline: none;
    border-bottom: 1px solid #dadada;
}

#infobox {
	display: inline-block;
	font-size: 17px;
}
.modal_close_btn1 {
	display: inline-block;
	float: right;
}

.modal_close_btn1:after {
	display: inline-block;
	content: "\00d7";
	font-size: 25px;
	color: #a7a7a7;
	width: 25px;

}

#date1, #date2 {
	border: none;
    outline: none;
    margin: 5px;
}


</style>
<body>

<%@ include file="../common/header.jsp" %>

<%-- 모달창 --%>
<div id="my_modal">
	<button class="modal_close_btn1"></button>

	<table id="modalmenu" style="width: 100%;">
		<colgroup>
			<col width="33%" />
			<col width="33%" />
			<col width="33%" />
		</colgroup>
	<tr style="border-bottom: 2px solid #074691; position: relative; z-index: 9;">
	<button class="topMenu" id="getContent" onclick="getContent()">콘텐츠 정보</button>
	<button class="topMenu" id="conGrp" onclick="conGrp()">연결 그룹 정보</button>
	<button class="topMenu" id="createGrp" onclick="createGrp()">그룹 생성</button>
	</tr>
	</table>

		<div id="getSub"></div>
    	
    	
</div>
<%-- --------------------------------------------------------------  --%>


<%-- 모달창2 --%>

<div id="my_modal2">
	<hr>
	<h2 style="text-align: center;">등록 완료</h2><br>

	<div style="width: 100%; text-align: center;">
		<button class="btn btn-default" style="margin: 10px;" onClick="location.href='/alpha/groupSingup?t_m_id=${memberVO.m_id }'">학습그룹으로 가기</button>
		<button class="btn btn-default" style="margin: 10px;" onClick="location.reload()">머무르기</button>
    </div>
</div>
<%-- --------------------------------------------------------------  --%>


<div class="main-box">

<div id="container">
    <div class="wrap">

    <form  method="get" name="searchForm" class="content_wrap">
    <input name="t_m_id" id="m_id" type="hidden" value="${memberVO.m_id }">
    <input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
    <div class="titleBox">
        <h2 class="t_title">구독 내역</h2>
    </div>
            
    <div class="searchWrap searchWrap_wide searchWrap_normal" style="display: inline-block; margin-bottom: -10px;">
        <div class="searchBox searchBox-mid searchBox-center">
            <fieldset style="width: 500px;">
                <input type="hidden" name="p" value="1">
                <legend>전체 검색</legend>
                <select title="검색 분류" name="searchField" onchange="searchChange()" id="search">
                    <option value="content.c_name" selected>콘텐츠명</option>
                    <option value="sub_date">구독일자</option>
                </select>
                    <div id="getsearch" style="display: inline-block;"></div>
            </fieldset>
        </div>
    </div>          
    
    		<c:choose>
    			<c:when test="${totalCnt gt 0}">
        			<div style="margin-top: -8px;">총 ${totalCnt } 건</div>
   				 </c:when>
    			 <c:otherwise>
        			<div style="margin-top: 20px;"></div>
   				 </c:otherwise>
			</c:choose>
</form>


<div class="entry">
	<table class="table table-bordered">
		<caption>구독 내역</caption>
			<colgroup>
				<col width="15%" />
				<col width="40%" />
				<col width="14%" />
				<col width="12%" />
				<col width="7%" />
				<col width="12%" />
			</colgroup>
			<thead>
    			<tr style="height: 60px; border-bottom: 1px solid #dadada; line-height: 60px;">
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
						
                   			<input type="hidden" class="index" id="sub_month" style="width: 100%;" data-sub_month="${status.index}" value="${sub.sub_month}">
                   			<input type="hidden" class="index" id="sub_connection" style="width: 100%;" data-sub_con="${status.index}" value="${sub.sub_connection}">
						<tr>
                            	<c:if test="${fn:length(sub.sub_no) > 1}">
									<td>${fn:substring(sub.sub_no,4,16)}<input type="hidden" class="index" id="sub_no" data-subuid="${status.index}" value="${sub.sub_no}"></td>
								</c:if>         		
        
                            <td align="center">${sub.c_name }<input type="hidden" id="c_name" style="width: 90%;" value="${sub.c_name }"></td>
                            
                            <c:choose>
								<c:when test="${fn:length(sub.sub_date) > 1}">
		                            <td align="center">${fn:substring(sub.sub_date, 0, 10) }<input type="hidden" class="index" id="sub_date" style="width: 100%;" data-sub_date="${status.index}" value="${fn:substring(sub.sub_date, 0, 10) }"></td>
								</c:when>
							</c:choose>
                            
                            <td align="center">${sub.sub_price }원<input type="hidden" class="index" id="sub_price" style=" width: 100%;" data-sub_price="${status.index}" value="${sub.sub_price }"></td>
                            <td align="center">${sub.sub_able } 명</td>        
                            
                            <td align="center">
                            <button onclick="connection(${status.index})">그룹관리 </button>                                           
                            <button onclick="cancelPay(${status.index})">콘텐츠환불</button></td>
                           
                        </tr>
						
						
						</c:forEach>
					</c:when>
				<c:otherwise>
					<tr>
				 		<td colspan="6">존재하지 않습니다.</td>
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


function getCalendal(){
    $('#test').html('<div class="my-datepicker"></div>');
    
    let datepickerDiv = $(".my-datepicker");
    console.log(datepickerDiv);
        datepickerDiv.datepicker({
            showOtherMonths: true,
            showMonthAfterYear: true,
            selectOtherMonths: true,
            buttonText: "선택",
            yearSuffix: "년",
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
            minDate: "0",
            maxDate: "+1y",
            dateFormat: 'yy-mm-dd',
            onSelect: function(selectedDate) {
                var startDate = new Date(selectedDate);
                startDate.setDate(startDate.getDate() + 90); // Add 90 days
               
                var year = startDate.getFullYear();
                var month = ("0" + (startDate.getMonth() + 1)).slice(-2); // Adding 1 because getMonth() is 0-based
                var day = ("0" + startDate.getDate()).slice(-2);
               
                var endDateFormatted = year + "-" + month + "-" + day;
               
                $('#startdate').val(selectedDate);
                $('#enddate').val(endDateFormatted);
            }
        });
 
    }


var search = document.getElementById('getsearch');

//페이지 로드 시 실행될 초기화 함수
function initializeSearchField() {
    var searchFieldParam = getParameterByName('searchField');
    var selectBox = document.getElementById('search');

    // select box를 업데이트하고 searchChange 함수를 호출합니다.
    selectBox.value = searchFieldParam || 'content.c_name'; // 파라미터 값이 없으면 기본값 "content.c_name" 설정
    searchChange();
}

// 페이지 로드 시 초기화 함수를 호출합니다.
initializeSearchField();

// URL에서 파라미터 값을 추출하는 함수
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

// select box가 변경될 때마다 실행되는 함수
function searchChange() {
    var v = $('#search').val();
    console.log(v);

    var search = document.getElementById('getsearch');

    if (v === 'content.c_name') {
        search.innerHTML = '';
        search.innerHTML +=
            '<input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." ' +
            'name="searchWord" value="${pageDto.cri.searchWord }" />';
        search.innerHTML += '<input type="submit" class="btn btn-primary" value="검색" />'
    } else if (v === 'sub_date') {
        search.innerHTML = '';
        search.innerHTML +=
            '<input type="date" name="searchDate1" id="date1" value="${pageDto.cri.searchDate1 }">' +
            '<input type="date" name="searchDate2" id="date2" value="${pageDto.cri.searchDate2 }">';
        search.innerHTML += '<input type="submit" class="btn btn-primary" value="검색" />'
    }
}



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
        .find('.modal_close_btn1')
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

//post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'post'
			,headers : 
			{'Content-Type' : 'application/json'} 
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

//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function updateresult(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		modal('my_modal2');
	} else {
		alert(map.msg);
	}
		
}


function connection(index) {
	
	const getContent = document.getElementById('getContent');
	getContent.classList.add('my-custom-class');
	const conGrp = document.getElementById('conGrp');
	conGrp.classList.remove('my-custom-class');
	const createGrp = document.getElementById('createGrp');
	createGrp.classList.remove('my-custom-class');
	
	var i = index;
	console.log(i);
	modal('my_modal');
	
    var sub_no = $('input[data-subuid="'+index+'"]').val();
    console.log(sub_no);

  	fetchGet('/alpha/group/getSubOne/'+sub_no, resultList)

}

/////////////////////그룹 정보
function getContent(sub_no) {
	
	const getContent = document.getElementById('getContent');
	getContent.classList.add('my-custom-class');
	const conGrp = document.getElementById('conGrp');
	conGrp.classList.remove('my-custom-class');
	const createGrp = document.getElementById('createGrp');
	createGrp.classList.remove('my-custom-class');
	
	
    var sub_no =  $('#sub_no').val();

    console.log(sub_no);
  	fetchGet('/alpha/group/getSubOne/'+sub_no, resultList)

}
/////////////////////연결 그룹 리스트
function conGrp(sub_no) {
	
	const getContent = document.getElementById('getContent');
	getContent.classList.remove('my-custom-class');
	const conGrp = document.getElementById('conGrp');
	conGrp.classList.add('my-custom-class');
	const createGrp = document.getElementById('createGrp');
	createGrp.classList.remove('my-custom-class');
	
    var sub_no =  $('#sub_no').val();

    console.log(sub_no);
  	fetchGet('/alpha/group/getGrpList/'+sub_no, GrpList)

}


/////////////////////그룹생성페이지
function createGrp(sub_no) {
	
	const getContent = document.getElementById('getContent');
	getContent.classList.remove('my-custom-class');
	const conGrp = document.getElementById('conGrp');
	conGrp.classList.remove('my-custom-class');
	const createGrp = document.getElementById('createGrp');
	createGrp.classList.add('my-custom-class');
	
    var sub_no =  $('#sub_no').val();

  	fetchGet('/alpha/group/getSubOne/'+sub_no, createGroup);
}

////////////모달 패키지 정보 출력////////////////////////////////////////////////////////
var main = document.getElementById('getSub');

function resultList(map){
	main.innerHTML = '';
	let vo = map.subscribeVO;
	console.log(vo);
	
	var sub_no = vo.sub_no;
	var idx = sub_no.indexOf("_"); 
	var sid = sub_no.substring(idx+1);
	
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
	      + '<table class="table table-bordered">'
	      + '<thead>'
			+ '<th colspan="6" style="background-color: #f1f1f1;">'
		    + '구독 콘텐츠 정보'
			+ '</th>'
	       +    '<tr>'
	      +       '<th style="padding: 10px 5px; background-color: #f6f7f9;">구독ID</th>'
	       +         '<td align="left" class="row">'+sid+'<input type="hidden" id="sub_no" style="width:100%" value="'
	       +         sub_no
	       +         '" readonly></td>'
	      +       '<th style="padding: 10px 5px; width: 60px; background-color: #f6f7f9;">구독일</th>'
	        +         '<td>'+date+'<input type="hidden" id="sub_date" style="width:100%" value="'
	        +         date
	        +         '" readonly></td>'
	      +       '<th style="padding: 10px 5px; background-color: #f6f7f9;">구독료</th>'
	        +         '<td>'+sub_price+'원 <input type="hidden" id="sub_price" style="width:100%" value="'
	        +         sub_price
	        +         ' 원" readonly></td>'
	       +    '</tr>'
	      + '</thead>'
	      +   '<tbody>'
	       +    '<tr>'
	      +       '<th style="padding: 10px 5px; width: 70px; background-color: #f6f7f9;" >콘텐츠명</th>'
	        +         '<td colspan="5" >'+c_name+'<input type="hidden" id="c_name" style="width:100%" value="'
	        +         c_name
	        +         '" readonly></td>'
	       +    '</tr>'
	       +   '<tr>'
	      +       '<th style="padding: 10px 5px; background-color: #f6f7f9;">구독개월</th>'
	        +         '<td>'+sub_month+'개월<input type="hidden" id="sub_month" style="width:100%" value="'
	        +         sub_month
	        +         ' 개월" readonly></td>'
	      +       '<th style="padding: 10px 5px; background-color: #f6f7f9;">정원</th>'
	        +         '<td>'+sub_able+'명 <input type="hidden" id="sub_able" style="width:100%" value="'
	        +         sub_able
	        +         '" readonly></td>'
	      +       '<th style="padding: 10px 5px; width: 80px; background-color: #f6f7f9;">콘텐츠레벨</th>'
	        +         '<td>'+sub_lv+'<input type="hidden" id="sub_lv" style="width:100%" value="'
	        +         sub_lv
	        +         '" readonly></td>'
	       +   '</tr>'
	      +   '</tbody>'
	       +'</table>' 
}

function GrpList(list){
	
	main.innerHTML = '';
	
	console.log(list.length);
	
	if(list.length > 0) {
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
	    
	} else{
        main.innerHTML += '<div style="text-align: center; padding: 20px 5px;">연결된 그룹이 없습니다.</div>';
	}

    


}
	
	

function createGroup(map) {

	main.innerHTML = '';
	let vo = map.subscribeVO;
	console.log(vo);
	
	var t_m_id = vo.t_m_id;
	
	var sub_no = vo.sub_no;
	var idx = sub_no.indexOf("_"); 
	var sid = sub_no.substring(idx+1);
	
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
	
	var sub_connection = vo.sub_connection;
	console.log(sub_connection);
	
    if (sub_connection > 0) {
    
	main.innerHTML += ''
		+ '<table class="table table-bordered">'
		+ '<thead>'
		+ '<th colspan="6" style="background-color: #f1f1f1;">'
	    + '구독 콘텐츠 정보'
		+ '</th>'
	    + 	'<tr>'
	    +			'<input type="hidden" id="sub_connection" value="'
	    +			sub_connection
	    +			'">'
	    +			'<input type="hidden" id="t_m_id" value="'
	    +			t_m_id
	    +			'">'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독ID</th>'
	    +			'<td align="center" class="row">'+sid+'<input type="hidden" id="sub_no" style="width:100%" value="'
	    +			sub_no
	    +			'"></td>'
		+ 		'<th style="padding: 10px 5px; width: 60px; background-color: #f6f7f9;">구독일</th>'
        +			'<td align="center">'+date+'<input type="hidden" id="sub_date" style="width:100%" value="'
        +			date
        +			'"></td>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독료</th>'
        +			'<td align="center">'+sub_price+'원 <input type="hidden" id="sub_price" style="width:100%" value="'
        +			sub_price
        +			'"></td>'
	    + 	'</tr>'
		+ '</thead>'
		+	'<tbody>'
	    + 	'<tr>'
		+ 		'<th style="padding: 10px 5px; width: 70px; background-color: #f6f7f9;" >콘텐츠명</th>'
        +			'<td align="left" colspan="5" >'+c_name+'<input type="hidden" id="c_name" style="width:100%" value="'
        +			c_name
        +			'"></td>'
	    + 	'</tr>'
	    +	'<tr>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독개월</th>'
        +			'<td align="center">'+sub_month+'개월 <input type="hidden" id="sub_month" style="width:100%" value="'
        +			sub_month
        +			'"></td>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">정원</th>'
        +			'<td align="center">'+sub_able+'명 <input type="hidden" id="sub_able" style="width:100%" value="'
        +			sub_able
        +			'"></td>'
		+ 		'<th style="padding: 10px 5px; width: 80px; background-color: #f6f7f9;">콘텐츠레벨</th>'
        +			'<td align="center">'+sub_lv+'<input type="hidden" id="sub_lv" style="width:100%" value="'
        +			sub_lv
        +			'"></td>'
	    +	'</tr>'
		+	'</tbody>'
	    + '</table>'
        + '<div style="font-size: smaller; color: #0746919c; float: right;">연결 가능 그룹 : '+ sub_connection +'개 </div>'
    	
    	
        main.innerHTML += '<br><h2>그룹 정보</h2><br>'
            + '<div id="test" style="display: inline-block; float: left; margin-right: 35px;"></div>'
            + '<div id="infobox"><label for="g_name" style="display: block; margin-top: 10px;">그룹명  <input type="text" id="g_name"></label>'
            + '<br>'
            + '<br>'
            + '<label for="startdate">학습 시작날짜 <input type="text" id="startdate" readonly></label>'
            + '<br>'
            + '<label for="enddate">학습 종료날짜 <input type="text" id="enddate" readonly></label>'
            + '</div>'
            + '<br>'
            + '<button class="btn btn-point btn-mg" style="margin-top: 20px;" onclick="insertGrp()">만들기</button>'
           
            
            getCalendal();
            
            
    } else {
        main.innerHTML += '<div style="text-align: center; padding: 20px 5px;">더 이상 그룹을 만들 수 없습니다.</div>';
        
    }
}

function insertGrp() {

	let t_m_id = $('#t_m_id').val();
	let g_name = $('#g_name').val();
	let sub_no = $('#sub_no').val();
	
	
	let sub_connection = $('#sub_connection').val();
	let g_start = $('#startdate').val();
	let g_end = $('#enddate').val();
	
	let g_cnt = $('#sub_able').val();
	
	let cnt = g_cnt.substr(0, (g_cnt.length-2));
	console.log(cnt);

	console.log(g_start);
	console.log(g_end);
	
	if (g_name.trim() === "") {
	       alert("그룹명을 입력해주세요");
	   }  else if (g_start.trim() === "") {
	       alert("학습날짜를 선택해주세요");
	   } else {	   
	
	//전달할 객체로 생성
	let obj = {
			t_m_id : t_m_id
			, sub_no : sub_no
			, g_name : g_name
			, g_cnt: cnt
			, g_start : g_start
			, g_end : g_end
			, sub_connection : sub_connection
			}
	
	console.log(obj);
	
	var res = confirm('그룹 등록 시 삭제할 수 없습니다. 정말 등록하시겠습니까?');
	
	if(res) {
		fetchPost('/alpha/group/insertsub/'+t_m_id, obj, updateresult)		
	}else {
		alert('그룹 등록이 취소되었습니다.')
	}
	
	   }
	
	
}

function cancelPay(index) {
	///////////////////////////환불 가능 여부 검사
	
	var res = confirm('환불 시 취소할 수 없습니다. 정말 환불하시겠습니까?');
	
	if(res) {	

	var i = index;
	console.log(i);
	
	var date =$('input[data-sub_date="'+index+'"]').val();
	var con = $('input[data-sub_con="'+index+'"]').val();
	var month = $('input[data-sub_month="'+index+'"]').val();
	var now = new Date();
	
	const getDateDiff = (d1, d2) => { //오늘 날짜와 결제한 날짜 사이의 차이 구하기
		  const date1 = new Date(d1);
		  const date2 = new Date(d2);
		  
		  const diffDate = date1.getTime() - date2.getTime();
		  
		  return Math.floor(Math.abs(diffDate / (1000 * 60 * 60 * 24))); // 밀리세컨 * 초 * 분 * 시 = 일
	}
	
	if(getDateDiff(date, now) > 7) {
		alert('결제 후 7일이 지난 콘텐츠는 환불할 수 없습니다. 관리자에게 문의하세요.');
	} else if (con < (month/4)) {
		alert('그룹에 연결한 콘텐츠는 환불할 수 없습니다. 관리자에게 문의하세요.');
	} else {
///////////////////////////환불 실행

		var imp_uid = $('input[data-subuid="'+index+'"]').val();
		var pay = $('input[data-sub_price="'+index+'"]').val();
		
		console.log(imp_uid);
		console.log(pay);
		
		console.log('삭제실행');
		
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
	    
	        console.log("삭제완료");
		    alert('정상적으로 환불 처리 되었습니다.')
		    location.reload();
	    
	    }).fail(function(error) { // 환불 실패시 로직
	    	alert("환불 중 문제가 발생하였습니다. 관리자에게 문의하세요.");
	    });

			}
	
		}else {
			alert('환불이 취소되었습니다.')
		}
	
}

function go(page){
	//alert(page);
	
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/mysubList?t_m_id="+$('#m_id').val();
	document.searchForm.submit();
}

</script>

<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>