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

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    border-bottom: 1px solid #dadada;
    vertical-align: middle;
</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">
<input id="m_id" type="text" value="${memberVO.m_id }">

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




<button id="popup_open_btn">그룹 생성</button>

<%-- 모달창 --%>
<div id="my_modal">
	<hr>
	<h2>학습콘텐츠 선택</h2>
		<select name="group_content" id="conSelect" style="width: 780px; border: none; border-bottom: 1px solid black;">
		    <option value="">학습 콘텐츠 선택</option>
		     <c:forEach var="list" items="${subList}">
		     	<option value="${list.sub_no}">${list.c_name}</option>
		    </c:forEach>
		</select>
		<br>
		<div id="getSub">
		</div>
		<hr>
		<h2>그룹 정보</h2>
	   	<h3>그룹명<input type="text" id="g_name"></h3>
	   	<br>
		<div class="btn">
		    <button><a class="modal_close_btn" onclick="groupinsert()">생성하기</a></button>
		    <button><a class="modal_close_btn">닫기</a></button>
    	</div>
    	
    	
</div>
<%-- --------------------------------------------------------------  --%>

<div class="entry">
	<table class="table table-bordered">
		<caption>그룹 관리</caption>
		<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="30%" />
		<col width="20%" />
		</colgroup>
			<thead>
    			<tr>
			        <th>그룹ID</th>
			        <th>그룹이름</th>
			        <th>그룹인원</th> <%--수강가능인원/현재수강인원 --%>
			        <th>학습가능일</th> <%-- 구독일 ~구독일+90 --%>
			        <th>그룹관리</th> <%-- 그룹삭제 / 학생관리 / 숙제관리 --%>
    			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${groupList != null && fn:length(groupList) > 0 }">
						<c:forEach  var="group" items="${groupList }" varStatus="status">
						
						<tr>
                   
                            <th align="left" class="row"> <a href="https://www.kbaduk.or.kr/bbs/view/competition/domestic/864/">${group.g_no }</a> </th>
                            <td align="center"> <input type="text" class="index" id="g_name" data-sub_price="${status.index}" value="${group.g_name }"readonly></td>
                            <td align="center"> <input type="text" class="index" id="sub_price" data-sub_price="${status.index}" value="${group.g_cnt }"readonly></td>
                            <td align="center">${group.g_start } ~ ${group.g_end }</td>
                            <td align="center"><button>그룹관리</button></td>
                            
                           
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
var main = document.getElementById('getSub');

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
		
		var sub_able = vo.sub_able;
		
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
		
		main.innerHTML += ''
		    +			'<input type="text" id="sub_no" value="'
		    +			sub_no
		    +			'" readonly>'
			+ '<table class="table table-bordered">'
			+ '<thead>'
		    + 	'<tr>'
			+ 		'<th>구독ID</th>'
			+ 		'<th>콘텐츠명</th>'
			+ 		'<th>수업 난이도</th>'
			+ 		'<th>구독일</th>'
			+ 		'<th>수강가능인원</th>'
		    + 	'</tr>'
			+ '</thead>'
			+	'<tbody>'
			+		'<tr>'
		    +			'<td align="left" class="row"><input type="text" id="sid" style="width:112px" value="'
		    +			sid
		    +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="sub_name" style="width:290px" value="'
            +			sub_name
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="sub_lv" style="width:80px" value="'
            +			sub_lv
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="sub_date" style="width:85px" value="'
            +			sub_date
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" id="sub_able" style="width:35px" value="'
            +			sub_able
            +			'" readonly></td>'
			+ 		'</tr>'
			+	'</tbody>'
		    +'</table>' 


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
	let g_start = getsys();
	
	//전달할 객체로 생성
	let obj = {
			t_m_id : t_m_id
			, sub_no : sub_no
			, g_name : g_name
			, g_cnt: g_cnt
			, g_start : g_start
			}
	
	console.log(obj);
	
	fetchPost('/alpha/group/insert/'+t_m_id, obj, result)
	
}



</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>