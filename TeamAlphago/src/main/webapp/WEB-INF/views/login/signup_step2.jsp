<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.alert-div{
	display: inline-block;
	width: 175px;
	font-size: 9px;
	color: red;
	line-height: 15px;
	margin-left: 20px;
}
#pwdChk_div{
	line-height: 38px;
}
.id-group {
    display: flex;
    align-items: center;
    position:relative;
}
#checkDuplicateBtn{
	width: 60px;
	font-size: 12px;
	background-color: #cccccc;
	border-radius: 5px;
	position:absolute;
	left: 166px;
}
.birth-list{
	margin-right: 10px;
}
#at{
	display: inline-block;
	line-height: 38px;
	float: left;
	margin: 0 10px;
}
.signup_email{
	float:left; width:130px; height:16px; padding:10px; border:1px solid #ccc; font-size:13px;line-height: 0
}
.signup_domain{
	float:left; width:95px; height:16px; padding:10px; border:1px solid #ccc; font-size:13px;line-height: 0
}
.domain-list{
	margin-top: 1px;
	margin-left: 10px;
}
td{
	height: 38px;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>
	
	<div id="container" class="membershipWrap">
    <div class="wrap">
        <div class="content_wrap">

            <div class="titleBox">
               
                <h2 class="t_title">정보 입력</h2>
                <p>입력하신 정보는 본인 확인용으로 사용되며, 회원 가입이 완료되면 사용자 확인을 위해 회원정보에 저장됩니다.</p>
            </div>

            <form class="entry">
                <div class="memberBox memberBox_nmg">
                    <div class="joinWrap">
                        <table class="table table-bordered table-form">
                            <caption>참가 신청</caption>
                            <colgroup>
                                <col style="width: 200px;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">아이디 <span class="t_red">&#42;</span></th>
                                    <td>
	                                    <div class="id-group">
										    <input type="text" class="input-default" placeholder="아이디를 입력해주세요." maxlength="20" name="id" id="signup_id" />
										    <button type="button" id="checkDuplicateBtn">중복확인</button>
										    <input type="hidden" class="input-default" id="checkDuplicateRes">
	                                        <div class="alert-div" id="id_div"></div>
										</div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">비밀번호 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="password" class="input-default" placeholder="비밀번호를 입력해주세요." maxlength="20" name="pwd" id="signup_pwd"/>
                                        <div class="alert-div" id="pwd_div"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">비밀번호 확인 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="password" class="input-default" placeholder="비밀번호 확인을 입력해주세요." maxlength="20" name="pwdChk" id="signup_pwdChk"/>
                                        <div class="alert-div" id="pwdChk_div"></div>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">이름 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" placeholder="이름을 입력해주세요." id="signup_name"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">생년월일 <span class="t_red">&#42;</span></th>
                                    <td>
                                    	  <select class="birth-list" id="birth-year">
										    <option disabled selected>출생 연도</option>
										  </select>
										  <select class="birth-list" id="birth-month">
										    <option disabled selected>월</option>
										  </select>
										  <select class="birth-list" id="birth-day">
										    <option disabled selected>일</option>
										  </select>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">주소 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default input-lg" placeholder="주소를 입력해 주세요." maxlength="100" id="signup_addr" name="addr1" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">이메일 주소<span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="signup_email" id="signup_email" placeholder="이메일을 입력해 주세요." />
                                         <div id="at">@</div>
                                        <input type="text" class="signup_domain" id="signup_domain" value="naver.com" />
										<select class="domain-list" id="domain-list">
										  <option value="naver.com">naver.com</option>
										  <option value="google.com">google.com</option>
										  <option value="hanmail.net">hanmail.net</option>
										  <option value="kakao.com">kakao.com</option>
										  <option value="nate.com">nate.com</option>
										  <option value="type">직접 입력</option>
										</select>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">휴대폰 번호 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" placeholder="(-)를 제외한 숫자만 입력해주세요." id="signup_phone" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">회원 구분 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <select id="signup_division">
                                        	<option value="1">학습관리자</option>
                                        	<option value="2">학습자</option>
                                        	<option value="3">운영관리자</option>
                                        </select>
                                    </td>
                                </tr>



                                

                            </tbody>
                        </table>
                    </div><!-- // logWrap-->
                </div><!-- // memberBox-->

                <div class="btnArea-center">
                    <span class="btn btn-point btn-lg"><button type="submit" id="signupBtn">회원가입</button></span>
                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                </div>
            </form>

        </div>
    </div>
</div>

<!-- <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	var idInput = document.getElementById('signup_id');
    var pwdInput = document.getElementById('signup_pwd');
    var pwdChkInput = document.getElementById('signup_pwdChk');
    var id_div = document.getElementById('id_div');
    var pwd_div = document.getElementById('pwd_div');
    var pwdChk_div = document.getElementById('pwdChk_div');
    
    // 아이디, 비밀번호 유효성 정규식
    const idRegex = /^[a-zA-Z0-9]{6,}$/;
    const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;

    // 중복체크 결과값
    var checkDuplicateRes = document.getElementById('checkDuplicateRes');
    checkDuplicateRes.value = '0';
    
    // 아이디 유효성 검사
    idInput.addEventListener('input', function() {
        if (!idRegex.test(idInput.value)) {
            id_div.innerHTML = "아이디는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.";
            /* this.style.border = "2px solid red"; */
        } else {
            id_div.innerHTML = ""; // 유효한 경우 메시지 제거
        }
    });

    // 비밀번호 유효성 검사
    pwdInput.addEventListener('input', function() {
        if (!idRegex.test(pwdInput.value)) {
            pwd_div.innerHTML = "비밀번호는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.";
        } else {
            pwd_div.innerHTML = ""; // 유효한 경우 메시지 제거
        }
        
        // 비밀번호 확인 검사
        checkPasswordMatch();
    });

    pwdChkInput.addEventListener('input', function() {
        // 비밀번호 확인 검사
        checkPasswordMatch();
    });
	
    // 아이디 중복확인 버튼 클릭   
	var checkDuplicateBtn = document.getElementById('checkDuplicateBtn');
	checkDuplicateBtn.addEventListener('click', function(){
       		
		if (!idRegex.test(idInput.value)) {
            alert("아이디는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.");
            checkDuplicateRes.value = '0';
        } else {
        	var idInputValue = idInput.value;
        	
        	console.log(idInputValue);
    		
    		fetch('/alpha/check-duplicate', {
    	        method: 'POST',
    	        headers: {
    	            'Content-Type': 'application/json'
    	        },
    	        body: JSON.stringify({ m_id: idInputValue })
    	    })
    	    .then(response => response.json())
    	    .then(data => {
    	    	if (data.result === 'success') {
    	            alert(data.msg);
		        	checkDuplicateRes.value = '1';
    	        } else if (data.result === 'fail') {
    	            alert(data.msg);
    	            checkDuplicateRes.value = '2';
    	        }
    	    })
    	    .catch(error => {
    	        console.error('오류 발생:', error);
    	    });
    		
        }
		
	})
	
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
	
	// 이메일 도메인 입력
	var signup_domain = document.getElementById('signup_domain');
	var domain_list = document.getElementById('domain-list');
	
	domain_list.addEventListener('change', function(e){
		if (this.value !== 'type'){
			signup_domain.value = this.value;
		} else {
			signup_domain.disabled = false;
			signup_domain.value ='';
		}
	})
	
	// 휴대폰번호에 하이픈 추가
	  function addHyphenToPhoneNumber() {
	    let phoneNumber = document.getElementById('signup_phone').value;
	    phoneNumber = phoneNumber.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
	    document.getElementById('signup_phone').value = phoneNumber;
	  }
	
	 // 전화번호 입력란에 onblur 이벤트 핸들러 등록
	  document.getElementById('signup_phone').addEventListener('blur', function() {
	    addHyphenToPhoneNumber();
	  });

	  // 폼을 제출하기 전에 전화번호에 하이픈을 추가
	  addHyphenToPhoneNumber();

	// 회원가입 버튼 클릭
	var signupBtn = document.getElementById('signupBtn');
	signupBtn.addEventListener('click', function(e) {
		  // 이벤트 초기화
		  e.preventDefault();
		  
		  register();
	});
	
	
	
	function register(){
		
		let id = idInput.value;
		let pwd = document.getElementById('signup_pwd').value;
		let pwdChk = document.getElementById('signup_pwdChk').value;
		let name = document.getElementById('signup_name').value;
		let birth = document.getElementById('birth-year').value
					+ "-" + document.getElementById('birth-month').value
					+ "-" + document.getElementById('birth-day').value;
		let addr = document.getElementById('signup_addr').value;
		let phone = document.getElementById('signup_phone').value;
		let email = document.getElementById('signup_email').value
					+ "@" + document.getElementById('signup_domain').value;
		let division = document.getElementById('signup_division').value;
		
		// 입력값 확인
		if (!id || !pwd || !pwdChk || !name || !birth || !addr || !phone ||!email ||!division){
			alert('모든 정보를 입력해주세요.');
	        return false;
		}
		
		// 아이디 중복체크 확인
		if (checkDuplicateRes.value == 0) {
			alert('아이디 중복여부를 확인해주세요.');
	        return false;
		}
		
		// 아이디 중복 확인
		if (checkDuplicateRes.value == 2) {
			alert('이미 사용중인 아이디입니다.');
	        return false;
		}
		
		// 아이디 유효성검사 확인
		if (!idRegex.test(idInput.value)) {
            alert('아이디는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.');
            return false;
        }
		
		// 비밀번호 유효성검사 확인
		if (!pwRegex.test(pwdInput.value)) {
            alert('비밀번호는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.');
            return false;
        }
		
		// 비밀번호 일치 확인
		if (pwdInput.value !== pwdChkInput.value) {
			alert('비밀번호가 일치하지 않습니다.');
	        return false;
		}
		
		let data = {
		    m_id: id,
		    m_password: pwd,
		    m_name: name,
		    m_birth: birth,
		    m_address: addr,
		    m_phone: phone,
		    m_email: email,
		    m_division: division
		};
	
	
		//회원가입 요청
		fetch('/alpha/register', {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/json'
		    },
		    body: JSON.stringify(data)
		})
		.then((response) => response.json())
		.then((result) => {showAlert('회원가입이 완료되었습니다.');
	    location.href = '/alpha/login';})
	}
	

	
	// 비밀번호 확인 검사 함수
    function checkPasswordMatch() {
        var pwd = pwdInput.value;
        var pwdChk = pwdChkInput.value;

        if (pwd !== pwdChk) {
            pwdChk_div.innerHTML = "비밀번호가 일치하지 않습니다.";
        } else {
            pwdChk_div.innerHTML = ""; // 일치하는 경우 메시지 제거
        }
    }
	
	//서버로부터 받은 메시지를 이용하여 알림창을 띄우는 함수
	function showAlert(message) {
	  alert(message);
	}
});
</script>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>