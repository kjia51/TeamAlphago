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
                <h2 class="t_title">수정</h2>
            </div>


            <form class="entry" name="editForm">
                <div class="writeForm">
                <input type="text" id="n_no" name="n_no" value=${noticeVO.n_no }>
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
                                    <td><input type="text" class="input-default" title="제목을 입력해주세요." placeholder="제목을 입력해주세요." 
                                    style="width: 97%" maxlength="100" name="n_title" value="${noticeVO.n_title }"></td>
                                </tr>
                                <tr>
                                	<th scope="row">내용</th>
                                   <td>
                                   		<textarea id="editor" name="n_content" style="width:100%; height:450px; border:1px solid #ccc;">${noticeVO.n_content }</textarea>
                                   </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">
                       <span class="btn btn-point btn-lg"><button type="button" class="eve-btn" id="editBtn" data-route="/alpha/notice/edit">수정</button></span>
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
        var n_no = document.querySelector('#n_no').value; // 공지사항 번호
        var n_title = $('input[name="n_title"]').val(); // 수정된 제목
        var n_content = $('textarea[name="n_content"]').val(); // 수정된 내용
        var url = "/alpha/notice/view?n_no=" + n_no; // 수정 후 이동할 URL

        $.ajax({
            type: "POST", // 혹은 "PUT" 등 요청 메서드 선택
            url: "/alpha/notice/edit?n_no=" + n_no,
            data: {
                n_title: n_title,
                n_content: n_content
            },
            success: function(data) {
                // 성공 처리
                alert('공지사항이 수정되었습니다.');
                window.location.href = url;
            },
            error: function() {
                // 에러 처리
                alert("공지사항 수정 중 오류가 발생했습니다.");
            }
        });
    });
});
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>