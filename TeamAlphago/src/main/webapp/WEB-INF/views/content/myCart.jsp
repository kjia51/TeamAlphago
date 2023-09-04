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
					<h2 class="t_title">장바구니 보기</h2>
				</div>

				<div id="groupInfoDiv">
					<div class="entry" id="groupInfo">
						<table class="table table-bordered">
							<caption>그룹 정보</caption>
							<colgroup>
								<col width="30%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th>장바구니 번호</th>
									<th>회원 아이디</th>
									<th>콘텐츠 번호</th>
									<th>학습인원</th>
								</tr>
							</thead>

							<tbody id="tbdy">


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- //content close -->
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/content/cartList.js"></script>
</html>