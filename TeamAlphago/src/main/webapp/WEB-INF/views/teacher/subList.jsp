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
	<hr>
	<h2>학습콘텐츠 선택</h2>
		<br>
		<div id="getSub">
		</div>
		<hr>
		<h2>그룹 정보</h2>
	   	<h3>그룹명<input type="text" id="g_name"></h3>
	   	<br>
		<div class="btn">
		    <button><a onclick="groupinsert()">생성하기</a></button>
		    <button><a class="modal_close_btn">닫기</a></button>
    	</div>
    	
    	
</div>
<%-- --------------------------------------------------------------  --%>



<div class="main-box">
<input id="m_id" type="text" value="${memberVO.m_id }">

<div id="container">
    <div class="wrap">


        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">구독 조회</h2>
            </div>

            <!--연간일정-->
            <div class="topbtnWrap">
                <i class="ico ico-cal"></i><span class="btn btn-default"><a href="https://www.kbaduk.or.kr/competition/annualSchedule/">연간일정</a></span>
            </div>


            <!--대회검색-->
            <form class="searchWrap searchWrap_wide">
                <table class="table table-bordered">
                    <caption>검색</caption>
                    <colgroup>
                        <col>
                        <col width="33.5%" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="col">대회보기</th>
                            <td>
                                <div class="searchBox">
                                    <select title="검색 분류" name="s_cate" onchange="location.href='./?s_cate='+this.value;" value="">
                                        <option value="">전체</option>
                                                                                    <option value="31">전국 온라인 바둑축제</option>
                                                                                    <option value="30">전국 동호인 디비전 바둑리그</option>
                                                                                    <option value="29">바둑 대축제</option>
                                                                                    <option value="26">전국 생활체육 동호인 바둑리그</option>
                                                                                    <option value="23">대한체육회장배 전국바둑선수권대회</option>
                                                                                    <option value="22">일요신문배 어린이</option>
                                                                                    <option value="11">세계대회 선발전</option>
                                                                                    <option value="10">전국 동호인바둑대회</option>
                                                                                    <option value="9">전국(소년)체육대회</option>
                                                                                    <option value="8">롯데백화점배 어린이 바둑대축제</option>
                                                                                    <option value="7">문화체육관광부장관배 전국학생바둑대회</option>
                                                                                    <option value="2">프로기전 아마선발전</option>
                                                                                    <option value="1">내셔널바둑리그</option>
                                                                            </select>
                                </div>
                            </td>
                            <th scope="col">대회검색</th>
                            <td>
                                <div class="searchBox searchBox-sm">
                                    <fieldset>
                                        <legend>전체 검색</legend>
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
			        <th>그룹연결여부</th>
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
                            <th align="left"> <a href="https://www.kbaduk.or.kr/bbs/view/competition/domestic/864/">${sub.c_name }</a> </th>
                            <td align="center"><input type="text" class="index" id="sub_date" data-sub_date="${status.index}" value="${sub.sub_date }"readonly></td>
                            <td align="center"><input type="text" class="index" id="sub_price" data-sub_price="${status.index}" value="${sub.sub_price }"readonly></td>
                            <td align="center">${sub.sub_able }</td>
                            <td align="center"><input type="text" class="index" id="sub_con" data-sub_con="${status.index}" value="${sub.sub_connection }"readonly></td>
                            
                            <td align="center">
                            <c:if test="${sub.sub_connection eq 'N'}">
                            <button onclick="connection(${status.index})">그룹생성 </button>                          
                            </c:if>                      
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

////////////모달 패키지 정보 출력////////////////////////////////////////////////////////
var main = document.getElementById('getSub');

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

		var imp_uid = 'imp_'+$('input[data-subuid="'+index+'"]').val();
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
		    location.reload();
	    
	    }).fail(function(error) { // 환불 실패시 로직
	    	console.log("환불 실패");
	    });
	
	
	}	
};

</script>

<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>