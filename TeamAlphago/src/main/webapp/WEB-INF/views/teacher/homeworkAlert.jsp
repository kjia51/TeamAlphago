<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙제리스트</title>
</head>
<style>

</style>
<body>

		
		


    <h3>숙제 알림</h3>
    <div style="display: inline-block; float:right;"><a href="/alpha/submitHomework?l_m_id=${memberVO.m_id}">숙제 제출 바로가기 ></a></div>
    <br>
    <hr>
		<table class="table table-bordered">

		<tr>
            <th align="center" style="background-color: #f1f1f1; width: 409px;">숙제명</th>
            <th align="center" style="background-color: #f1f1f1; width: 116px;">제출기한</th>
            <th align="center" style="background-color: #f1f1f1;">제출여부</th>
        </tr>
        </table>
        
        
		<div style="height: 300px; overflow: scroll;">
		<table class="table table-bordered">
			<colgroup>
				<col width="60%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
        <c:forEach var="work" items="${homeworkalert}">
		<tr>
            <td align="center">${work.h_homework }</td>
		    <c:choose>
				<c:when test="${fn:length(work.h_limit) > 1}">
                	<td align="center">${fn:substring(work.h_limit, 0, 10) }</td>
				</c:when>
			</c:choose>

            <td align="center">
            <c:choose>
			    <c:when test="${work.h_content eq null}">
			    	<p style="color: red;">미제출</p>
			    </c:when>
			    	
			    <c:otherwise>
			                      제출완료
			    </c:otherwise>
			</c:choose>
           	</td>
        </tr>		
        </c:forEach>
		</table>
        </div>

</body>
</html>