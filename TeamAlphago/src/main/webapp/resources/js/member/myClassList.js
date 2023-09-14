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
    const userConfirmation = confirm('학습 내역?');
    if (userConfirmation) {
        // 사용자가 "확인"을 선택한 경우
    	submain.innerHTML = '';
    	fetchGet('/alpha/myClassList', resMyClassList)
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }

})

function resMyClassList(map){
	let myList =map.classList
	
	classList.innerHTML += '';
	let pageBlock = ''; // 기존 내용 초기화
    pageBlock += ''                                                                        
				+'	<div class="entry">                                                     '
				+'	<table class="table table-bordered">                                    '
				+'		<caption>학습자 정보</caption>                                         '
				+'		<colgroup>                                                          '
				+'			<col width="10%" />                                             '
				+'			<col width="20%" />                                             '
				+'			<col width="40%" />                                             '
				+'			<col width="15%" />                                             '
				+'			<col width="15%" />                                             '
				+'		</colgroup>                                                         '
				+'		<thead>                                                             '
				+'			<tr>                                                            '
				+'				<th align="center"><input type="checkbox" id="checkboxAll"  '
				+'				name="myCheckbox" onclick="selectAll(this)" value="checked"></th> '
				+'				<th>학습자 이름</th>                                           '
				+'				<th>학습콘텐츠</th>                                             '
				+'				<th>학습시작일</th>                                            '
				+'				<th>학습종료일</th>                                            '
				+'			</tr>                                                           '
				+'		</thead>                                                            '
				+'		<tbody>';
if(LearnerList != null && LearnerList.length > 0){
LearnerList.forEach((Learner)=>{
	console.log('Learner', Learner.m_name);
	pageBlock += ''					
				+'				<tr>                                                        '
				+'					<th align="center"><input type="checkbox" id="checkbox" '
				+'						name="myCheckbox" value="'+Learner.l_no+'"></th>    '
				+'					<td align="center" class="row">'+Learner.m_name+'</td>  '
				+'					<td align="center">'+Learner.c_name+'</td>              '
				+'					<td align="center">'+Learner.g_start+'</td>             '
				+'					<td align="center">'+Learner.g_end+'</td>'
				+'<td style="display: none">'
				+'<input type="hidden" name="h_c_no" id="contentNo" value="'+ Learner.h_c_no +'">'
				+'</td>'
				+'<td style="display: none">'
				+'<input type="hidden" name="l_m_id" id="learnerId" data-lno="'+Learner.l_no+'" value="'+ Learner.l_m_id +'">'
				+'</td>'
				+'<td style="display: none">'
				+'<input type="hidden" name="h_g_no" id="groupNo" value="'+ Learner.h_g_no +'">'
				+'</td>'
				+'</tr>';
});
	pageBlock += ''			
				+'		</tbody>'
				+'	</table>'
				+'</div>';
} else {
	pageBlock +='<tr>'
				+'<td colspan="5" style="text-align: center;">학습자가 존재하지 않습니다.</td>'
				+'</tr>';
}
	learnerInfo.innerHTML += pageBlock;
	
}