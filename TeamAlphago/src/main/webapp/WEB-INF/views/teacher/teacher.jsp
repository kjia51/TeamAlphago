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

            <div class="titleBox">
                <h2 class="t_title">콘텐츠 조회</h2>
            </div>


            <form class="searchWrap btnTopSrch" name="searchForm" action="/alpha/teacher">
                <!-- 상단 검색 -->
                <h2 class="blind">검색</h2>
                <div class="searchBox">
                    <fieldset>
                        <input type="hidden" name="p" value="1">
                        <legend>전체 검색</legend>
                        <select title="검색 분류" name="cate" value="" class="form-group">
                            <option value="전체">전체</option>
                            <option value="초급">초급</option>
                            <option value="중급">중급</option>
                            <option value="고급">고급</option>
                        </select>
                        <input type="text" class="inputSrch" title="검색어를 입력해주세요." autofocus="autofocus" placeholder="검색어를 입력해주세요." name="word" value="${pageDto.cri.searchWord }" style="width:190px">
                        <input type="submit" class="btnTopSrch btn btn-primary" value="검색">
                    </fieldset>
                </div>
                <!-- // 상단 검색 -->
            </form>


            <div class="entry">
                <div class="photoAtcList">

${pageDto }

총 ${totalCnt } 건

	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
	
<c:choose>
<c:when test="${contentList != null && fn:length(contentList) > 0 }">
	  <c:forEach  var="con" items="${contentList }" varStatus="status">

	  			<input type="hidden" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly>
			<input type="hidden" class="index" id="c_no" data-cid="${status.index}" value="${con.c_no }"readonly>
	  
	    <c:if test="${i%j == 0 }">
                    <ul class="pList">
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
                    </ul>
                       	    </c:if>
     <c:set var="i" value="${i+1 }" />
	  </c:forEach>
	     </c:when>
  <c:otherwise>
    <li>존재하지 않습니다.</li>

  </c:otherwise>
  </c:choose>                                               
                </div><!-- // photoAtcList -->
                <div class="paging">
                    <a href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=1" class="current">1</a><a href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=2">2</a><a href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=3">3</a><a href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=4">4</a><a href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=5">5</a><a class="nextPage" href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=6"> <span>다음</span> </a><a class="nextPageMore" href="https://www.kbaduk.or.kr/bbs/read/thum/photo/?p=6"> <span>다다음</span> </a>                </div>
            </div>
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
<%@ include file="../common/footer.jsp" %>



</body>
</html>