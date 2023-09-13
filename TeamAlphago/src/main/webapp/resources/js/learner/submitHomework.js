
// post방식 요청
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
// 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		var memberId = $('#memberId').val();
		window.location.href = "/alpha/submitHomework?l_m_id=" + memberId;
	} else {
		alert(map.msg);
	}
		
}



//선택된 체크박스의 h_no 값을 저장할 배열
var selectedHnos = [];

// 학습 내용 입력 버튼 클릭 시
$('#writebtn').on('click', function() {
    // 초기화: 선택된 h_no 배열 비우기
    selectedHnos = [];

    // 선택된 체크박스 확인
    $('input[name="myCheckbox"]:checked').each(function() {
        var hno = $(this).data('hno');
        selectedHnos.push(hno);
    });

    // 모달창 띄우기
    modal('assign_modal');
});

// 모달창에서 제출하기 버튼 클릭 시
function submitHomework() {
    var hContent = $('#hContent').val(); // 학습 내용 입력
	console.log('hContent',hContent)
    if (selectedHnos.length === 0) {
        alert('숙제를 선택하세요.');
        return;
    }

    // 선택된 각 h_no에 대해 hContent 전송
    selectedHnos.forEach(function(hno) {
        var obj = {
            h_no: hno,
            h_content: hContent
        };
		console.log("obj", obj);
		
        fetchPost('/alpha/submitHomework/submit', obj, function(map) {
            if (map.result === 'success') {
                alert('제출되었습니다.');
                // 제출 현황 업데이트: 완료 표시
                $('#submissionStatus_' + hno).html('완료');
        		var memberId = $('#memberId').val();
                // 현재 페이지의 URL을 가져와서 리로드
                var currentPageURL = "/alpha/submitHomework/?l_m_id="+memberId;
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





