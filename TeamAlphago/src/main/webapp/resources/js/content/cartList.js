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
		window.location.href = "/alpha/teacher";
	} else {
		alert(map.msg);
	}
		
}
window.addEventListener('load', function(){
	let cr_m_no = $('#m_id').val();
	console.log("cr_m_no",cr_m_no);
	fetchGet('/alpha/mycart/list/'+cr_m_no, resultList);
	
})
function resultList(map){
		let cartList = map.cartList;
		console.log("cartList",cartList);
	    tbdy.innerHTML='';
		cartList.forEach((cart,index) => {
			let c_no = cart.c_no;
	    	let c_name = cart.c_name;
	    	let cnt = cart.cnt;
	    	let c_level = cart.c_level;
	    	let c_discountrate = cart.c_discountrate;
	    	let c_price = cart.c_price;
	    	let c_sellprice = cart.c_sellprice;
	        var row = document.createElement('tr');
	        row.innerHTML = `
	        	<td><input type="checkbox" name="chkbox" value=${index}></td>
	        	<td>${index+1}</td>
	        	<td>${c_name}</td>
	        	<td>${c_level}</td>
	            <td>${cnt}</td>
	        	<td style="color:red">[${c_discountrate}]${c_sellprice}원</td>
	        `;
	        tbdy.appendChild(row);
		})
		}
	function chkboxAll(){
		var selectedIndexes = [];
	    $('input:checkbox[name=chkbox]').each(function() {
		 if(!this.checked){
			 this.checked=true;
			 selectedIndexes.pop($('input:checkbox[name=chkbox]').index(this))
		 } else{
			 this.checked=false;
			 selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
		 }
	    })
	     
		 console.log(selectedIndexes);
	}

	$('#deleteOption').on('click', function() {
	let cr_m_no = $('#m_id').val();
	console.log(cr_m_no);
	var selectedIndexes = [];
	
    $('input:checkbox[name=chkbox]').each(function() {
        if (this.checked) {
            selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
        }
    })
        console.log(selectedIndexes);
    
    const promises = selectedIndexes.forEach(function(index) {
    	let cr_c_no = $('input[data-cno="'+index+'"]').val();
    	console.log(cr_c_no);
    	// 확인과 취소를 묻는 알림창 표시
        const userConfirmation = confirm('정말로 삭제하시겠습니까?');
        
        if (userConfirmation) {
            // 사용자가 "확인"을 선택한 경우
            fetchDelete('/alpha/content/DeleteCart/' + cr_c_no + '/' + cr_m_no, result);
            
        } else {
            // 사용자가 "취소"를 선택한 경우
            // 아무 작업도 수행하지 않음
        	return Promise.resolve();
        }
});
		Promise.all(promises)
		.then(function(results) {
		    console.log('모든 삭제 작업이 완료되었습니다.');
		    // 여기에서 results 배열에 각 프로미스의 결과가 들어 있습니다.
		    // 이제 result 함수를 실행할 수 있습니다.
		
		    result(results);
		})
		.catch(function(error) {
		    console.error('삭제 중 오류 발생:', error);
		    // 오류 처리
		});
		
		})

    