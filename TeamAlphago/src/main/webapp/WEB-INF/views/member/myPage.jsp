<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
.topMenu {
    width: 20%;
    float: left;
    border: 2px solid #dddddd;
    border-radius: 5px 5px 0 0;
    height: 45px;
    position: relative;
    z-index: -1;
    border-bottom: none;
    color: darkgrey;
    margin-top:30px;
}

.topMenu:hover {
    color: #074691;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="main-box">
		<div id="container">
		    <div class="wrap">
		    <table style="width: 100%;">
			<colgroup>
				<col width="33%" />
				<col width="33%" />
				<col width="33%" />
			</colgroup>
				<tr style="border-bottom: 2px solid #074691;  z-index: 9;">
					<button class="topMenu" id="getGroup" onclick="getGroup()" >정보 수정</button>
					<button class="topMenu" id="groupMemList" >나의 수강내역</button>
					<button class="topMenu" id="myCartList"></button>
				</tr>
			</table>
			<div id="submain"></div>
		    </div>
		  </div>
		</div>
    
		<%@ include file="../common/footer.jsp" %>
</body>
<script src="/resources/js/member/myPage.js"></script>
</html>