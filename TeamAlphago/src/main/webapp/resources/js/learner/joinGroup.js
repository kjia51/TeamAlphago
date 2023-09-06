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
	console.log("g_name", g_name); 
    var url = '';
    if (g_name === 'listAll') {
        // 현재 페이지의 URL을 가져와서 리로드
        var currentPageURL = "/alpha/joinGroup";
        window.location.href = currentPageURL;
    } else {   
	    $.ajax({
	        url: '/alpha/joinGroup/' + g_name,
	        method: 'GET',
	        success: function(response) {
	        	// 성공 시 작업
	        	
				var url = '/alpha/joinGroup/' + g_name;
	        	fetchGet(url, displayGroupList)
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	        	console.log(error)
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
    		console.log('group', group);
    		console.log("그룹 중복 카운트", group.dupGrpCount);
    		pageBlock += ''
    				   + '<tbody>'
    				   +'<tr>' 
	                   +'<th align="center"><input type="checkbox" id="checkbox" name="myCheckbox" value="isChecked"></th>' 
	                   +'<td align ="center" class="row">' + group.t_m_name + '</td>' 
	                   +'<td align="center">' + group.g_period + '</td>' 
	                   +'<td align="center">' + group.g_AppCnt + '</td>' 
	                   +'<td align="center">'; 
	                   if(group.dupGrpCount == 0){
	                   pageBlock += '<button class="apply-button" id="applyButton" onclick="applyButton()">신청하기</button>' 
					   pageBlock += '</td>'
					            +'<td style="display: none;">                                                  '
								+'<input type="hidden" name="t_m_id" id="teacherId" value="' + group.t_m_id + '"> '
								+'</td>                                                                        '
								+'<td style="display: none;">	                                              '
								+'<input type="hidden" name="l_g_no" id="groupNo" value="' + group.l_g_no + '">   '
								+'</td>                                                                        '
								+'<td style="display: none;">		                                          '
								+'<input type="hidden" name="l_c_no" id="contentNo" value="' + group.l_c_no + '"> '
								+'</td>                                                                        '
								+'<td style="display: none;">'
								+'<input type="hidden" name="sub_able" id="ableGrpCnt" value="'+ group.sub_able +'">'
								+'</td>'
								+'<td style="display: none;">'
								+'<input type="hidden" name="g_cnt" id="currentGrpCnt" value="'+ group.g_cnt +'">'
								+'</td>'
								+'</tr>';
	                   }else{
	                   pageBlock += '<button class="apply-button" id="applyDuple" disabled>신청완료</button>' 
	                   }
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
document.addEventListener('click', function() {
    if (event.target && event.target.type === 'checkbox') {
        var applyButton = event.target.closest('tr').querySelector('.apply-button');
        
        if (event.target.checked) {
            // 체크 박스가 선택된 경우 - 버튼 활성화
            applyButton.disabled = false;
        } else {
            // 체크 박스가 선택되어 있지 않은 경우 - 버튼 비활성화
            applyButton.disabled = true;
            alert('신청하실 그룹을 선택하여 주세요.');
        }
    }
});
//'신청' 버튼 클릭 이벤트 처리
function applyButton() {
	// 체크된 행
	let checkedRow = document.querySelector('input[name="myCheckbox"]:checked').closest('tr');
	let inputMid = document.querySelector('#memberId');
	let inputDiv = document.querySelector('#division');
	
	let checkbox = $(event.target).closest('tr').find('input[type="checkbox"]');
	let applyButton = $(event.target);
	
	// 각 input 요소에서 값을 가져옴
	let l_m_id = inputMid.value;
	let m_division = inputDiv.value;
	let t_m_id = checkedRow.querySelector('#teacherId').value;
	let l_g_no = checkedRow.querySelector('#groupNo').value;
	let l_c_no = checkedRow.querySelector('#contentNo').value;
	let sub_able = checkedRow.querySelector('#ableGrpCnt').value;
	let g_cnt= checkedRow.querySelector('#currentGrpCnt').value;
	
	console.log(l_m_id);
	console.log(t_m_id);
	console.log(l_g_no);
	console.log(l_c_no);
	console.log(m_division);
	console.log(sub_able);
	console.log(g_cnt);
		if(m_division == 2){
			
	    	// 학습자인 경우 신청 활성화
	    	if (!checkbox.prop('checked')) {
	    		// 체크 박스가 선택되어 있지 않은 경우
	    		alert('신청하실 그룹을 선택하여 주세요.'); 
	    		//  -> 신청 비활성화
	    		applyButton.prop('disabled', true);
	    	} else if(g_cnt === sub_able){
            	// 현재인원이 그룹인원과 동일한 경우
    			alert('신청 인원 마감');
	    		applyButton.prop('disabled', true);
	    		
	    	} else {
	    		// 체크 박스가 선택되어 있는 경우 -> 신청 활성화
	            console.log("신청버튼 활성화")
	            	
	            // 그룹 신청 Fetch 요청
	            fetch('/alpha/groupApply', {
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
	            .then(response => response)
	            .then(data => {
	            	// fetch 요청이 성공한 경우의 처리
	            	console.log("data", data);
	            	alert('신청되었습니다.');
	            	var currentPageURL = "/alpha/main";
	            	window.location.href = currentPageURL;
		                })
		                .catch(error => {
		                	// fetch 요청이 실패한 경우의 처리
		                	console.error(error);
		                	var currentPageURL = "/alpha/joinGroup";
		                	window.location.href = currentPageURL;
		                	alert("그룹 신청 중 에러가 발생하였습니다.")
		                });
	                
	            }
	    }else{
	    	// 학습자 이외의 경우 신청 비활성화
	   		alert('학습자만 신청 가능합니다.');
			applyButton.prop('disabled', true);
	    }
} 
// 페이징 처리
function go(page){
	//alert(page);
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/joinGroup";
	document.searchForm.submit();
}