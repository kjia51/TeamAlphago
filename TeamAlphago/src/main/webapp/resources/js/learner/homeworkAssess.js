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

//그룹 선택시 이벤트 발생 
function selectGroupHw(g_no) {
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

 
 
//선택 그룹에 따른 그룹 정보 리스트 출력
function displayLearnerList(map) {
	console.log("map", map)
	let LearnerList = map.LearnerList_h;
	console.log("LearnerList", LearnerList)
	
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
						+'					<th>학습자 이름</th>        '
						+'					<th>제출기한</th>          '
						+'					<th>제출일자</th>          '
						+'					<th>콘텐츠이름</th>        '
						+'					<th>학습내용</th>          '
						+'					<th>평가</th>             '
						+'				</tr>                        '
						+'			</thead>                         '
						+'			<tbody>							 ';			
	if(LearnerList != null){
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
						+'<td style="display: ">'
						+'<input type="text" name="l_m_id" id="learnerId" data-lno="'+Learner.l_no+'" value="'+ Learner.l_m_id +'">'
						+'</td>'
						+'<td style="display: none">'
						+'<input type="hidden" name="h_g_no" id="groupNo" value="'+ Learner.h_g_no +'">'
						+'</td>'
						+'</tr>';
		})
						
						
			pageBlock += ''			
						+'		</tbody>'
						+'	</table>'
						+'</div>';
	} else {
			pageBlock +='<tr>'
						+'<td colspan="6" style="text-align: center;">그룹을 선택하여 주세요.</td>'
						+'</tr>';
	}
			learnerInfo.innerHTML += pageBlock;
}

