<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>숙제 전송</title>
</head>
<body>
	<div id="container">
		<div class="wrap">


			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 전송(학습 지도자용)</h2>
						<input name="l_m_id" id="memberId" type="hidden"
						value="${memberVO.m_id}"> <input name="m_division"
						id="division" type="hidden" value="${memberVO.m_division}">
				</div>
				

				<!--그룹명-->
				<form class="searchWrap searchWrap_wide">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col width="15%"/>
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="groupNameList" name="g_name" id="grpSelectBox"
											onchange="changeGroup(this.value);" value="">
											<c:forEach items="${list}" var="group">
												<option value="${group.g_name}">${group.g_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td style="border-left: none;">
										<button class="btn btn-default">대상조회</button>
										<button class="btn btn-default">전송</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>


				<div class="entry">
					<table class="table table-bordered">
						<caption>가입 정보</caption>
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
								<th>학습자명</th>
								<th>대상그룹</th>
								<th>숙제내용</th>
								<th>제출기한</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th align="center"><input type="checkbox" id="checkbox"
									name="myCheckbox" value="isChecked"></th>
								<td align="center" class="row">김첨지</td>
								<td align="center">초급반</td>
								<td align="center"><input></td>
								<td align="center"><input type="text" id="datepicker" placeholder="제출기한 선택"></td>
				
							</tr>

							<c:forEach items="${list}" var="grpInfo">
								<tr>
									<th align="center"><input type="checkbox" id="checkbox"
										name="myCheckbox" value="isChecked"></th>
									<td align="center" class="row">${grpInfo.m_name}</td>
									<td align="center">${grpInfo.g_period}</td>
									<td align="center">${grpInfo.g_AppCnt}</td>
									<td align="center">
										<button class="apply-button" id="applyButton" disabled>신청</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="paging">
						<a
							href='https://www.kbaduk.or.kr/bbs/read/competition/international/?p=1'
							class="current">1</a> <a
							href='https://www.kbaduk.or.kr/bbs/read/competition/international/?p=2'>2</a>
					</div>
				</div>
			</div>
			<!-- //content close -->


		</div>
	</div>
	<!-- container close -->

</body>
<script type="text/javascript">
$(function() {
    $("#datepicker").datepicker();
});

// 그룹명 선택시 이벤트 발생 

</script>
</html>
<%@ include file="../common/footer.jsp"%>