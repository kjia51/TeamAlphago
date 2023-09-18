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
	let m_id = $('#m_id').val();
	if(map.result == 'success'){
		const userConfirmation = confirm(map.msg);
		if(userConfirmation){
	    	submain.innerHTML = '';
	    	fetchGet('/alpha/myClassList', resultEditList)	
		}
	} else {
		alert(map.msg);
	}
		
}

$('#myClassList').click(function () {
 

        // 사용자가 "확인"을 선택한 경우
    	submain.innerHTML = '';
    	classListDiv.innerHTML = '';
    	fetchGet('/alpha/myClassList', resMyClassList)

        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    

})

function resMyClassList(map){
	console.log("map", map);
	let myList = map.classList;
	
	console.log("myList", myList);
	

	let pageBlock = ''; // 기존 내용 초기화
	    pageBlock += ''
					+'<div class="titleBox">'
					+'    <h1 class="t_titlet">학습 내역</h1>'
					+'</div>'
					+'	<div class="entry">                                                     '
					+'	<table class="table table-bordered">                                    '
					+'		<caption>학습 내역 조회</caption>                                         '
					+'		<colgroup>                                                          '
					+'			<col width="5%" />                                             '
					+'			<col width="25%" />                                             '
					+'			<col width="10%" />                                             '
					+'			<col width="30%" />                                             '
					+'			<col width="15%" />                                             '
					+'			<col width="15%" />                                             '
					+'		</colgroup>                                                         '
					+'		<thead>                                                             '
					+'			<tr>                                                            '
					+'				<th>No</th>                                                 '
					+'				<th>수강 중인 콘텐츠</th>                                           '
					+'				<th>그룹</th>                                                 '
					+'				<th>숙제 현황</th>                                               '
					+'				<th>학습종료일</th>                                              '
					+'				<th>숙제 평가</th>                                              '
					+'			</tr>                                                           '
					+'		</thead>                                                            '
					+'		<tbody>';
	if(myList != null && myList.length > 0){
		myList.forEach((list, index)=>{
		console.log('list', list.g_name);
		pageBlock += ''					
					+'				<tr>                                                        '
					+'					<th align="center">'+ (index+1) +'</th>                 '
					+'					<td align="center" class="row">'+list.c_name+'</td>     '
					+'					<td align="center">'+list.g_name+'</td>                 '
					+'					<td align="center">'
					if (list.h_homework !== null) {
			                // h_homework가 null이 아닌 경우, 페이지 이동 링크 추가
		pageBlock += '<a href="/alpha/submitHomework?l_m_id=' + list.l_m_id + '">' + list.h_homework + '</a>';
					} else {
			                // h_homework가 null인 경우, "숙제가 없습니다" 출력
		pageBlock += '숙제가 없습니다';
					}		
		pageBlock += '</td>'

					+'					<td align="center">'+list.g_end+'</td>'
					+'    <td align="center">'+ (list.h_review !== null ? list.h_review : '') +'</td>'

					+'             </tr>';
	});
		pageBlock += ''			
					+'		</tbody>'
					+'	</table>'
					+'</div>';
	} else {
		pageBlock +='<tr>'
					+'<td colspan="6" style="text-align: center;">학습 내역이 존재하지 않습니다.</td>'
					+'</tr>';
	}
		classListDiv.innerHTML += pageBlock;
	
}

