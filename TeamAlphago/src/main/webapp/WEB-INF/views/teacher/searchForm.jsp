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

<form id="search" action="/peco/main/pension" method="get" name="selectForm">

	<input type="hidden" name="pageNo" value="${pageDto.regioncri.pageNo}">
<select class="form-select" id="megaregion" name="megaregion"  onchange="regionChange(this)" style="width:100px; display:inline-block;">
  <option value='' selected>난이도 난이도</option>
  <option value="강원" ${pageDto.regioncri.megaregion eq "강원" ? "selected" : " " }>초급</option>
  <option value="경기" ${pageDto.regioncri.megaregion eq "경기" ? "selected" : " " }>중급</option>
  <option value="경상" ${pageDto.regioncri.megaregion eq "경상" ? "selected" : " " }>고급</option>

</select>

<select class="form-select form-select-inline" id="sort" name="sort" id="smallregion" onchange="this.form.submit(this.value)" style=" width:150px; display:inline-block; ">
<option value='' selected>전체</option>
<option value='cnt' ${pageDto.regioncri.sort eq "cnt" ? "selected" : " " }>리뷰많은순</option>
<option value='star' ${pageDto.regioncri.sort eq "star" ? "selected" : " " }>별점순</option>
</select>



</form>


 
</body>
</html>