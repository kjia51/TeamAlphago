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


//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		location.href = map.url;
	} else {
		alert(map.msg);
	}
		
}

    $('#contentEdit').click(function () {
    	let c_id = $('#c_id').val();
    	fetchGet(`/alpha/content/edit/${c_id}`, resultView)

})

function resultView(map){
    	let divStr = ''
    	
    	 
    }

    