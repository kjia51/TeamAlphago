<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='/resources/js/jquery-1.12.4.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
<link rel='canonical' href='www.kbaduk.or.kr' />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>


    <div id="header">
        <div class="topHead">
            <div class="top_wrap">
                <div class='logo_top'>
                    <a href="https://www.kbaduk.or.kr/main/"><img src="/resources/images/logo_top.png" alt="대한바둑협회" /></a>
                </div>
                <div class='subject'>
                    <a href='/alpha/main'>게임으로 배우는 바둑 교실</a>
                </div>
                <div class="topMenuBar">
                    <h2 class="blind">서비스 바로가기</h2>
                    <div class="util">
                        <div class="service">
                            <ul>
                                <li><a href="/alpha/main" ><em>홈</em></a></li>
                                <c:if test="${memberVO == null }">
	                                <li><a href="/alpha/login"><em>로그인</em></a></li>
                                </c:if>
                                <c:if test="${memberVO != null }">
	                                <li><a href="/alpha/logout"><em>로그아웃</em></a></li>
                                </c:if>
                                <li><a href="/alpha/signup_step1/"><em>회원가입</em></a></li>
                            </ul>
                        </div><!-- // service -->
                    </div><!-- // util -->
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
                                <li><a href="https://www.kbaduk.or.kr/introduce/greeting/"> 사이트 소개 </a></li>
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
                                <li><a href="/alpha/joinGroup"> 그룹 가입 신청</a></li>
                                <li><a href="https://www.kbaduk.or.kr/bbs/read/competition/domestic/"> 숙제 제출 </a></li>
                            </ul>
                        </div>
                        <div class="gnb_sub gnb_sub_4">
                            <h3 class="blind">바둑정보</h3>
                            <ul>
                                <li><a href="/alpha/group?t_m_id=${memberVO.m_id }"> 학습 그룹 등록 </a></li>
                                <li><a href="https://www.kbaduk.or.kr/baduk/academy/"> 그룹 가입 승인 </a></li> </ul>
                                <li><a href="https://www.kbaduk.or.kr/baduk/rule/"> 숙제 전송 </a></li>
                                <li><a href="https://www.kbaduk.or.kr/baduk/academy/"> 숙제 평가 </a></li> </ul>
                        </div>
                        <div class="gnb_sub gnb_sub_5">
                            <h3 class="blind">자료실</h3>
                            <ul>
                                <li><a href="/alpha/notice"> 공지사항 </a></li>
                                <li><a href="https://www.kbaduk.or.kr/bbs/read/thum/movie/"> Q&A </a></li>
                                <li><a href="/alpha/content"> 학습패키지 등록 </a></li>
                                <li><a href="/alpha/salesLIST"> 매출 조회 </a></li>
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
    <script type="text/javascript" src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/basic.js"></script>
</body>
</html>