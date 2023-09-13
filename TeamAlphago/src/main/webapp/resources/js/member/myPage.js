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

window.addEventListener('load', function(){
	console.log("Get")
    const userConfirmation = confirm('마이페이지로 이동하시겠습니까?');
    if (userConfirmation) {
        // 사용자가 "확인"을 선택한 경우
    	submain.innerHTML = '';
    	fetchGet('/alpha/member/list', resultEditList)
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }
    
})

$('#getGroup').click(function () {
    const userConfirmation = confirm('정보를 수정 하시겠습니까?');
    if (userConfirmation) {
        // 사용자가 "확인"을 선택한 경우
    	submain.innerHTML = '';
    	fetchGet('/alpha/member/list', resultEditList)
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }

})
function resultEditList(map){
		let vo = map.vo;

		// 배열에서 최댓값을 추출

		submain.innerHTML += ''
			+'<div class="titleBox">'
			+'    <h2 class="t_title">정보 수정</h2>'
			+'   <p>입력하신 정보는 본인 확인용으로 사용되며, 회원 가입이 완료되면 사용자 확인을 위해 회원정보에 저장됩니다.</p>'
			+'</div>'
			+'<div class="memberBox memberBox_nmg">'
			+'                    <div class="joinWrap">'
			+'                        <table class="table table-bordered table-form">'
			+'                            <caption>참가 신청</caption>'
			+'                            <colgroup>'
			+'                                <col style="width: 200px;">'
			+'                                <col>'
			+'                            </colgroup>'
			+'                            <tbody>'
			+'                                <tr>'
			+'                                    <th scope="row">아이디 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'	                                    <div class="div-group">'
			+'										    <input type="text" class="input-default" maxlength="20" name="id" id="signup_id" value="'+vo.m_id+'" disabled/>'
			+'										</div>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">기존 비밀번호 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'                                        <input type="password" class="input-default" value="" maxlength="20" name="pwd" id="signup_pwd"/>'
			+'                                        <div class="alert-div" id="pwd_div"></div>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">변경될 비밀번호</th>'
			+'                                    <td>'
			+'                                        <input type="password" class="input-default" placeholder="비밀번호 변경 하실때만 입력하세요" value="" maxlength="20" name="pwd" id="signup_pwd"/>'
			+'                                        <div class="alert-div" id="pwd_div"></div>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">비밀번호 확인</th>'
			+'                                    <td>'
			+'                                        <input type="password" class="input-default" placeholder="비밀번호 변경 하실때만 입력하세요" value="" maxlength="20" name="pwdChk" id="signup_pwdChk"/>'
			+'                                        <div class="alert-div" id="pwdChk_div"></div>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">이름 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'                                        <input type="text" class="input-default" value="'+vo.m_name+'" id="signup_name" disabled/>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">생년월일 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'                                        <input type="text" class="input-default" value="'+vo.m_birth+'" id="signup_name" disabled/>'

			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">주소 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'                                        <input type="text" class="input-default input-lg" value="'+vo.m_address+'" maxlength="100" id="signup_addr" name="addr1" />'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">이메일 주소<span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'                                        <input type="text" class="signup_email" id="signup_email" value="'+vo.m_email+'" disabled />'
			+'                                         '
			+'                                    </td>'
			+'                                </tr>'
			+'                                '
			+'										'
			+'                                <tr>'
			+'                                    <th scope="row">휴대폰 번호 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'                                        <input type="text" class="input-default" value="'+vo.m_phone+'" id="signup_phone" disabled/>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">회원 구분 <span class="t_red">&#42;</span></th>'
			+'                                    <td>'
			+'           							 <select id="signup_division" disabled>'
			+'        									<option value="1"'+(vo.m_division == 1 ? "selected" : "")+'>학습관리자</option>'
			+'        									<option value="2"'+(vo.m_division == 2 ? "selected" : "")+'>학습자</option>'
			+'       									<option value="3"'+(vo.m_division == 3 ? "selected" : "")+'>운영관리자</option>'
			+'      								 </select>'
			+'                                    </td>'
			+'                                </tr>'
			+'                            </tbody>'
			+'                        </table>'
			+'                    </div><!-- // logWrap-->'
			+' 			<ul class="list_info list_info_center">'
			+'             <li>'
			+'                 한기원을 더 이상 이용하지 않습니까? <a href="https://www.kbaduk.or.kr/member/withdrawal/" class="link_info">회원 탈퇴하기</a>'
			+'             </li>'
			+'         </ul>'
			+'                </div><!-- // memberBox-->'
			+'                <div class="btnArea-center">'
			+'                    <span class="btn btn-point btn-lg"><button type="submit" id="signupBtn">정보수정</button></span>'
			+'                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>'
			+'                </div>'

			// '출생 연도' 셀렉트 박스 option 목록 동적 생성
			var birthYearEl = document.querySelector('#birth-year')
			// option 목록 생성 여부 확인
			isYearOptionExisted = false;
			birthYearEl.addEventListener('focus', function () {
			  // year 목록 생성되지 않았을 때 (최초 클릭 시)
			  if(!isYearOptionExisted) {
			    isYearOptionExisted = true
			    for(var i = 1940; i <= 2023; i++) {
			      // option element 생성
			      const YearOption = document.createElement('option')
			      YearOption.setAttribute('value', i)
			      YearOption.innerText = i
			      // birthYearEl의 자식 요소로 추가
			      this.appendChild(YearOption);
			    }
			  }
			});
			
			// '출생 월' 셀렉트 박스 option 목록 동적 생성
			var birthMonthEl = document.querySelector('#birth-month')
			// option 목록 생성 여부 확인
			isMonthOptionExisted = false;
			birthMonthEl.addEventListener('focus', function () {
			  // month 목록 생성되지 않았을 때 (최초 클릭 시)
			  if(!isMonthOptionExisted) {
			    isMonthOptionExisted = true
			    for(var i = 1; i <= 12; i++) {
			      // option element 생성
			      const MonthOption = document.createElement('option')
			      MonthOption.setAttribute('value', i)
			      MonthOption.innerText = i
			      // birthYearEl의 자식 요소로 추가
			      this.appendChild(MonthOption);
			    }
			  }
			});
			
			// '출생 일' 셀렉트 박스 option 목록 동적 생성
			var birthDayEl = document.querySelector('#birth-day')
			// option 목록 생성 여부 확인
			isDayOptionExisted = false;
			birthDayEl.addEventListener('focus', function () {
			  // day 목록 생성되지 않았을 때 (최초 클릭 시)
			  if(!isDayOptionExisted) {
			    isDayOptionExisted = true
			    for(var i = 1; i <= 31; i++) {
			      // option element 생성
			      const DayOption = document.createElement('option')
			      DayOption.setAttribute('value', i)
			      DayOption.innerText = i
			      // birthYearEl의 자식 요소로 추가
			      this.appendChild(DayOption);
			    }
			  }
			});
			
}

$('#myCartList').click(function () {
    const userConfirmation = confirm('장바구니로 이동 하시겠습니까?');
    if (userConfirmation) {
    	let cr_m_no = $('#m_id').val();
    	console.log("cr_m_no",cr_m_no);
		submain.innerHTML = '';
    	fetchGet('/alpha/mycart/list/'+cr_m_no, resultList);
        
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }

})

function resultList(map){
		let cartList = map.cartList;
		console.log("cartList",cartList);
		submain.innerHTML += ''
			+'<div class="titleBox">'
			+'					<h2 class="t_title">장바구니</h2>'
			+'				</div>'
			+'				<div id="groupInfoDiv" style="text-align:center">'
			+'					<div class="entry" id="groupInfo">'
			+'						<table class="table table-bordered">'
			+'							<caption>그룹 정보</caption>'
			+'							<colgroup>'
			+'								<col width="3%" />'
			+'								<col width="3%" />'
			+'								<col width="40%" />'
			+'								<col width="6%" />'
			+'								<col width="6%" />'
			+'								<col width="10%" />'
			+'							</colgroup>'
			+'							<thead>'
			+'								<tr>'
			+'									<th><input type="checkbox" onclick="chkboxAll()"></th>'
			+'									<th>No</th>'
			+'									<th>콘텐츠명</th>'
			+'									<th>수준</th>'
			+'									<th>인원</th>'
			+'									<th>판매가</th>'
			+'								</tr>'
			+'							</thead>'
			+'							<tbody id="tbdy">'
			+'</tbody>'
			+'							<thead id="tbdy1">'
			+'								<tr>'
			+'									<th colspan="6"></th>'
			+'								</tr>'
			+'							</thead>'
			+'						</table>'
			+'					</div>'
			+'						<input type="button" class="btn btn-primary" id="payOption" value="결제하기">'
			+'						<input type="button" class="btn btn-primary" id="deleteOption" value="선택삭제" style="margin-left:10px; color:#074691; background-color:white">'
			+'				</div>';
		cartList.forEach((cart,index) => {
			let c_no = cart.c_no;
	    	let c_name = cart.c_name;
	    	let cnt = cart.cnt;
	    	let c_level = cart.c_level;
	    	let c_discountrate = cart.c_discountrate;
	    	let c_price = cart.c_price;
	    	let c_sellprice = cart.c_sellprice;
	        var row = document.createElement('tr');
	        row.innerHTML = `
	        	<td><input type="checkbox" name="chkbox" value=${index}></td>
	        	<td>${index+1}</td>
	        	<td>${c_name}</td>
	        	<td>${c_level}</td>
	            <td>${cnt}</td>
	        	<td style="color:red">[${c_discountrate}]${c_sellprice}원</td>
	        	<input type="hidden" data-cno=${index} value=${c_no}>
	        	<input type="hidden" data-cnt=${index} value=${cnt}>
	        	<input type="hidden" data-cprice=${index} value=${c_price}>
	        `;
	        tbdy.appendChild(row);
		})
		}
