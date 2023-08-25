<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 조회</title>
</head>


<style>
.main-box {
    display: flex;
    width: 60%;
    height: 100%;
    background-color: #fff;
    border: 1px solid #d8dfe6;
    margin: 0 auto;
    justify-content: center;
}

div .InfoBox {
	border: 1px solid black;
	width: 100%;
	height: 100%;
}

div .InfoBox .info {
	text-align: center;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;

}

</style>
<body>

<%@ include file="../common/header.jsp" %>

<hr>
<div class="serachForm" style="text-align: center;">
     <!-- 검색폼 -->
     <form name="searchForm" action="/alpha/teacher" >
     <input type="text" name="pageNo" value="${pageDto.cri.pageNo}">
     <div class="form-inline text-center"> 
     <p></p>
   <div class="form-group" style="display: flex;">
		<input type="radio" name="level" value="전체" checked>전체
		<input type="radio" name="level" value="초급">초급
		<input type="radio" name="level" value="중급">중급
		<input type="radio" name="level" value="고급">고급
   </div>
   <div class="form-group">
       <input class="form-control" name='searchWord' value="${pageDto.cri.searchWord }" style="border-bottom: 1px solid black" >
    
    <button type="submit" class="btn btn-default">검색</button> </div>
</div>
      </form>
      <!-- 검색폼끝 -->
</div>
<hr>
${pageDto }

총 ${totalCnt } 건

	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
	
<c:choose>
<c:when test="${contentList != null && fn:length(contentList) > 0 }">
	  <c:forEach  var="con" items="${contentList }" varStatus="status">

	  
	  
	    <c:if test="${i%j == 0 }">
	    <div class="main-box">
	    </c:if>
	       		<div class="InfoBox">
			<input type="text" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly>
			<input type="text" class="index" id="c_no" data-cid="${status.index}" value="${con.c_no }"readonly><br>
			<hr>
			<div class="imgBox">
				<img src="" alt="이미지">		
			</div><hr>
			<div class="info">
			<h2>${con.c_name }</h2>
			</div>
				<div class="goDetail">
					<button onclick="godetail(${status.index})">자세히보기</button>
				</div>
	
				</div>
	       <hr>
	    <c:if test="${i%j == j-1 }">
	    </div>
	    </c:if>
	    <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	     </c:when>
  <c:otherwise>
   <tr>
    <td>존재하지 않습니다.</td>
   </tr>
  </c:otherwise>
  </c:choose>



<script>
function godetail(index) {
	
	var i = index;
	console.log(i);

	var c_no= $('input[data-cid="'+index+'"]').val();
	alert(c_no);

	console.log(c_no);
	window.location.replace("/alpha/teacher/detail?c_no="+c_no);
	
	
}

function go(page){
	//alert(page);
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/teacher";
	document.searchForm.submit();
}
</script>
	
<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>



</body>
</html>