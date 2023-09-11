//get방식 요청
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
		console.log(e);
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

//put방식 요청
function fetchPut(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'put'
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
//DELETE 방식 요청
function fetchDelete(url, callback) {
    console.log(url);
    console.log(callback);

    try {
        // URL 요청
        fetch(url, {
            method: "DELETE"
        })
        // 요청 결과 JSON 문자열을 JavaScript 객체로 반환
        .then(response => response.json())
        // 매개로 받은 콜백 함수 실행
        .then(data => callback(data));
    } catch (e) {
        console.log(e);
    }
}



//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function result(map){
	console.log(map);
	let c_no = $('#c_no').val();
	if(map.result == 'success'){
		const userConfirmation = confirm(map.msg);
		if(userConfirmation){
			window.location.href = "/alpha/teacher/detail?c_no="+c_no;			
		}
	} else {
		alert(map.msg);
	}
		
}

function dresult(map){
	console.log(map);
	if(map.result == 'success'){
		const userConfirmation = confirm(map.msg);
		if(userConfirmation){
			window.location.href = "/alpha/teacher";			
		}
	} else {
		alert(map.msg);
	}
	
}
//장바구니 등록
function cartresult(map){
	console.log(map);
	if(map.result == 'success'){
		const userConfirmation = confirm(map.msg);
		if(userConfirmation){
			window.location.href = "/alpha/mycart";			
		}
	} else {
		alert(map.msg);
	}
	
}



$('#contentEdit').click(function () {
    const userConfirmation = confirm('수정하시겠습니까?');
    if (userConfirmation) {
        // 사용자가 "확인"을 선택한 경우
        getContentList()
        
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }

})

$('#contentDelete').click(function () {
	let c_no = $('#c_no').val();
	// 확인과 취소를 묻는 알림창 표시
    const userConfirmation = confirm('정말로 삭제하시겠습니까?');
    
    if (userConfirmation) {
        // 사용자가 "확인"을 선택한 경우
        fetchDelete('/alpha/content/DeleteAction/' + c_no, dresult);
        
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }
})
    
    
    
//덧글 조회 및 출력
function getContentList(){

	let c_no = $('#c_no').val();
	container.innerHTML = '';
	fetchGet('/alpha/content/list/'+c_no, resultList)
}



function resultList(map){
		let vo = map.contentVO;
		console.log(vo);
		console.log(vo.c_level);
		console.log(vo.c_able);
		const c_ableArray = vo.c_able.split(',').map(Number);

		// 배열에서 최댓값을 추출
		const maxC_able = Math.max(...c_ableArray);

		console.log(maxC_able); 
		container.innerHTML += ''
			+'	<div id="container">'
			+'    <div class="wrap">'
			+'        <div class="content_wrap">'
			+'            <div id="titleBox" style="padding: 60px 0px 50px">'
			+'                <h2 class="t_title">학습콘텐츠 수정</h2>'
			+'            </div>'
			+'            <form class="content" id="content">'
    		+'             <input type="text" class="input-default" id="c_no" style="width: 97%" maxlength="100" name="c_no" value="'+vo.c_no+'">'
			+'                <div class="writeForm1">'
			+'			       <div id="titleInfo">'
    		+'             <table class="table table-bordered table-form">'
    		+'                 <caption>글쓰기</caption>'
    		+'                 <colgroup>'
    		+'                     <col width="25%">'
    		+'                     <col width="75%">'
    		+'                 </colgroup>'
    		+'                 <tbody>'
    		+'                     <tr>'
    		+'                         <th scope="row">패키지명</th>'
    		+'                         <td>'
    		+'                         <div id="signCname" style="color:red"></div>'
    		+'                         <input type="text" class="input-default" id="c_name" style="width: 97%" maxlength="100" name="title" value="'+vo.c_name+'">'
    		+'                         </td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습난이도</th>'
    		+'                         <td>'
    		+'                               <select title="검색 분류" name="c_level" id="c_level" value="" }>'
    		+'                                                <option value="1" '+ (vo.c_level == 1 ? "selected" : "") + '> 초급 </option>'
    		+'                                                <option value="2" '+ (vo.c_level == 2 ? "selected" : "") + '> 중급 </option>'
    		+'                                                <option value="3"'+ (vo.c_level == 3 ? "selected" : "") + '> 고급 </option>'
    		+'                               </select> '
    		+'							</td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습가능인원</th>'
    		+'                         <td>'
    		+'		                        <select name="selAmount" data-index="index" id="c_able" value="'+maxC_able+'">'
    		+'		                        </select>'
    		+'                         </td>'
    		+'                         '
    		+'                     </tr>'
    		+'			            <tr>'
    		+'			            <th scope="row">수강인원</th>'
    		+'			            <td id="p_ableTd" >'
    		+'			            <div id="p_able"></div>'
    		+'			            <input type="hidden" class="input-default" id="poss_able" style="width: 97%" maxlength="100" name="poss_able" value="'+c_ableArray+'">'
    		+'			            </td>'
    		+'			       		 </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">정가</th>'
    		+'                         <td><input type="text" class="input-default" id="c_price" style="width: 97%" maxlength="100" name="c_price" value="'+vo.c_price+'"></td>'
    		+'                     </tr>'
    		
    		+'                         <th scope="row">콘텐츠 내용</th>'
    		+'                         <td>'
    		+'							<div id="signContent"  style="color:red"></div>'
    		+'							<textarea id="c_content" placeholder="10자 이상 입력하세요" style="width:100%; height:450px; border: solid #ccc 1px;">'+vo.c_content+'</textarea></td>'
    		+'                     </tr>'
    		+'                 </tbody>'
    		+'             </table>'
    		+'</div>'
    		+'                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">'
    		+'                                                    <span class="btn btn-point btn-lg"><button type="button" id="editBtn" data-route="one/add/user/">수정</button></span>'
    		+'                                                                            <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>'
    		+'                    </div>'
    		+'                </div>'
    		+'            </form>'
    		+'        </div>'
    		+'    </div>'
    		+'</div>'
    		
    	    // select박스 목록 선택
    	    let selAmountList = document.querySelectorAll("[name=selAmount]");
    	    // select 옵션
    	    let options = '';
    	    for(let i=1;i<=10;i++){
    	        options += `<option value='${i*10}' ${maxC_able == i * 10 ? "selected" : ""}>${i*10}</option>`
    	    }
    	    // select박스들에 옵션 추가및 change이벤트 추가
    	    selAmountList.forEach(function(item, index){
    	        // 1. select 옵션(수량 1~10) 추가
    	        item.innerHTML = options;

    	    })
    		
    		
		    	$('#c_name').blur(function () {
			    	let c_name = $('#c_name').val();
			  	  	const isValidcname = /^[가-힣0-9 ]{1,20}$/.test(c_name);
				  	  // 결과에 따라 메시지 출력
				  	  if (!isValidcname) {
				  		  signCname.innerHTML = "패키지명은 한글과 숫자로만 구성되고, 20자리 가능합니다.";
				  		  $('#c_name').focus();
				  	    return
				  	  } else{
				  		  signCname.innerHTML = '';	  		  
				  	  }
				})

			    $('#c_content').blur(function () {
			    	let c_content = $('#c_content').val();
			    	const isValidcontent = /^[ㄱ-ㅎㅏ-ㅣ가-힣0-9 ]{10,}$/.test(c_content);
			    	// 결과에 따라 메시지 출력
			    	if (!isValidcontent) {
			    		signContent.innerHTML = "10자리 이상 입력하세요";
			    		$('#c_content').focus();
			    		return
			    	} else{
			    		signContent.innerHTML = '';	  		  
			    	}
			    })
			    
		        p_able.innerHTML='';
	            for(let i=1;i<=maxC_able/10;i++){
	            	p_able.innerHTML += `<button type="button" value="${i}" class="blue" style="width:40px;height:30px; margin-right:25px" id="btn">${i*10}</button>`
	            		}
	            
                let buttons = document.querySelectorAll("#btn");
                buttons.forEach(button => {
              	let isDisabled = button.classList.contains("disabled");
               	let btnValue = button.getAttribute("value");
               	for (let i = 1; i <= c_ableArray.length; i++) {
               			console.log("c_ableArray",c_ableArray);
               			const c_able = c_ableArray[i - 1]/10;
	               		if(c_able==btnValue){
		                button.classList.add("disabled");
	               		}
               	}
                })
                let btnAll = c_ableArray;
                console.log("btnAll", btnAll)
                buttons.forEach(button => {
	                  button.addEventListener("click", () => {
	                	  let btnValue = button.getAttribute("value");
	                	  console.log("btnValue*10", btnValue*10)
	                	  let isDisabled = button.classList.contains("disabled");
	                    if (isDisabled) {
	                    	const indexToRemove = btnAll.indexOf(btnValue * 10);
	                    	if (indexToRemove !== -1) {
	                    	  btnAll.splice(indexToRemove, 1);
	                    	}
	                      button.classList.remove("disabled");
	                      console.log(`버튼 ${btnValue} 활성화`);
	                      
	                    } else {
	                      button.classList.add("disabled");
	                      console.log(`버튼 ${btnValue} 비활성화`);
	                      btnAll.push(btnValue*10);
	                      console.log(btnAll);
	                    }
	                    $('#poss_able').val(btnAll);
	                  });
	                });

	            $('#c_able').blur(function () {
	        		// 정규식을 이용하여 한글 숫자로만 구성되고,6자리인지를 검사
	            	let c_able = $('#c_able').val();
	                
	                p_able.innerHTML='';
	                for(let i=1;i<=c_able/10;i++){
	                	p_able.innerHTML += `<button type="button" value="${i}" class="blue" style="width:40px;height:30px; margin-right:25px" id="btn">${i*10}</button>`
	                }
	                
	                let buttons = document.querySelectorAll("#btn");

	                let btnAll = [];
	                buttons.forEach(button => {
	                  button.addEventListener("click", () => {
	                	  let btnValue = button.getAttribute("value");
	                	  let isDisabled = button.classList.contains("disabled");
	                    if (isDisabled) {
	                      button.classList.remove("disabled");
	                      btnAll.pop(btnValue*10);
	                      console.log(`버튼 ${btnValue} 활성화`);
	                      
	                    } else {
	                      button.classList.add("disabled");
	                      console.log(`버튼 ${btnValue} 비활성화`);
	                      btnAll.push(btnValue*10);
	                      console.log(btnAll);
	                    }
	                    $('#poss_able').val(btnAll);
	                  });
	                });
	            })
    
			
			$('#editBtn').click(function () {
			let c_name = $('#c_name').val();
			let c_level = $('#c_level').val();
			let c_able = $('#poss_able').val();
			let c_price = $('#c_price').val();
			let c_content = $('#c_content').val();
			let c_no = $('#c_no').val();
			  

			//전달할 객체로 생성
			let obj = {
					c_name : c_name
					,  c_level : c_level
					,  c_able : c_able
					, c_price: c_price
					, c_content : c_content
					, c_no : c_no
					}
			
			fetchPut('/alpha/content/EditAction', obj, result)
		
		})

	
		

}


function getCart(index) {
	let indexAll = []; // 중복 제거된 인덱스들을 담는 배열
    // 중복 검사
	console.log("getCartIndex", index)
    const existingIndex = indexAll.indexOf(index);
    
    if (existingIndex === -1) {
        indexAll.push(index);
    } else {
        indexAll.splice(existingIndex, 1);
    }

    let listArray = []; // 여러 선택 항목을 저장할 배열
    console.log("getCartindexAll", indexAll)

    // 모든 선택된 인덱스에 대해 데이터를 수집하여 배열에 추가
    indexAll[0].forEach(function(index) {
    	console.log("index", index)
        var c_no = $('input[data-cno="'+index+'"]').val();
        var c_name = $('input[data-cname="'+index+'"]').val();
        var price = $('input[data-price="'+index+'"]').val();
        var c_able =  $('input[data-cnt="'+index+'"]').val();
        var m_id =  $('input[data-mid="'+index+'"]').val();

        console.log("c_no", c_no);
        console.log("c_name", c_name);
        console.log("c_able", c_able);
        
        let item = {
            c_no: c_no,
            c_name: c_name,
            price: price,
            c_able: c_able,
            m_id: m_id
        };

        listArray.push(item);
    });
    
    return listArray; // 모든 선택 항목의 데이터를 배열로 반환
}



function resultCart(map) {
    let cr_c_no = $('#c_no').val();
    fetchGet('/alpha/cart/list/'+cr_c_no, result);
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
            // 레이어 색갈은 여기서 바꾸면 됨
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

$('#cartPopUp').on('click', function() {
	var selectedIndexes = [];

	    $('input:checkbox[name=chkbox]').each(function() {
	        if (this.checked) {
	            selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
	        }
	    });
	    console.log($('#m_id').val())
	    if($('#m_id').val()==null || $('#m_id').val()==''){
	    	alert('로그인 후 이용가능합니다.')
	    } else{
	    
		if($('input:checkbox[name=chkbox]:checked').length==0){
			alert('장바구니에 넣을 콘텐츠를 선택하세요');
		} else{
	    tbdy.innerHTML='';
	    var listArray = getCart(selectedIndexes);
	    
	    listArray.forEach((list,index) => {
	    	let cname = list.c_name.slice(0,18);
	    	let cprice = list.price;
	    	let cnt = list.c_able;
	    	let cno = list.c_no;
	    	let mid = list.m_id;
	        var row = document.createElement('tr');
	        row.innerHTML = `
	            <td><input type="checkbox" name="selectedItem" data-index="${index}" style="margin-top: 5px;" /></td>
	            <td>${index+1}</td>
	            <td>${cname}..</td>
	            <td>${cnt}</td>
	            <td>${cprice}</td>
	        	<td>${cprice}</td>
	        	<td style="display: none">${cno}</td>
	        	<td style="display: none">${mid}</td>
	        `;
	        tbdy.appendChild(row);
	    });
    // 모달창 띄우기
    modal('cartList');
    
 // 선택된 아이템 체크박스 변경 이벤트 처리
    var listIndex = [];
    $('input[name="selectedItem"]').on('change', function() {
    	var itemIndex = parseInt($(this).attr('data-index'));
        const existingIndex = listIndex.indexOf(itemIndex);
        
        if (existingIndex === -1) {
        	listIndex.push(itemIndex);
        } else {
        	listIndex.splice(existingIndex, 1);
        }
        });
    $('#cartContent').click(function () {
        var table = document.getElementById('cartTable');
        var selectedData = listIndex;
        console.log(selectedData);
        // 행들을 순회하면서 선택된 행들의 데이터를 추출
        
        for (var i = 1; i < table.rows.length; i++) { // 첫 번째 행은 헤더이므로 인덱스 1부터 시작
            var checkbox = table.rows[i].cells[0].querySelector('input[type="checkbox"]');
            
            if (checkbox && checkbox.checked) {
                var cnt = table.rows[i].cells[3].innerHTML;
                var cr_c_no = table.rows[i].cells[6].innerHTML;
                var cr_m_no = table.rows[i].cells[7].innerHTML;
                console.log(cnt);
                console.log(cr_c_no);
                console.log(cr_m_no);
                let obj = {
                        cr_m_no: cr_m_no,
                        cr_c_no: cr_c_no,
                        cnt: cnt
                    };

                    fetchPost('/alpha/cart/insert', obj, cartresult);
            }


        }
    });
    
		}
	    }
});

$('#payPopUp').on('click', function() {
	var selectedIndexes = [];
	
	$('input:checkbox[name=chkbox]').each(function() {
		if (this.checked) {
			selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
		}
	});
    if($('#m_id').val()==null || $('#m_id').val()==''){
    	alert('로그인 후 이용가능합니다.')
    } else{
		if($('input:checkbox[name=chkbox]:checked').length==0){
			alert('구매하실 콘텐츠를 선택하세요');
		} else if($('input:checkbox[name=chkbox]:checked').length>1){
			alert('최대 1개까지 구매 가능합니다');
		}else {
			
			tbdy1.innerHTML='';
			var listArray = getCart(selectedIndexes);
			console.log("listArray",listArray);
			
			listArray.forEach((list,index) => {
				let cname = list.c_name.slice(0,15);
				let cprice = list.price;
				let cnt = list.c_able;
				var row = document.createElement('tr');
				row.innerHTML = `
					<td>${index+1}</td>
					<td>${cname}..</td>
					<td>${cnt}명</td>
					<td>${cprice}</td>
					<td>
		       			<select title="검색 분류" name="c_period" id="c_period" style="font-size:1em" >
								<option value="0">기간선택</option>
		                        <option value="1">3개월</option>
		                        <option value="2">6개월</option>
		                        <option value="3">9개월</option>
								<option value="4">12개월</option>
		                </select>
					</td>
					<td></td>
					`;
				tbdy1.appendChild(row);
			});
			$(document).on('change', 'select[name=c_period]', function() {
			    var rowIndex = $(this).closest('tr').index(); // 해당 행의 인덱스 가져오기
			    var selectedPeriod = $(this).val(); // 선택한 기간 값 가져오기
			    var cprice = listArray[rowIndex].price; // 해당 행의 원래 가격 가져오기
			    console.log(rowIndex);
			    var calculatedPrice = cprice * selectedPeriod; // 계산된 가격
		
			    // 해당 행의 가격 업데이트
			    $('td:eq(5)', $(this).closest('tr')).text(calculatedPrice);
			});
			// 모달창 띄우기
			modal('payList');
		    console.log("listArray",listArray);
		    console.log("$('#c_period').val()",$('#c_period').val());
				}
    }
});

	$("#theBtn").click(function() {
		modal('no_content');
	});
	
	
