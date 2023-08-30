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
// 그룹명 선택시 이벤트 발생
function changeGroup(g_name) {
    var url = '';
    if (g_name === 'listAll') {
        // 현재 페이지의 URL을 가져와서 리로드
        var currentPageURL = window.location.href;
        window.location.href = currentPageURL;
    } else {   
	    $.ajax({
	        url: url,
	        method: 'GET',
	        success: function(response) {
	        	// 성공 시 작업
	        	var url = '/alpha/joinGroup/' + g_name
	        	fetchGet(url, displayGroupList)
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	        }
	    });
    }
}

// 선택 그룹에 따른 그룹 정보 리스트
function displayGroupList(map) {
	console.log("map", map)
	let groupList = map.grplist;
	console.log("groupList", groupList)
	
	groupInfoDiv.innerHTML='';
	let pageBlock = ''; // 기존 내용 초기화

	         pageBlock += ''
						+'	<div class="entry" id="groupInfo">      '
						+'	<table class="table table-bordered">    '
						+'		<caption>그룹 정보</caption>          '
						+'		<colgroup>                          '
						+'			<col width="10%" />             '
						+'			<col width="30%" />             '
						+'			<col width="20%" />             '
						+'			<col width="20%" />             '
						+'			<col width="20%" />             '
						+'		</colgroup>                         '
						+'		<thead>                             '
						+'			<tr>                            '
						+'				<th>선택</th>                '
						+'				<th>학습지도자명</th>          '
						+'				<th>학습기간</th>             '
						+'				<th>가입현황</th>             '
						+'				<th>가입신청</th>             '
						+'			</tr>                           '
						+'		</thead>                            ';
    if(groupList != null){
    	// groupList를 순회하며 테이블 행을 생성하여 추가
    	groupList.forEach((group)=>{
    		console.log(group);
    		pageBlock += ''
    				   + '<tbody>'
    				   +'<tr>' 
	                   +'<th align="center"><input type="checkbox" id="checkbox" name="myCheckbox" value="isChecked"></th>' 
	                   +'<td align ="center" class="row">' + group.t_m_name + '</td>' 
	                   +'<td align="center">' + group.g_period + '</td>' 
	                   +'<td align="center">' + group.g_AppCnt + '</td>' 
	                   +'<td align="center">' 
	                   +'<button class="apply-button" id="applyButton" disabled>신청</button>' 
	                   +'</td>' 
	                   +'</tr>';
    });
    } else {
    			pageBlock +='<tr>'
						+'<td colspan="5" style="text-align: center;">그룹을 선택하여 주세요.</td>'
						+'</tr>';
    }
    			pageBlock += ''
						 +'</tbody>'
						+'</table>'
						+'</div>';
    groupInfoDiv.innerHTML += pageBlock;
}