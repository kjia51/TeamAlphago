<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	
	<div id="container">
    <div class="wrap">
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">학습콘텐츠 수정</h2>
            </div>


            <form class="content" id="content">
            
                <div class="writeForm1">
                    <div id="titleInfo"></div>
                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">
                                                    <span class="btn btn-point btn-lg"><button type="button" id="editBtn" data-route="one/add/user/">수정</button></span>
                                                                            <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>

	<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/content/contentEdit.js"></script>
</html>