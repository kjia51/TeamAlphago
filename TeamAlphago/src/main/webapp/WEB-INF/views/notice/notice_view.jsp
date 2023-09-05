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
                	<input type="text" name="n_no" value=${noticeVO.n_no }>
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
                                    <a href="/alpha/notice">목록</a>
                                </span>
                            </div>
                        </div>
                        <!-- // viewForm1 -->
                      
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
        
        $('#delBtn').on('click', function() {
            var n_no = $('input[name="n_no"]').val(); // 삭제할 항목의 n_no

            $.ajax({
                type: "DELETE", // HTTP DELETE 요청
                url: '/alpha/notice/delete/' + n_no, // 요청할 URL
                success: function(data) {
                    // 성공 처리
                    alert('공지사항이 삭제되었습니다.');
                    // 삭제 후 목록 페이지로 이동
                    location.href = "/alpha/notice";
                },
                error: function() {
                    // 에러 처리
                    alert("공지사항 삭제 중 오류가 발생했습니다.");
                }
            });
            return false;
        });
                
                $('#editBtn').on('click', function(){
                    location.href = "/alpha/notice/edit?n_no=${noticeVO.n_no}";
                });

        </script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>