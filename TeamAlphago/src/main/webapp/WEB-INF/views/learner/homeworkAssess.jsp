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
<link rel="icon" href="/resources/images/favicon.ico"/>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">
<style>

#evaluationSelect {

width: 150px;
margin-left :40px;
padding: .5em .5em;

border: 1px solid #999;

font-family: inherit;

background: url('arrow.jpg') no-repeat 95% 50%;

border-radius: 0px;

-webkit-appearance: none;

-moz-appearance: none;

text-align: center;


}
.titleBox{
	text-align: left;
	margin-bottom: 0;
	padding-bottom: 0;
	
}

</style>

<body>
	<%@ include file="../common/header.jsp"%>

	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 평가</h2>
					<input name="l_m_id" id="memberId" type="hidden" value="${memberVO.m_id}"> 
					<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
				</div>

				<!--그룹명-->
				<form class="searchWrap searchWrap_wide" onSubmit="return false;">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col width="20%"/>
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="grpNameList" name="g_name" id="grpSelectBox"
											onchange="selectGroup(this.value);" value="">
											<option value="selectop">선택</option>
											<c:forEach items="${grpNameList}" var="group">
												<option value="${group.g_no}">${group.g_name}</option>
											</c:forEach>
										</select>
									</div>
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
								<col width="35%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>No.</th>
									<th>학습자 이름</th>
									<th>제출기한</th>
									<th>제출일자</th>
									<th>콘텐츠이름</th>
									<th>평가</th>
								</tr>
							</thead>

							<tbody>
								<c:set var="isMember" value="${memberVO.m_id}" />
								<c:if test="${isMember == null}">
									<tr>
										<td colspan="6" style="text-align: center;">
										로그인 후 이용해주세요.</td>
									</tr>
								</c:if>
								<c:set var="isTeacher" value="${memberVO.m_division}" />
								<c:if test="${listCheck != null && isTeacher == 1}">
									<tr>
										<td colspan="6" style="text-align: center;">
										그룹을 선택하여 주세요.</td>
									</tr>
								</c:if>
								<c:if test="${memberVO.m_id != null && isTeacher != 1}">
									<tr>
										<td colspan="6" style="text-align: center;">
										학습관리자만 이용 가능합니다.</td>
									</tr>
								</c:if>
								<c:set var="listCheck" value="${submittedList}" />
								<c:if test="${listCheck == null && isTeacher == 1}">
									<tr>
										<td colspan="6" style="text-align: center;">
										제출된 숙제가 없습니다.</td>
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
	<%------모달창 -----%>
	<div id="assign_modal">
		<h2 class="ttitle">숙제 평가</h2>
		<div class="titleBox">
			<div style="margin-bottom: 20px;">
				학   습   자 : <span id ="h_m_name" style="margin-left: 50px; font-weight: bold;"></span>
			</div>
			<div class="assessBox">
			학습평가 :
				<select id="evaluationSelect" name="h_review" value="">
					<option value="selectop">선택</option>
					<option value="Excellent">우수</option>
					<option value="Good">보통</option>
					<option value="Poor">미흡</option>
				</select>
			</div>
		
		</div>
		<div class="entry">
       <!-- 숙제 내용과 콘텐츠 이름 표시 -->
        <div id="homeworkDetails">
			<div class="centered-div" style="align-content: center;">                        
				<table style="border: 1px solid #000, border-collapse: collapse; width: 100%;">
					<tr>                                                                       
						<th align="center" style="border: 1px solid #000;">숙제 내용</th>      
						<th align="center" style="border: 1px solid #000;">학습 내용</th>      
					</tr>
					<tr>                                                                                               
						<td align="center" style="border: 1px solid #000; width: 200px; height: 300px;"><span id="h_homeworkh"></span></td> 
						<td align="center" style="border: 1px solid #000; width: 200px; height: 300px;"><span id="h_contenth"></span></td>  
					</tr>                                                                                               
				</table>                                                                                               
			</div>    
        </div>

		</div>
			<br>
			<div class="btns">
				<button>
					<a class="submitBtn" onclick="homeworkAssess()">저장</a>
				</button>
				<button>
					<a class="modal_close_btn">닫기</a>
				</button>
			</div>
		</div>
	</div>
	<%----모달창 끝---%>

</body>

<script src="/resources/js/learner/homeworkAssess.js"></script>
<%@ include file="../common/footer.jsp"%>
</html>