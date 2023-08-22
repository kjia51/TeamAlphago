<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징</title>
<style>
.other-games ul {
    position:relative; 
    right: 0;
    top: 15px;
}

</style>
</head>
<body>


<!-- 페이지 블럭 생성 -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  	
  	<!-- 첫 페이지 -->
  	<li>
      <a class="page-link" onclick='go(1)'>처음</a>
    </li>
  	
<!-- 이전 페이지 -->
<li class="page-item ${!pageDto.prev ? 'disabled' : ''}">
  <a class="page-link" onclick="go(${pageDto.startNo - 1})">이전</a>
</li>
    
    <!-- 페이지목록 -->
    <c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	<li ${param.pageNo eq i ? "class='page-item active' aria-current='page'" : "class='page-item' " }><a class="page-link" onclick='go(${i})'>${i }</a></li>
	</c:forEach>
	  
<!-- 다음 페이지 -->
<li class="page-item ${!pageDto.next ? 'disabled' : ''}">
  <a class="page-link" onclick="go(${pageDto.endNo + 1})">다음</a>
</li>
    
    <!-- 끝 페이지 -->
    <li class="page-item ">
      <a class="page-link" onclick='go(${pageDto.realEnd })'>끝</a>
    </li>
    
  </ul>
</nav>
</body>
</html>