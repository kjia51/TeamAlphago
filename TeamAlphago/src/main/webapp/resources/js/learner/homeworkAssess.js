//get방식 
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
		consol.log('fetchGet', e);
	}

}

// fetch Post 방식
function fetchPost(url, obj, callback){
	try {
	fetch(url, {method : 'post', headers : {'Content-Type' : 'application/json'}, body : JSON.stringify(obj)})
	.then(response => response.json())
	.then(map => callback(map));
		
	} catch (e) {
		consol.log('fetchPost',e);
	}
}
//등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		var memberId = $('#memberId').val();
		window.location.href = "/alpha/homeworkAssess?t_m_id=" + memberId;
	} else {
		alert(map.msg);
	}
		
}

//그룹 선택시 이벤트 발생 
function selectGroup(g_no) {
	console.log("g_no", g_no); 
 var url = '';
	    $.ajax({
	        url: '/alpha/homeworkAssess/' + g_no,
	        method: 'GET',
	        success: function(response) {
	        	// 성공 시 작업
				var url = '/alpha/homeworkAssess/' + g_no;
	        	fetchGet(url, displayLearnerList)
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	        	console.log(error)
	        }
	    });
} 

 
 
//선택 그룹에 따른 학습자 리스트 출력
function displayLearnerList(map) {
	console.log("map", map)
	let submittedList = map.submittedList;
	console.log("submittedList", submittedList)
	
	learnerInfoDiv.innerHTML='';
	let pageBlock = ''; // 기존 내용 초기화
	         pageBlock += ''                                                                        
						+'	<div class="entry" id="learnerInfo">     '
						+'		<table class="table table-bordered"> '
						+'			<caption>그룹 정보</caption>        '
						+'			<colgroup>                       '
						+'				<col width="5%" />           '
						+'				<col width="15%" />          '
						+'				<col width="15%" />          '
						+'				<col width="15%" />          '
						+'				<col width="20%" />          '
						+'				<col width="20%" />          '
						+'				<col width="10%" />          '
						+'			</colgroup>                      '
						+'			<thead>                          '
						+'				<tr>                         '
						+'					<th>No.</th>             '
						+'					<th>학습자 이름</th>'
						+'					<th>제출기한</th>'
						+'					<th>제출일자</th>'
						+'					<th>콘텐츠이름</th>'
						+'					<th>학습내용</th>          '
						+'					<th>평가</th>             '
						+'				</tr>                        '
						+'			</thead>                         '
						+'			<tbody>							 ';			
	if(submittedList != null){
		submittedList.forEach((homework)=>{
 		console.log('homework', homework.m_name);
 		pageBlock += ''					
						+'<tr>'
						+'		<th align="center">'+ index+1 +'</th>'
						+'		<td align="center" class="row">'+homework.m_name+'</td>  '
						+'		<td align="center">'+homework.h_limit+'</td>'
						+'		<td align="center">'+homework.h_regidate+'</td>'
						+'		<td align="center">'+homework.c_name+'</td>'
						+'		<td align="center">'+homework.h_content+'</td>'
						+'		<td align="center">'
						+'<select name="h_review" onchange="assess(this.value);" value="">'
						+'<option value="selectop">선택</option>'
						+'<option value="Excellent">우수</option>'
						+'<option value="Good">보통</option>'
						+'<option value="Poor">미흡</option>'
						+'</select>'
						+'		</td>'
						+'</tr>';
		})
			pageBlock += ''			
						+'		</tbody>'
						+'	</table>'
						+'</div>';
	} else {
			pageBlock +='<tr>'
						+'<td colspan="7" style="text-align: center;">그룹을 선택하여 주세요.</td>'
						+'</tr>';
	}
	learnerInfoDiv.innerHTML += pageBlock;
}















