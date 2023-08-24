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
    height: 700px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}

#my_modal .modal_close_btn {

}
</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">
<input id="m_id" type="text" value="${memberVO.m_id }">

<div id="container">
    <div class="wrap">


        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">구독 조회</h2>
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
	그룹명<input type="text" value=""><br>
	학습콘텐츠
		<select name="group_content" id="conSelect">
		    <option value="">학습 콘텐츠 선택</option>
		     <c:forEach var="list" items="${subList}">
		     	<option value="${list.sub_id}">${list.sub_name}</option>
		    </c:forEach>
		</select>
		<br>
		<div id="getSub">
		</div>
		<hr>
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
                   
                            <th align="left" class="row"> <a href="https://www.kbaduk.or.kr/bbs/view/competition/domestic/864/">${group.g_id }</a> </th>
                            <td align="center"> <input type="text" class="index" id="sub_price" data-sub_price="${status.index}" value="${group.g_cnt }"readonly></td>
                            <td align="center">${group.g_start } ~ ${group.g_end }</td>
                            <td align="center"><button>그룹관리</button> <button onclick="cancelPay(${status.index})">콘텐츠환불</button></td>
                            
                           
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

////////////////////////////////////////////////////////////////////
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

var main = document.getElementById('getSub');

$("#conSelect").change(function(){
	
    var sub_id =  $(this).val();
    console.log(sub_id);
	main.innerHTML = '';
	fetchGet('/alpha/group/getSubOne/'+sub_id, resultList)

})

function resultList(map){
		let vo = map.subscribeVO;
		console.log(vo);
		console.log(vo.sub_id);
		
		var a = vo.sub_id;
		console.log(a);
		
		main.innerHTML += ''
			+ '<table class="table table-bordered">'
			+ '<colgroup>'
			+ '<col width="20%" />'
			+ '<col width="40%" />'
			+ '<col width="20%" />'
		    + '<col width="20%" />'
			+ '</colgroup>'
			+ '<thead>'
		    + 	'<tr>'
			+ 		'<th>구독ID</th>'
			+ 		'<th>콘텐츠명</th>'
			+ 		'<th>학습가능일</th>'
			+ 		'<th>수강가능인원</th>'
		    + 	'</tr>'
			+ '</thead>'
			+	'<tbody>'
			+		'<tr>'
		    +			'<th align="left" class="row"><input type="text" class="index" id="sub_price" value="'
		    +			sub_id
		    +			'" readonly></td>'
            +			'<td align="center"><input type="text" class="index" id="sub_price" value="'
            +			sub_name
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" class="index" id="sub_price" value="'
            +			sub_end
            +			'" readonly></td>'
            +			'<td align="center"><input type="text" class="index" id="sub_price" value="'
            +			sub_able
            +			'" readonly></td>'
			+ 		'</tr>'
			+'</tbody>
		        </table> 
			+a
			+'</h1>'
			+'    </div>'


    	    }


function groupinsert() { //그룹생성
	
}

</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>