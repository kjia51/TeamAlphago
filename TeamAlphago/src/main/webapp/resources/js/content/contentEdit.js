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

//put방식 요청
function fetchPut(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'put'
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
//DELETE 방식 요청
function fetchDelete(url, callback) {
    console.log(url);
    console.log(callback);

    try {
        // URL 요청
        fetch(url, {
            method: "DELETE"
        })
        // 요청 결과 JSON 문자열을 JavaScript 객체로 반환
        .then(response => response.json())
        // 매개로 받은 콜백 함수 실행
        .then(data => callback(data));
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




$('#contentEdit').click(function () {
	getContentList()

})

$('#contentDelete').click(function () {
	let c_no = $('#c_no').val();
	fetchDelete('/alpha/content/DeleteAction/'+c_no, result)
	
})
    
    
    
//덧글 조회 및 출력
function getContentList(){

	let c_no = $('#c_no').val();
	container.innerHTML = '';
	fetchGet('/alpha/content/list/'+c_no, resultList)
}



function resultList(map){
		let vo = map.contentVO;
		console.log(vo.c_level);
		console.log(vo.c_able);
		container.innerHTML += ''
			+'	<div id="container">'
			+'    <div class="wrap">'
			+'        <div class="content_wrap">'
			+'            <div id="titleBox" style="padding: 60px 0px 50px">'
			+'                <h2 class="t_title">학습콘텐츠 수정</h2>'
			+'            </div>'
			+'            <form class="content" id="content">'
    		+'             <input type="text" class="input-default" id="c_no" style="width: 97%" maxlength="100" name="c_no" value="'+vo.c_no+'">'
			+'                <div class="writeForm1">'
			+'			       <div id="titleInfo">'
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
    		+'                                                <option value="1" ${'+vo.c_level+' eq "1" ? "selected" : "" }> 초급 </option>'
    		+'                                                <option value="2" ${'+vo.c_level+' eq "2" ? "selected" : "" }> 중급 </option>'
    		+'                                                <option value="3" ${'+vo.c_level+' eq "3" ? "selected" : "" }> 고급 </option>'
    		+'                               </select> '
    		+'							</td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습가능인원</th>'
    		+'                         <td>'
    		+'		                        <select name="selAmount" data-index="index" id="c_able" value="'+vo.c_able+'">'
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
    		+'                         <td>'
    		+'						<div id="signDiscount"  style="color:red"></div>'
    		+'						<input type="text" class="input-default" id="c_discount" style="width: 97%" maxlength="100" name="c_discount" value="'+vo.c_discount+'" disabled></td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">판매가</th>'
    		+'                         <td><input type="text" class="input-default" id="c_sellprice" style="width: 97%" maxlength="100" name="c_sellprice" value="'+vo.c_sellprice+'" disabled></td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">콘텐츠 내용</th>'
    		+'                         <td>'
    		+'							<div id="signContent"  style="color:red"></div>'
    		+'							<textarea id="c_content" placeholder="10자 이상 입력하세요" style="width:100%; height:450px; border: solid #ccc 1px;">'+vo.c_content+'</textarea></td>'
    		+'                     </tr>'
    		+'                 </tbody>'
    		+'             </table>'
    		+'</div>'
    		+'                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">'
    		+'                                                    <span class="btn btn-point btn-lg"><button type="button" id="editBtn" data-route="one/add/user/">수정</button></span>'
    		+'                                                                            <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>'
    		+'                    </div>'
    		+'                </div>'
    		+'            </form>'
    		+'        </div>'
    		+'    </div>'
    		+'</div>'
    		
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
		    	let c_price = $('#c_price').val();
		        if(c_able>=30){
		        	signDiscount.innerHTML = '';
		        	$('#c_discount').val(c_able+'%');      
		    		let total = c_price * (100-c_able)/100;
		    		$('#c_sellprice').val(total);  
		        }else{
		        	signDiscount.innerHTML = '학습인원이 30인 이상인 경우 할인 적용됩니다.';
		        	$('#c_discount').val(0);
		        	$('#c_sellprice').val(c_price);
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
    
			
			$('#editBtn').click(function () {
			let c_name = $('#c_name').val();
			let c_level = $('#c_level').val();
			let c_able = $('#c_able').val();
			let c_price = $('#c_price').val();
			let c_discount = $('#c_discount').val();
			let c_sellprice = $('#c_sellprice').val();
			let c_content = $('#c_content').val();
			let c_no = $('c_no').val();
			  

			//전달할 객체로 생성
			let obj = {
					c_name : c_name
					,  c_level : c_level
					,  c_able : c_able
					, c_price: c_price
					, c_discount : c_discount
					, c_sellprice : c_sellprice
					, c_content : c_content
					, c_no : c_no
					}
			
			fetchPut('/alpha/content/EditAction', obj, result)
		
		})
		$('#editBtn').click(function () {
			let c_name = $('#c_name').val();
			let c_level = $('#c_level').val();
			let c_able = $('#c_able').val();
			let c_price = $('#c_price').val();
			let c_discount = $('#c_discount').val();
			let c_sellprice = $('#c_sellprice').val();
			let c_content = $('#c_content').val();
			let c_no = $('#c_no').val();

			//전달할 객체로 생성
			let obj = {
					c_name : c_name
					,  c_level : c_level
					,  c_able : c_able
					, c_price: c_price
					, c_discount : c_discount
					, c_sellprice : c_sellprice
					, c_content : c_content
					, c_no : c_no
			}
			
			fetchPut('/alpha/content/EditAction', obj, result)
			
		})
	
		
}

let indexAll = [];

function getCart(index) {
    // 중복 검사
    const existingIndex = indexAll.indexOf(index);
    
    if (existingIndex === -1) {
        indexAll.push(index);
        var c_no = $('input[data-cno="'+index+'"]').val();
        var c_name = $('input[data-cname="'+index+'"]').val();
        var price = $('input[data-price="'+index+'"]').val();
        var c_able =  $('input[data-cnt="'+index+'"]').val();
        var m_id =  $('input[data-mid="'+index+'"]').val();
    } else {
        indexAll.splice(existingIndex, 1);
    }
    

    let list = {
    		c_no : c_no
    		,c_name : c_name
    		,price : price
    		,c_able : c_able
    		,m_id : m_id
    }
    
    console.log('list', list);
    
    return list;

}
$('#cartContent').click(function () {
	
	var idx = -1;
	
	$('input:checkbox[name=chkbox]').each(function() {
		   if(this.checked){//checked 처리된 항목의 값
			   idx = $('input:checkbox[name=chkbox]').index(this); 		   
			   console.log(idx);
			   return false;
		   }
	});
	
	var list = getCart(idx);
	console.log(list);
	let cr_m_no = list.m_id;
	let cr_c_no = list.c_no;
	let cnt = list.c_able;

	console.log("cr_m_no",cr_m_no)
	console.log("cr_c_no",cr_c_no)
	console.log("cnt",cnt)
	//전달할 객체로 생성
	let obj = {
		cr_m_no : cr_m_no,
		cr_c_no : cr_c_no,
		cnt : cnt
			}
	
	fetchPost('/alpha/cart/insert', obj, resultCart)

})
  

function resultCart(map){
	let cr_c_no = $('#c_no').val();
	console.log(cr_c_no);
	console.log()
	fetchGet('/alpha/cart/list/'+cr_c_no, result)
}



    