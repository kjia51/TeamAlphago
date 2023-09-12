<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" href="/resources/images/favicon.ico">
</head>
<body>
<%@ include file="../common/header.jsp" %>
	

<div id="container" class="membershipWrap">
    <div class="wrap">
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">로그인</h2>
            </div>

            <form class="entry" id="signinForm">
                <div class="memberBox">
                    <div class="logWrap">
                        <h3 class="tit_register">회원 로그인</h3>
                        <div class="input_area">
                            <div class="inp_wrap">
                                <input type="text" class="input-default" title="아이디를 입력해주세요." placeholder="아이디를 입력해주세요." name="signin_id" id="signin_id"/>
                            </div>
                            <div class="inp_wrap">
                                <input type="password" class="input-default" title="비밀번호를 입력해주세요." placeholder="비밀번호를 입력해주세요." name="signin_pwd" id="signin_pwd"/>
                            </div>
                        </div>
                        <ul class="list_info">
                            <li> 아이디 / 비밀번호를 잊어버렸나요? <a href="/alpha/find_id/" class="link_info">아이디 찾기</a> /
                            	<a href="/alpha/find_pw/" class="link_info">비밀번호 찾기</a> </li>
                            <li> 회원이 아니신가요? <a href="/alpha/signup_step1/" class="link_info">회원가입 하기</a> </li>
                        </ul>
                    </div>
                </div>
                <div class="btnArea-center">
                    <span class="btn btn-point btn-lg"><button type="button" id="signinBtn">로그인</button></span>
                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                </div>
            </form>

        </div>
    </div>
</div>


<script type="text/javascript">
        $(function(){
        	
        
        var btn = $('#signinBtn');
        btn.on('click', function(){
            var signin_id = document.querySelector('#signin_id').value;
            var signin_pwd = document.querySelector('#signin_pwd').value;
            
            var loginData = {"m_id" : signin_id, "m_password" : signin_pwd}
            
            console.log(loginData);
            
            $.ajax({
            	type : "post",
            	url : "/alpha/loginAction",
            	contentType : 'application/json',
            	data : JSON.stringify(loginData),
            	success : function(response){
            		alert('로그인이 완료되었습니다.');
            	    location.href = response.url;
            	},
            	error: function(xhr, status, error) {
            		var errorMessage = xhr.responseText; // 서버에서 전달한 오류 메시지를 가져옴
                    alert('로그인에 실패했습니다. 아이디 및 비밀번호를 확인해주세요.');
                    console.error('로그인 실패:', status, error);
                }
            });
        });

        $('#signinForm').on('keydown', function (e) {
            if(e.keyCode == 13) {
            	e.preventDefault();
                btn.trigger('click');
            }
        });
        
        })
        
     
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>