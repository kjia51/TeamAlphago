<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="icon" href="/resources/images/favicon.ico">
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div id="container">
    <div class="wrap">
        <form  method="get" name="searchForm" class="content_wrap">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <input type="hidden" name="totalCnt" value="${totalCnt}">
            <div class="titleBox">
                <h2 class="t_title">공지사항</h2>
            </div>
            
            <div class="searchWrap searchWrap_wide searchWrap_normal">
                    <div class="searchBox searchBox-mid searchBox-center">
                        <fieldset>
                            <legend>전체 검색</legend>
                            <select title="검색 분류" name="searchField">
                                <option value="n_title" ${pageDto.cri.searchField == 'n_title' ? 'selected' : ''}>제목</option>
                                <option value="n_content" ${pageDto.cri.searchField == 'n_content' ? 'selected' : ''}>내용</option>
                                <option value="n_m_id" ${pageDto.cri.searchField == 'n_m_id' ? 'selected' : ''}>작성자</option>
                            </select>
                            <input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." 
                            		name="searchWord" value="${pageDto.cri.searchWord }" />
                            <input type="submit" class="btn btn-primary" value="검색" />
                        </fieldset>
                    </div>
                <c:if test="${memberVO.m_division == 3}">
                <div class="btnArea topbtnWrap">
                    <span class="btn btn-point btn-mg"><button type="button" id="addBtn">글쓰기</button></span>
                </div>
                </c:if>
            </div>



            <div class="entry">

                <!-- 게시판 리스트 -->
                <table class="table table-wide">
                    <caption>커뮤니티 리스트</caption>
                    <colgroup>
                        <col width="10%" />
                        <col width="65%" />
                        <col width="10%" />
                        <col width="15%" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>no</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        
                        <c:forEach var="noticeVO" items="${list}">
                        <tr>
                            <th align="center" scope="row">${noticeVO.n_no }</th>
                            <td class="subject">
                                <a href="/alpha/notice/view?n_no=${noticeVO.n_no }">${noticeVO.n_title }</a>
                                                            </td>
                            <td align="center">${noticeVO.n_m_id }</td>
                            <td align="center">${noticeVO.n_regdate }</td>
                        </tr>
						</c:forEach>
                        
                        

                     </tbody>
                </table>

                
				<div class="paging">
                	<%@include file="./pageNavi_notice.jsp" %>
				</div>

        </form>
    </div>
</div>


<script type="text/javascript">

function go(page){
	//alert(page);
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/notice";
	document.searchForm.submit();
}


$('#addBtn').on('click', function(){
    location.href = "/alpha/notice/write";
});

</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>