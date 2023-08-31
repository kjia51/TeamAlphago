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
<div id="container">

    <div class="wrap">
        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">매출현황</h2>
            </div>

            <!--대회검색-->
            <div class="searchWrap searchWrap_wide">
                <table class="table table-bordered">
                    <caption>대회검색</caption>
                    <colgroup>
                        <col>
                        <col width="40%">
                    </colgroup>
                    <tbody id="eve_searchLayout">
                        <tr>
                            <th scope="col" style="width:20%;">조회기간</th>
                            <td style="width:80%;">
                                <div class="searchBox" style="display:inline-block">
                                <input type="text" class="input" name="strtDd" id="strtDd" value="20230823" maxlength="8" style="width:100px; text-align:center">
                                <span>~</span>
                                <input type="text" class="input" name="endDd" id="endDd" value="20230831" maxlength="8" style="width:100px; text-align:center">
                                <button type="button" class="cal-btn-open" data-calendar-module="true" data-calendar-display="false" ><i class="fa-regular fa-calendar" style="font-size:25px"></i></button>
                                </div>
                                <div class="searchBox" style="display:inline-block; margin-left:50px">
                                    <input type="text" class="inputSrch" value="1일" name="day" id="day" style="width:40px; text-align:center">
                                    <input type="text" class="inputSrch" value="1개월" name="month" id="month" style="width:40px; text-align:center">
                                    <input type="text" class="inputSrch" value="6개월" name="half" id="half" style="width:40px; text-align:center">
                                    <input type="text" class="inputSrch" value="1년" name="year" id="year" style="width:40px; text-align:center">
                                    <input type="button" class="btn btn-primary" value="조회">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="entry">
              	<%@ include file="chart.jsp" %>
		<div id="calendarList">
			<%@ include file="../teacher/test.jsp" %>
			<%@ include file="../teacher/test.jsp" %>
			<button><a class="modal_close_btn">확인</a></button>
        </div>
                <table class="table table-bordered univ-lineTop2" id="eve_academyTable">
                    <caption>바둑학원 정보</caption>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="20%">
                        <col width="40%">
                        <col width="10%">
                    </colgroup>
                        <thead>
                            <tr>
                                <th>학원이름</th>
                                <th>학원원장</th>
                                <th>전화번호</th>
                                <th>주소</th>
                                <th>약도</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th colspan="5"> 학원 목록이 없습니다. </th>
                            </tr>
                        </tbody>
                </table>
            </div>
        </div>
        <!-- //content close -->
    </div>
</div>
	<%@ include file="../common/footer.jsp" %>
	<script>
		function modal(id) { //모달창 띄우기
		    var zIndex = 9999;
		    var modal = $('#' + id);
	

	
		    modal
		        .css({
		            position: 'fixed',
		            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
		            // 시꺼먼 레이어 보다 한칸 위에 보이기
		            zIndex: zIndex + 1,
	
		            // div center 정렬
		            top: '42%',
		            left: '50%',
		            transform: 'translate(-50%, -50%)',
		            msTransform: 'translate(-50%, -50%)',
		            webkitTransform: 'translate(-50%, -50%)'
		        })
		        .show()
		        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		        .find('.modal_close_btn')
		        .on('click', function() {
		            modal.hide();
		        });
		}
		
		$('.cal-btn-open').click(function () {
		    modal('calendarList');
			
		})
</script>
</body>
</html>