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

#my_modal {
    display: none;
    width: 400px;
    height: 250px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    text-align: center;
    line-height: 115px;

}

#my_modal .modal_close_btn {

    border: 1px solid black;
    padding: 10px;
    border-radius: 5px;
    margin: 20px;
    
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
	
	<input type="text" value="${con.c_no }" id="c_no">
	<input type="text" value="${con.c_discount }">
	<input id="c_sellpice" type="text" value="${con.c_sellprice }">
	
	

	
    <select name="selAmount" data-index="${index }" id="c_able" >
    <option value='1'>1</option>
    </select>
	<div id="signDiscount"  style="color:red; border:solid 1px red; width:250px; height:30px"></div>
	<label for="c_discount">할인율 :</label>
	<input type="text" class="input-default" id="c_discount" style="width: 33%; border:solid 1px black" maxlength="100" name="c_discount" value="">
	<button id="payment">결제</button>
	<button id="goback" onclick="location.href='/alpha/teacher'">뒤로가기</button>
	<button id="contentEdit">수정</button>
	<button id="contentDelete">삭제</button>
	</div>


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


<%-- 모달창 --%>
<div id="my_modal">
	<hr>
	<h2>결제 완료</h2>

		<div class="btn">
		    <button><a class="modal_close_btn" onClick="location.href='/alpha/mysubList?t_m_id=${memberVO.m_id }'">구독내역으로 가기</a></button>
		    <button><a class="modal_close_btn" onClick="location.href='/alpha/teacher'">리스트로 돌아가기</a></button>
    	</div>
    	
    	
</div>
<%-- --------------------------------------------------------------  --%>



<script>

function modal(id) { //모달창 띄우기
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('.modal_close_btn')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
}

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
    var c_no = $('#c_no').val();
    var m_id = $('#m_id').val();
    var c_name = $('#c_name').val();
    var today = getsys();
    var price = $('#c_sellpice').val();
    var sub_able = able.substr(0, (able.length)-1);
    var sub_current = 0;
    
    console.log(c_no);
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
                        	sub_c_no: c_no, //콘텐츠id
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

	                                    $('#resForm').submit(); 
	                           			alert(msg);
	                       				console.log(m_id);
	                       			 	modal('my_modal');
	                   	        	} else {
	                   	        		var msg = '결제에 실패하였습니다.';
	                                    msg += '에러내용 : ' + rsp.error_msg;
	                           			alert(msg);
	                   	        	}     		
	                   	        });

    })
 
});  


	window.addEventListener('load', function(){
	    // select박스 목록 선택
	    let selAmountList = document.querySelectorAll("[name=selAmount]");
	    // select 옵션
	    let options = '';
	    for(let i=1;i<=10;i++){
	        options += `<option value='${i*10}'>${i*10}${i==10?'+':''}</option>`
	    }
	    // select박스들에 옵션 추가및 change이벤트 추가
	    selAmountList.forEach(function(item, index){
	        // 1. select 옵션(수량 1~10) 추가
	        item.innerHTML = options;
	
	    })
	})
</script>


<%@ include file="../common/footer.jsp" %>



</body>
<script src="/resources/js/content/contentEdit.js"></script>
</html>