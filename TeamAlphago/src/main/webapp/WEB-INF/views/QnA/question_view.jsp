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
                	<input type="text" name="q_no" value=${QnAVO.q_no }>
                    <div class="titleBox">
                        <h2 class="t_title">Q&A</h2>
                    </div>
                    <div class="entry">
                        <div class="viewForm1">
			            
                            <div class="titleInfo">
                                <div class="tit">
                                    <h3>${QnAVO.q_title }</h3>
                                </div>
                                <div class="post">
                                    <span class="name">${QnAVO.n_m_id }</span>
                                    <span class="date" title="작성일">${QnAVO.q_regdate }</span>
                                </div>
                        <c:if test="${memberVO.m_id == QnAVO.n_m_id}">        
                        <div class="btnArea btnArea-right">
                            <span class="btn btn-grayline btn-mg"><a href="#" id="editBtn">수정</a></span>
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
                                    <a href="/alpha/QnA">목록</a>
                                </span>
                            </div>
                        </div>
                        <!-- // viewForm1 -->
                      
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        
        localStorage.setItem('q_title', "${QnAVO.q_title}");
        localStorage.setItem('q_content', "${QnAVO.q_content}");
        
        $('#delBtn').on('click', function() {
            var n_no = $('input[name="q_no"]').val(); // 삭제할 항목의 n_no

            fetch('/alpha/QnA/delete/' + q_no, {
                method: 'DELETE', // DELETE 메서드를 사용합니다.
            })
            .then(function(response) {
                if (response.ok) {
                    alert('문의가 삭제되었습니다.');
                    // 삭제 후 목록 페이지로 이동
                    location.href = "/alpha/QnA";
                } else {
                    throw new Error('문의 삭제 중 오류가 발생했습니다.');
                }
            })
            .catch(function(error) {
                // 에러 처리
                alert(error.message);
            });
            return false;
        });
                
                $('#editBtn').on('click', function(){
                    location.href = "/alpha/notice/edit?q_no=${QnAVO.q_no}";
                });

        </script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>