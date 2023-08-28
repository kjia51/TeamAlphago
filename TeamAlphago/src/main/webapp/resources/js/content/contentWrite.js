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
		alert(map.msg);
	} else {
		alert(map.msg);
	}
		
}

//get방식 요청
function fetchGet(url,callback){
	console.log(url);
	console.log(callback);
	
	try {
	//url 요청
	fetch(url)
		//요청 결과json 문자열을 javascript 객체로 반환
		.then(response => response.json())
		//매개로 받은 콜백함수 실행
		.then(map => callback(map));
		
	} catch (e) {
		console.log(e);
	}
	
	
}

$('#registerBtn').click(function () {
	let c_name = $('#c_name').val();
	let c_level = $('#c_level').val();
	let c_able = $('#poss_able').val();
	let c_price = $('#c_price').val();
	let c_discount = $('#c_discount').val();
	let c_sellprice = $('#c_sellprice').val();
	let c_content = $('#c_content').val();
	  
	console.log(c_able);
	console.log(c_price);
	console.log(c_name);
	console.log(c_level);
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
	
	fetchPost('/alpha/content/insert', obj, getContentList)

})

window.addEventListener('load', function(){
    // select박스 목록 선택
    let selAmountList = document.querySelectorAll("[name=selAmount]");
    // select 옵션
    let options = '';
    for(let i=1;i<=10;i++){
        options += `<option value='${i}'>${i*10}${i==10?'+':''}</option>`
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
        if(c_able>=3){
        	signDiscount.innerHTML = '';
        	$('#c_discount').val(c_able*10+'%');        	
        }else{
        	signDiscount.innerHTML = '학습인원이 30인 이상인 경우 할인 적용됩니다.';
        	$('#c_discount').val(0);
        }
        
        p_able.innerHTML='';
        for(let i=1;i<=c_able;i++){
        	p_able.innerHTML += `<button type="button" value="${i}" class="blue" style="width:40px;height:30px; margin-right:25px" id="btn">${i*10}</button>`
        }
        
        let buttons = document.querySelectorAll("#btn");

        let btnAll = '';
        buttons.forEach(button => {
          button.addEventListener("click", () => {
        	  let btnValue = button.getAttribute("value");
        	  let isDisabled = button.classList.contains("disabled");
            if (isDisabled) {
              button.classList.remove("disabled");
              console.log(`버튼 ${btnValue} 활성화`);
            } else {
              button.classList.add("disabled");
              console.log(`버튼 ${btnValue} 비활성화`);
              if(btnAll == ""){

            	  btnAll = btnValue*10;
            	  } else {
            	  btnAll = btnAll + ',' + btnValue*10;
            	  }
              $('#poss_able').val(btnAll);
              console.log(btnAll);
            }
          });
        });
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
    
//    let isDisabled = false;
//	$('#btn').click(function () {
//      if (isDisabled) {
//    	  btn.classList.remove("disabled");
//      } else {
//    	  btn.classList.add("disabled");
//      }
//      isDisabled = !isDisabled;
//    });
	
//	$("input[type=button]").click(function () {
//	    var get_btn = $("input[type=button]");
//	    $.each(get_btn, function (index, value) {
//	        console.log('인덱스값' + index);
//	        console.log(value);
//	    });
//	});


//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
	} else {
		alert(map.msg);
	}
		
}



//덧글 조회 및 출력
function getContentList(){

	let c_no = $('#c_no').val();
	console.log(c_no);
	fetchGet('/alpha/content/list/${c_no}', result)
}



function resultList(map){
		let vo = map.contentVO;
		console.log(vo);
		titleInfo.innerHTML += ''
    		+'             <table class="table table-bordered table-form">'
    		+'                 <caption>글쓰기</caption>'
    		+'                 <colgroup>'
    		+'                     <col width="25%">'
    		+'                     <col width="75%">'
    		+'                 </colgroup>'
    		+'                 <tbody>'
    		+'                     <tr>'
    		+'                         <th scope="row">패키지명</th>'
    		+'                         <td>'
    		+'                         <div id="signCname" style="color:red"></div>'
    		+'                         <input type="text" class="input-default" id="c_name" style="width: 97%" maxlength="100" name="title" value="'+vo.c_name+'">'
    		+'                         </td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습난이도</th>'
    		+'                         <td>'
    		+'                               <select title="검색 분류" name="c_level" id="c_level" value="'+vo.c_level+'" }>'
    		+'                                                <option value="1"> 초급 </option>'
    		+'                                                <option value="2"> 중급 </option>'
    		+'                                                <option value="3"> 고급 </option>'
    		+'                               </select> '
    		+'							</td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습가능인원</th>'
    		+'                         <td>'
    		+'		                        <select name="selAmount" data-index="index" id="'+vo.c_able+'">'
    		+'		                        </select>'
    		+'                         </td>'
    		+'                         '
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">정가</th>'
    		+'                         <td><input type="text" class="input-default" id="c_price" style="width: 97%" maxlength="100" name="c_price" value="'+vo.c_price+'"></td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">할인율</th>'
    		+'                         <td><input type="text" class="input-default" id="c_discount" style="width: 97%" maxlength="100" name="title" value="'+vo.c_discount+'" disabled></td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">판매가</th>'
    		+'                         <td><input type="text" class="input-default" id="c_sellprice" style="width: 97%" maxlength="100" name="title" value="'+vo.c_sellprice+'" disabled></td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">콘텐츠 내용</th>'
    		+'                         <td><textarea id="c_content" placeholder="10자 이상 입력하세요" style="width:100%; height:450px; border: solid #ccc 1px;">'+vo.c_content+'</textarea></td>'
    		+'                     </tr>'
    		+'                 </tbody>'
    		+'             </table>'
    }
    