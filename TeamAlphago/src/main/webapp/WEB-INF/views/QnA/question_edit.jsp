<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<link rel="icon" href="/resources/images/favicon.ico">
<script src="https://kit.fontawesome.com/a2debf6ac3.js" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div id="container">
    <div class="wrap">
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">수정</h2>
            </div>

            <form class="entry" name="writeForm">
                <div class="writeForm">
                <input type="hidden" id="q_no" name="q_no" value=${QnAVO.q_no }>
                    <div class="titleInfo">
                        <table class="table table-bordered table-form">
                            <caption>수정</caption>
                            <colgroup>
                                <col width="25%" />
                                <col width="75%" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">제목</th>
                                    <td><input type="text" class="input-default" title="제목을 입력해주세요." placeholder="제목을 입력해주세요." 
                                    style="width: 95%" maxlength="100" name="q_title" value="${QnAVO.q_title }"></td>
                                    <th scope="row"> <i class="fa-solid fa-lock"></i> </th>
                                    <td><input  style="margin-top:7px;" type="checkbox" id="q_secret" name="q_secret" ${QnAVO.q_secret == 'Y' ? 'checked' : ''}></td>
                                </tr>
                                <tr>
                                	<th scope="row">내용</th>
                                   <td colspan="3">
                                   		<textarea id="editor" name="q_content" style="width:100%; height:450px; border:1px solid #ccc;">${QnAVO.q_content }</textarea>
                                   </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">
                       <span class="btn btn-point btn-lg"><button type="button" class="eve-btn" id="editBtn" data-route="/alpha/QnA/question_edit">등록</button></span>
                       <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>


<script type="text/javascript">
$(document).ready(function() {
        	$('#editBtn').on('click', function() {
        
	        var action = $(this).data('route');
	        var q_secret = (document.querySelector('#q_secret').checked == true) ? 'Y' : 'N';
	        var q_no = $('input[name="q_no"]').val();
	        
	        var formData = new FormData();
	        
	        formData.append("q_secret", q_secret);
	        formData.append("q_title", $('input[name="q_title"]').val());
	        formData.append("q_content", $('textarea[name="q_content"]').val());
	        formData.append("q_no", q_no);
	
	        $.ajax({
	            type: "POST",
	            url: action,
	            data: formData,
	            processData: false,
	            contentType: false,
	            success: function(data) {
	                // 성공 처리
	                alert('문의가 수정되었습니다.');
	                window.location.href = "/alpha/QnA/question_view?q_no=" + q_no;
	            },
	            error: function() {
	                // 에러 처리
	                alert("문의 수정 중 오류가 발생했습니다.");
	            }
	        });
       
    });
});
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>