<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<link rel="icon" href="/resources/images/favicon.ico"></head>
<body>
<%@ include file="../common/header.jsp" %>
	

<div id="container" class="membershipWrap">
    <div class="wrap">
        <div class="content_wrap">

            <div class="titleBox">
                <h2 class="t_title">아이디 찾기</h2>
            </div>

            <form class="entry" id="findIdForm">
                <div class="memberBox">
                    <div class="logWrap">
                        <h3 class="tit_register">회원 아이디 찾기</h3>
                        <div class="input_area" id="input_area">
                            <div class="inp_wrap">
                                <input type="text" class="input-default" title="이메일 주소를 입력해주세요." placeholder="이메일 주소를 입력해주세요." name="findIdEmail" id="findIdEmail"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnArea-center">
                    <span class="btn btn-point btn-lg"><button type="button" id="findIdBtn">찾기</button></span>
                    <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>
                </div>
            </form>

        </div>
    </div>
</div>


<script type="text/javascript">
        $(function(){
        	
        
        	var btn = $('#findIdBtn');
        	btn.on('click', function(){
        		var findIdEmail = document.querySelector('#findIdEmail').value;
        		var input_area = document.querySelector('#input_area');

        	    var loginData = {"m_email" : findIdEmail}

        	    console.log(loginData);

        	    $.ajax({
        	        type : "post",
        	        url : "/alpha/find_id_check",
        	        contentType : 'application/json',
        	        data : JSON.stringify(loginData),
        	        success : function(result) {
        	            if (result.result === "success") {
        	                alert('이메일 주소가 확인되었습니다.');
        	                var list = result.list;
        	                console.log(list);

        	              var ids = '귀하의 아이디는 ';
        	                // list에서 원하는 값들을 추출하여 사용 가능
        	                for (var i = 0; i < list.length; i++) {
        	                    var member = list[i];
        	                    console.log(member.m_id);
        	                    ids += member.m_id + " ";
        	                }
        	                
        	                ids += '입니다.';
        	                input_area.innerHTML = ids;
        	                
        	                var findIdBtn = document.querySelector('div>span:first-child');
        	                findIdBtn.innerHTML = '<button type="button" id="findIdBtn">로그인</button>';
        	                findIdBtn.addEventListener('click', function(e){
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