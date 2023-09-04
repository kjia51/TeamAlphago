<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a2debf6ac3.js" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div id="container">
    <div class="wrap">
        <form  method="get" name="searchForm" class="content_wrap">
			<input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
            <div class="titleBox">
                <h2 class="t_title">Q&A</h2>
            </div>
            
            <div class="searchWrap searchWrap_wide searchWrap_normal">
                    <div class="searchBox searchBox-mid searchBox-center">
                        <fieldset>
                            <legend>전체 검색</legend>
                            <select title="검색 분류" name="searchField">
                                <option value="q_title" ${pageDto.cri.searchField == 'q_title' ? 'selected' : ''}>제목</option>
                                <option value="q_m_id" ${pageDto.cri.searchField == 'q_m_id' ? 'selected' : ''}>작성자</option>
                            </select>
                            <input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." 
                            		name="searchWord" value="${pageDto.cri.searchWord }" />
                            <input type="submit" class="btn btn-primary" value="검색" />
                        </fieldset>
                    </div>
                <c:if test="${memberVO != null }">
                <div class="btnArea topbtnWrap">
                    <span class="btn btn-point btn-mg"><button type="button" id="addBtn">문의하기</button></span>
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
                        
                        
                        <c:forEach var="QnAVO" items="${list}">
                        <tr>
                            <td align="center">${QnAVO.q_answerYN == 'Y' ? '답변완료' : '답변대기' }</td>
                            <td class="subject">
                               <a style="cursor:pointer" class="viewQ" >
								<input style="display:none" type="text" class="q_no" value="${QnAVO.q_no }">
								<input style="display:none" type="text" class="q_secret" value="${QnAVO.q_secret }">
							    <c:if test="${QnAVO.q_secret == 'Y'}">
							        <i class="fa-solid fa-lock"></i> 
							    </c:if>
							    ${QnAVO.q_title}
							</a>
                            </td>
                            <td align="center" class="q_m_id">${QnAVO.q_m_id }</td>
                            <td align="center">${QnAVO.q_regdate }</td>
                        </tr>
						</c:forEach>
                        
                        

                     </tbody>
                </table>

                
				<div class="paging">
                	<%@include file="./pageNavi_question.jsp" %>
				</div>

        </form>
    </div>
</div>


<script type="text/javascript">

function go(page){
	//alert(page);
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/QnA/question";
	document.searchForm.submit();
}

$('.viewQ').on('click', function(){
	var q_no = $(this).closest('tr').find('.q_no').val();
	var q_secret = $(this).closest('tr').find('.q_secret').val();
	var q_m_id = $(this).closest('tr').find('.q_m_id').html();
	/* console.log(q_no);
	console.log(q_m_id); */
	if (q_secret === 'Y'){
		if (3 == '${memberVO.m_division }' || q_m_id === '${memberVO.m_id }'){
			location.href = '/alpha/QnA/question_view?q_no=' + q_no;
		} else {
	    	alert('비밀글은 작성자 본인만 조회할 수 있습니다.');
	    }
	} else {
		location.href = '/alpha/QnA/question_view?q_no=' + q_no;
	}
});

$('#addBtn').on('click', function(){
    location.href = "/alpha/QnA/question_write";
});

</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>