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
                <h2 class="t_title">학습콘텐츠 등록</h2>
            </div>


            <form class="content" id="content">
                <div class="writeForm1">
                    <div class="titleInfo">
                        <table class="table table-bordered table-form">
                            <caption>글쓰기</caption>
                            <colgroup>
                                <col width="25%">
                                <col width="75%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">패키지명</th>
                                    <td>
                                    <div id="signCname" style="color:red"></div>
                                    <input type="text" class="input-default" id="c_name" placeholder="공백없이 한글/숫자 6자" style="width: 97%" maxlength="100" name="title" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">학습난이도</th>
                                    <td>
                                                                           <select title="검색 분류" name="c_level" id="c_level">
                                                                                            <option value="1"> 초급 </option>
                                                                                            <option value="2"> 중급 </option>
                                                                                            <option value="3"> 고급 </option>
                                                                                    </select> 
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">학습가능인원</th>
                                    <!-- <td><input type="text" class="input-default" id="c_able"  style="width: 97%" maxlength="100" name="title" value=""></td> -->
                                    <td>
                                        <!-- 수량 선택박스 -->
				                        <select name='selAmount' data-index='${index}' id="c_able" >
				                        </select>
				                        <!-- 수량 변경 버튼-->
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th scope="row">정가</th>
                                    <td><input type="text" class="input-default" id="c_price" style="width: 97%" maxlength="100" name="title" value=""></td>
                                </tr>
                                <tr>
                                    <th scope="row">할인율</th>
                                    <td>
                                    <div id="signDiscount"  style="color:red"></div>
                                    <input type="text" class="input-default" id="c_discount" style="width: 97%" maxlength="100" name="title" disabled></td>
                                </tr>
                                <tr>
                                    <th scope="row">판매가</th>
                                    <td><input type="text" class="input-default" id="c_sellprice" style="width: 97%" maxlength="100" name="title" disabled></td>
                                </tr>
                                <tr>
                                    <th scope="row">콘텐츠 내용</th>
                                    <td>
                                    <div id="signContent"  style="color:red"></div>
                                    <textarea id="c_content" placeholder="10자 이상 입력하세요" style="width:100%; height:450px; border: solid #ccc 1px;"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">
                                                    <span class="btn btn-point btn-lg"><button type="button" id="registerBtn" data-route="one/add/user/">등록</button></span>
                                                                            <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                    </div>
                </div>
            </form>


        </div>
    </div>
</div>

	<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/content/contentWrite.js"></script>
</html>