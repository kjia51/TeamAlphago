<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                        <input type="text" class="input-default" placeholder="아이디를 입력해주세요." maxlength="20" name="id" id="id" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">비밀번호 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="password" class="input-default" placeholder="비밀번호를 입력해주세요." maxlength="20" name="pwd" id="pwd"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">비밀번호 확인 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="password" class="input-default" placeholder="비밀번호 확인을 입력해주세요." maxlength="20" name="pwdChk" id="pwdChk"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">이름 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="name"/>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">생년월일 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="birth" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">주소 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default input-lg" placeholder="주소를 입력해 주세요." maxlength="100" id="addr1" name="addr1" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">이메일 주소<span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="email" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">휴대폰 번호 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <input type="text" class="input-default" id="phone" />
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row">회원 구분 <span class="t_red">&#42;</span></th>
                                    <td>
                                        <select id="division">
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

var signupBtn = document.getElementById('signupBtn');
signupBtn.addEventListener('click', function(e) {
	  // 이벤트 초기화
	  e.preventDefault();
	  
	  register();
});


function register(){
	
	let id = document.getElementById('id').value;
	let pwd = document.getElementById('pwd').value;
	let pwdChk = document.getElementById('pwdChk').value;
	let name = document.getElementById('name').value;
	let birth = document.getElementById('birth').value;
	let addr1 = document.getElementById('addr1').value;
	let phone = document.getElementById('phone').value;
	let email = document.getElementById('email').value;
	let division = document.getElementById('division').value;
	
	
	
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

//서버로부터 받은 메시지를 이용하여 알림창을 띄우는 함수
function showAlert(message) {
  alert(message);
}
</script>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>