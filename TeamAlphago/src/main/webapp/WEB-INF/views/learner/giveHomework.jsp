<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙제 전송</title>
</head>
<body>
	<div id="container">
		<div class="wrap">


			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 전송(학습 지도자용)</h2>
				</div>

				<!--대회검색-->
				<form class="searchWrap searchWrap_wide">
					<table class="table table-bordered">
						<caption>대회검색</caption>
						<colgroup>
							<col width="15%"/>
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">대회보기</th>
								<td>
									<div class="searchBox">
										<select title="검색 분류" name="g_name"
											onchange="location.href='./?g_name='+this.value;" value="">
											<option value="">전체</option>
											<option value="31">초급반</option>
											<option value="30">중급반</option>
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
								<td align="center">2023.08.26 ~ 09.02</td>
				
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
</html>
<%@ include file="../common/footer.jsp"%>