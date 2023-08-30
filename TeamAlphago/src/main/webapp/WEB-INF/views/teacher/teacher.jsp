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

<div id="container">
    <div class="wrap">


        <div class="content_wrap">

            <form  method="get" name="searchForm" class="content_wrap">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <div class="titleBox">
                <h2 class="t_title">콘텐츠 조회</h2>
            </div>
            
            <div class="searchWrap searchWrap_wide searchWrap_normal">
                    <div class="searchBox searchBox-mid searchBox-center">
                        <fieldset>
                            <input type="hidden" name="p" value="1">
                            <legend>전체 검색</legend>
                            <select title="검색 분류" name="searchField" value="${pageDto.cri.searchField }">
                                <option value="c_name">제목</option>
                            </select>
                            <input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." 
                            		name="searchWord" value="${pageDto.cri.searchWord }" />
                            <input type="submit" class="btn btn-primary" value="검색" />
                        </fieldset>
                    </div>
            </div>           
        </form>
총 ${totalCnt } 건

	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
	
<c:choose>
<c:when test="${contentList != null && fn:length(contentList) > 0 }">
                    <ul class="pList">
	  <c:forEach  var="con" items="${contentList }" varStatus="status">

	  			<input type="hidden" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly>
			<input type="hidden" class="index" id="c_no" data-cid="${status.index}" value="${con.c_no }"readonly>
	  
	    <c:if test="${i%j == 0 }">
                         </c:if>
                         <li>
                         	
                            <a href="https://www.kbaduk.or.kr/bbs/view/thum/photo/95/" class="img">
                                <img src="https://www.kbaduk.or.kr/storage/mis/2023_03/06/b78e96e66dffc3d12d10e49db1563282.jpg" alt="">
                                <span class="text"><em>${status.index}</em></span>
                                                            </a>
                            <p class="desc">
                                <a onclick="godetail(${status.index})"><strong class="tit">${con.c_name }</strong></a>
                                <span class="date">${con.c_price}원</span><em>|</em><span class="hit">학습수준 : ${con.c_level }</span>
                            </p>
                       </li>
  	    <c:if test="${i%j == j-1 }">
                       	    </c:if>
	  </c:forEach>
                    </ul>
	     </c:when>
  <c:otherwise>
    <li>존재하지 않습니다.</li>

  </c:otherwise>
  </c:choose>                                               
        </div>
        <!-- //content close -->


    </div>
</div>
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