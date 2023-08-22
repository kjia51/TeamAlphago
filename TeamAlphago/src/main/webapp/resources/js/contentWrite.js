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
		alert(map.message);
	} else {
		alert(map.message);
	}
		
}
registerBtn.addEventListener('click', function(e){
	let c_name = document.querySelector('#c_name').value;
	let c_level = document.querySelector('#c_level').value;
	let c_able = document.querySelector('#c_able').value;
	let c_price = document.querySelector('#c_price').value;
	let c_discount = document.querySelector('#c_discount').value;
	let c_sellprice = document.querySelector('#c_sellprice').value;
	let c_content = document.querySelector('#c_content').value;

	
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
	
	fetchPost('/container/insert/', obj, result)

})