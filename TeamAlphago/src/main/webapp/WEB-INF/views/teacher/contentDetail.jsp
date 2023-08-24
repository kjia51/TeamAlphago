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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
#main {
    width: 60%;
    height: 100%;
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

<div id="main">

<input id="m_id" type="text" value="${memberVO.m_id }">
<div class="content-box">
<c:forEach items="${contentList }" var="con">
	<input id="c_name" type="text" value="${con.c_name }">
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
	<input id="c_sellpice" type="text" value="${con.c_sellprice }">
	
	
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
	<button id="contentDelete">삭제</button>
	</div>

<script>

function getsys() {

	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);

	var dateString = year + '-' + month  + '-' + day;
	
	console.log(dateString);

	return dateString;
	
}


function checkLogin() {
	
	var m_id = $('#m_id').val();
	
	if(m_id === '') { //세션변수에 값이 없으면
		alert('로그인 후 이용가능합니다');
		window.location.replace("/alpha/login");
	}
	
}


$('#payment').click(function () { //결제버튼
	
	checkLogin(); //로그인 체크
	
	alert('a');

	var IMP = window.IMP;
	IMP.init('imp07586387');
	
	var able =  $("#pCnt option:selected").val();
                     
    //DOM객체들에서 사용할 데이터 뽑기
    var c_id = $('#c_id').val();
    var m_id = $('#m_id').val();
    var c_name = $('#c_name').val();
    var today = getsys();
    var price = $('#c_sellpice').val();
    var sub_able = able.substr(0, (able.length)-1);
    var sub_current = 0;
    
    console.log(c_id);
    console.log(m_id);
    console.log(c_name);
    console.log(today);
    console.log(price);
    console.log(sub_able.substr());
    console.log(sub_current);
                  
    IMP.request_pay({
        //카카오페이 결제시 사용할 정보 입력
       pg: 'kakaopay',
       pay_method: "card",
       name: c_name,
       amount: price,
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
                         url: "/alpha/teacher/insertContent",
                         type: 'post',
                         data: {
                        	sub_id: rsp.imp_uid, //거래번호(구독ID)
                        	sub_c_id: c_id, //콘텐츠id
                           	t_m_id: m_id, //회원id
                            sub_name: c_name, //콘텐츠명
                            sub_date: today, //구독날짜
                            sub_price: price, //구독료
                            sub_able: sub_able, //수강가능인원
                            sub_current: sub_current, //콘텐츠id
                         }    
                       });
                     
                     console.log('토큰생성');
                     $.ajax({
                     	type : "POST",
            	        url : "/payment/complete"
                     })
                     console.log('토큰생성완료');


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
	                           
                    	
           			alert(msg);
       				console.log(m_id);
           			window.location.replace("/alpha/teacher");
            			
    	        	} else {
    	        		var msg = '결제에 실패하였습니다.';
                     	msg += '에러내용 : ' + rsp.error_msg;
            			alert(msg);
    	        	}     		
    	    });
    })
 
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