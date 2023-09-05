<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
						<input type="button" class="btn btn-primary" id="payment" value="결제하기">
						<input type="button" class="btn btn-primary" id="deleteOption" value="선택삭제" style="margin-left:10px; color:#074691; background-color:white">
				</div>
			</div>
			<!-- //content close -->
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/content/cartList.js"></script>
</html>