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
		        	fetchGet(url, displayHomeworkList)
		        },
		        error: function(xhr, status, error) {
		            // 에러 처리
		        	console.log(error)
		        }
		    });
} 

//선택 그룹에 따른 학습자 리스트 출력
function displayHomeworkList(map) {
	console.log("map", map)
	let g_no = map.g_no;
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
						+'				<col width="35%" />          '
						+'				<col width="15%" />          '
						+'			</colgroup>                      '
						+'			<thead>                          '
						+'				<tr>                         '
						+'					<th>No</th>             '
						+'					<th>학습자 이름</th>'
						+'					<th>제출기한</th>'
						+'					<th>제출일자</th>'
						+'					<th>콘텐츠이름</th>'
						+'					<th>평가</th>             '
						+'				</tr>                        '
						+'			</thead>                         '
						+'			<tbody>							 ';			
	if(submittedList != null && submittedList.length > 0){
		submittedList.forEach((homework, index)=>{
 		console.log('homework', homework.m_name);
 		pageBlock += ''					
						+'<tr>'
						+'<th align="center">'+ (index+1) +''
						+'</th>'
						+'<td align="center" class="row">'+homework.m_name+''
						+'<input type="hidden" name="m_name" id="m_name" value="'+ homework.m_name +'">'
						+'</td>  '
						+'		<td align="center">'+homework.h_limit+'</td>'
						+'		<td align="center">'+homework.h_regidate+'</td>'
						+'		<td align="center">'+homework.c_name+'</td>'
						+'<td style="display: none">'
						+'<input type="hidden" name="h_homework" id="h_homework" value="'+ homework.h_homework +'">'
						+'</td>'
						+'<td style="display: none">'
						+'<input type="hidden" name="h_content" id="h_content" value="'+ homework.h_content +'">'
						+'</td>'
						+'		<td align="center">'
						+'		<button class="btn btn-default" id="writebtn">평가하기'
						+'<input type="text" name="h_no" id="h_no" value="'+ homework.h_no +'">'
						+'</button>'
						+'		</td>'
						+'</tr>';
		})
			pageBlock += ''			
						+'		</tbody>'
						+'	</table>'
						+'</div>';
	} else {
			pageBlock +='<tr>'
						+'<td colspan="7" style="text-align: center;">제출된 숙제가 없습니다.</td>'
						+'</tr>';
	}
	learnerInfoDiv.innerHTML += pageBlock;
	


// 평가하기 버튼 클릭 시 이벤트
	$(document).on('click', '#writebtn', function() {
	$('#g_no').val(g_no);
    // 초기화: 선택된 h_no 배열 비우기
    selectedHnos = [];
	
    // 선택한 숙제 데이터를 배열에 추가
    var hno = $(this).closest('tr').find('input[name="h_no"]').val();
    console.log("hno",hno);
    
    selectedHnos.push(hno);
    
    // 숙제 내용과 학습내용을 모달에 표시
    var hName = $(this).closest('tr').find('input[name="m_name"]').val();
    var hHomework = $(this).closest('tr').find('input[name="h_homework"]').val();
    var hContent = $(this).closest('tr').find('input[name="h_content"]').val();
    
    console.log(hHomework);
    console.log(hContent);
    
    $('#h_m_name').text(hName);
    $('#h_homeworkh').text(hHomework);
    $('#h_contenth').text(hContent);
    
    // 모달창 띄우기
    modal('assign_modal'); 
	});

} // displayHomeworkList 끝


// 숙제 데이터를 저장하기 위한 배열
var selectedHnos = [];

function homeworkAssess() {
	  // 선택된 평가 값을 가져옵니다.
	  var hReview = $("#evaluationSelect").val(); // 숙제 평가 값
	  console.log("hReview:", hReview);

	  // 선택된 각 h_no에 대해 hContent 전송
	  selectedHnos.forEach(function(hno) {
		var obj = {
		    h_no: hno,
		    h_review: hReview
		};
		console.log("obj", obj);
		
		fetchPost('/alpha/homeworkAssess/Assess', obj, function(map) {
		    if (map.result === 'success') {
		        alert('저장되었습니다.');
		        // 현재 페이지의 URL을 가져와서 리로드
		        var memberId = $('#memberId').val();
		        var currentPageURL = '/alpha/homeworkAssess?t_m_id=' + memberId;
		        window.location.href = currentPageURL;
		        
		    } else {
		        alert('제출에 실패하였습니다.');
		        }
		    });
		});

    // 모달창 닫기
    $('#assign_modal').hide();
    $('.modal_bg').remove();
}


 













