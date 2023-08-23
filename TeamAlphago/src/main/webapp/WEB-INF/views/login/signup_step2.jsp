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
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">이름 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="signup_name"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">생년월일 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="signup_birth" />
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
                                        <input type="text" class="input-default" id="signup_email" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">휴대폰 번호 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="signup_phone" />
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
	// 아이디 유효성 검사
	var idInput = document.getElementById('signup_id');
	idInput.addEventListener('input', function() {
	    var id_div = document.getElementById('id_div'); // 아이디 옆의 <div> 요소
	    
	    if (!isValidId(idInput.value)) {
	        id_div.innerHTML = "아이디는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.";
	    } else {
	        id_div.innerHTML = ""; // 유효한 경우 메시지 제거
	    }
	});
	
	// 비밀번호 유효성 검사
	var signup_pwdInput = document.getElementById('signup_pwd');
    signup_pwdInput.addEventListener('input', function() {
        var pwd_div = document.getElementById('pwd_div'); // 비밀번호 옆의 <div> 요소
        
        if (!isValidPassword(signup_pwdInput.value)) {
            pwd_div.innerHTML = "비밀번호는 영문자와 숫자로 구성되며 최소 6자리 이상이어야 합니다.";
        } else {
            pwd_div.innerHTML = ""; // 유효한 경우 메시지 제거
        }
    });
	
	var checkDuplicateBtn = document.getElementById('checkDuplicateBtn');
	checkDuplicateBtn.addEventListener('click', function(){
		
	})
	
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
		let birth = document.getElementById('signup_birth').value;
		let addr1 = document.getElementById('signup_addr').value;
		let phone = document.getElementById('signup_phone').value;
		let email = document.getElementById('signup_email').value;
		let division = document.getElementById('signup_division').value;
		
		
		let data = {
		    m_id: id,
		    m_password: pwd,
		    m_name: name,
		    m_birth: birth,
		    m_address: addr1,
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
	
	//아이디 유효성 검사 함수
	function isValidId(id) {
	    // 영문자와 숫자로 구성되며 최소 6자리 이상인지 검사
	    const regex = /^[a-zA-Z0-9]{6,}$/;
	    return regex.test(id);
	}
	
	// 비밀번호 유효성 검사 함수
	function isValidPassword(password) {
        // 영문자와 숫자로 구성되며 최소 6자리 이상인지 검사
        const regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;
        return regex.test(password);
	}
	
	// 비밀번호 확인 검사 함수
    function checkPasswordMatch() {
        var pwd = signup_pwdInput.value;
        var pwdChk = signup_pwdChkInput.value;

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