<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="icon" href="/resources/images/favicon.ico">
<style>
#emailWrap{
	display: flex;
    align-items: center;
    justify-content: center;
    margin: 20px 0;
}
.signup_email{
	float:left; width:130px; height:16px; padding:10px; border:1px solid #ccc; font-size:13px;line-height: 0
}
.signup_domain{
	float:left; width:95px; height:16px; padding:10px; border:1px solid #ccc; font-size:13px;line-height: 0
}
#at{
	display: inline-block;
	line-height: 38px;
	float: left;
	margin: 0 10px;
}
.domain-list{
	margin-top: 1px;
	margin-left: 10px;
	width: 120px;
	height: 35px;
	padding-left: 10px;
}
#emailBtn{
	width: 90px;
	height:35px;
	font-size: 12px;
	background-color: #074691;
	color: white;
	margin-left: 10px;
}
#emailCheck{
	float:left; width:150px; height:16px; padding:10px; border:1px solid #ccc; font-size:13px;line-height: 0
}
#emailCheckBtn{
	width: 70px;	
	height:35px;
	font-size: 12px;
	background-color: #074691;
	color: white;
	margin-left: 10px;
}
.div-group {
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
</head>
<body>

<%@ include file="../common/header.jsp" %>
	<div id="container" class="membershipWrap">
    <div class="wrap">
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">본인 인증</h2>
                <p>이메일로 인증하셔야 회원가입을 하실 수 있습니다.</p>
            </div>

            <form class="entry">
                <div class="memberBox">
                    <div class="joinWrap">
                        <h4 class="txt">이메일 인증</h4>
                        <div id="emailWrap">
	                        <input type="text" class="signup_email" id="signup_email" placeholder="이메일을 입력해 주세요." />
	                        	<div id="at">@</div>
	                        <input type="text" class="signup_domain" id="signup_domain" value="naver.com" />
							<select class="domain-list" id="domain-list">
							  <option value="naver.com"> naver.com</option>
							  <option value="gmail.com"> gmail.com</option>
							  <option value="hanmail.net"> hanmail.net</option>
							  <option value="kakao.com"> kakao.com</option>
							  <option value="nate.com"> nate.com</option>
							  <option value="type">직접 입력</option>
							</select>
							<button type="button" id="emailBtn">인증메일 전송</button>
                        </div>
                        <div class="div-group">
                            <input type="text" class="input-default" id="emailCheck" name="emailCheck" placeholder="인증번호를 입력해 주세요."/>
							<button type="button" id="emailCheckBtn">인증 확인</button>
							<input type="hidden" id="temporaryPassword">
							<div class="alert-div" id="emailCheckDiv" style="display:none"></div>
						</div>
                    </div><!-- // logWrap-->
                </div><!-- // memberBox-->
                <div class="btnArea-center">
                    <span class="btn btn-point btn-lg"><button type="button" onclick="goStep3()">회원가입</button></span>
                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">

//이메일 도메인 입력
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

// 이메일 인증
var emailInput = document.getElementById('signup_email');
var domainInput = document.getElementById('signup_domain');
var emailBtn = document.querySelector('#emailBtn');
var temporaryPasswordInput = document.getElementById('temporaryPassword');

emailBtn.addEventListener('click', function() {
    var email = emailInput.value + "@" + domainInput.value;
    console.log(email);
    
    // 서버에 이메일 주소를 전송하는 fetch 요청
    fetch('/alpha/email_check', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email: email })
    })
    .then(response => response.json())
    .then(data => {
    	var temporaryPassword = data.temporaryPassword;
    	
        if (data.status === 'success') {
            alert('인증 메일이 발송되었습니다.');
            
            temporaryPasswordInput.value = temporaryPassword;
        } else {
            alert('인증 메일 발송에 실패했습니다.');
        }
    })
    .catch(error => {
        alert('서버 오류가 발생했습니다.');
    });
});

// 이메일 인증 확인 버튼 클릭
var emailCheckBtn = document.getElementById('emailCheckBtn');
var verificationCodeInput = document.getElementById('emailCheck');
var emailCheckDiv = document.getElementById('emailCheckDiv');


emailCheckBtn.addEventListener('click', function() {
    var enteredVerificationCode = verificationCodeInput.value;
    var temporaryPassword = temporaryPasswordInput.value;

    // 서버에 확인 요청을 보냅니다.
    fetch('/alpha/email_check_confirm', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({verificationCode: enteredVerificationCode, temporaryPassword: temporaryPassword })
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
        	emailCheckDiv.innerHTML = '인증이 완료되었습니다.';
        	alert('인증이 완료되었습니다.');
        } else {
        	emailCheckDiv.innerHTML = '인증 번호가 일치하지 않습니다.';
        	alert('인증 번호가 일치하지 않습니다. 다시 시도하세요.');
        }
    })
    .catch(error => {
        alert('서버 오류가 발생했습니다.');
    });
});

function goStep3(){
	var emailCheck = document.getElementById('emailCheckDiv').innerText;

    if (emailCheck !== '인증이 완료되었습니다.') {
        alert('이메일을 인증해주세요.');
        return false;
    }

    var signupEmail = document.getElementById('signup_email').value;
    var signupDomain = document.getElementById('signup_domain').value;
    var email = signupEmail + "@" + signupDomain;

    // 폼 엘리먼트 동적 생성
    var form = document.createElement('form');
    form.method = 'POST'; // POST 방식 설정
    form.action = '/alpha/signup_step3'; // 이동할 URL 설정

    // email 값을 전송할 hidden input 엘리먼트 생성
    var emailInput = document.createElement('input');
    emailInput.type = 'hidden';
    emailInput.name = 'email'; // 서버에서 읽을 이름
    emailInput.value = email;

    // 폼에 input 엘리먼트 추가
    form.appendChild(emailInput);

    // 폼을 현재 페이지에 추가
    document.body.appendChild(form);

    // 폼을 제출 (페이지 이동)
    form.submit();
}

</script>

<%@ include file="../common/footer.jsp" %>
</body>
</html>