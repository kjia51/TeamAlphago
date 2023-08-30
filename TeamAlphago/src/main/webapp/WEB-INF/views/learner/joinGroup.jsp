<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<script src="/resources/js/joinGroup.js?v=<%=new java.util.Date().getTime()%>"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>
<meta charset="UTF-8">
<title>그룹 가입 신청</title>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">
<style>
.apply-button {
            padding: 10px 20px;
            
            color: #cccccc;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 40px;
}

/* 버튼에 호버 효과 추가 */
.apply-button:hover {
	color: black;
	font-style: bold;
}

/* 버튼 비활성화 스타일
.apply-button[disabled] {
    cursor: not-allowed;
} */
</style>
<body>
<%@ include file="../common/header.jsp"%>
${memberVO}

	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">그룹 가입 신청</h2>
					<input name="l_m_id" id="menberId" type="hidden" value="${memberVO.m_id}"> 
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
										<select title="groupName" name="g_name" id=""
											onchange="changeGroup(this.value);" value="">
											<option value="listAll">전체</option>
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
							<col width="10%" />
							<col width="30%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>학습지도자명</th>
								<th>학습기간</th>
								<th>가입현황</th>
								<th>가입신청</th>
							</tr>
						</thead>

						<tbody>
						<c:set var="isMember" value="${memberVO.m_id}" />
					<c:if test="${isMember != null}">
							<c:forEach items="${listAll}" var="grplist" varStatus="status">
								<tr>
									<th align="center"><input type="checkbox" id="checkbox"
										name="myCheckbox" value="isChecked"></th>
									<td align="center" class="row">${grplist.t_m_name}</td>
									<td align="center">${grplist.g_period}</td>
									<td align="center">${grplist.g_AppCnt}
									</td>
									<td align="center">
										<button class="apply-button" id="applyButton" onclick="applyButton()">신청</button>
									</td>
									<td style="display: none;">
										<input type="hidden" name="t_m_id" id="teacherId" value="${grplist.t_m_id}">
									 </td>
									 <td style="display: none;">	
										<input type="hidden" name="l_g_no" id="groupNo" value="${grplist.l_g_no}">
									 </td>
									 <td style="display: none;">		
										<input type="hidden" name="l_c_no" id="contentNo" value="${grplist.l_c_no}">
									</td>
								</tr>
							</c:forEach>
					</c:if>
					<c:if test="${isMember == null}">
						<tr>
							<td colspan="5" style="text-align: center;">로그인 후에 이용 가능합니다.</td>
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
	<%@ include file="../common/footer.jsp"%>
<script type="text/javascript">

</script>
</body>
</html>