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
    border-bottom: none;
    color: darkgrey;
    margin-top:30px;
}

.topMenu:hover {
    color: #074691;
}

.alert-div{
	display: flex;
	width: 185px;
	font-size: 12px;
	color: red;
	line-height: 15px;
	margin-left: 20px;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="main-box">
		<div id="container">
		    <div class="wrap">
		    <input type="hidden" id="m_id" value=${memberVO.m_id }>
		    <input type="hidden" id=m_password value=${memberVO.m_password }>
		    <table style="width: 100%;">
			<colgroup>
				<col width="33%" />
				<col width="33%" />
				<col width="33%" />
			</colgroup>
				<tr style="border-bottom: 2px solid #074691; ">
					<button class="topMenu" id="getGroup" >정보 수정</button>
                    <c:choose>    
                    <c:when test="${sessionScope.memberVO.m_division==2}">
					<button class="topMenu" id="myClassList" >나의 수강내역</button>
					</c:when>
                    <c:when test="${sessionScope.memberVO.m_division==1}">
					<button class="topMenu" id="myCartList">장바구니</button>
					</c:when>
                                <c:otherwise>
			   					</c:otherwise>
							</c:choose>
				</tr>
			</table>
			<div id="submain"></div>
			<div id="classList"></div>
		    </div>
		  </div>
		</div>
    
		<%@ include file="../common/footer.jsp" %>
<script src="/resources/js/member/myPage.js"></script>
<script src="/resources/js/member/myClassList.js"></script>
</body>
</html>