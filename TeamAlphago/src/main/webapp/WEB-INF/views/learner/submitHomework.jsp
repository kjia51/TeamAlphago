<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습자 숙제 제출</title>
</head>
<body>
<%@ include file="../common/header.jsp"%>   
<h1>학습자 숙제 제출</h1>
<div>학습자 : ${memberVO.m_name}</div>

				<!-- 학습자 리스트 -->
				<div id="learnerInfo">
					<div class="entry">
						<table class="table table-bordered">
							<caption>학습자 정보</caption>
							<colgroup>
								<col width="5%" />
								<col width="15%" />
								<col width="15%" />
								<col width="30%" />
								<col width="10%" />
								<col width="30%" />
							</colgroup>
							<thead>
								<tr>
									<th style="text-align: center;"><input type="checkbox"
										id="checkboxAll" name="myCheckboxAll" value="Checked"></th>
									<th>학습콘텐츠</th>
									<th>학습지도자</th>
									<th>숙제내용</th>
									<th>제출기한</th>
									<th>학습내용</th>
								</tr>
								<tr>
									<td colspan="6" style="text-align: center;">숙제가 존재하지 않습니다.</td>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					<!-- 제출버튼 -->
					<div class="btnArea-center" style="border:0; padding-top:0;">
                        <span class="btn btn-grayline btn-lg"><a href="">제출하기</a></span>
                    </div>
						<div class="paging">
							<a href='/' class="current">1</a> <a href='/'>2</a>
						</div>
					</div>
				</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>