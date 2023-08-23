//post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'post'
					,headers : {'Content-Type' : 'application/json'} 
					,body  : JSON.stringify(obj)
			  })
			//요청 결과json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			//매개로 받은 콜백함수 실행
			.then(map => callback(map))
			
		} catch (e) {
			console.log(e);

		}
	
}

//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert("성공");
		location.href = map.url;
	} else {
		alert("실패");
	}
		
}

$('#registerBtn').click(function () {
	let c_name = $('#c_name').val();
	let c_level = $('#c_level').val();
	let c_able = $('#c_able').val();
	let c_price = $('#c_price').val();
	let c_discount = $('#c_discount').val();
	let c_sellprice = $('#c_sellprice').val();
	let c_content = $('#c_content').val();
	  

	//전달할 객체로 생성
	let obj = {
			c_name : c_name
			,  c_level : c_level
			,  c_able : c_able
			, c_price: c_price
			, c_discount : c_discount
			, c_sellprice : c_sellprice
			, c_content : c_content
			}
	
	fetchPost('/alpha/container/insert', obj, result)

})

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

	$('#c_name').blur(function () {
    	let c_name = $('#c_name').val();
  	  	const isValidcname = /^[가-힣0-9]{6}$/.test(c_name);
	  	  // 결과에 따라 메시지 출력
	  	  if (!isValidcname) {
	  		  signCname.innerHTML = "패키지명은 한글과 숫자로만 구성되고, 6자리 가능합니다.";
	  		  $('#c_name').focus();
	  	    return
	  	  } else{
	  		  signCname.innerHTML = '';	  		  
	  	  }
	})

	$('#c_able').blur(function () {
		// 정규식을 이용하여 한글 숫자로만 구성되고,6자리인지를 검사
    	let c_able = $('#c_able').val();
        if(c_able>=30){
        	signDiscount.innerHTML = '';
        	$('#c_discount').val(c_able+'%');        	
        }else{
        	signDiscount.innerHTML = '학습인원이 30인 이상인 경우 할인 적용됩니다.';
        	$('#c_discount').val(0);
        }
    })
    
    $('#c_price').blur(function () {
    	let c_able = $('#c_able').val();
    	let c_price = $('#c_price').val();
    	if(c_able>=30){
    		let total = c_price * (100-c_able)/100;
    		$('#c_sellprice').val(total);        	
    	}else{
    		$('#c_sellprice').val(c_price);    
    	}
    })
    $('#c_content').blur(function () {
    	let c_content = $('#c_content').val();
    	const isValidcontent = /^[ㄱ-ㅎㅏ-ㅣ가-힣0-9 ]{10,}$/.test(c_content);
    	// 결과에 따라 메시지 출력
    	if (!isValidcontent) {
    		signContent.innerHTML = "10자리 이상 입력하세요";
    		$('#c_content').focus();
    		return
    	} else{
    		signContent.innerHTML = '';	  		  
    	}
    })
    