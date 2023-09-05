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
<body>
	<%@ include file="../common/header.jsp" %>
	
	
	
	<div id="container">
        <div class="wrap">
            <div class="content_wrap main_wrap">
                <div class="entry">
		

	<c:set var="i" value="0" />
	<c:set var="j" value="3" />

	 <div class="atcBox atcBox-notice">
              <h3><i class="ico ico-rally"></i>이 달의 콘텐츠</h3>
<c:choose>
<c:when test="${contentList != null && fn:length(contentList) > 0 }">
                    <ul class="pList">
	  <c:forEach  var="con" items="${contentList }" varStatus="status">

	  			<input type="hidden" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly>
			<input type="hidden" class="index" id="c_no" data-cid="${status.index}" value="${con.c_no }"readonly>
	  
	    <c:if test="${i%j == 0 }">
        </c:if>
             <li style="width:222px; height:170px;">
             	
                <a href="https://www.kbaduk.or.kr/bbs/view/thum/photo/95/" class="img">
                    <img src="https://www.kbaduk.or.kr/storage/mis/2023_03/06/b78e96e66dffc3d12d10e49db1563282.jpg" alt="">
                    <span class="text"><em>${status.index}</em></span>
                </a>
                <p class="desc">
                    <a onclick="godetail(${status.index})"><strong class="tit">${con.c_name }</strong></a>
                    <em>|</em><span class="hit">학습수준 : ${con.c_level }</span>
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
	
	
	
        <div class="atcBox atcBox-notice">
              <h3><i class="ico ico-notice"></i>공지사항</h3>
              <ul>
                   <c:forEach var="noticeVO" items="${noticeVOList}">
                        <li>
                          <a href="/alpha/notice/view?n_no=${noticeVO.n_no }">${noticeVO.n_title }</a>
                          <span class="date">${noticeVO.n_regdate }</span>
                      	</li>
					</c:forEach>
              </ul>
              <a href="/alpha/notice" class="ico ico-more more"><span>더보기</span></a>
          </div><!-- // atcBox | 화제-->
       </div>
    </div>
  </div>
</div>           
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>