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

function resultMain(map){
	let m_id = $('#m_id').val();
	console.log(m_id);
		const userConfirmation = confirm(map.msg);
		console.log("userConfirmation", userConfirmation);
		if(userConfirmation){
			window.location.href = "/alpha/main";		
			} else {
			}
		
}

window.addEventListener('load', function(){
	console.log("Get")
        // 사용자가 "확인"을 선택한 경우
    	submain.innerHTML = '';
    	fetchGet('/alpha/member/list', resultEditList)
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    
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
			+'   <p>입력하신 정보는 본인 확인용으로 사용되며, 개인 정보 수정이 완료되면 사용자 확인을 위해 회원정보에 저장됩니다.</p>'
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
			+'                                        <input type="password" class="input-default" value="" maxlength="20" name="orgin_pwd" id="orgin_pwd"/>'
			+'                                        <div class="alert-div" id="pwd_org"></div>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">변경될 비밀번호</th>'
			+'                                    <td>'
			+'                                        <input type="password" class="input-default" placeholder="비밀번호 변경 하실때만 입력하세요" value="" maxlength="20" name="new_pwd" id="new_pwd" disabled/>'
			+'                                        <div class="alert-div" id="pwd_chg"></div>'
			+'                                    </td>'
			+'                                </tr>'
			+'                                <tr>'
			+'                                    <th scope="row">비밀번호 확인</th>'
			+'                                    <td>'
			+'                                        <input type="password" class="input-default" placeholder="비밀번호 변경 하실때만 입력하세요" value="" maxlength="20" name="pwdChk" id="pwdChk" disabled/>'
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
			+'                                        <input type="text" class="input-default input-lg" value="'+vo.m_email+'" maxlength="100" id="signup_email" name="signup_email" disabled/>'
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

			+'                </div><!-- // memberBox-->'
			+'                <div class="btnArea-center">'
			+'                    <span class="btn btn-point btn-lg"><button type="submit" id="signupBtn">정보수정</button></span>'
			+'                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>'
			+'                </div>'
			
			
			var pwd_chg = document.getElementById('pwd_chg');
			var pwd_org = document.getElementById('pwd_org');
			var pwdChk_div = document.getElementById('pwdChk_div');
			const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
		$('#orgin_pwd').blur(function () {
			
			var orgin_input = $('#orgin_pwd').val();
			var orgin_pwd =  $('#m_password').val();
			var length = orgin_input.length;
			if(orgin_input==orgin_pwd){
				$('#new_pwd').prop('disabled', false);
				
				pwd_org.innerHTML='인증완료';
				$('#new_pwd').focus();
			} else{
				$('#new_pwd').prop('disabled', true);
				$('#pwdChk').prop('disabled', true);
				if(length==0){
					pwd_org.innerHTML='';					
				} else{
					pwd_org.innerHTML='비밀번호가 일치하지 않습니다.';
			}
			}
		});

	    // 비밀번호 유효성 검사
		$('#new_pwd').on('input', function () {
			let orgin_pwd = $('#orgin_pwd').val();
			let new_pwd = $('#new_pwd').val();
			let length = new_pwd.length;
        	if(length==0){
        		pwd_chg.innerHTML = ""; // 일치하는 경우 메시지 제거
        	} else{
	        if (!pwRegex.test($('#new_pwd').val())) {
	        	pwd_chg.innerHTML = "비밀번호는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.";
		  		  $('#new_pwd').focus();
	        } else {
	        	if(orgin_pwd==new_pwd){
	        		pwd_chg.innerHTML = "기존 비밀번호는 사용하실 수 없습니다";
	        		$('#new_pwd').val('');
	        		
	        	}else{
	        		pwd_chg.innerHTML = ""; // 유효한 경우 메시지 제거
	        		$('#pwdChk').prop('disabled', false);
	        	}
	        }
        	}
	        // 비밀번호 확인 검사
	    });
		// 비밀번호 일치 검사
		$('#pwdChk').blur(function () {
	        var new_pwd = $('#new_pwd').val();
	        var pwdChk = $('#pwdChk').val();

        	if(pwdChk==null){
        		pwdChk_div.innerHTML = ""; // 일치하는 경우 메시지 제거
        	} else{
	        
	        if (new_pwd !== pwdChk ) {
	        	pwdChk_div.innerHTML = "비밀번호가 일치하지 않습니다.";
	        	$('#pwdChk').focus();
	        } else {
	        	pwdChk_div.innerHTML = "비밀번호가 일치합니다"; // 일치하는 경우 메시지 제거
	        }
        	}
		});
		
		
		
			$('#signupBtn').click(function () {
				let orgin_pwd = $('#orgin_pwd').val();
				console.log(orgin_pwd);
		        var new_pwd = $('#new_pwd').val();
		        console.log(new_pwd);
		        var pwdChk = $('#pwdChk').val();
		        var m_password = $('#m_password').val();
		        console.log(pwdChk);
		        const userConfirmation = confirm('정보를 수정 하시겠습니까?');
		        if (userConfirmation) {
		        
	
	        	if(orgin_pwd==null ||orgin_pwd==''){
	        		alert('정보수정을 위해선 기존 비밀번호를 확인해주셔야 합니다.');
	        		$('#orgin_pwd').focus();
	        		return;
	        	}
		        if(orgin_pwd!=m_password){
		        	alert('기존 비밀번호가 일치하지 않습니다');
		        	console.log(1);
		        	$('#orgin_pwd').focus();
		        	return;
		        }
		        // 비밀번호 유효성검사 확인
		        if (!pwRegex.test(new_pwd)) {
		        	alert('비밀번호는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.');
		        	return false;
		        }
				if(new_pwd!=null && new_pwd!=''){
					if(pwdChk==null ||pwdChk==''){
						console.log(2);
						alert('비밀번호 확인란이 일치하지 않습니다.');
						$('#pwdChk').focus();
						return false;
					}
				}
				if(new_pwd==null ||new_pwd==''){
					console.log(3);
					pwdChk = $('#orgin_pwd').val();
					console.log(pwdChk);
				}
				


					let m_id = $('#m_id').val();
					console.log(m_id)
					let m_address = $('#signup_addr').val();
					console.log(m_id);
					console.log(m_address);
					console.log(pwdChk);
	                let obj = {
	                		m_id: m_id,
	                		m_password: pwdChk,
	                		m_address: m_address
	                    };
					fetchPut('/alpha/member/edit',obj, resultMain);
					
				} else {
					// 사용자가 "취소"를 선택한 경우
					// 아무 작업도 수행하지 않음
					
				}
				
			})
			
			
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

//컨텐츠 등록, 수정, 삭제의 결과를 처리하는 함수
function resultCart(map){
	console.log(map);
	if(map.result == 'success'){
		alert(map.msg);
		window.location.href = "/alpha/mycart";
	} else {
		alert(map.msg);
	}
		
}
function resultList(map){
		let cartList = map.cartList;
		console.log("cartList",cartList);
		classList.innerHTML = ''
		submain.innerHTML = ''
		submain.innerHTML += ''
			+'<div class="titleBox">'
			+'					<h2 style="text-align:left">장바구니</h2>'
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
			+'						<input type="button" class="btn btn-primary" id="deleteOption" value="선택삭제" style="margin-left:10px; color:#074691; background-color:white">'
			+'					<h2 style="text-align:left">할인/결제금액</h2>'
			+'					<br>'			
			+'					<div class="entry" id="grouppay">'
			+'						<table class="table table-bordered" style="border:0px; font-weight:900; font-size:1.2em">'
			+'							<caption>결제정보</caption>'
			+'							<colgroup>'
			+'								<col width="35%" />'
			+'								<col width="30%" />'
			+'								<col width="35%" />'
			+'							</colgroup>'
			+'							<thead>'
			+'								<tr>'
			+'									<th>총 주문금액</th>'
			+'									<th>할인금액</th>'
			+'									<th style="background-color:red; color:white">총 결제금액</th>'
			+'								</tr>'
			+'							</thead>'
			+'							<tbody id="tbdy2">'
			+'								<tr>'
			+'									<td>0원</td>'
			+'									<td>0원</td>'
			+'									<td style="color:red; font-weight:900; font-size:1.5em">0원</td>'
			+'								</tr>'
			+'</tbody>'
			+'						</table>'
			+'					</div>'
			+'					<h2 style="text-align:left">취소/환불 안내</h2>'
			+'					<h4 style="text-align:left">유의사항 및 환급조건을 확인하였으며, 이에 동의합니다 <input type="checkbox" style="margin-top: 6px;"></h4>	'
			+'					<div class="entry" id="grouppay" style="border:1px solid black; text-align: left;">'
			+'<ul style="margin-top: 15px;">'
			+'<li style="list-style: square; margin-left: 25px;">결제 후 미사용시 7일 이내 전액 환불이 가능하며, 7일이 경과한 경우 문의를 통해 수수료를 공제한 부분 환불이 가능합니다.</li>'
			+'<li style="list-style: square; margin-left: 25px;">그룹 연결 이력이 없고 결제일로부터 7일이 지나지 않은 경우 별도의 문의 없이 전액 환불이 가능합니다.</li>'
			+'<li style="list-style: square; margin-left: 25px;">교재포함 상품의 경우, 교재의 반품 규정에 따라 교재비가 차감된 금액이 환불됩니다.</li>'
			+'<li style="list-style: square; margin-left: 25px;">할인 적용 상품의 경우 할인 받은 금액을 제외하고 환불됩니다.</li>'
			+'<li style="list-style: square; margin-left: 25px;">환불 요청 시 결제한 결제수단으로 환불됩니다.</li>'					
			+'</ul>'
			
			
			+'					</div><br>'

			
			+'						<input type="button" class="btn btn-primary" id="payOption" value="결제하기" style="margin-bottom:30px">'
			+'				</div>'
			
			;
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
		
		$('#deleteOption').on('click', function() {
	let cr_m_no = $('#m_id').val();
	console.log(cr_m_no);
	var selectedIndexes = [];
	
	$('input:checkbox[name=chkbox]').each(function() {
	        if (this.checked) {
	            selectedIndexes.push($('input:checkbox[name=chkbox]').index(this));
	        }
	    })
	        console.log(selectedIndexes);
	        selectedIndexes.forEach(function(index) {
	    	let cr_c_no = $('input[data-cno="'+index+'"]').val();
	    	let cnt = $('input[data-cnt="'+index+'"]').val();
	    	console.log(cr_c_no);
	    	// 확인과 취소를 묻는 알림창 표시
	        const userConfirmation = confirm('정말로 삭제하시겠습니까?');
	        
	        if (userConfirmation) {
	            // 사용자가 "확인"을 선택한 경우
	            fetchDelete('/alpha/content/DeleteCart/' + cr_c_no + '/' + cr_m_no + '/' + cnt, resultList);
	            
	        } else {
	            // 사용자가 "취소"를 선택한 경우
	            // 아무 작업도 수행하지 않음
	        }
	
	
		})
		})
		}
