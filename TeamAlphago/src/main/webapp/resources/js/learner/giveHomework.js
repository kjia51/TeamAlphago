// get방식 
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

//post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{
			method : 'post'
			,headers : {'Content-Type' : 'application/json'} 
			,body  : JSON.stringify(obj)
			  })
			//요청 결과json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			//매개로 받은 콜백함수 실행
			.then(map => callback(map))
	        .catch(error => {
	            console.log(error);
	            callback({ result: 'error', msg: '요청 실패' }); // 요청 실패 시 콜백 호출
	        });
			
		} catch (e) {
			console.log(e);
			callback({ result: 'error', msg: '요청 실패' }); // 요청 실패 시 콜백 호출
		}
}


// 결과를 처리하는 함수(등록, 수정, 삭제) 
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		var memberId = $('#memberId').val();
		window.location.href = "/alpha/giveHomework?t_m_id=" + memberId;
	} else {
		alert(map.msg);
	}
		
}


//내용 입력 버튼 클릭 시 이벤트
$('#writebtn').on('click', function() {
    // 모달창 띄우기
    modal('assign_modal');
});

//모달창 띄우기
function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색상은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('.modal_close_btn')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
}
// 숙제 일자 선택
$(function() {
    $("#datepickerS").datepicker({
    	showOtherMonths: true,
        showMonthAfterYear: true,
        selectOtherMonths: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
    	dateFormat: 'yy-mm-dd',
    	minDate: 0
    	});
    $('#datepickerS').datepicker('setDate', 'today');
    $("#datepickerE").datepicker({
    	showOtherMonths: true,
        showMonthAfterYear: true,
        selectOtherMonths: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        maxDate: "+1M",
        minDate: 0,
        dateFormat: 'yy-mm-dd',
        onSelect: function(selectedDate) {
            var EndDate = new Date(selectedDate);
           
            var year = EndDate.getFullYear();
            var month = ("0" + (EndDate.getMonth() + 1)).slice(-2); 
            var day = ("0" + EndDate.getDate()).slice(-2);
           
            var endDateFormatted = year + "-" + month + "-" + day;
           
            $('#enddate').val(endDateFormatted);
        }
    });
});


// 그룹 선택시 이벤트 발생 
function selectGroup(g_no) {
	console.log("g_no", g_no);
	let page = $('#page').val();
	var replyDiv ='';
	replyDiv.innerHTML='';
    var url = '';
	    $.ajax({
	        url: '/alpha/giveHomework/' + g_no +'/' + page,
	        method: 'GET',
	        success: function(response) {
	        	console.log('response',response);
	        	displayLearnerList(response);
	        	// 성공 시 작업
//				var url = '/alpha/giveHomework/' + g_no +'/' + page;
//	        	fetchGet(url, displayLearnerList)
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	        	console.log(error)
	        }
	    });
} 

function displayLearnerList1(map) {   
	let pageDto = map.pageDto;
	let totalCnt =map.totalCnt;
	console.log(pageDto);
	console.log(totalCnt);
}
    
// 선택 그룹에 따른 그룹 정보 리스트 출력
function displayLearnerList(map) {
	console.log("map", map)
	let LearnerList = map.LearnerList;
	let pageDto = map.pageDto;
	let totalCnt =map.totalCnt
	replyDiv.innerHTML='';
	console.log("LearnerList", LearnerList);
	console.log("pageDto=>", pageDto);
	console.log("totalCnt=>", totalCnt);

	learnerInfo.innerHTML='';
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
						+'				<th>학습자 이름</th>                                             '
						+'				<th>학습콘텐츠</th>                                             '
						+'				<th>학습시작일</th>                                             '
						+'				<th>학습종료일</th>                                             '
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
			

			let pageDiv='';
			//페이지 블럭 생성
			pageDiv += '<nav aria-label="Page navigation example">'
				+'<ul class="pagination justify-content-center">';
			
			if(pageDto.prev){
				pageDiv += '<li class="page-item" onclick="go('+ (pageDto.startNo-1) +')">'
				+'<a class="page-link">&lt;</a>'
				+'</li>';
			};
			
			
			for(i=pageDto.startNo; i<=pageDto.endNo; i++){
				let activeStr = (pageDto.cri.pageNo==i)?'active':'';
				pageDiv += '<li class="page-item'+activeStr+'" onclick="go('+i+')">'
				+'<a class="page-link">'+i+'</a></li>';		    	
			} 
			if(pageDto.next){
				pageDiv += '<li class="page-item" onclick="go('+ (pageDto.endNo+1) +')">'
				+'<a class="page-link">&gt;</a>'
				+'</li>';
			}
			pageDiv += '</ul>'
				+'</nav>';

			replyDiv.innerHTML += pageDiv;
			
			
			// 학습자 목록을 업데이트한 후 학습자의 존재 여부 확인
		    checkLearnerExistence();
		    
		    
		    
function checkLearnerExistence(map) {
	
    var writeButton = $('#writebtn');

    if (LearnerList != null && LearnerList.length > 0) {
        // 학습자가 있을 경우 버튼 활성화
        writeButton.prop('disabled', false);
    } else {
        // 학습자가 없을 경우 버튼 비활성화
        writeButton.prop('disabled', true);
    }
}

}

// 체크 박스 전체 선택 이벤트
function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('myCheckbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  });
}

// 회원 정보 리스트 l_no로 받아오기 
function getLearner(selectedIndexes) {

 	// 여러 선택 항목을 저장할 배열
    var listArray = []; 
    console.log("listArray", listArray)

    // 모든 선택된 번호에 대해 데이터를 수집하여 배열에 추가
    selectedIndexes.forEach(function(l_no) {
    	console.log("l_no", l_no);
    	 var row = $('input[value="' + l_no + '"]').closest('tr');

         // 행에서 각 필드의 데이터를 가져옴
         var m_name = row.find('td:eq(1)').text(); // 학습자 이름
         var c_name = row.find('td:eq(2)').text(); // 학습콘텐츠
         var g_start = row.find('td:eq(3)').text(); // 학습시작일
         var g_end = row.find('td:eq(4)').text(); // 학습종료일
         var l_m_id = $('input[data-lno="' + l_no + '"]').val(); // 학습자 아이디
    	console.log("l_no", l_no);
    
    	// 전체 선택 버튼 클릭 시 오류 처리  	
	    if(l_m_id != null){
	    	
	    	var item = {
	    			l_no: l_no, // 체크박스의 l_no 값
	    			m_name: m_name,
	    			c_name: c_name,
	    			g_start: g_start,
	    			g_end: g_end,
	    			l_m_id : l_m_id
	    	};
	    	
	    	listArray.push(item);
	    }
    });
 		// 모든 선택 항목의 데이터를 배열로 반환
	    return listArray;
}

// 전송 버튼 클릭 시  숙제 요청 내역에 insert
function insertHomework(){
    var selectedIndexes = [];

    console.log("input:checkbox[name=myCheckbox]",$('input:checkbox[name=myCheckbox]'));
    
   	    $('input:checkbox[name=myCheckbox]').each(function() {
   	        if (this.checked) {
   	            selectedIndexes.push($(this).val());
   	        }
   	    });
   	    
   	    // 체크 박스 선택 검증
   		if($('input:checkbox[name=myCheckbox]:checked').length==0){
   			alert('학습자를 선택하세요');
   			// 입력 버튼 비활성화 처리 
   			return;
   		}
   
   				var learnerInfo  = getLearner(selectedIndexes);
   	    	    console.log("selectedIndexes",selectedIndexes[0]);
   	    	    console.log("selectedIndexes",selectedIndexes);
   	    	    console.log("학습자 정보 : ", learnerInfo);
   		
   	    	 
   			    let t_m_id = $('#memberId').val();
   			    let h_c_no = $('#contentNo').val();
   			    let h_g_no = $('#groupNo').val();
   			    let h_limit = $('#enddate').val();
   			    let h_homework = $('#hHomework').val();
   			
   			    
   			    console.log("t_m_id : ", t_m_id);
   			    console.log("h_c_no : ", h_c_no);
   			    console.log("h_g_no : ", h_g_no);
   			    console.log("h_limit :", h_limit);
   			    console.log("h_homework : ", h_homework);
   			    
   			    // 추적할 요청 수와 완료된 요청 수를 초기화
   			    var totalRequests = learnerInfo.length;
   			    var completedRequests = 0;
   			    
   			    learnerInfo.forEach(list => {
   			       let m_name = list.m_name;
   			       let c_name = list.c_name;
   			       let g_start = list.g_start;
   			       let l_m_id = list.l_m_id;
   			       
   			       let obj = {
   				       			t_m_id: t_m_id,
   				       			h_c_no: h_c_no,
   				       			h_g_no: h_g_no,
   				       			h_homework: h_homework,
   				                m_name: m_name,
   				                c_name: c_name,
   				            	l_m_id: l_m_id,
   				                g_start: g_start,
   				                h_limit: h_limit
   			       };
   					console.log("obj:", obj.l_m_id);
   					console.log("result",result);

   			        fetchPost('/alpha/giveHomework/save', obj, function (map) {
   			            // 각 요청이 완료될 때마다 호출되는 콜백
   			            console.log("obj:", obj.l_m_id);
   			            console.log("result", result);

   			            completedRequests++;

   			            if (completedRequests === totalRequests) {
   			                // 모든 요청이 완료되면 한 번만 알림 표시
   			                result(map);
   			            }
   			        });
					
   				});
	
}
function go(page){
	alert(page);
	$('#page').val(page);
	var gName = document.querySelector("#grpSelectBox").value
	selectGroup(gName);
	//displayLearnerList();

}


