<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/favicon.ico"/>
<title>장바구니</title>
</head>
<style>
#payList{
    display: none;
    width: 600px;
    height: 300px;
    padding: 30px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    text-align: center;
}
#payList .modal_close_btn{

    border: 1px solid black;
    padding: 10px;
    border-radius: 5px;
    margin: 20px;
}

</style>
<body>
<div id="payList">
	<hr>
	<h2 style="height:50px;">결제<i class="fa-solid fa-cart-shopping"></i> </h2>

		<table border="1" style="width:100%;">
			<colgroup>
				<col style="width:7%">
				<col style="width:30%">
				<col style="width:20%">
				<col style="width:20%">
				<col style="width:15%">
				<col style="width:20%">
			</colgroup>
		<thead>
		<tr>
			<th>No</th>
			<th>강의명</th>
			<th>정원</th>
			<th>가격</th>
			<th>기간</th>
			<th>소계</th>
		</tr>
		</thead>
		<tbody id="tbdy1">
		</tbody>
		</table>
		<br>
			<div>
				<input type="submit" class="btnTopSrch btn btn-primary" value="결제하기" id="payment">
		    	<button><a class="modal_close_btn">닫기</a></button>
			</div>
		
</div>
<%@ include file="../common/header.jsp" %>
<input id="m_id" type="hidden" value="${memberVO.m_id }">
<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">장바구니</h2>
				</div>

				<div id="groupInfoDiv" style="text-align:center">
					<div class="entry" id="groupInfo">
						<table class="table table-bordered">
							<caption>그룹 정보</caption>
							<colgroup>
								<col width="3%" />
								<col width="3%" />
								<col width="40%" />
								<col width="6%" />
								<col width="6%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" onclick="chkboxAll()"></th>
									<th>No</th>
									<th>콘텐츠명</th>
									<th>수준</th>
									<th>인원</th>
									<th>판매가</th>
								</tr>
							</thead>

							<tbody id="tbdy">


							</tbody>
							<thead id="tbdy1">
								<tr>
									<th colspan="6"></th>
								</tr>
							</thead>
						</table>
					</div>
						<input type="button" class="btn btn-primary" id="payOption" value="결제하기">
						<input type="button" class="btn btn-primary" id="deleteOption" value="선택삭제" style="margin-left:10px; color:#074691; background-color:white">
				</div>
			</div>
			<!-- //content close -->
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/content/cartList.js"></script>
<script src="/resources/js/content/payment.js"></script>
</html>