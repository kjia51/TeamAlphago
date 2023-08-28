<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<input id="m_id" type="text" value="teacher2">

<div id="container">
    <div class="wrap">


        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">학습 그룹</h2>
            </div>

            <!--대회검색-->
            <form class="searchWrap searchWrap_wide">
                <table class="table table-bordered">
                    <caption>검색</caption>
                    <colgroup>
                        <col>
                        <col width="70%" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="col">그룹검색</th>
                            <td>
                                <div class="searchBox searchBox-sm">
                                    <fieldset>
                                        <legend>그룹 검색</legend>
                                        <select title="검색 분류" name="cate" value="">
                                            <option value="title">제목</option>
                                            <option value="content">내용</option>
                                            <option value="title:content">제목 + 내용</option>
                                        </select>
                                        <input type="text" class="inputSrch" title="검색어를 입력해주세요." autofocus="autofocus" placeholder="검색어를 입력해주세요." name="word" value="" />
                                        <input type="submit" class="btn btn-primary" value="검색" />
                                    </fieldset>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>






<%-- 모달창 --%>
<div id="my_modal">
	<nav id="topMenu" >
		<ul>
			<button><a class="" onclick="">그룹 정보</a></button>
			<button><a class="" onclick="groupMemList()">그룹 멤버 관리</a></button>
	   		<button><a class="" onclick="">그룹 신청 승인</a></button>

		</ul>
	</nav>

	<div id="getgroup">
	</div>

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
                            <td align="center" id="popup_open_btn" onclick="getGroupOne(${status.index})"><button>학습자 관리</button></td>
                            
                           
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
		    +			'<input type="text" id="g_no" value="'
		    +			g_no
		    +			'" readonly>'
		    +			'<input type="text" id="g_no" value="'
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
	var g_no = $('#g_no').val();
	console.log(g_no);
	main.innerHTML = '';

	fetchGet('/alpha/group/getGroupOne/list/'+g_no, MemberList);

}

function Groupupdate(index) {
    var l_no = $('input[data-l_no="'+index+'"]').val();
    console.log("Index:", index);
    console.log("l_no:", l_no);
}
    	 
function MemberList(list){
	
    var tableHTML = '<table class="table table-bordered">';
    tableHTML += '<thead><tr><th></th><th>학생ID</th><th>이름</th><th>탈퇴</th></tr></thead>';
    tableHTML += '<tbody>';

    list.forEach(function(member, index) {
        tableHTML += '<tr>';
        tableHTML += '<td>' + '<input type="hidden" value="'+ member.l_g_no +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<input type="text" id="index" value="'+ index +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<input type="text" data-l_no="'+index+'" value="'+ member.l_no +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<input type="text" value="'+ member.m_name +'" readonly>' + '</td>';
        tableHTML += '<td>' + '<button onclick="Groupupdate(' + index + ')">내보내기</button>' + '</td>';
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

//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
	} else {
		alert(map.msg);
	}
		
}


</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>