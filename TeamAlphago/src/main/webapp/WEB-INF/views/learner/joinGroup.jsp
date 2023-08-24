<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 가입 신청</title>
<link rel="stylesheet" href="../resources/css/learner.css">
</head>
<body>
	<div id="container">
		<div class="wrap">


			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">가입 정보</h2>
				</div>

				<!--정보수정-->
				<div class="topbtnWrap">
					<i class="ico ico-cal"></i><span class="btn btn-default"><a
						href="https://www.kbaduk.or.kr/competition/annualSchedule/">정보수정</a></span>
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
										<select title="검색 분류" name="s_cate"
											onchange="location.href='./?s_cate='+this.value;" value="">
											<option value="">전체</option>
											<option value="31">g_name 받아오기</option>
										</select>
									</div>
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
								<th>승인신청</th>
								<th>학습지도자명</th>
								<th>학습기간</th>
								<th>가입현황</th>
								<th>승인신청</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th align="center"><input type="checkbox" id="checkbox"
									name="myCheckbox" value="isChecked"></th>
								<td align="center" class="row">김첨지</td>
								<td align="center">2023.08.26 ~ 09.02</td>
								<td align="center">12/20</td>
								<td align="center">
									<button class="apply-button" id="applyButton" disabled>신청</button>
								</td>
							</tr>

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



	<%@ include file="../common/footer.jsp"%>
</body>
</html>