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
                <h2 class="t_title">비밀번호 찾기</h2>
            </div>

            <form class="entry" id="findPwForm">
                <div class="memberBox">
                    <div class="logWrap">
                        <h3 class="tit_register">회원 비밀번호 찾기</h3>
                        <div class="input_area" id="input_area">
                            <div class="inp_wrap">
                                <input type="text" class="input-default" title="아이디를 입력해주세요." placeholder="아이디를 입력해주세요." name="findPwId" id="findPwId"/>
                                <input type="text" class="input-default" title="이메일 주소를 입력해주세요." placeholder="이메일 주소를 입력해주세요." name="findPwEmail" id="findPwEmail"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnArea-center">
                    <span class="btn btn-point btn-lg"><button type="button" id="findPwBtn">찾기</button></span>
                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                </div>
            </form>

        </div>
    </div>
</div>


<script type="text/javascript">
        $(function(){
        	
        
        	var btn = $('#findPwBtn');
        	btn.on('click', function(){
        		var findPwId = document.querySelector('#findPwId').value;
        		var findPwEmail = document.querySelector('#findPwEmail').value;
        		var input_area = document.querySelector('#input_area');

        	    var loginData = {"m_id" : findPwId, "m_email" : findPwEmail}

        	    console.log(loginData);

        	    $.ajax({
        	        type : "post",
        	        url : "/alpha/find_pw_check",
        	        contentType : 'application/json',
        	        data : JSON.stringify(loginData),
        	        success : function(result) {
        	            if (result.result === "success") {
        	                
        	                input_area.innerHTML = "입력하신 이메일 주소로 임시 비밀번호가 발송되었습니다.";
        	                
        	                var findPwBtn = document.querySelector('div>span:first-child');
        	                findPwBtn.innerHTML = '<button type="button" id="findIdBtn">로그인</button>';
        	                findPwBtn.addEventListener('click', function(e){
        	                	e.preventDefault();
        	                	location.href = '/alpha/login';
        	                })
        	                
        	            } else {
        	                alert('가입 정보가 없습니다.');
        	            }
        	        },
        	        error: function(xhr, status, error) {
        	            var errorMessage = xhr.responseText;
        	            alert('확인 중 오류가 발생했습니다.');
        	            console.error('이메일 확인 실패:', status, error);
        	        }
        	    });
        	
        });

        $('#findIdEmail').on('keydown', function (e) {
            if(e.keyCode == 13) {
            	e.preventDefault();
                btn.trigger('click');
            }
        });
        
        })
        
        /* 
        function findIdConfirm(response){
        	var list = response.list;
            console.log(list);

            // list에서 원하는 값들을 추출하여 사용 가능
            for (var i = 0; i < list.length; i++) {
                var member = list[i];
                console.log(member.m_id)
            }
        } */
     
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>