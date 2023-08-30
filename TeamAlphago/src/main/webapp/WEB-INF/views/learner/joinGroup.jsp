<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<%@ include file="../common/header.jsp"%>
<script src="/resources/js/joinGroup.js"></script>
<head>
<meta charset="UTF-8">
<title>그룹 가입 신청</title>
<link rel="stylesheet" href="../resources/css/learner.css">
</head>

<body>
${memberVO }
	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">그룹 가입 신청</h2>
					<!--  <input type="hidden" value="${sessionScope.memberId}" id="m_id">-->
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
							<c:forEach items="${listAll}" var="grplist" varStatus="status">
								<tr>
									<th align="center"><input type="checkbox" id="checkbox"
										name="myCheckbox" value="isChecked"></th>
									<td align="center" class="row">${grplist.t_m_name}</td>
									<td align="center">${grplist.g_period}</td>
									<td align="center">${grplist.g_AppCnt}</td>
									<td align="center">
										<button class="apply-button" id="applyButton" disabled>신청</button>
									</td>
								</tr>
							</c:forEach>
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
// 체크 박스 선택 여부를 감지하고 신청 버튼 활성화/비활성화하는 함수
function handleCheckboxChange() {
    var checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
    
    checkboxes.forEach(function(checkbox) {
        var row = checkbox.closest('tr'); // 현재 체크 박스가 속한 행을 찾음
        var applyButton = row.querySelector('.apply-button'); // 해당 행의 신청 버튼을 찾음
        
        if (checkbox.checked) {
            applyButton.removeAttribute('disabled'); // 체크 박스 선택 시 신청 버튼 활성화
        } else {
            applyButton.setAttribute('disabled', 'disabled'); // 체크 박스 선택 해제 시 신청 버튼 비활성화
        }
    });
}

// 체크 박스 상태 변화 감지 이벤트 설정
var checkboxes = document.querySelectorAll('input[name="myCheckbox"]');
checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', handleCheckboxChange);
});
</script>
</body>
</html>