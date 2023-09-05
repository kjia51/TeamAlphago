<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>
<%@ include file="../common/header.jsp"%>
<!-- 캘린더 사용 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>숙제 전송</title>
</head>
<link rel="stylesheet" href="/resources/css/learner.css">
<body>
	<div id="container">
		<div class="wrap">
			<div class="content_wrap">
				<div class="titleBox">
					<h2 class="t_title">숙제 전송(학습 지도자용)</h2>
					<input name="t_m_id" id="memberId" type="hidden" value="${memberVO.m_id}"> 
						<input name="m_division" id="division" type="hidden" value="${memberVO.m_division}">
				</div>

				<!--그룹명-->
				<form class="searchWrap searchWrap_wide" onSubmit="return false;">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col width="20%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="groupNameList" name="g_name" id="grpSelectBox"
											onchange="selectGroup(this.value);" value="">
											<option value="selectop">선택</option>
											<c:forEach items="${grpNameList}" var="group">
												<option value="${group.g_no}">${group.g_no}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td style="border-left: none;">
									<button class="btn btn-default" id="writebtn">내용입력</button>
								</td>
							
							</tr>
						</tbody>
					</table>
				</form>


				<!-- 학습자 리스트 -->
				<div id="learnerInfo">
					<div class="entry">
						<table class="table table-bordered">
							<caption>학습자 정보</caption>
							<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="40%" />
								<col width="15%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th style="text-align: center;"><input type="checkbox"
										id="checkboxAll" name="myCheckboxAll" value="Checked"></th>
									<th>학습자 이름</th>
									<th>콘텐츠명</th>
									<th>학습시작일</th>
									<th>학습종료일</th>
								</tr>
								<tr>
									<td colspan="5" style="text-align: center;">그룹을 선택해주세요.</td>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
						<div class="paging">
							<a href='/' class="current">1</a> <a href='/'>2</a>
						</div>
					</div>
				</div>
			</div>
			<!-- //content close -->


		</div>
	</div>
	<!-- container close -->

	<%-- 모달창 --%>
	<div id="assign_modal">
		<div class="titleBox">
			<h3 class="t_title">숙제 내용 입력</h3>
			<input name="l_no" id="learnerNo" type="hidden" value="">
		</div>
		<div class="entry">
			<div>
			<form>
			<table style="border: 1px solid #000, border-collapse: collapse;">
				<colgroup>
					<col width="20%" />
					<col width="40%" />
					<col width="40%" />
				</colgroup>
				<tr>
					<th align="center" style="border: 1px solid #000;">숙제 내용</th>
					<td align="center" style="border: 1px solid #000;" colspan="2">
						<textarea name="h_homework" id="hHomework" rows="5" cols="10" style="width: 90%;">내용을 입력하세요.</textarea>
					</td>
					<td align="center" style="border: 1px solid #000;"></td>
				</tr>
				<tr>
					<th align="center" style="border: 1px solid #000;" rowspan="3">숙제기한
					</th>
					<td align="center" style="border: 1px solid #000;">숙제 시작일</td>
					<td align="center" style="border: 1px solid #000;">숙제 종료일</td>
				</tr>
				<tr>
					<td align="center" style="border: 1px solid #000;">
					<input type="text" name="startDay" id="datepickerS" placeholder="선택 " style="text-align:center;">
					</td>
					<td align="center" style="border: 1px solid #000;">
					<input type="text" name="h_limit" id="datepickerE" placeholder="선택 " style="text-align:center;">
					<input type="hidden" id="enddate">
					</td>
				</tr>
			</table>
			</form>
			</diV>
			<br>
			<div class="btn">
				<button>
					<a onclick="insertHomework()">전송</a>
				</button>
				<button>
					<a class="modal_close_btn">닫기</a>
				</button>
			</div>
		</div>
	</div>
	<%-----------------------------모달창 끝----------------------------------%>
</body>
<script>
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
		window.location.href = "/alpha/giveHomework?t_m_id=" + memberId;
	} else {
		alert(map.msg);
	}
		
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
    var url = '';
	    $.ajax({
	        url: '/alpha/giveHomework/' + g_no,
	        method: 'GET',
	        success: function(response) {
	        	// 성공 시 작업
				var url = '/alpha/giveHomework/' + g_no;
	        	fetchGet(url, displayLearnerList)
	        },
	        error: function(xhr, status, error) {
	            // 에러 처리
	        	console.log(error)
	        }
	    });
} 

    
    
// 선택 그룹에 따른 그룹 정보 리스트 출력
function displayLearnerList(map) {
	console.log("map", map)
	let LearnerList = map.LearnerList;
	console.log("LearnerList", LearnerList)
	
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
						+'				<th>학습자 이름</th>                                           '
						+'				<th>학습콘텐츠</th>                                             '
						+'				<th>학습시작일</th>                                            '
						+'				<th>학습종료일</th>                                            '
						+'			</tr>                                                           '
						+'		</thead>                                                            '
						+'		<tbody>';
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
						+'<td style="display: none">'
						+'<input type="hidden" name="l_m_id" id="learnerId" value="'+ Learner.l_m_id +'">'
						+'</td>'
						+'<td style="display: none">'
						+'<input type="hidden" name="h_g_no" id="groupNo" value="'+ Learner.h_g_no +'">'
						+'</td>'
						+'</tr>';
		})
						
						
			pageBlock += ''			
						+'		</tbody>                                                            '
						+'	</table>                                                                '
						+'</div>';
	} else {
			pageBlock +='<tr>'
						+'<td colspan="5" style="text-align: center;">그룹을 선택하여 주세요.</td>'
						+'</tr>';
	}
			learnerInfo.innerHTML += pageBlock;
}

// 체크 박스 전체 선택 이벤트
function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('myCheckbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}



// 내용 입력 버튼 클릭 시 이벤트
$('#writebtn').on('click', function() {
    // 모달창 띄우기
    modal('assign_modal');
    

});

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

         var item = {
             l_no: l_no, // 체크박스의 l_no 값
             m_name: m_name,
             c_name: c_name,
             g_start: g_start,
             g_end: g_end
         };

         listArray.push(item);
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
   		} else{
   				var learnerInfo  = getLearner(selectedIndexes);
   	    	    console.log("selectedIndexes",selectedIndexes[0]);
   	    	    console.log("selectedIndexes",selectedIndexes);
   	    	    console.log("학습자 정보 : ", learnerInfo);
   		
   	    	 
   			    let t_m_id = $('#memberId').val();
   			    let h_c_no = $('#contentNo').val();
   			    let l_m_id = $('#learnerId').val();
   			    let h_g_no = $('#groupNo').val();
   			    let h_limit = $('#enddate').val();
   			    let h_homework = $('#hHomework').val();
   			
   			    
   			    console.log("t_m_id : ", t_m_id);
   			    console.log("h_c_no : ", h_c_no);
   			    console.log("l_m_id : ", l_m_id);
   			    console.log("h_g_no : ", h_g_no);
   			    console.log(h_limit);
   			    console.log("h_homework : ", h_homework);
   			    
   			    learnerInfo.forEach(list => {
   			       let m_name = list.m_name;
   			       let c_name = list.c_name;
   			       let g_start = list.g_start;
   			     
   			
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
   					console.log("obj:", obj);
   					console.log("result",result);
	   		 	try {
	   					fetchPost('/alpha/giveHomework/save', obj, result);
	   	    		
	   			    
				} catch (e) {
					 console.error('오류:', error);
				}
				
   				});
	}
}

// 모달창 띄우기
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




</script>
</html>
<%@ include file="../common/footer.jsp"%>