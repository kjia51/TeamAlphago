<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임으로 배우는 바둑 교실</title>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- ----------------------------------------------------------------- -->
<link rel="stylesheet" href="/resources/css/common.css">
<meta http-equiv='X-UA-Compatible' content='IE=edge, chrome=1' />
<meta http-equiv='Content-Language' content='ko' />
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<meta http-equiv='Content-Style-Type' content='text/css' />
<meta http-equiv='Content-Script-Type' content='text/javascript' />
<meta http-equiv='imagetoolbar' content='no' />
<meta name='referrer' content='always' />
<meta name='viewport' content='user-scalable=no, width=device-width, initial-scale=1' />
<meta name='format-detection' content='telephone=no, address=no, email=no' />
<meta name='theme-color' content='#333' />
<meta name='robots' content='all' />
<meta name='reply-to(email)' content='enoch_choi@naver.com' />
<link rel='shortcut icon' href='/images/favicon.ico' type='image/x-icon' />
<meta name="kbaduk_csrf" content="16896db39db66de029a7ada8839c2b3e" id="csrf">
<link rel='canonical' href='/alpha/main' />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/ec3292e06e.js" crossorigin="anonymous"></script>
</head>
<style>
#my_modal_main {
    display: none;
    width: 750px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
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

</style>
<body>

    <div id="header">
        <div class="topHead">
            <div class="top_wrap" style="heigth:120px">
                <div class='logo_top'>
                    <a href="/"><img src="/resources/images/logo_top.png" alt="게임으로 배우는 바둑" /></a>
                </div>
                <div class='subject'>
                    <a href='/alpha/main'>게임으로 배우는 바둑 교실</a>
                </div>
                <div class="topMenuBar" style="right:0;">
                    <h2 class="blind">서비스 바로가기</h2>
					<div class="util" style="height: 60px; width: 250px; display: flex; flex-direction: column; align-items: flex-end;">
					    <div class="service">
					        <ul>
					            <li><a href="/alpha/main"><em>홈</em></a></li>
					            <c:if test="${memberVO == null}">
					                <li><a href="/alpha/login"><em>로그인</em></a></li>
					            </c:if>
					            <c:if test="${memberVO != null}">
					                <li><a href="/alpha/mypage"><em>마이페이지</em></a></li>
					                <li><a href="/alpha/logout"><em>로그아웃</em></a></li>
					            </c:if>
					            <c:if test="${memberVO == null}">
					                <li><a href="/alpha/signup_step1/"><em>회원가입</em></a></li>
					            </c:if>
					        </ul>
					    </div><!-- // service -->
					    <c:if test="${memberVO != null}">
					        <div style="height: 30px; font-size: 1em; display: flex; justify-content: flex-end; align-items: center;">
					        ${memberVO.m_name}님
					        
					        <c:if test="${memberVO. m_division == 2}">
					        <i onClick="alertMoldal()" style="display: flex; margin-left: 10px;" class="fa-regular fa-bell"></i>
					        </c:if>
					        </div>
					    </c:if>
					</div>
                </div>
                <!-- // topMenuBar -->
             
                <!--//util-->
            </div>

            <div class="gnbWrap">
                <div class="wrap">
                    <h2 class="blind">메인 메뉴</h2>
                    <ul class="gnb" id="navBig">
                        <li class="li_1"> <a href="javascript:;" class="gnbLink"><span>서비스 안내</span></a> </li>
                        <li class="li_2"> <a href="javascript:;" class="gnbLink"><span>구독 서비스</span></a> </li>
                        <li class="li_3"> <a href="javascript:;" class="gnbLink"><span>학습 서비스</span></a> </li>
                        <li class="li_4"> <a href="javascript:;" class="gnbLink"><span>강사마당</span></a> </li>
                        <li class="li_5"> <a href="javascript:;" class="gnbLink"><span>관리마당</span></a> </li>
                    </ul>
                </div>
            </div>

            <div class="bd_gnb_sub" id="navFull" style="display: none;">
                <div class="wrap">
                    <div class="gnb_subWrap">
                        <div class="gnb_sub gnb_sub_1">
                            <h3 class="blind">협회소개</h3>
                            <ul>
                                <li><a href="/alpha/siteIntro"> 사이트 소개 </a></li>
                                <li><a href="/alpha/guide"> 이용가이드 </a></li>
                            </ul>
                        </div>
                        <div class="gnb_sub gnb_sub_2">
                            <h3 class="blind">협회소식</h3>
                            <ul>
                                
                                <li><a href="/alpha/teacher"> 콘텐츠 검색 </a></li>
                                <li><a href="/alpha/mysubList?t_m_id=${memberVO.m_id }"> 구독 내역 </a></li>
                            </ul>
                        </div>
                        <div class="gnb_sub gnb_sub_3">
                            <h3 class="blind">대회정보</h3>
                            <ul>
                                <li><a href="/alpha/joinGroup?l_m_id=${memberVO.m_id}"> 그룹 가입 신청</a></li>
                                <li><a href="/alpha/submitHomework?l_m_id=${memberVO.m_id}"> 숙제 제출 </a></li>
                            </ul>
                        </div>
                        <div class="gnb_sub gnb_sub_4">
                            <h3 class="blind">바둑정보</h3>
                            <ul>
                                <li><a href="/alpha/group?t_m_id=${memberVO.m_id }"> 학습 그룹 등록 </a></li>
                                <li><a href="/alpha/groupSingup?t_m_id=${memberVO.m_id }"> 그룹 가입 승인 </a></li> </ul>
                                <li><a href="/alpha/giveHomework?t_m_id=${memberVO.m_id }"> 숙제 전송 </a></li>
                                <li><a href="/alpha/homeworkAssess?t_m_id=${memberVO.m_id }"> 숙제 평가 </a></li> </ul>
                        </div>
                        <div class="gnb_sub gnb_sub_5">
                            <h3 class="blind">자료실</h3>
                            <ul>
                                <li><a href="/alpha/notice"> 공지사항 </a></li>
                                <li><a href="/alpha/QnA/question"> Q&A </a></li>
                            <c:choose>    
                                <c:when test="${sessionScope.memberVO.m_division==3}">
                                <li><a href="/alpha/content"> 학습콘텐츠 등록 </a></li>
                                <li><a href="/alpha/saleList"> 매출 조회 </a></li>
                                </c:when>

                                <c:otherwise>
			   					</c:otherwise>
							</c:choose>
                            </ul>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- // topHead -->
                <!-- // location -->
    </div>
    <!-- // header -->
    
<input name="m_id" id="m_id" type="hidden" value="${memberVO.m_id }">
    
<!-- 모달창 -->
<div id="my_modal_main">

	<button class="modal_close_btn1"></button>

	<div id="alertList"></div>
	
</div>
<%-- --------------------------------------------------------------  --%>
    
<script>
<<<<<<< HEAD
window.onload = function()  {

var l_m_id = $('#m_id').val();
console.log(l_m_id);

$.ajax({
    url: '/alpha/homeworkable/' + l_m_id,
    method: 'GET',
    dataType: 'json', // 데이터 타입을 JSON으로 설정
    success: function(data) {
        // JSON 데이터에서 객체 추출
        var homeworkData = data; 
        console.log(homeworkData);
        
        // homeworkData 배열의 각 객체에 접근하기 위한 반복문
        for (var i = 0; i < homeworkData.length; i++) {
            var item = homeworkData[i];
=======
/*  window.onload = function()  {
	
    var l_m_id = $('#m_id').val();
    console.log(l_m_id);
    
    $.ajax({
        url: '/alpha/homeworkable/' + l_m_id,
        method: 'GET',
        dataType: 'json', // 데이터 타입을 JSON으로 설정
        success: function(data) {
            // JSON 데이터에서 객체 추출
            var homeworkData = data; 
>>>>>>> refs/remotes/origin/main
            
            console.log(item)
            
            if(item == null) {
          	  var iconElement = document.querySelector(".fa-bell");
              iconElement.className = "fa-solid fa-bell";
        		return false;
            }
        }
<<<<<<< HEAD
    },
    error: function() {
        console.error('데이터를 가져오지 못했습니다.');
    }
});	
}
=======
    });	
}  */
>>>>>>> refs/remotes/origin/main

function modal_main(id) { //모달창 띄우기
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


function alertMoldal() {
    var l_m_id = $('#m_id').val();
    console.log(l_m_id);

    // 모달 열기
    modal_main('my_modal_main');

    // AJAX 요청을 통해 데이터 가져오기
    $.ajax({
        url: '/alpha/homeworkAlert/' + l_m_id,
        method: 'GET',
        success: function(data) {
            $('#alertList').html(data);
        },
        error: function() {
            console.error('데이터를 가져오지 못했습니다.');
        }
    });
}


</script>
    <script type="text/javascript" src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/basic.js"></script>
</body>
</html>