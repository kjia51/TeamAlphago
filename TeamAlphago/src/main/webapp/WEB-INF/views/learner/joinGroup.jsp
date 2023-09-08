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
<title>그룹 가입 신청</title>
<link rel="icon" href="/resources/images/favicon.ico"/>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="container">
		<div class="wrap">
	<form id="searchForm" method="get" name="searchForm" class="content_wrap">
    	<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
    </form>		
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">그룹 가입 신청</h2>

					<input name="l_m_id" id="memberId" type="hidden" value="${memberVO.m_id}"> 
					<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
				</div>
				<!--그룹가입신청-->
				<form class="searchWrap searchWrap_wide">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col>
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="groupName" name="g_name" id="grpSelectBox"
											onchange="changeGroup(this.value);" value=""
											<c:set var="isMember" value="${memberVO.m_id}" />
											<c:if test="${isMember == null}">disabled="disabled"</c:if>>
											<option value="select">그룹 선택</option>
											<c:forEach items="${list}" var="group">
												<option value="${group.g_name}">${group.g_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div id="groupInfoDiv">
					<div class="entry" id="groupInfo">
						<table class="table table-bordered">
							<caption>그룹 정보</caption>
							<colgroup>
								<col width="30%" />
								<col width="25%" />
								<col width="25%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th>학습지도자명</th>
									<th>학습기간</th>
									<th>가입현황</th>
									<th>가입신청</th>
								</tr>
							</thead>
				
								<c:if test="${isMember == null}">
									<tr>
										<td colspan="4" style="text-align: center;">
										로그인 후 이용 가능합니다.</td>
									</tr>
								</c:if>
								<c:if test="${memberVO.m_division == 1}">
									<tr>
										<td colspan="4" style="text-align: center;">학습자만 이용 가능합니다.</td>
									</tr>
								</c:if>
								<c:if test="${memberVO.m_division == 2}">
									<tr>
										<td colspan="4" style="text-align: center;">그룹을 선택하여 주세요.</td>
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
	
<div style="text-align:center">

</div>
<%@ include file="../common/footer.jsp"%>
</body>
<script src="/resources/js/learner/joinGroup.js"></script>
</html>