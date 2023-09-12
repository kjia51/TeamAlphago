<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">글쓰기</h2>
            </div>


            <form class="entry" name="writeForm">
            	<input type="hidden" name="n_m_id" value=${memberVO.m_id }>
                <div class="writeForm">
                    <div class="titleInfo">
                        <table class="table table-bordered table-form">
                            <caption>글쓰기</caption>
                            <colgroup>
                                <col width="25%" />
                                <col width="75%" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td><input type="text" class="input-default" title="제목을 입력해주세요." placeholder="제목을 입력해주세요." style="width: 97%" maxlength="100" name="n_title" value=""></td>
                                </tr>
                                <tr>
                                	<th scope="row">내용</th>
                                   <td>
                                   		<textarea id="editor" name="n_content" style="width:100%; height:450px; border:1px solid #ccc;"></textarea>
                                   </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">
                       <span class="btn btn-point btn-lg"><button type="button" class="eve-btn" id="writeBtn" data-route="/alpha/notice/write">등록</button></span>
                       <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>


<script type="text/javascript">
$(document).ready(function() {
    $('#writeBtn').on('click', function() {
        var form = $('form[name="writeForm"]');
        var action = $(this).data('route');
        
        var formData = form.serialize(); // 폼 데이터 직렬화
        
        $.ajax({
            type: "POST",
            url: action,
            data: formData,
            success: function(data) {
                // 성공 처리
            	alert('공지사항이 등록되었습니다.');
            	window.location.href = "/alpha/notice";
            },
            error: function() {
                // 에러 처리
                alert("공지사항 등록 중 오류가 발생했습니다.");
            }
        });
    });
});
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>