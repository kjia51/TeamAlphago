<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
select {
    -webkit-appearance:none; /* 크롬 화살표 없애기 */
    -moz-appearance:none; /* 파이어폭스 화살표 없애기 */
    appearance:none /* 화살표 없애기 */
}
</style>    
</head>
<body>
<script>
function go(page){
	selectForm.pageNo.value=page;
	selectForm.submit();
}
</script>

<form id="search" action="/alpha/teacher" method="get" name="selectForm">

	<input type="text" name="pageNo" value="${pageDto.cri.pageNo}">

</form>


 
</body>
</html>