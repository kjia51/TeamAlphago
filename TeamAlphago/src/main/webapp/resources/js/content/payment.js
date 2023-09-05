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

function getContent(idx) {
	
	var c_no = $('#c_no').val();
    var m_id = $('#m_id').val();
    var c_name = $('#c_name').val();
    var today = getsys();
    var price =  $('td:eq(5)').text();
    var sub_month = ($('#c_period').val()*3); //구독개월수
    var sub_able = $('#cnt').val(); 
    
    let list = {
    		c_no : c_no
    		,m_id : m_id
    		,today : today
    		,price : price
    		,c_name : c_name
    		,sub_month : sub_month
    		, sub_able : sub_able
    }
    
    return list;
}


$('#payment').click(function () { //결제버튼
	
	checkLogin(); //로그인 체크
	
	//alert('a');

	var idx = -1;

	var IMP = window.IMP;
	IMP.init('imp07586387');
	
	
	$('input:checkbox[name=chkbox]').each(function() {
		   if(this.checked){//checked 처리된 항목의 값
		   idx = $('input:checkbox[name=chkbox]').index(this); 		   
		   console.log(idx);
		   return false;;
		   }
	});
	
	var list = getContent(idx);
                     
    //DOM객체들에서 사용할 데이터 뽑기
	
	var c_no = list.c_no;
    var m_id = list.m_id;
    var c_name = list.c_name;
    var today = list.today;
    var price = list.price;
    var sub_able =  list.sub_able;
    var sub_month = list.sub_month;
    
    console.log('콘텐츠번호 '+c_no);
    console.log('회원ID '+m_id);
    console.log('콘텐츠명 '+c_name);
    console.log('구독일 '+today);
    console.log('총가격 '+price);
    console.log('정원 '+sub_able);
    console.log('구독개월 '+sub_month);

	
                  
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
                        	sub_no: rsp.imp_uid, //거래번호(구독ID)
                        	sub_c_no: c_no, //콘텐츠id
                           	t_m_id: m_id, //회원id
                           	sub_date: today, //구독날짜
                           	sub_price: price, //가격
                           	sub_able: sub_able, //정원
                           	sub_month: sub_month, //구독개월수

                           	
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