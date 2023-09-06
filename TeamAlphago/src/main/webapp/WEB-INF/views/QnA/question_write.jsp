<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">문의하기</h2>
            </div>


            <form class="entry" name="writeForm">
            	<input type="hidden" name="q_m_id" value=${memberVO.m_id }>
                <div class="writeForm">
                    <div class="titleInfo">
                        <table class="table table-bordered table-form">
                            <caption>문의하기</caption>
                            <colgroup>
                                <col width="25%" />
                                <col width="75%" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td><input type="text" class="input-default" title="제목을 입력해주세요." placeholder="제목을 입력해주세요." style="width: 95%" maxlength="100" name="q_title" value=""></td>
                                    <th scope="row"> <i class="fa-solid fa-lock"></i> </th>
                                    <td><input style="margin-top:7px;" type="checkbox" id="q_secret" name="q_secret"></td>
                                </tr>
                                <tr>
                                	<th scope="row">내용</th>
                                   <td colspan="3">
                                   		<textarea id="editor" name="q_content" style="width:100%; height:450px; border:1px solid #ccc;"></textarea>
                                   </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">
                       <span class="btn btn-point btn-lg"><button type="button" class="eve-btn" id="writeBtn" data-route="/alpha/QnA/question_write">등록</button></span>
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
        var action = $(this).data('route');
        
        var q_secret = $("#q_secret").prop("checked") ? "Y" : "N";
        
        var formData = new FormData();
        formData.append("q_secret", q_secret);
        formData.append("q_title", $('input[name="q_title"]').val());
        formData.append("q_m_id", $('input[name="q_m_id"]').val());
        formData.append("q_content", $('textarea[name="q_content"]').val());

        $.ajax({
            type: "POST",
            url: action,
            data: formData,
            processData: false,
            contentType: false,
            success: function(data) {
                // 성공 처리
                alert('문의가 등록되었습니다.');
                window.location.href = "/alpha/QnA/question";
            },
            error: function() {
                // 에러 처리
                alert("문의 등록 중 오류가 발생했습니다.");
            }
        });
    });
});
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>