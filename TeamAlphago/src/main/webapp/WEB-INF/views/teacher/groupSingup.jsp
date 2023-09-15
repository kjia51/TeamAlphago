<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 가입 승인</title>
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
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 5px;
    border-bottom: 1px solid #dadada;
    vertical-align: middle;
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

</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">

<div id="container">
    <div class="wrap">

            <form  method="get" name="searchForm" class="content_wrap">
          	  총 ${totalCnt } 건
			<input name="t_m_id" id="m_id" type="hidden" value="${memberVO.m_id }">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <div class="titleBox">
                <h2 class="t_title">그룹 가입 승인</h2>
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
            </div>           
        </form>






<%-- 모달창 --%>
<div id="my_modal">
	<button class="modal_close_btn1"></button>
	
	<input type="hidden" id="g_no" readonly>
	
		<table id="modalmenu" style="width: 100%;">
		<colgroup>
			<col width="33%" />
			<col width="33%" />
			<col width="33%" />
		</colgroup>
			<tr style="border-bottom: 2px solid #074691; position: relative; z-index: 9;">
				<button class="topMenu" id="getGroup" onclick="getGroup()">그룹 정보</button>
				<button class="topMenu" id="groupMemList" onclick="groupMemList()">그룹 멤버 관리</button>
				<button class="topMenu" id="joinGroup" onclick="joinGroup()">그룹 신청 승인</button>
			</tr>
		</table>

	<div id="getgroup">
	</div>

    	
    	
</div>
<%-- --------------------------------------------------------------  --%>
<div class="entry">
	<table class="table table-bordered">
		<caption>학습자 관리</caption>
		<colgroup>
			<col width="5%" />
			<col width="20%" />
			<col width="10%" />
			<col width="50%" />
			<col width="15%" />
		</colgroup>
			<thead>
    			<tr>
			        <th>그룹ID</th>
			        <th>그룹이름</th>
			        <th>그룹인원</th> <%--수강가능인원/현재수강인원 --%>
			        <th>학습가능일</th> <%-- 구독일 ~구독일+90 --%>
			        <th></th> <%-- 그룹삭제 / 학생관리 / 숙제관리 --%>
    			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${groupList != null && fn:length(groupList) > 0 }">
					<div id="info">
						<c:forEach  var="group" items="${groupList }" varStatus="status">
						
						<tr>
                            <th align="center" class="row">${group.g_no }<input type="hidden" class="index" value="${group.g_no }" data-g_no="${status.index}" id="g_no"></th>
                            <td align="center">${group.g_name }<input type="hidden" id="g_name" value="${group.g_name }"></td>
                             <td align="center">${group.g_cnt }/${group.sub_able }<input type="hidden" class="index" id="sub_able" data-sub_able="${status.index}" value="${group.sub_able }"></td>
                            
                             <c:choose>
								<c:when test="${fn:length(group.g_start) > 1}">
		                            <td align="center">${fn:substring(group.g_start , 0, 10) } ~ ${fn:substring(group.g_end , 0, 10) }
								</c:when>
							</c:choose>
                            
                            <td align="center"><button id="popup_open_btn" onclick="getGroupOne(${status.index})">학습자 관리</button></td>
          
                        </tr>
						
						
						</c:forEach>
						</div>
					</c:when>
				<c:otherwise>
					<tr>
				 		<td colspan="5" align="center">존재하지 않습니다.</td>
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
        .find('.modal_close_btn1')
        .on('click', function() {
            bg.remove();
            modal.hide();
            location.replace(location.href);
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

var main = document.getElementById('getgroup');

function getGroupOne(index) {
	
	const getGroup = document.getElementById('getGroup');
	getGroup.classList.add('my-custom-class');
	const groupMemList = document.getElementById('groupMemList');
	groupMemList.classList.remove('my-custom-class');
	const joinGroup = document.getElementById('joinGroup');
	joinGroup.classList.remove('my-custom-class');
	
	var i = index;
	console.log(i);
	main.innerHTML = '';
	modal('my_modal');
	
    var g_no =  $('input[data-g_no="'+index+'"]').val();
    $('#g_no').val(g_no);
    
    
    console.log(g_no);
	fetchGet('/alpha/group/getGroupOne/'+g_no, resultList)

}



function resultList(map){
		main.innerHTML = '';
		let vo = map.grpVO;
		console.log(vo);
		
		var g_no = vo.g_no;
		
		var start = vo.g_start.substr(0,10);
		var end = vo.g_end.substr(0,10);;
		var date = start+" ~ "+end;
		
		var cnt = vo.sub_able;
		var g_name = vo.g_name;
		var c_name = vo.c_name;
		var m_name = vo.m_name;
		var c_level = vo.c_level;
		var sub_lv = "";
		
		if(c_level == '1') {
			sub_lv = "초급";
		} else if (c_level == '2') {
			sub_lv = "중급";
		} else if (c_level == '3') {
			sub_lv = "고급";
		}

		console.log(start);
		console.log(end);
		console.log(date);
		main.innerHTML += ''
		    +			'<input type="hidden" id="l_g_no" value="'
		    +			g_no
		    +			'" readonly>'
		    +			'<input type="hidden" id="g_no" value="'
		    +			g_name
		    +			'" readonly><br>'
		    +			'<input type="hidden" id="m_name" value="'
		    +			m_name
		    +			'" readonly>'
			+ '<table class="table table-bordered">'
			+ '<thead>'
			+ '<tr><th style="background-color: #f1f1f1;">그룹명</th><td colspan="5">'+g_name+'</td></tr>'
			+ '<tr><th style="background-color: #f1f1f1;">강사이름</th><td colspan="5">'+m_name+'</td></tr>'		
			+ '</thead>'
			+	'<tbody>'
		    + 	'<tr>'
			+ 		'<th style="background-color: #f1f1f1;">수강가능일</th>'
		    +			'<td>'+date+'<input type="hidden" id="date" style="width:112px" value="'
		    +			date
		    +			'" readonly></td>'
			+ 		'<th style="background-color: #f1f1f1;">수업 난이도</th>'
            +			'<td>'+sub_lv+'<input type="hidden" id="sub_lv" style="width:85px" value="'
            +			sub_lv
            +			'" readonly></td>'
			+ 		'<th style="background-color: #f1f1f1;">수강가능인원</th>'
            +			'<td>'+cnt+'명 <input type="hidden" id="cnt" style="width:35px" value="'
            +			cnt
            +			'" readonly></td>'
			+ 		'</tr>'
			+'<tr>'
			+ 		'<th style="background-color: #f1f1f1;">콘텐츠명</th>'
			+ 			'<td colspan="5">'+c_name+'<input type="hidden" id="c_name" style="width:290px" value="'
            +			c_name
            +			'" readonly></td>'
			+'</tr>'			
			+	'</tbody>'
		    +'</table>' 

}
    	    
/////////////////////////////////////// 그룹 학습자 관리    	    
function groupMemList(g_no) {
	
	const getGroup = document.getElementById('getGroup');
	getGroup.classList.remove('my-custom-class');
	const groupMemList = document.getElementById('groupMemList');
	groupMemList.classList.add('my-custom-class');
	const joinGroup = document.getElementById('joinGroup');
	joinGroup.classList.remove('my-custom-class');
	
	var g_no = $('#g_no').val();
	console.log(g_no);

	fetch('/alpha/group/getGroupOne/list/' + g_no)
    .then(response => response.json())
    .then(data => {
        const LearnerCnt = data.LearnerCnt;
        const list = data.list;
        MemberList(list, LearnerCnt);
    })
    .catch(error => {
        console.error('Error:', error);
    });

}

function delMemberAll() { //모두 내보내기
	
	var res = confirm('체크한 인원을 모두 탈퇴시키겠습니까?');
	
	if(res) {
		
    var checkboxes = document.querySelectorAll('input[name="item"]:checked');
    var selectedValues = [];

    checkboxes.forEach(function (checkbox) {
        selectedValues.push(checkbox.value);
    });
    
    selectedValues.forEach(function (value) {
    	
        var l_no = $('input[data-l_no="'+value+'"]').val();
    	var g_no = $('#g_no').val();
    	
    	console.log('======')
    	console.log(l_no)
    	console.log(g_no)
    	

				//삭제 성공 시 MemberList 리로드
			    fetchDelete('/alpha/group/getGroupOne/delAction/'+g_no+'/'+l_no, function(data) { 
			    	fetch('/alpha/group/getGroupOne/list/' + g_no)
			        .then(response => response.json())
			        .then(data => {
			            const LearnerCnt = data.LearnerCnt;
			            const list = data.list;
			            MemberList(list, LearnerCnt);
			        })
			        .catch(error => {
			            console.error('Error:', error);
			        });
			    });	
    })
    
	}else {
		alert('취소되었습니다.')
	}
	
}

function delMember(index) { // 내보내기
    var l_no = $('input[data-l_no="'+index+'"]').val();
    console.log("Index:", index);
    console.log("l_no:", l_no);

	var g_no = $('#g_no').val();
	console.log(g_no);
	
	var res = confirm('탈퇴시키겠습니까?');
	
	if(res) {
		//삭제 성공 시 MemberList 리로드
	    fetchDelete('/alpha/group/getGroupOne/delAction/'+g_no+'/'+l_no, function(data) {
	        result(data);
	    	fetch('/alpha/group/getGroupOne/list/' + g_no)
	        .then(response => response.json())
	        .then(data => {
	            const LearnerCnt = data.LearnerCnt;
	            const list = data.list;
	            MemberList(list, LearnerCnt);
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    });	
	}else {
		alert('취소되었습니다.')
	}

	

}
    	 
function MemberList(list, LearnerCnt){

	main.innerHTML = '';

    var tableHTML = '';
    tableHTML += '<div style="display: inline-block; font-size: smaller; margin: 5px; ">총 ' + LearnerCnt + ' 명</div>'; // LearnerCnt 변수 삽입
    tableHTML += '<button class="btn btn-default" style="float:right; margin: 5px;" onclick="delMemberAll()">선택 삭제</button>';
    tableHTML += '<table class="table table-bordered">';


    
    tableHTML += '<thead><tr>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 80px;"><input type="checkbox" name="item  value="selectall" onclick="selectAll(this)"></th>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 149px;">학생ID</th>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 190px;">이름</th>';
    tableHTML += '<th style="background-color: #f1f1f1;"></th>';
    tableHTML += '</tr></thead></table>';
    
    tableHTML += '<div style="height: 300px; overflow: scroll;">'
    tableHTML += '<table class="table table-bordered">';
    tableHTML += '<tbody>';
    
    if(LearnerCnt > 0) {
    
    list.forEach(function(member, index) {
        tableHTML += '<tr>';
        tableHTML +='<input type="hidden" id="l_g_no" value="'+ member.l_g_no +'" readonly>'
        tableHTML +='<input type="hidden" id="index" value="'+ index +'" readonly>'
        tableHTML += '<td align="center"><input type="checkbox" name="item" value="'+ index +'"></td>';
        tableHTML += '<td align="center">' + member.l_no + '<input type="hidden" data-l_no="'+index+'" value="'+ member.l_no +'" readonly>' + '</td>';
        tableHTML += '<td align="center">' + member.m_name + '<input type="hidden" value="'+ member.m_name +'" readonly>' + '</td>';
        tableHTML += '<td align="center">' + '<button onclick="delMember(' + index + ')">멤버 삭제</button>' + '</td>';
        tableHTML += '</tr>';
    });
    
        tableHTML += '</tbody></table></div>';
        main.innerHTML += tableHTML; // main 요소에 테이블 추가
    
	} else {
		main.innerHTML += '<div style="text-align: center; padding: 20px 5px;">그룹에 소속된 멤버가 없습니다</div>';
	}

}
    	       	    
//DELETE 방식 요청
function fetchDelete(url, callback) {
    console.log(url);
    console.log(callback);

    try {
        // URL 요청
        fetch(url, {
            method: "DELETE"
        })
        // 요청 결과 JSON 문자열을 JavaScript 객체로 반환
        .then(response => response.json())
        // 매개로 받은 콜백 함수 실행
        .then(data => callback(data));
    } catch (e) {
        console.log(e);
    }
}

//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
	} else {
		alert(map.msg);
	}
		
}
////////////////////그룹 가입 승인 관리
function joinGroup() {
	
	const getGroup = document.getElementById('getGroup');
	getGroup.classList.remove('my-custom-class');
	const groupMemList = document.getElementById('groupMemList');
	groupMemList.classList.remove('my-custom-class');
	const joinGroup = document.getElementById('joinGroup');
	joinGroup.classList.add('my-custom-class');
	
	var g_no = $('#g_no').val();
	console.log(g_no);

	fetch('/alpha/group/getJoin/list/' + g_no)
    .then(response => response.json())
    .then(data => {
        const JoinCnt = data.JoinCnt;
        const list = data.list;
        const grpVO = data.grpVO;
        JoinList(list, JoinCnt, grpVO);
    })
    .catch(error => {
        console.error('Error:', error);
    });
}
///////////////////////////////////////////////////////////////////////
    
function JoinList(list, JoinCnt, grpVO){

	main.innerHTML = '';

    var tableHTML = '';
    tableHTML += '<div style="display: inline-block; font-size: smaller; margin: 5px; ">총 ' + JoinCnt + ' 명</div>'; // JoinCnt 변수 삽입
    tableHTML += '<button class="btn btn-default" style="float:right; margin: 5px;" onclick="RefuserMemberAll()">선택 거절</button>';
    tableHTML += '<button class="btn btn-primary" style="float:right; margin: 5px;" onclick="JoinMemberAll()">선택 승인</button>';
    
tableHTML += '<table class="table table-bordered">';

    
    tableHTML += '<thead><tr>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 39px;"><input type="checkbox" name="item  value="selectall" onclick="selectAll(this)"></th>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 83px;">학생ID</th>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 96px;">이름</th>';
    tableHTML += '<th style="background-color: #f1f1f1; width: 241px;">신청날짜</th>';
    tableHTML += '<th style="background-color: #f1f1f1;"></th>';
    tableHTML += '</tr></thead></table>';
    
    tableHTML += '<div style="height: 300px; overflow: scroll;">'
    tableHTML += '<table class="table table-bordered">';
    tableHTML += '<tbody>';
    
    if(JoinCnt > 0) {
    list.forEach(function(member, index) {
        tableHTML += '<tr>';
        tableHTML +='<input type="hidden" id="l_g_no" value="'+ member.l_g_no +'" readonly>'
        tableHTML +='<input type="hidden" id="index" value="'+ index +'" readonly>'
        tableHTML += '<td align="center"><input type="checkbox" name="item" value="'+ index +'"></td>';
        tableHTML += '<td align="center">' + member.l_no + '<input type="hidden" data-l_no="'+index+'" value="'+ member.l_no +'" readonly>' + '</td>';
        tableHTML += '<td align="center">' + member.m_name + '<input type="hidden" value="'+ member.m_name +'" readonly>' + '</td>';
        tableHTML += '<td align="center">' + member.l_register + '<input type="hidden" value="'+ member.l_register +'" readonly>' + '</td>';
        tableHTML += '<td align="center">' + '<button onclick="JoinMember(' + index + ')">승인 |</button>';
        tableHTML += ' '+'<button onclick="RefuserMember(' + index + ')">거절</button>' + '</td>';
        tableHTML += '</tr>';
    });
    
        tableHTML += '</tbody></table></div>';        
        main.innerHTML += tableHTML; // main 요소에 테이블 추가
    	
    } else {
    	main.innerHTML += '<div style="text-align: center; padding: 20px 5px;">가입을 신청한 멤버가 없습니다</div>';
    }

    tableHTML += '<input type="text" id="g_cnt" value="' + grpVO.g_cnt + '" readonly>';
    tableHTML += '<input type="text" id="sub_able" value="' + grpVO.sub_able + '" readonly>';
    console.log(grpVO);

}

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('item');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}
/////////////////////////////////////////////////////////////////////////////////////////////////
//put방식 요청
function fetchPut(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'put'
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

function JoinMemberAll() { //모두 승인하기
	
	var res = confirm('체크한 인원을 모두 승인하겠습니까?');
	
	if(res) {
		
		var able = $('#sub_able').val(); //가입가능인원
		var cnt = $('#g_cnt').val(); //현재 가입된 인원
		
		console.log(able)
		console.log(cnt)
		
		if(able<=cnt) {
			alert('최대 수강가능인원은 '+ able +'명입니다. 더이상 승인할 수 없습니다.');
		} else {
		
		
		    var checkboxes = document.querySelectorAll('input[name="item"]:checked');
		    var selectedValues = [];
		
		    checkboxes.forEach(function (checkbox) {
		        selectedValues.push(checkbox.value);
		    });
		    
		    selectedValues.forEach(function (value) {
		    	
		        var l_no = $('input[data-l_no="'+value+'"]').val();
		    	var g_no = $('#g_no').val();
		    	
		    	console.log('======')
		    	console.log(l_no)
		    	console.log(g_no)
		    	
		    	//전달할 객체로 생성
				let obj = {
						g_no : g_no,
						l_no : l_no
				};
		
		    	//업데이트 성공 시 MemberList 리로드
				fetchPut('/alpha/group/getGroupOne/updateAction/'+g_no+'/'+l_no, obj, function(data) {
			    	fetch('/alpha/group/getJoin/list/' + g_no)
			        .then(response => response.json())
			        .then(data => {
			            const JoinCnt = data.JoinCnt;
			            const list = data.list;
			            JoinList(list, JoinCnt);
			        })
			        .catch(error => {
			            console.error('Error:', error);
			        });
			    });
		    })
		    alert('수정되었습니다.')
		}
    
	}else {
		alert('취소되었습니다.')
	}
	
}

function JoinMember(index) { //가입 승인
	var able = $('#sub_able').val(); //가입가능인원
	var cnt = $('#g_cnt').val(); //현재 가입된 인원
	
	if(able<=cnt) {
		alert('최대 수강가능인원은 '+ able +'명입니다. 더이상 승인할 수 없습니다.');
	} else {
		
		var l_no = $('input[data-l_no="'+index+'"]').val();
	    console.log("Index:", index);
	    console.log("l_no:", l_no);

		var g_no = $('#g_no').val();
		console.log("g_no:",g_no);
			  

		//전달할 객체로 생성
		let obj = {
				g_no : g_no,
				l_no : l_no
		};
		
		console.log(obj);
		
		var res = confirm('승인하시겠습니까?');
		
		if(res) {
			//업데이트 성공 시 MemberList 리로드
			fetchPut('/alpha/group/getGroupOne/updateAction/'+g_no+'/'+l_no, obj, function(data) {
		        result(data);
		    	fetch('/alpha/group/getJoin/list/' + g_no)
		        .then(response => response.json())
		        .then(data => {
		            const JoinCnt = data.JoinCnt;
		            const list = data.list;
		            JoinList(list, JoinCnt);
		        })
		        .catch(error => {
		            console.error('Error:', error);
		        });
		    });
		}else {
			alert('취소되었습니다.')
		}


	}

}

function RefuserMemberAll() { //모두 거절하기
	
	var res = confirm('체크한 인원을 모두 거절하겠습니까?');
	
	if(res) {
		
    var checkboxes = document.querySelectorAll('input[name="item"]:checked');
    var selectedValues = [];

    checkboxes.forEach(function (checkbox) {
        selectedValues.push(checkbox.value);
    });
    
    selectedValues.forEach(function (value) {
    	
        var l_no = $('input[data-l_no="'+value+'"]').val();
    	var g_no = $('#g_no').val();
    	
    	console.log('======')
    	console.log(l_no)
    	console.log(g_no)

    	fetchDelete('/alpha/group/getGroupOne/delAction/'+g_no+'/'+l_no, function(data) {
	    	fetch('/alpha/group/getJoin/list/' + g_no)
	        .then(response => response.json())
	        .then(data => {
	            const JoinCnt = data.JoinCnt;
	            const list = data.list;
	            JoinList(list, JoinCnt);
	        })
	        .catch(error => {
	            console.error('Error:', error);
	        });
	    });
    })
    alert('수정되었습니다.')
    
	}else {
		alert('취소되었습니다.')
	}
	
}

function RefuserMember(index) { //가입 거절
    var l_no = $('input[data-l_no="'+index+'"]').val();
    console.log("Index:", index);
    console.log("l_no:", l_no);

	var g_no = $('#g_no').val();
	console.log(g_no);
	
	var res = confirm('거절하시겠습니까?');
		
		if(res) {
			fetchDelete('/alpha/group/getGroupOne/delAction/'+g_no+'/'+l_no, function(data) {
		        result(data);
		    	fetch('/alpha/group/getJoin/list/' + g_no)
		        .then(response => response.json())
		        .then(data => {
		            const JoinCnt = data.JoinCnt;
		            const list = data.list;
		            JoinList(list, JoinCnt);
		        })
		        .catch(error => {
		            console.error('Error:', error);
		        });
		    });
		}else {
			alert(' 취소되었습니다.')
		}

    

}


/////////////////////그룹 정보
function getGroup(g_no) {
	
	const getGroup = document.getElementById('getGroup');
	getGroup.classList.add('my-custom-class');
	const groupMemList = document.getElementById('groupMemList');
	groupMemList.classList.remove('my-custom-class');
	const joinGroup = document.getElementById('joinGroup');
	joinGroup.classList.remove('my-custom-class');
	
    var g_no =  $('#g_no').val();

    console.log(g_no);
	fetchGet('/alpha/group/getGroupOne/'+g_no, resultList)

}

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
});

function go(page){
	//alert(page);
	
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/groupSingup?t_m_id="+$('#m_id').val();
	document.searchForm.submit();
}

</script>
<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>