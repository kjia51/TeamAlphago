<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="icon" href="/resources/images/favicon.ico">
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
                                    <div class="txtBox" style="width: 600px;">
                                        <div class="rules">
                                            홈페이지 이용 약관<br>
                <br>
            <pre>
<b>제 1 장 총칙</b>
1.1. 본 홈페이지를 이용하는 모든 이용자는 아래의 약관을 숙지하고 준수해야 합니다. 
     이 약관은 이용자와 홈페이지(또는 앱) 운영자 간의 계약을 형성하며, 이를 위반할
     경우 법적 조치가 취해질 수 있습니다.
	   
1.2. 이 약관은 홈페이지의 이용, 콘텐츠, 서비스, 기능 등에 적용됩니다.

<b>제 2 장 콘텐츠 및 지적 재산권</b>

2.1. 홈페이지에 게시된 모든 콘텐츠(텍스트, 그래픽, 로고, 사진, 비디오 등)의
     지적 재산권은 홈페이지 운영자 또는 해당 콘텐츠 소유자에게 속합니다.
	   
2.2. 이용자는 홈페이지 내에서 제공된 콘텐츠를 개인적으로 사용할 수 있으며,
     상업적인 목적으로 사용하거나 재배포할 수 없습니다.

<b>제 3 장 약관의 효력과 수정</b>

3.1. 본 약관은 회원이 회사의 서비스를 이용하는 동안 효력을 가집니다.

3.2. 회사는 본 약관을 언제든지 수정할 권리를 가지며, 수정된 약관은 서비스 내에서
     공지됩니다. 수정된 약관은 공지 즉시 효력을 가집니다.

<b>제 4 장 서비스 이용 권한</b>

4.1. 회원은 회사의 서비스를 이용할 권한을 가집니다.

4.2. 회사는 회원의 서비스 이용 권한을 일부 또는 전부 제한할 권리를 가집니다.

<b>제 5 장 서비스 이용 제한</b>

5.1. 회사는 다음의 경우에 회원의 서비스 이용을 제한할 수 있습니다:

5.1.1. 불법 활동 또는 부적절한 행동
5.1.2. 기타 회사의 정책 또는 약관 위반

<b>제 6 장 책임과 면책</b>

6.1. 회사는 회원이 서비스를 이용함으로써 발생하는 어떠한 손해에 대해서도 책임을 
     지지 않습니다.
	   
6.2. 회원은 서비스 이용 시 발생하는 모든 활동에 대한 책임을 집니다.

<b>제 7 장 약관 해지</b>

7.1. 회원은 언제든지 본 약관을 해지하고 회원 가입을 취소할 수 있습니다.</pre>
                                           
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
                                    <div class="txtBox" style="width: 600px;">
                                        <div class="rules">
                                            홈페이지 개인정보처리방침<br>
                                            
                <pre>
<b>1. 개인정보 수집 및 이용 동의</b>

1.1. 회사명는 고객의 개인정보 보호를 매우 중요하게 생각하며, 이에 따라 개인정보
     보호법 및 관련 법령을 준수하고 있습니다.
	   
1.2. 본 약관은 회사가 개인정보를 수집하고 이용하는 방식을 설명하며, 귀하의 동의를 
     얻기 위한 목적으로 제공됩니다.

<b>2. 수집하는 개인정보 항목</b>

2.1. 회사는 다음과 같은 개인정보 항목을 수집할 수 있습니다:

2.1.1. 성명
2.1.2. 연락처 정보 (전화번호, 이메일 주소 등)
2.1.3. 주소 정보
2.1.4. 기타 서비스 이용과 관련된 정보

<b>3. 개인정보의 수집 및 이용 목적</b>

3.1. 회사는 수집한 개인정보를 다음과 같은 목적으로 사용할 수 있습니다:

3.1.1. 서비스 제공과 관련된 목적으로 개인정보 사용
3.1.2. 서비스 개선 및 개인화된 서비스 제공
3.1.3. 서비스 관련 공지사항 전달
3.1.4. 문의나 민원 처리
3.1.5. 기타 서비스 관련 목적

<b>4. 개인정보의 보유 및 보관 기간</b>

4.1. 회사는 개인정보를 수집한 목적을 달성한 후에는 해당 정보를 즉시 파기하거나,
     보관 기간이 지나면 파기하거나, 별도로 분리하여 보관할 수 있습니다.

<b>5. 개인정보 제공 및 공유</b>

5.1. 회사는 귀하의 개인정보를 본인의 동의 없이 타 기업이나 단체에 제공하지 
     않습니다.

5.2. 법령에 의해 요구되거나 법적 의무를 준수하기 위해 개인정보를 제공해야 할  
     경우에는 별도의 동의 없이 개인정보를 제공할 수 있습니다.

<b>6. 권리와 선택</b>

6.1. 귀하는 언제든지 제공한 개인정보에 대한 접근 권리를 가지며,정보의 정정, 삭제,
     이동 및 처리 중지를 요청할 수 있습니다.

6.2. 개인정보 처리에 대한 동의 철회가 가능하며, 이 경우에는 서비스 이용에 제한이
     있을 수 있습니다.

<b>7. 개인정보 보호 조치</b>

7.1. 회사는 개인정보 보호를 위해 적절한 물리적, 기술적 및 관리적 조치를 취합니다.

<b>8. 동의의 철회</b>

8.1. 귀하는 언제든지 본 동의를 철회할 수 있으며, 이 경우 개인정보 처리가
     중단됩니다.

<b>9. 변경 사항</b>

9.1. 본 약관은 변경될 수 있으며, 변경 사항은 웹사이트 내에서 공지됩니다. </pre>
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