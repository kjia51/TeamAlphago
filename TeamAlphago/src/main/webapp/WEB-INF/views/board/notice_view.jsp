<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="content_wrap">
                
                    <div class="titleBox">
                        <h2 class="t_title">공지사항</h2>
                    </div>
                    <div class="entry">
                        <div class="viewForm1">
			            
                            <div class="titleInfo">
                                <div class="tit">
                                    <h3>${noticeVO.n_title }</h3>
                                </div>
                                <div class="post">
                                    <span class="name">${noticeVO.n_m_id }</span>
                                    <span class="date" title="작성일">${noticeVO.n_regdate }</span>
                                </div>
                        <c:if test="${memberVO.m_division == 3}">        
                        <div class="btnArea btnArea-right">
                            <span class="btn btn-grayline btn-mg"><a href="https://www.kbaduk.or.kr/one/write/user/mod/275">수정</a></span>
                            <span class="btn btn-grayline btn-mg"><a href="javascript:;" id="delBtn" data-idx="275">삭제</a></span>
                        </div>
                        </c:if>
                            </div>
                            <!-- // titleInfo -->
                            <div class="boardView">
                                <p class="0" style="background:#ffffff;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;">
                                    ${noticeVO.n_content }
                                </p>
                            </div>
                            <!-- // contentView -->
                            <div class="btnArea-center">
                                <span class="btn btn-primary btn-lg">
                                    <a href="/alpha/notice">목록</a>
                                </span>
                            </div>
                        </div>
                        <!-- // viewForm1 -->
                      
                    </div>
                </div>
            </div>
        </div>
        <div id="hiddenData">
            <input type="hidden" name="bbsIdx" value="274">
            <input type="hidden" name="board" value="user">
        </div>
        <script type="text/javascript">
                $('#delBtn').on('click', function() {
                    fs.ajax({
                        msg: '삭제 하시겠습니까?',
                        action: '/one/del/user/' + $(this).data('idx'),
                        success: function(data) {
                            history.back(-1);
                        }
                    });
                    return false;
                });
        </script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>