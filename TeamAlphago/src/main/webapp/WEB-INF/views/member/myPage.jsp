<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 결제api -->
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

input:focus {
 	outline: none;
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

                .total_order {width:171px}
                .sale_price {width:171px}
                .sale_pay{overflow:hidden;margin-bottom:20px;}
                .sale_pay dd ul {background:url('../img/payment/sum_bg_.gif') no-repeat;}
                div.total_price {margin:10px 0 0 70px}
                div.total_price dl.benefit{margin:17px 0 0}
                
#my_modal {
    display: none;
    width: 360px;
    padding: 20px 35px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}
</style>
</head>
<body>
			<%-- 모달창 --%>
			<div id="my_modal">
				<hr>
				<h2 style="text-align: center;">결제 완료</h2><br>
			
				<div style="width: 100%; text-align: center;">
				    <button class="btn btn-default" style="margin: 10px;" onClick="location.href='/alpha/mysubList?t_m_id=${memberVO.m_id }'">구독내역으로 가기</button>
				    <button class="btn btn-default" style="margin: 10px;" onClick="location.href='/alpha/mypage'">장바구니로 돌아가기</button>
			    </div>
			</div>
			</div>
			</div>
	<%@ include file="../common/header.jsp" %>
	<div class="main-box">
		<div id="container">
		    <div class="wrap">
		    <input type="hidden" id="m_id" value=${memberVO.m_id }>
		    <input type="hidden" id="m_password" value=${memberVO.m_password }>
		    <input type="hidden" id="m_division" value=${memberVO.m_division }>
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
					<button class="topMenu" id="myClassList" >나의 학습내역</button>
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
			<div id="classListDiv"></div>
		    </div>
		  </div>
		</div>
    
		<%@ include file="../common/footer.jsp" %>
<script src="/resources/js/member/myPage.js"></script>
<script src="/resources/js/content/contentEdit.js"></script>
<script src="/resources/js/member/myClassList.js"></script>
</body>
</html>