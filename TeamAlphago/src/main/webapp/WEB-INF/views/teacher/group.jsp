<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹관리</title>
</head>
<style>
.main-box {
    width: 1280px;
    height: 100%;
    background-color: #fff;
    margin: 0 auto;
    justify-content: center;
}

#my_modal, #my_modal2 {
    display: none;
    width: 750px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    border-bottom: 1px solid #dadada;
    vertical-align: middle;
}

.hasDatepicker {
		display: inline-block;
		padding: .2em .2em 0;
		float: left;
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

#name, #up_name {
    border: none;
    outline: none;
    border-bottom: 1px solid #a7a7a7;
    margin-left: 15px;
    width: 60%;
}

select {
        font-size: 16px;
}


</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">
<input name="m_division" id="m_division" type="hidden" value="${memberVO.m_division }">
<div id="container">
    <div class="wrap">

 		<form  method="get" name="searchForm" class="content_wrap">
 		
			<input name="t_m_id" id="m_id" type="hidden" value="${memberVO.m_id }">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <div class="titleBox">
                <h2 class="t_title">학습 그룹 등록</h2>
            </div>
            
            <div class="searchWrap searchWrap_wide searchWrap_normal">
                    <div class="searchBox searchBox-mid searchBox-center">
                        <fieldset>
                            <input type="hidden" name="p" value="1">
                            <legend>전체 검색</legend>
								<select title="검색 분류" name="searchField" id="searchFieldSelect">
								    <option value="g_no" ${pageDto.cri.searchField == 'g_no' ? 'selected' : ''}>그룹ID</option>
								    <option value="g_name" ${pageDto.cri.searchField == 'g_name' ? 'selected' : ''}>그룹이름</option>
								</select>
                            <input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." 
                            		name="searchWord" value="${pageDto.cri.searchWord }" />
                            <input type="submit" class="btn btn-primary" value="검색" />
                        </fieldset>
                    </div>
                    
                                                    
			<c:if test="${totalCnt gt 0}"> 
  			<div style="margin-top: -24px;">총 ${totalCnt } 건</div>
			</c:if>	
                    
                    <div class="btnArea topbtnWrap" id="btnclass">
    					<span class="btn btn-point btn-mg"><button type="button" id="popup_open_btn">그룹 생성</button></span>
					</div>
            </div>
            

   
        </form>





<%-- 모달창 --%>
<div id="my_modal">
	<button class="modal_close_btn1"></button>
		
	<h2>그룹 생성</h2>
		<hr>
		<select name="group_content" id="conSelect" style="width: 750px; font-size: 16px; padding:3px; border: none; border-bottom: 1px solid black;">
		    <option value="0">학습 콘텐츠 선택</option>
		     <c:forEach var="list" items="${subList}">
		     	<option value="${list.sub_no}">${list.c_name}</option>
		    </c:forEach>
		</select>
		<br>
		<div id="getSub">
		</div>

		<br><h2>그룹 정보</h2><br>
	   	<div id="test" style="display: inline-block; float: left; margin-right: 35px;"></div>
	   	
	   	<div id="infobox">
	   	<label for="g_name" style="display: block; margin-top: 10px;">그룹명  <input type="text" id="g_name"></label>
	   	<br><br>
	   	<label for="startdate">학습 시작날짜 <input type="text" id="startdate" readonly></label>
	   	<br>
	   	<label for="enddate">학습 종료날짜 <input type="text" id="enddate" readonly></label>
	   	</div>
	   	
	   	<br>
	   	<button class="btn btn-point btn-mg" style="margin-top: 20px;" onclick="groupinsert()">만들기</button>

    	
</div>
<%-- --------------------------------------------------------------  --%>

<%-- 모달창2 --%>
<div id="my_modal2" style="width: 360px; padding: 20px 35px;">
<button class="modal_close_btn1"></button>

	<h2>그룹명 수정</h2>
	<br>
		
		<input type="hidden" id="g_no" readonly>
		
		<label for="name">현재 그룹명  <input type="text" id="name" style="margin-left: 32px;" readonly></label><br>
	
	   	 <label for="up_name">변경 할 그룹명  </label>
	   	 <input type="text" id="up_name">
	   	
		
		<div style="text-align: center;"><button class="btn btn-point btn-mg" onclick="updateName()" style="margin-top: 15px;">변경하기</button></div>

    	
    	
</div>
<%-- --------------------------------------------------------------  --%>

<div class="entry" style="margin-top: -10px;">
	<table class="table table-bordered">
		<caption>그룹 관리</caption>
		<colgroup>
		<col width="10%" />
		<col width="15%" />
		<col width="35%" />
		<col width="10%" />
		<col width="15%" />
		<col width="15%" />
		</colgroup>
			<thead>
    			<tr>
			        <th>그룹ID</th>
			        <th>그룹이름</th>
			        <th>학습 중인 패키지</th> <%--수강가능인원/현재수강인원 --%>
			        <th>그룹인원</th> <%--수강가능인원/현재수강인원 --%>
			        <th>학습가능일</th> <%-- 구독일 ~구독일+90 --%>
			        <th></th> <%-- 그룹삭제 / 학생관리 / 숙제관리 --%>
    			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${groupList != null && fn:length(groupList) > 0 }">
						<c:forEach  var="group" items="${groupList }" varStatus="status">
						
						<tr>
                   
                            <th align="center">${group.g_no }<input type="hidden" class="index" id="g_no" data-g_no="${status.index}" value="${group.g_no }"></th>
                            <td align="center">${group.g_name }<input type="hidden" class="index" id="g_name" data-g_name="${status.index}" value="${group.g_name }"></td>
                            <td align="center">${group.c_name }<input type="hidden" class="index" id="c_name" data-c_name="${status.index}" value="${group.c_name }"></td>
                            <td align="center">${group.g_cnt }/${group.sub_able }<input type="hidden" class="index" id="sub_able" data-sub_able="${status.index}" value="${group.g_cnt }/${group.sub_able }"></td>
                            
                            <c:choose>
								<c:when test="${fn:length(group.g_start) > 1}">
		                            <td align="center">${fn:substring(group.g_start , 0, 10) } ~ ${fn:substring(group.g_end , 0, 10) }
								</c:when>
							</c:choose>
                            
                            <td align="center"><button onclick="updateGrp(${status.index})">그룹명 변경</button></td>
    
                        </tr>
				</c:forEach>
							    
					</c:when>
				<c:otherwise>
					<tr>
				 		<td colspan="6" align="center">존재하지 않습니다.</td>
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

var main = document.getElementById('getSub');


$('#test').datepicker({
	
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

document.searchForm.addEventListener('submit', function (event) {
    event.preventDefault(); // 기본 서브밋 동작 방지

    // 선택된 searchField 값을 URL에 업데이트
    const selectedValue = document.getElementById('searchFieldSelect').value;
    const currentUrl = new URL(window.location.href);
    currentUrl.searchParams.set('searchField', selectedValue);

    // searchWord의 값을 가져와서 URL에 추가
    const searchWordValue = document.querySelector('input[name="searchWord"]').value;
    currentUrl.searchParams.set('searchWord', searchWordValue);

    // 업데이트된 URL로 페이지 이동
    window.location.href = currentUrl.toString();
    
})

function updateGrp(index) {
	var g_no = $('input[data-g_no="'+index+'"]').val();
	var gname = $('input[data-g_name="'+index+'"]').val();
    console.log("Index:", index);
    console.log("g_no:", g_no);
    console.log("g_name:", gname);
    
    modal('my_modal2');
    $('#name').val(gname);
    $('#g_no').val(g_no);
	
}


function updateName() {
   var g_name = $('#up_name').val();
   var g_no = $('#g_no').val();
   
  if(g_name.trim() === "") {
	  alert("그룹명을 입력하세요")
  } else {
	  //전달할 객체로 생성
		let obj = {
		  g_no: g_no,
		  g_name: g_name
		};
		
	   console.log(obj);
	   
	   fetchPost('/alpha/group/updateName/' + g_no, obj, result);
      
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
        .show();

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.find('.modal_close_btn1').on('click', function() {
    	var selectBox = modal.find('#conSelect');
    	
    	if(selectBox) {
    		selectBox.val(0);
    		main.innerHTML = ''
    	}
    	
    	
    	modal.find('input[type="text"]').val(''); // 모달 내부의 모든 text input을 비움
        bg.remove();
        modal.hide();
    });
}

$('#popup_open_btn').on('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});

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
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		location.reload();
	} else {
		alert(map.msg);
	}
		
}

////////////모달 패키지 정보 출력////////////////////////////////////////////////////////

$("#conSelect").change(function(){
	
    var sub_no =  $(this).val();
    console.log(sub_no);
	main.innerHTML = '';
	fetchGet('/alpha/group/getSubOne/'+sub_no, resultList)
	

})

function resultList(map){
		let vo = map.subscribeVO;
		console.log(vo);
		
		var sub_no = vo.sub_no;
		var idx = sub_no.indexOf("_"); 
		var sid = sub_no.substring(idx+1);
		
		var sub_name = vo.c_name;
		var date = vo.sub_date;
		var sub_date = date.substr(0,10);
		
		var sub_month = vo.sub_month;
		
		var sub_cntcon = (sub_month/3);
		
		var sub_connection = vo.sub_connection;
		
		var sub_able = vo.sub_able;
		
		var sub_price = vo.sub_price;
		
		var c_level = vo.c_level;
		var sub_lv = "";
		
		if(c_level == '1') {
			sub_lv = "초급";
		} else if (c_level == '2') {
			sub_lv = "중급";
		} else if (c_level == '3') {
			sub_lv = "고급";
		}
		
		console.log(sid);
		console.log(sub_name);
		console.log(typeof(sub_date));
		console.log(sub_able);
		
		main.innerHTML = ''
		+ '<table class="table table-bordered">'
		+ '<thead>'
	    + 	'<tr>'
	    +			'<input type="hidden" id="sub_connection" value="'
	    +			sub_connection
	    +			'">'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독ID</th>'
	    +			'<td align="center" class="row">'+sid+'<input type="hidden" id="sub_no" style="width:100%" value="'
	    +			sub_no
	    +			'"></td>'
		+ 		'<th style="padding: 10px 5px; width: 60px; background-color: #f6f7f9;">구독일</th>'
        +			'<td align="center">'+sub_date+'<input type="hidden" id="sub_date" style="width:100%" value="'
        +			sub_date
        +			'"></td>'
		+ 		'<th style="padding: 10px 5px; background-color: #f6f7f9;">구독료</th>'
        +			'<td align="center">'+sub_price+'원 <input type="hidden" id="sub_price" style="width:100%" value="'
        +			sub_price
        +			' 원"></td>'
	    + 	'</tr>'
		+ '</thead>'
		+	'<tbody>'
	    + 	'<tr>'
		+ 		'<th style="padding: 10px 5px; width: 70px; background-color: #f6f7f9;" >콘텐츠명</th>'
        +			'<td align="left" colspan="5" >'+sub_name+'<input type="hidden" id="c_name" style="width:100%" value="'
        +			sub_name
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
        +		'<div style="font-size: smaller; color: #0746919c; float: right;">연결 가능 그룹 : '+ sub_connection +'개 </div>'

 }

////////////////그룹생성///////////////////////////////////////////////////////
function getsys() {

	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;
	
	console.log(dateString);

	return dateString;
	
}

function groupinsert() { //그룹생성
	
	let t_m_id = $('#m_id').val();
	let g_name = $('#g_name').val();
	let sub_no = $('#sub_no').val();
	let g_cnt = $('#sub_able').val();
	let sub_connection = $('#sub_connection').val();
	let g_start = $('#startdate').val();
	let g_end = $('#enddate').val();
	
	console.log(sub_no)
	
	 if (sub_no === undefined || sub_no === "") {
		  alert("학습콘텐츠를 선택해주세요");
	   } else if(g_name.trim() === "") {
	       alert("그룹명을 입력해주세요");
	   }  else if (g_start.trim() === "") {
	       alert("학습날짜를 선택해주세요");
	   } else {	   
		   console.log(typeof(g_start));
			
			console.log(startdate);
			console.log(enddate);
			
			//전달할 객체로 생성
			let obj = {
					t_m_id : t_m_id
					, sub_no : sub_no
					, g_name : g_name
					, g_cnt: g_cnt
					, g_start : g_start
					, g_end : g_end
					, sub_connection : sub_connection
					}
			
			console.log(obj);
			
			var res = confirm('그룹 등록 시 삭제할 수 없습니다. 정말 등록하시겠습니까?');
			
			if(res) {
				fetchPost('/alpha/group/insert/'+t_m_id, obj, result)	
			}else {
				alert('그룹 등록이 취소되었습니다.')
			}			
		}			
 }
	


function go(page){
	//alert(page);
	
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/group?t_m_id="+$('#m_id').val();
	document.searchForm.submit();
}



// 학습지도자일 경우에만 버튼 보이기
var btnclass = document.getElementById("btnclass");
var m_division = $('#m_division').val();
var t_m_id_check = $('#m_id').val();
console.log(t_m_id_check);
console.log(m_division);

if (t_m_id_check === undefined) {
	btnclass.style.display = "none";
} else {
	
	if(m_division == 1) {
		btnclass.style.display = "block";
	} else {
		btnclass.style.display = "none";			
	}
}

</script>

<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>