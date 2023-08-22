<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.main-box {
    display: flex;
    width: 80%;
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
}

</style>
<body>

<%@ include file="../common/header.jsp" %>

<hr>
<div class="serachForm">
     <!-- 검색폼 -->
     <form name="searchForm" action="#">
     <input type="text" name="pageNo" value="1">
     <div class="form-inline text-center"> 
     <p></p>
   <div class="form-group">
       <select class="form-control" name='searchField'>
           <option value='1'>초급</option>
           <option value='2'>중급</option>
           <option value='3'>고급</option>
       </select>
   </div>
   <div class="form-group">
       <input class="form-control" name='searchWord' value="${pageDto.cri.searchWord }">
    </div>
    <button type="submit" class="btn btn-default">검색</button>
</div>
      </form>
      <!-- 검색폼끝 -->
</div>
<hr>
	
	<div class="main-box">
	
<c:forEach  var="con" items="${contentList }" varStatus="status">
		<c:if test="${fn:length(contentList )==0}">
				콘텐츠가 없습니다
		</c:if>
	
	
		<div class="InfoBox">
			<input type="text" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly><br>
			<div class="imgBox">
				<img src="" alt="이미지">		
			</div><hr>
			<div class="info">
			<h2>${con.c_name }</h2>
			<input type="text" class="index" id="c_sellprice" data-csellprice="${status.index}" value="${con.c_sellprice }"readonly><br>
			</div>		
		</div>
		</c:forEach>
		</div>
	
	<%--
		<form name='getContent' onsubmit="return false">


			<tr>
				<td><input type="hidden" value="${status.index}" id="index"></td>
				
				<td><input type="hidden" class="index" id="c_id" data-cid="${status.index}" value="${con.c_id }" readonly></td>		
				<td><input type="hidden" class="index" id="c_name" data-cname="${status.index}" value="${con.c_name }"readonly></td>
				<td><input type="hidden" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly></td>
				<td><input type="hidden" class="index" id="c_able" data-cable="${status.index}" value="${con.c_able }"readonly></td>
				<td><input type="hidden" class="index" id="c_price" data-cprice="${status.index}" value="${con.c_price }"readonly></td>
				<td><input type="hidden" class="index" id="c_discount" data-cdiscount="${status.index}" value="${con.c_discount }"readonly></td>
				<td><input type="hidden" class="index" id="c_sellprice" data-csellprice="${status.index}" value="${con.c_sellprice }"readonly></td>
				<td><input type="hidden" class="index" id="c_content" data-ccontent="${status.index}" value="${con.c_content }"readonly></td>
				<td style="border: none;"><button onclick="goSub(${status.index})">신청하러가기</button></td> 
				</tr>


			</form>--%>
	
<%@ include file="../common/footer.jsp" %>



</body>
</html>