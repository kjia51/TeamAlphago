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
	                   +'<button class="apply-button" id="applyButton" onclick="applyButton()">신청</button>' 
	                   +'</td>'
	                   +'<td style="display: none;">                                                  '
					   +'<input type="hidden" name="t_m_id" id="teacherId" value="${grplist.t_m_id}"> '
					   +'</td>                                                                        '
					   +'<td style="display: none;">	                                              '
					   +'<input type="hidden" name="l_g_no" id="groupNo" value="${grplist.l_g_no}">   '
					   +'</td>                                                                        '
					   +'<td style="display: none;">		                                          '
					   +'<input type="hidden" name="l_c_no" id="contentNo" value="${grplist.l_c_no}"> '
					   +'</td>                                                                        '
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

//'신청' 버튼 클릭 이벤트 처리
function applyButton() {
    var checkbox = $(event.target).closest('tr').find('input[type="checkbox"]');
    var applyButton = $(event.target);

    if (!checkbox.prop('checked')) {
        // 체크 박스가 선택되어 있지 않은 경우 - 알림 및 버튼 비활성화
        alert('신청하실 그룹을 선택하여 주세요.');
        applyButton.prop('disabled', true);
    } else {
         // 체크 박스가 선택되어 있는 경우 - 버튼 활성화
		 // 체크된 행을 찾습니다.
		var checkedRow = document.querySelector('input[name="myCheckbox"]:checked').closest('tr');
		
		// 각 input 요소에서 값을 가져옵니다.
		var l_m_id = checkedRow.querySelector('#memberId').value;
		var t_m_id = checkedRow.querySelector('#teacherId').value;
		var l_g_no = checkedRow.querySelector('#groupNo').value;
		var l_c_no = checkedRow.querySelector('#contentNo').value;
		
		console.log("l_m_id");
		console.log("t_m_id");
		console.log("l_g_no");
		console.log("l_c_no");
		
		// fetch 요청을 보냅니다.
		fetch('/groupApply', {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/json'
		    },
		    body: JSON.stringify({
		        l_m_id: l_m_id,
		    	t_m_id: t_m_id,
		        l_g_no: l_g_no,
		        l_c_no: l_c_no
		         
		    })
		})
		.then(response => response.json())
		.then(data => {
		    // fetch 요청이 성공한 경우의 처리
		    console.log("data", data);
		    alert('신청되었습니다.');
		})
		.catch(error => {
		    // fetch 요청이 실패한 경우의 처리
		    console.error(error);
		});
    }
}
//체크 박스 클릭 이벤트 처리
$(document).on('click', 'input[type="checkbox"]', function() {
    var applyButton = $(this).closest('tr').find('.apply-button');
    
    if ($(this).prop('checked')) {
        // 체크 박스가 선택된 경우 - 버튼 활성화
        applyButton.prop('disabled', false);
    } else {
        // 체크 박스가 선택되어 있지 않은 경우 - 버튼 비활성화
        applyButton.prop('disabled', true);
    }
});

