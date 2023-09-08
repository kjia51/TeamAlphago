<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>

<meta charset="UTF-8">
<title>숙제 평가</title>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">

<body>
	<%@ include file="../common/header.jsp"%>

	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 평가(학습지도자)</h2>
					<input name="l_m_id" id="memberId" type="hidden" value="${memberVO.m_id}"> 
					<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
				</div>

				<!--그룹명-->
				<form class="searchWrap searchWrap_wide" onSubmit="return false;">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="grpNameList" name="g_name" id="grpSelectBox"
											onchange="selectGroupHw(this.value);" value="">
											<option value="selectop">선택</option>
											<c:forEach items="${grpNameList}" var="group">
												<option value="${group.g_name}">${group.g_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td style="border-left: none;">
									<button class="btn btn-default" id="writebtn">저장</button>
								</td>
							
							</tr>
						</tbody>
					</table>
				</form>

				<div id="learnerInfoDiv">
					<div class="entry" id="learnerInfo">
						<table class="table table-bordered">
							<caption>그룹 정보</caption>
							<colgroup>
								<col width="5%" />
								<col width="15%" />
								<col width="15%" />
								<col width="15%" />
								<col width="20%" />
								<col width="20%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th>No.</th>
									<th>학습자 이름</th>
									<th>제출기한</th>
									<th>제출일자</th>
									<th>콘텐츠이름</th>
									<th>학습내용</th>
									<th>평가</th>
								</tr>
							</thead>

							<tbody>
								<c:set var="isMember" value="${memberVO.m_id}" />
								<c:if test="${isMember == null}">
									<tr>
										<td colspan="7" style="text-align: center;">
										로그인 후 이용해주세요.</td>
									</tr>
								</c:if>
								<c:set var="isTeacher" value="${memberVO.m_division}" />
								<c:if test="${isTeacher == 1}">
									<tr>
										<td colspan="7" style="text-align: center;">
										그룹을 선택하여 주세요.</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- //content close -->
		</div>
	</div>
	<!-- container close -->
</body>
<script src="/resources/js/learner/homeworkAssess.js"></script>
<%@ include file="../common/footer.jsp"%>
</html>