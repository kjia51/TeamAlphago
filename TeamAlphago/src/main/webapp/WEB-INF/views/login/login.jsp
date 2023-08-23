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
                <h2 class="t_title">로그인</h2>
            </div>

            <form class="entry" id="signinForm">
                <div class="memberBox">
                    <div class="logWrap">
                        <h3 class="tit_register">회원 로그인</h3>
                        <div class="input_area">
                            <div class="inp_wrap">
                                <input type="text" class="input-default" title="아이디를 입력해주세요." placeholder="아이디를 입력해주세요." name="signin_id"/>
                            </div>
                            <div class="inp_wrap">
                                <input type="password" class="input-default" title="비밀번호를 입력해주세요." placeholder="비밀번호를 입력해주세요." name="signin_pwd"/>
                            </div>
                        </div>
                        <ul class="list_info">
                            <li> 아이디&amp;비밀번호를 잊어버렸나요? <a href="https://www.kbaduk.or.kr/member/find/" class="link_info">아이디&amp;비밀번호 찾기</a> </li>
                            <li> 회원이 아니신가요? <a href="https://www.kbaduk.or.kr/member/signup_step1/" class="link_info">회원가입 하기</a> </li>
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
	function($, fs) {
        var $btn = $('#signinBtn');
        $btn.on('click', function(){
            fs.ajax({
                data : {
                    bbs : 'sign' ,
                    function : 'in'
                } ,
                form : $(this.form) ,
                action: 'process' ,
                success : function( data, b ){
                    location.href = data.route;
                }
            });
        });

        $('#signinForm').on('keydown', function (e) {
            if(e.keyCode == 13) {
                $btn.trigger('click');
            }
        });
</script>

<%@ include file="../common/footer.jsp" %>

</body>
</html>