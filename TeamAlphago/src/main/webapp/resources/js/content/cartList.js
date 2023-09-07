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
		window.location.href = "/alpha/mycart";
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
	        	<input type="hidden" data-cno=${index} value=${c_no}>
	        	<input type="hidden" data-cnt=${index} value=${cnt}>
	        	<input type="hidden" data-cprice=${index} value=${c_price}>
	        `;
	        tbdy.appendChild(row);
		})
		}
//	function chkboxAll(){
//		var selectedIndexes = [];
//	    $('input:checkbox[name=chkbox]').each(function() {
//		 if(!this.checked){
//			 this.checked=true;
//			 selectedIndexes.pop($('input:checkbox[name=chkbox]').index(this))
//		 } else{
//			 this.checked=false;
//			 selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
//		 }
//	    })
//	     
//		 console.log(selectedIndexes);
//	}




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
        selectedIndexes.forEach(function(index) {
    	let cr_c_no = $('input[data-cno="'+index+'"]').val();
    	let cnt = $('input[data-cnt="'+index+'"]').val();
    	console.log(cr_c_no);
    	// 확인과 취소를 묻는 알림창 표시
        const userConfirmation = confirm('정말로 삭제하시겠습니까?');
        
        if (userConfirmation) {
            // 사용자가 "확인"을 선택한 경우
            fetchDelete('/alpha/content/DeleteCart/' + cr_c_no + '/' + cr_m_no + '/' + cnt, result);
            
        } else {
            // 사용자가 "취소"를 선택한 경우
            // 아무 작업도 수행하지 않음
        }


})
})
$('#payOption').on('click', function() {
	var selectedIndexes = [];
	
	$('input:checkbox[name=chkbox]').each(function() {
		if (this.checked) {
			selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
		}
	});
    if($('#m_id').val()==null || $('#m_id').val()==''){
    	alert('로그인 후 이용가능합니다.')
    } else{
		if($('input:checkbox[name=chkbox]:checked').length==0){
			alert('구매하실 콘텐츠를 선택하세요');
		} else if($('input:checkbox[name=chkbox]:checked').length>1){
			alert('최대 1개까지 구매 가능합니다');
		}else {
			
			tbdy.innerHTML='';
			var listArray = getCart(selectedIndexes);
			console.log("listArray",listArray);
			
			listArray.forEach((list,index) => {
				let cname = list.c_name;
				let cprice = list.price;
				let cnt = list.c_able;
				var row = document.createElement('tr');
				row.innerHTML = `
					<td>${index+1}</td>
					<td>${cname}</td>
					<td>${cnt}명</td>
					<td>${cprice}</td>
					<td>
		       			<select title="검색 분류" name="c_period" id="c_period" style="font-size:1em" >
								<option value="0">기간선택</option>
		                        <option value="1">3개월</option>
		                        <option value="2">6개월</option>
		                        <option value="3">9개월</option>
								<option value="4">12개월</option>
		                </select>
					</td>
					<td></td>
					`;
				tbdy.appendChild(row);
			});
			$(document).on('change', 'select[name=c_period]', function() {
			    var rowIndex = $(this).closest('tr').index(); // 해당 행의 인덱스 가져오기
			    var selectedPeriod = $(this).val(); // 선택한 기간 값 가져오기
			    var cprice = listArray[rowIndex].price; // 해당 행의 원래 가격 가져오기
			    console.log(rowIndex);
			    var calculatedPrice = cprice * selectedPeriod; // 계산된 가격
		
			    // 해당 행의 가격 업데이트
			    $('td:eq(5)', $(this).closest('tr')).text(calculatedPrice);
			});
			// 모달창 띄우기
			modal('payList');
		    console.log("listArray",listArray);
		    console.log("$('#c_period').val()",$('#c_period').val());
				}
    }
});

function getCart(index) {
	let indexAll = []; // 중복 제거된 인덱스들을 담는 배열
    // 중복 검사
	console.log("getCartIndex", index)
    const existingIndex = indexAll.indexOf(index);
    
    if (existingIndex === -1) {
        indexAll.push(index);
    } else {
        indexAll.splice(existingIndex, 1);
    }

    let listArray = []; // 여러 선택 항목을 저장할 배열
    console.log("getCartindexAll", indexAll)

    // 모든 선택된 인덱스에 대해 데이터를 수집하여 배열에 추가
    indexAll[0].forEach(function(index) {
    	console.log("index", index)
        var c_no = $('input[data-cno="'+index+'"]').val();
        var c_name = $('input[data-cname="'+index+'"]').val();
        var price = $('input[data-price="'+index+'"]').val();
        var c_able =  $('input[data-cnt="'+index+'"]').val();
        var m_id =  $('input[data-mid="'+index+'"]').val();

        console.log("c_no", c_no);
        console.log("c_name", c_name);
        console.log("c_able", c_able);
        
        let item = {
            c_no: c_no,
            c_name: c_name,
            price: price,
            c_able: c_able,
            m_id: m_id
        };

        listArray.push(item);
    });
    
    return listArray; // 모든 선택 항목의 데이터를 배열로 반환
}
    