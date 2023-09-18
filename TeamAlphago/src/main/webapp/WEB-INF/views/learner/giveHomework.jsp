<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>
<%@ include file="../common/header.jsp"%>
<!-- 캘린더 사용 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>숙제 전송</title>
<link rel="icon" href="/resources/images/favicon.ico"/>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">
<style>
.disabled {
display: none;
}

nav > ul {
    list-style: none;
    display: flex;
    justify-content: center;
}

nav > ul > li {
margin-left: 10px;
list-style: none;
cursor: pointer;
}
</style>
<body>
	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 전송</h2>
					<input name="t_m_id" id="memberId" type="hidden" value="${memberVO.m_id}"> 
						<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
						<input id="page" type="hidden" value="1">
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
										<select title="groupNameList" name="g_name" id="grpSelectBox"
											onchange="selectGroup(this.value);" value=""
											<c:set var="isTeacher" value="${memberVO.m_division}" />
											<c:if test="${isTeacher != 1 }">disabled="disabled"</c:if>>
											<option value="selectop">선택</option>
											<c:forEach items="${grpNameList}" var="group">
												<option value="${group.g_no}">${group.g_name}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td style="border-left: none;">
									<button class="btn btn-default" id="writebtn" disabled >내용입력</button>
								</td>
							
							</tr>
						</tbody>
					</table>
				</form>


				<!-- 학습자 리스트 -->
				<div id="learnerInfo">
					<div class="entry">
						<table class="table table-bordered">
							<caption>학습자 정보</caption>
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="40%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th style="text-align: center;"><input type="checkbox"
										id="checkboxAll" name="myCheckboxAll" value="Checked"></th>
									<th>학습자 이름</th>
									<th>콘텐츠명</th>
									<th>학습시작일</th>
									<th>학습종료일</th>
								</tr>
								<tr>
									<td colspan="5" style="text-align: center;">그룹을 선택해주세요.</td>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
			
					</div>
				</div>
			</div>
			<!-- //content close -->
			<div id="replyDiv"></div>
		</div>
	</div>
	<!-- container close -->

	<%-- 모달창 --%>
	<div id="assign_modal">
		<div class="titleBox">
			<h3 class="t_title">숙제 내용 입력</h3>
			<input name="l_no" id="learnerNo" type="hidden" value="">
		</div>
		<div class="entry">
			<div>
			<form>
			<table style="border: 1px solid #000, border-collapse: collapse;">
				<colgroup>
					<col width="20%" />
					<col width="40%" />
					<col width="40%" />
				</colgroup>
				<tr>
					<th align="center" style="border: 1px solid #000; vertical-align: middle;">숙제 내용</th>
					<td align="center" style="border: 1px solid #000;" colspan="2">
						<textarea name="h_homework" id="hHomework" rows="5" cols="10" style="width: 90%;" placeholder="내용을 입력하세요."></textarea>
					</td>
					<td align="center" style="border: 1px solid #000;"></td>
				</tr>
				<tr>
					<th align="center" style="border: 1px solid #000; vertical-align: middle;" rowspan="3">숙제 기한
					</th>
					<td align="center" style="border: 1px solid #000;">숙제 시작일</td>
					<td align="center" style="border: 1px solid #000;">숙제 종료일</td>
				</tr>
				<tr>
					<td align="center" style="border: 1px solid #000;">
					<input type="text" name="startDay" id="datepickerS" placeholder="선택 " style="text-align:center;">
					</td>
					<td align="center" style="border: 1px solid #000;">
					<input type="text" name="h_limit" id="datepickerE" placeholder="선택 " style="text-align:center;">
					<input type="hidden" id="enddate">
					</td>
				</tr>
			</table>
			</form>
			</diV>
			<br>
			<div class="btns">
				<button>
					<a class ="submitBtn" onclick="insertHomework()">전송</a>
				</button>
				<button>
					<a class="modal_close_btn">닫기</a>
				</button>
			</div>
		</div>
	</div>
	<%-----------------------------모달창 끝----------------------------------%>

</body>

<script src="/resources/js/learner/giveHomework.js"></script>
<%@ include file="../common/footer.jsp"%>
</html>


