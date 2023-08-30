<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">
총 ${totalCnt } 건
<div id="container">
    <div class="wrap">

            <form  method="get" name="searchForm" class="content_wrap">
			<input name="t_m_id" id="m_id" type="text" value="${memberVO.m_id }">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <div class="titleBox">
                <h2 class="t_title">학습 그룹</h2>
            </div>
            
            <div class="searchWrap searchWrap_wide searchWrap_normal">
                    <div class="searchBox searchBox-mid searchBox-center">
                        <fieldset>
                            <input type="hidden" name="p" value="1">
                            <legend>전체 검색</legend>
                            <select title="검색 분류" name="searchField" value="${pageDto.cri.searchField }">
                                <option value="g_no">그룹ID</option>
                                <option value="g_name">그룹이름</option>
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
	<nav id="topMenu" >
		<ul>
			<button><a class="" onclick="getGroup()">그룹 정보</a></button>
			<button><a class="" onclick="groupMemList()">그룹 멤버 관리</a></button>
	   		<button><a class="" onclick="joinGroup()">그룹 신청 승인</a></button>

		</ul>
	</nav>

	<div id="getgroup">
	</div>

	<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>

	<div class="btn">
	    <button><a class="" onclick="">저장하기</a></button>
	    <button><a class="modal_close_btn">닫기</a></button>
    </div>
    	
    	
</div>
<%-- --------------------------------------------------------------  --%>
<div class="entry">
	<table class="table table-bordered">
		<caption>학습자 관리</caption>
		<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="10%" />
		<col width="20%" />
		<col width="20%" />
		</colgroup>
			<thead>
    			<tr>
			        <th>그룹ID</th>
			        <th>그룹이름</th>
			        <th>그룹인원</th> <%--수강가능인원/현재수강인원 --%>
			        <th>학습가능일</th> <%-- 구독일 ~구독일+90 --%>
			        <th>학습자관리</th> <%-- 그룹삭제 / 학생관리 / 숙제관리 --%>
    			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${groupList != null && fn:length(groupList) > 0 }">
						<c:forEach  var="group" items="${groupList }" varStatus="status">
						
						<tr>
                            <th align="left" class="row"><input type="text" class="index" value="${group.g_no }" data-g_no="${status.index}" id="g_no" readonly></th>
                            <td align="center"> <input type="text" id="g_name" value="${group.g_name }"readonly></td>
                            <td align="center"> <input type="text" id="sub_price" value="${group.g_cnt }"readonly></td>
                            <td align="center">${group.g_start } ~ ${group.g_end }</td>
                            <td align="center"><button id="popup_open_btn" onclick="getGroupOne(${status.index})">학습자 관리</button></td>
          
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

var main = document.getElementById('getgroup');

function getGroupOne(index) {
	var i = index;
	console.log(i);
	main.innerHTML = '';
	modal('my_modal');
	
    var g_no =  $('input[data-g_no="'+index+'"]').val();
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
		
		var cnt = vo.g_cnt;
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
		    +			'" readonly>'
		    +			'<input type="text" id="g_no" value="'
		    +			m_name
		    +			'" readonly>'
			+ '<table class="table table-bordered">'
			+ '<thead>'
		    + 	'<tr>'
			+ 		'<th>수강가능일</th>'
			+ 		'<th>콘텐츠명</th>'
			+ 		'<th>수업 난이도</th>'
			+ 		'<th>수강가능인원</th>'
		    + 	'</tr>'
			+ '</thead>'
			+	'<tbody>'
			+		'<tr>'
		    +			'<td align="left" class="row"><input type="text" id="date" style="width:112px" value="'
		    +			date
		    +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="c_name" style="width:290px" value="'
            +			c_name
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="sub_lv" style="width:85px" value="'
            +			sub_lv
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="cnt" style="width:35px" value="'
            +			cnt
            +			'" readonly></td>'
			+ 		'</tr>'
			+	'</tbody>'
		    +'</table>' 

}
    	    
/////////////////////////////////////// 그룹 학습자 관리    	    
function groupMemList(g_no) {
	var g_no = $('#l_g_no').val();
	console.log(g_no);

	fetchGet('/alpha/group/getGroupOne/list/'+g_no, MemberList);

}

function delMember(index) {
    var l_no = $('input[data-l_no="'+index+'"]').val();
    console.log("Index:", index);
    console.log("l_no:", l_no);

	var g_no = $('#g_no').val();
	console.log(g_no);

	//삭제 성공 시 MemberList 리로드
    fetchDelete('/alpha/group/getGroupOne/delAction/'+l_no, function(data) {
        result(data);
        fetchGet('/alpha/group/getGroupOne/list/'+g_no, MemberList);
    });

}
    	 
function MemberList(list){

	main.innerHTML = '';

    var tableHTML = '<table class="table table-bordered">';
    tableHTML += '<form  method="get" name="searchForm" class="content_wrap">'
    tableHTML += '<input name="t_m_id" id="m_id" type="hidden" value="${memberVO.m_id }">'
    tableHTML += '<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">'
    tableHTML += ' <div class="searchWrap searchWrap_wide searchWrap_normal">'
    tableHTML += '<div class="searchBox searchBox-mid searchBox-center">'
    tableHTML += '<fieldset>'
    tableHTML += '<input type="hidden" name="p" value="1">'
    tableHTML += '<legend>전체 검색</legend>'
    tableHTML += '<select title="검색 분류" name="searchField" value="${pageDto.cri.searchField }">'
    tableHTML += '<option value="l_m_id">학생ID</option>'
    tableHTML += '<option value="m_name">학생이름</option>'
    tableHTML += '</select>'
    tableHTML += '<input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." '
    tableHTML += 'name="searchWord" value="${pageDto.cri.searchWord }" />'
    tableHTML += '<input type="submit" class="btn btn-primary" value="검색" />'
   	tableHTML += '</fieldset>'
    tableHTML += '</div>'
    tableHTML += '</div>'
    tableHTML += '</form>';
    tableHTML += '<table class="table table-bordered">';
    tableHTML += '<thead><tr><th>학생ID</th><th>이름</th><th></th></tr></thead>';
    tableHTML += '<tbody>';
    

    list.forEach(function(member, index) {
        tableHTML += '<tr>';
        tableHTML +='<input type="text" id="l_g_no" value="'+ member.l_g_no +'" readonly>'
        tableHTML +='<input type="hidden" id="index" value="'+ index +'" readonly>'
        tableHTML += '<td>' + '<input type="text" data-l_no="'+index+'" value="'+ member.l_no +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<input type="text" value="'+ member.m_name +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<button onclick="delMember(' + index + ')">내보내기</button>' + '</td>';
        tableHTML += '</tr>';
    });

    tableHTML += '</tbody></table>';

    main.innerHTML += tableHTML; // main 요소에 테이블 추가
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
	var g_no = $('#l_g_no').val();
	console.log(g_no);

	fetchGet('/alpha/group/getJoin/list/'+g_no, JoinList);
}

function JoinList(list){

	main.innerHTML = '';

    var tableHTML = '<table class="table table-bordered">';
    tableHTML += '<thead><tr><th>학생ID</th><th>이름</th><th>신청일자</th><th></th><th></th></tr></thead>';
    tableHTML += '<tbody>';

    list.forEach(function(member, index) {
        tableHTML += '<tr>';
        tableHTML +='<input type="text" id="l_g_no" value="'+ member.l_g_no +'" readonly>'
        tableHTML +='<input type="hidden" id="index" value="'+ index +'" readonly>'
        tableHTML += '<td>' + '<input type="text" data-l_no="'+index+'" value="'+ member.l_no +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<input type="text" value="'+ member.m_name +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<input type="text" value="'+ member.l_register +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<button onclick="JoinMember(' + index + ')">승인 |</button>';
        tableHTML += ' '+'<button onclick="RefuserMember(' + index + ')">거절</button>' + '</td>';
        tableHTML += '</tr>';
    });

    tableHTML += '</tbody></table>';

    main.innerHTML += tableHTML; // main 요소에 테이블 추가
}

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

function JoinMember(index) { //가입 승인
    var l_no = $('input[data-l_no="'+index+'"]').val();
    console.log("Index:", index);
    console.log("l_no:", l_no);

	var g_no = $('#g_no').val();
	console.log(g_no);
	
	let l_checkyn = $('#l_checkyn').val();
	console.log(l_checkyn);

		  

	//전달할 객체로 생성
	let obj = {
			l_no : l_no
	};
	
	console.log(obj);


	//업데이트 성공 시 MemberList 리로드
    fetchPut('/alpha/group/getGroupOne/updateAction/'+l_no, obj, function(data) {
        result(data);
        fetchGet('/alpha/group/getJoin/list/'+g_no, JoinList);
    });

}

function RefuserMember(index) { //가입 거절
    var l_no = $('input[data-l_no="'+index+'"]').val();
    console.log("Index:", index);
    console.log("l_no:", l_no);

	var g_no = $('#g_no').val();
	console.log(g_no);

	//삭제 성공 시 MemberList 리로드
    fetchDelete('/alpha/group/getGroupOne/delAction/'+l_no, function(data) {
        result(data);
        fetchGet('/alpha/group/getJoin/list/'+g_no, JoinList);
    });

}


/////////////////////그룹 정보
function getGroup(g_no) {
	
    var g_no =  $('#l_g_no').val();

    console.log(g_no);
	fetchGet('/alpha/group/getGroupOne/'+g_no, resultList)

}

</script>

<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>