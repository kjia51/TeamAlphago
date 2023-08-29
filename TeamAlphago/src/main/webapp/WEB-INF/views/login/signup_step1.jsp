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
                        
                        <!--// joinStep-->
                        <h2 class="t_title">정보수집 동의</h2>
                        <p>회원님의 개인정보보호를 위해 개인정보 보호지침을 마련하여 이를 준수하고 있습니다.</p>
                        <p>
                            <strong>회원가입 전 이용약관 및 개인정보 처리방침을 반드시 확인하여 주시기 바랍니다.</strong>
                        </p>
                    </div>
                    <form class="entry" method="get" action="/alpha/signup_step2/">
                        <div class="memberBox memberBox_ref">
                            <div class="joinWrap">
                                <fieldset class="terms">
                                    <legend>
                                        <span class="t_point">&#91;필수 &#93;</span>
                                        이용약관 동의
                                    </legend>
                                    <div class="txtBox">
                                        <div class="rules">
                                            홈페이지 이용 약관<br>
                                            <br>
                                            제 1 장 총칙<br>
                                            <br>
                                           
                                        </div>
                                    </div>
                                    <p class="chk">
                                        <input type="checkbox" name="service" id="service" class="checkbox"/>
                                        <label for="service">
                                            <span class="ico_chk"></span>
                                            <span class="txt_required">이용약관에 동의합니다.</span>
                                        </label>
                                    </p>
                                </fieldset>
                                <fieldset class="terms">
                                    <legend>
                                        <span class="t_point">&#91;필수 &#93;</span>
                                        개인정보 수집 및 이용에 대한 동의
                                    </legend>
                                    <div class="txtBox">
                                        <div class="rules">
                                            홈페이지 개인정보처리방침<br>
                                            <br>
                                            <br>
                                            
                                        </div>
                                    </div>
                                    <p class="chk">
                                        <!--체크박스 체크시 : class="chk_on" 추가 -->
                                        <input type="checkbox" name="privacy" id="privacy" class="checkbox"/>
                                        <label for="privacy">
                                            <span class="ico_chk"></span>
                                            <span class="txt_required">개인정보 수집 및 이용에 동의합니다.</span>
                                        </label>
                                    </p>
                                </fieldset>
                            </div>
                            <!-- // logWrap-->
                        </div>
                        <!-- // memberBox-->
                        <div class="btnArea-center">
                            <span class="btn btn-point btn-lg">
                                <button type="button" id="step1_btn">동의</button>
                            </span>
                            <span class="btn btn-grayline btn-lg">
                                <button type="button" onclick="history.back(-1);">취소</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript">
                var $service = $('#service')
                  , $privacy = $('#privacy');

                $service.add($privacy).on('click', function() {
                    $(this).next('label').toggleClass('chk_on');
                    ;
                });
                $('#step1_btn').on('click', function() {
                    if (!$service.is(':checked')) {
                        window.alert('이용약관에 동의해주세요.');
                        return;
                    }
                    if (!$privacy.is(':checked')) {
                    	window.alert('개인정보처리방침에 동의해주세요.');
                        return;
                    }
                    this.form.submit();
                });
        </script>
        
        <%@ include file="../common/footer.jsp" %>
</body>
</html>