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
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
					<input name="l_m_id" id="memberId" type="hidden"
						value="${memberVO.m_id}"> <input name="m_division"
						id="division" type="hidden" value="${memberVO.m_division}">
				</div>

				<!--그룹명-->
				<form class="searchWrap searchWrap_wide" onSubmit="return false;">
					<table class="table table-bordered">
						<caption>그룹명</caption>
						<colgroup>
							<col width="15%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">그룹명</th>
								<td>
									<div class="searchBox">
										<select title="groupNameList" name="g_name" id="grpSelectBox"
											onchange="selectGroup(this.value);" value="">
											<option value="selectop" >선택</option>
											<c:forEach items="${grpNameList}" var="group">
												<option value="${group.g_no}">${group.g_no}</option>
											</c:forEach>
										</select>
									</div>
								</td>
								<td style="border-left: none;">
									<button class="btn btn-default" id="writebtn">내용입력</button>
								</td>
								<td><input type="text" id="datepicker"
									placeholder="제출기한 선택"></td>
							</tr>
						</tbody>
					</table>
				</form>
				
				<%-- 모달창 --%>
				<div id="assign_modal">
				<div class="titleBox">
					<h3 class="t_title">그룹이름 </h3>
					<input name="l_no" id="learnerNo" type="hidden" value=""> 
				</div>
				<div class="entry">
					<table class="table table-bordered">
						<caption>숙제 내용 입력</caption>
						<colgroup>
							<col width="20%" />
							<col width="20%" />
							<col width="30%" />
							<col width="30%" />
						</colgroup>
						<thead>
							<tr>
								<th>학습자 이름</th>
								<th>콘텐츠명</th>
								<th>학습시작일</th>
								<th>학습종료일</th>
							</tr>
						</thead>
							<tbody>
								<c:forEach items="${grpLearnerList}" var="grpLearner">
									<tr>
										<th align="center"><input type="checkbox" id="checkbox"
											name="myCheckbox" value="${grpLearner.l_no}"></th>
										<td align="center" class="row">${grpLearner.m_name}</td>
										<td align="center">${grpLearner.c_name}</td>
										<td align="center">${grpLearner.g_start}</td>
										<td align="center">${grpLearner.g_end}</td>
									</tr>
								</c:forEach>
							</tbody>	
						</table>
						<h4 class="t_title">숙제 내용 입력  </h4>
						<table style="border: 1px solid #000 ,  border-collapse: collapse;">
						<colgroup>
							<col width="30%" />
							<col width="30%" />
							<col width="40%" />
						</colgroup>
							<tr>
								<th align="center" style="border: 1px solid #000;">숙제 내용</th>
								<td align="center" style="border: 1px solid #000;"></td>
								<td align="center" style="border: 1px solid #000;">
								<textarea rows="10" cols="40"></textarea></td>
							</tr>
							<tr>
								<th align="center" style="border: 1px solid #000;" ></th>
								<td align="center" style="border: 1px solid #000;">숙제 시작일</td>
								<td align="center" style="border: 1px solid #000;">숙제 종료일</td>
							</tr>
							<tr>
								<th align="center" style="border: 1px solid #000;" >숙제 기한</th>
								<td align="center" style="border: 1px solid #000;"><%@ include file="test.jsp" %></td>
								<td align="center" style="border: 1px solid #000;"><%@ include file="test.jsp" %></td>
							</tr>
						
						</table>

					   	
					   	<div style="display: inline-block;">
					   	<input type="text" id="startdate">
					   	<br>
						<input type="text" id="enddate">
					   	</div>
					   	<br>
						<div class="btn">
						    <button><a onclick="groupinsert()">전송</a></button>
						    <button><a class="modal_close_btn">닫기</a></button>
				    	</div>
				</div>
				</div>
				<%-- --------------------------------------------------------------  --%>
				
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
										id="checkboxAll" name="myCheckbox" value="Checked"></th>
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

</body>
<script type="text/javascript">
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
// 날짜 선택
$(function() {
    $("#datepicker").datepicker();
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

    
    
//선택 그룹에 따른 그룹 정보 리스트
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
						+'				<th align="center"><input type="checkbox" id="checkbox"              '
						+'						name="myCheckbox" value="Checked"></th>       '
						+'				<th>학습자 이름</th>                                           '
						+'				<th>콘텐츠명</th>                                             '
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
						+'					<td align="center" class="row">'+Learner.m_name+'</td>   '
						+'					<td align="center">'+Learner.c_name+'</td>               '
						+'					<td align="center">'+Learner.g_start+'</td>              '
						+'					<td align="center">'+Learner.g_end+'</td>                '
						+'				</tr>                                                       ';
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
// 내용 입력 버튼 클릭 시 이벤트
$('#writebtn').on('click', function() {
    // 모달창 띄우기
    modal('assign_modal');

    	console.log("input:checkbox[name=myCheckbox]",$('input:checkbox[name=myCheckbox]'));
    	var selectedIndexes = [];

    	    $('input:checkbox[name=myCheckbox]').each(function() {
    	        if (this.checked) {
    	            selectedIndexes.push($('input:checkbox[name=myCheckbox]').val());
    	        }
    	    });
    	    
    		if($('input:checkbox[name=myCheckbox]:checked').length==0){
    			alert('선택하세요');
    		} else{
    			getLearner(selectedIndexes);
    	    console.log("selectedIndexes",selectedIndexes[0]);
    	    console.log("selectedIndexes",selectedIndexes);
    	   
    	    }
});
// 회원 정보 리스트 l_no로 받아오기 
function getLearner(l_no) {
    console.log("l_no", l_no)
	let learnerAll = []; 
    learnerAll.push(l_no);

 	// 여러 선택 항목을 저장할 배열
    let listArray = []; 
    console.log("learnerAll", learnerAll)

    // 모든 선택된 번호에 대해 데이터를 수집하여 배열에 추가
    learnerAll.forEach(function(l_no) {
    	console.log("l_no", l_no);
        var m_name = $('input[data-lno="' + l_no + '"]').val();
        var c_name = $('input[data-cno="' + l_no + '"]').val();
        var g_start = $('input[data-sno="' + l_no + '"]').val();
        var g_end = $('input[data-eno="' + l_no + '"]').val();
	    console.log("m_name", m_name);
	    console.log("c_name", c_name);
	    console.log("g_start", g_start);
	    console.log("g_end", g_end);
	    
	    let item = {
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

function modal(id) { //모달창 띄우기
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