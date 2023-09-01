<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://kit.fontawesome.com/1028c0334c.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>Insert title here</title>
<style>
	#calendarList {
	    display: none;
	    width: 540px;
	    height: 300px;
	    background-color: #fefefe;
	    border: 1px solid #888;
	    border-radius: 3px;
	    text-align: center;
	}
	#calendarList .modal_close_btn{

    border: 1px solid black;
    padding: 5px;
    border-radius: 5px;
    margin: 10px 20px;
}

.input {
    width: 220px;
    height: 16px;
    padding: 10px;
    border: 1px solid #ccc;
    font-size: 13px;
    line-height: 0;
}

</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>
		<!-- 서브바 -->
		<div class="location" style="position: relative; margin: 0 auto; text-align:center; font-size:1em">
            <ul class="locationSub" style="display:inline-block;">
                <li style="display:inline-block; padding:20px;" id="saleDate"><a>일별 매출조회</a></li>
                <li style="display:inline-block; padding:20px;" id="saleContent"><a>콘텐츠별 매출조회</a></li>
            </ul>
        </div>
<div id="container">
		<div id="calendarList">
			<%@ include file="../teacher/test.jsp" %>
			<%@ include file="../teacher/test.jsp" %>
			<button><a class="modal_close_btn">확인</a></button>
        </div>

    <div class="wrap">
        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">매출현황</h2>
            </div>

            <!--대회검색-->
            <div class="searchWrap searchWrap_wide">
                <table class="table table-bordered">
                    <caption>콘텐츠별</caption>
                    <colgroup>
                        <col>
                        <col width="40%">
                    </colgroup>
                    <tbody id="searchLayout">
                    </tbody>
                </table>
            </div>
            <div id="entry">
              	<div >
				  <canvas id="myChart"></canvas>
				</div>

                <table class="table table-bordered univ-lineTop2" id="eve_academyTable" style="margin-top:50px; margin-bottom:50px">
                    <caption>바둑학원 정보</caption>
                    <colgroup>
                        <col width="40%">
                        <col width="15%">
                        <col width="15%">
                    </colgroup>
                        <thead id="chartHead">
                        </thead>
                        <tbody id="chartBdy">
                            
                        </tbody>
                </table>
            </div>
        </div>
        <!-- //content close -->
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/content/saleChart.js"></script>
</html>