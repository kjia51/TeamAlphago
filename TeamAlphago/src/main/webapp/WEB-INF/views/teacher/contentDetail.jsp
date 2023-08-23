<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<style>
.main-box {
    width: 60%;
    height: 100%;
    background-color: #fff;
    border: 1px solid #d8dfe6;
    margin: 0 auto;
    justify-content: center;
}
.content-box {
    padding: 20px;
}

.imgBox {
	border: 1px solid black;
    width: 40%;
    height: 230px;
    float: left;
        margin-right: 20px;
    }
    
.discountInfo, .cancleInfo {
	border: 1px solid black;

}
</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">


<div class="content-box">
<c:forEach items="${contentList }" var="con">
	<h2>${con.c_name }</h2>
	<div class="imgBox"><img src="" alt="이미지"></div>
	<div class="infoBox"><h3>${con.c_content }</h3></div>
	<hr>
	<h3>- 
	<c:if test="${con.c_level eq 1 }">초급</c:if>
	<c:if test="${con.c_level eq 2 }">중급</c:if>
	<c:if test="${con.c_level eq 3 }">고급</c:if></h3>
	<h3>- 수강가능인원 : ${con.c_able }명</h3>
	<h3>- 정가 : ${con.c_price }원</h3>
	
	<input type="text" value="${con.c_id }" id="c_id">
	<input type="text" value="${con.c_discount }">
	<input type="text" value="${con.c_sellprice }">
	
	
	<fmt:formatNumber var="num" value="${con.c_able/10 }" type="number" />
	
	<select id="pCnt" name="pCnt">
		<c:forEach var="i" begin="1" end="${num }">
		<option>${i*10 }명</option>
		</c:forEach>
	</select>
	<div class="btn">
	<button id="payment">결제</button>
	<button id="goback" onclick="location.href='/alpha/teacher'">뒤로가기</button>
	<button id="contentEdit">수정</button>
	</div>

<script>

function getSysdate() {

	var date = new Date();
	return date;
	
}

$('#payment').click(function () { //결제버튼

			var IMP = window.IMP;
			IMP.init('imp07586387');
                     
             //DOM객체들에서 사용할 데이터 뽑기
             var sub_c_id = $('#c_id').val();
             var t_m_id = $('#m_id').val();
             var sub_name = $('#c_name').val();
             var sub_date = $('#c_date').val();
             var sub_price = $('#c_sellpice').val();
             var sub_able = $('#able').val();
             var sub_current = 0;
             
             if(!user_id.length || !user_email.length || !user_tel.length) {
             	alert('예약자 정보를 입력해주세요');
             	return false;
             }


	                           IMP.request_pay({
	                                //카카오페이 결제시 사용할 정보 입력
	                               pg: 'kakaopay',
	                               pay_method: "card",
	                               name: pname,
	                               amount: pay,
	                           }, function (rsp) {
	                                
	                        	   console.log(rsp);
	                   			// 결제검증
	                   			$.ajax({
	                   	        	type : "POST",
	                   	        	url : "/payment/verifyIamport/" + rsp.imp_uid 
	                   	        }).done(function(data) {
	                   	        	
	                   	        	console.log(data);
	                   	        	
	                   	        	// 결제 유효성 검증
	                   	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	                   	        	if(rsp.paid_amount == data.response.amount){
	                   	        		var msg = "결제 및 결제검증완료";
	                   		        	msg += '\n고유ID : ' + rsp.imp_uid;
	                                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                                    msg += '\n결제 금액 : ' + rsp.paid_amount+'원';
	                                    
	                                    if(rsp.apply_num === null || rsp.apply_num === undefined || rsp.apply_num === '') {
	                                    	rsp.apply_num = '카카오페이머니';
	                                    }
	                                    msg += '\n카드 승인번호 : ' + rsp.apply_num;                                    	
	                   		        	
	                                    $.ajax({
	                                        url: "/peco/insert",
	                                        type: 'post',
	                                        data: {
	                                           p_id: p_id,//펜션아이디   
		                                       period: period,//기간
		                                       pricecnt: pay,//결제할 가격
		                                       startdate : startdate, //입실일
		                                       enddate : enddate, //퇴실일
		                                       pr_name: user_id,//예약자명
		                                       pr_email: user_email,//예약자 이메일
		                                       pr_tel: user_tel,//예약자 전화번호
		                                       imp_uid: rsp.imp_uid, //거래고유번호
		                                       pr_id: rsp.merchant_uid, //주문고유번호=펜션예약번호
										 	   pr_pay: rsp.apply_num, //카드승인번호
										 	   m_id : m_id,//회원번호 -예약자명 직접입력 경우 다를 경우
										 	   pname : pname, //펜션명
										 	   roomname : roomname,//객실명
										 	   room_no : room_no, //객실번호
	                                        }                               
	                                      });
	                                    console.log('토큰생성');
	                                    $.ajax({
	                                    	type : "POST",
	                           	        	url : "/payment/complete"
	                                    })
	                                    console.log('토큰생성완료');
	                                    
	                                    $('#resForm').submit(); 
	                           			alert(msg);
	                       				console.log(m_id);
	                           			window.location.replace("/peco/profile?m_id=${member.m_id}");
	                   	        	} else {
	                   	        		var msg = '결제에 실패하였습니다.';
	                                    msg += '에러내용 : ' + rsp.error_msg;
	                           			alert(msg);
	                   	        	}     		
	                   	        });
	                           });  
	                    	}); 
                    	

</script>





</div>
<br>
<hr>
<div class="discountInfo">
<p>할인율 안내</p>

</div>
<div class="cancleInfo">
<p>취소 및 환불규정</p>

</div>






</c:forEach>

</div>



<%@ include file="../common/footer.jsp" %>



</body>
<script src="/resources/js/content/contentEdit.js"></script>
</html>