<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>
<link rel="stylesheet" href="/resources/css/learner.css">
<%@ include file="../common/header.jsp"%>
<meta charset="UTF-8">
<title>학습자 숙제 내역</title>
<link rel="icon" href="/resources/images/favicon.ico"/>
</head>
<body>
	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 제출</h2>
					<input name="t_m_id" id="memberId" type="hidden"
						value="${memberVO.m_id}"> <input name="m_division"
						id="division" type="hidden" value="${memberVO.m_division}">
				</div>

				<!-- 숙제 내역 리스트 -->
				<div id="homeworkInfo">
					<c:if test="${memberVO.m_id != null}">
						<div style="margin: 20px; font-style: normal; text-align: left; font-size: medium;">
							${memberVO.m_name}님
						</div>
					</c:if>
				<div class="entry" Style="">
					<table class="table table-bordered">
						<caption>숙제 제출</caption>
						<colgroup>
							<col width="5%" />
							<col width="25%" />
							<col width="15%" />
							<col width="30%" />
							<col width="15%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th style="text-align: center;"></th>
								<th>학습콘텐츠</th>
								<th>학습지도자</th>
								<th>숙제내용</th>
								<th>제출기한</th>
								<th>제출현황</th>
							</tr>
						</thead>
						<c:if test="${memberVO.m_id == null}">

							<tr>
								<td colspan="6" style="text-align: center;">로그인 후 이용바랍니다.</td>
							</tr>

						</c:if>
						<c:if test="${memberVO.m_division == 1}">

							<tr>
								<td colspan="6" style="text-align: center;">학습자만 이용 가능합니다.</td>
							</tr>

						</c:if>
						<!-- m_division이 2이고 homeworkList가 null인 경우 -->
						<c:if test="${memberVO.m_division == 2 and empty homeworkList}">

							<tr>
								<td colspan="6" style="text-align: center;">숙제가 존재하지 않습니다.</td>
							</tr>

						</c:if>
						<!-- m_division이 2이고 homeworkList가 null이 아닌 경우 숙제 리스트를 출력 -->
						<c:if test="${memberVO.m_division == 2 and not empty homeworkList}">
							<tbody>
								<c:forEach items="${homeworkList}" var="list">
									<tr>
										<th align="center">
										<input type="checkbox" id="checkbox" name="myCheckbox" value="${list.h_no}"
											data-hno="${list.h_no}"></th>
										<td align="center" class="row">${list.c_name}
										<input type="hidden" name="c_name" id="contentNo"
											value="${list.c_name}">
										</td>
										<td align="center">${list.m_name}
										<input type="hidden" name="m_name" id="memberName" value="${list.m_name}">
										</td>
										<td align="center">${list.h_homework}
										<input type="hidden" name="h_homework" id="homework" value="${list.h_homework}">
										</td>
										<td align="center">${fn:substring(list.h_limit, 0, 10)}
										<input type="hidden" name="h_limit" id="deadline"
											value="${list.h_limit}">
										</td>
										<td align="center">
											<input type="hidden" id="subStatus" value="">
											<input type="hidden" name="h_content" value="${list.h_content}" data-cno="${list.h_no}" >
											<span id="submissionStatus_${list.h_no}"> 
											${list.h_content == null || list.h_content == '' ? '미제출' : '제출'}</span>
										</td>
									</tr>

								</c:forEach>
							</tbody>
						</c:if>
					</table>
					

					<!-- 제출버튼 -->
	                <div class="btnArea-center" style="margin-top:0" id="submitBtns">
	                    <span class="btn btn-primary" >
	                        <c:choose>
						        <c:when test="${empty homeworkList}">
						            <button type="button" id="writebtn" data-route="one/add/user/" disabled="disabled">학습내용 입력</button>
						        </c:when>
						        <c:otherwise>
						            <button type="button" id="writebtn" data-route="one/add/user/">학습내용 입력</button>
						        </c:otherwise>
						    </c:choose>
	                    </span>
                    </div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- container -->

	<%------모달창 -----%>
	<div id="assign_modal">
		<div class="titleBox">
			<h3 class="t_title">학습 내용 입력</h3>
			<input name="l_no" id="learnerNo" type="hidden" value="">
		</div>
		<div class="entry">
			<div class="centered-div" style="align-content: center;">
				<table
					style="border: 1px solid #000, border-collapse: collapse; width: 100%;">
					<tr>
						<td align="center" style="border: 1px solid #000;">
						<textarea name="h_content" id="hContent" placeholder="학습 내용을 입력하세요."></textarea></td>
					<tr>
				</table>
			</div>
			<br>
			<div class="btns">
				<button>
					<a class="submitBtn" onclick="submitHomework()">제출하기</a>
				</button>
				<button>
					<a class="modal_close_btn">닫기</a>
				</button>
			</div>
		</div>
	</div>
	<%----모달창 끝---%>
</body>
<script src="/resources/js/learner/submitHomework.js"></script>
<%@ include file="../common/footer.jsp"%>
</html>