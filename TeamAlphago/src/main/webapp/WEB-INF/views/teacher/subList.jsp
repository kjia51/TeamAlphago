<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 내역</title>
</head>
<style>
.main-box {
    width: 60%;
    height: 100%;
    background-color: #fff;
    border: 1px solid #d8dfe6;
    margin: 0 auto;
    justify-content: center;
}
</style>
<body>

<%@ include file="../common/header.jsp" %>

<div class="main-box">
<input id="m_id" type="text" value="${memberVO.m_id }">

<div id="container">
    <div class="wrap">


        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">구독 조회</h2>
            </div>

            <!--연간일정-->
            <div class="topbtnWrap">
                <i class="ico ico-cal"></i><span class="btn btn-default"><a href="https://www.kbaduk.or.kr/competition/annualSchedule/">연간일정</a></span>
            </div>


            <!--대회검색-->
            <form class="searchWrap searchWrap_wide">
                <table class="table table-bordered">
                    <caption>검색</caption>
                    <colgroup>
                        <col>
                        <col width="33.5%" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="col">대회보기</th>
                            <td>
                                <div class="searchBox">
                                    <select title="검색 분류" name="s_cate" onchange="location.href='./?s_cate='+this.value;" value="">
                                        <option value="">전체</option>
                                                                                    <option value="31">전국 온라인 바둑축제</option>
                                                                                    <option value="30">전국 동호인 디비전 바둑리그</option>
                                                                                    <option value="29">바둑 대축제</option>
                                                                                    <option value="26">전국 생활체육 동호인 바둑리그</option>
                                                                                    <option value="23">대한체육회장배 전국바둑선수권대회</option>
                                                                                    <option value="22">일요신문배 어린이</option>
                                                                                    <option value="11">세계대회 선발전</option>
                                                                                    <option value="10">전국 동호인바둑대회</option>
                                                                                    <option value="9">전국(소년)체육대회</option>
                                                                                    <option value="8">롯데백화점배 어린이 바둑대축제</option>
                                                                                    <option value="7">문화체육관광부장관배 전국학생바둑대회</option>
                                                                                    <option value="2">프로기전 아마선발전</option>
                                                                                    <option value="1">내셔널바둑리그</option>
                                                                            </select>
                                </div>
                            </td>
                            <th scope="col">대회검색</th>
                            <td>
                                <div class="searchBox searchBox-sm">
                                    <fieldset>
                                        <legend>전체 검색</legend>
                                        <select title="검색 분류" name="cate" value="">
                                            <option value="title">제목</option>
                                            <option value="content">내용</option>
                                            <option value="title:content">제목 + 내용</option>
                                        </select>
                                        <input type="text" class="inputSrch" title="검색어를 입력해주세요." autofocus="autofocus" placeholder="검색어를 입력해주세요." name="word" value="" />
                                        <input type="submit" class="btn btn-primary" value="검색" />
                                    </fieldset>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>


<div class="entry">
	<table class="table table-bordered">
		<caption>구독 내역</caption>
		<colgroup>
		<col width="15%" />
		<col width="40%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="15%" />
		</colgroup>
			<thead>
    			<tr>
			        <th>구독ID</th>
			        <th>패키지명</th>
			        <th>구독일</th>
			        <th>구독료</th>
			        <th>인원</th> <%--수강가능인원/현재수강인원 --%>
			        <th>그룹관리</th>
    			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${subList != null && fn:length(subList) > 0 }">
						<c:forEach  var="sub" items="${subList }" varStatus="status">
						
						<tr>
                            	<c:if test="${fn:length(sub.sub_id) > 1}">
									<td><input type="text" class="index" id="sub_id" data-subuid="${status.index}" value="${fn:substring(sub.sub_id,4,16)}" readonly></td>
								</c:if>
                   
                            <th align="left" class="row"> <a href="https://www.kbaduk.or.kr/bbs/view/competition/domestic/864/">${sub.sub_name }</a> </th>
                            <td align="center">${sub.sub_date }</td>
                            <td align="center"> <input type="text" class="index" id="sub_price" data-sub_price="${status.index}" value="${sub.sub_price }"readonly></td>
                            <td align="center">${sub.sub_able } / ${sub.sub_current }</td>
                            <td align="center"><button>그룹관리</button> <button onclick="cancelPay(${status.index})">콘텐츠환불</button></td>
                            
                           
                        </tr>
						
						
						</c:forEach>
					</c:when>
				<c:otherwise>
					<tr>
				 		<td>존재하지 않습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>

         	</tbody>
        </table> 
    </div>
</div>
<!-- //content close -->

</div>
</div>
</div>

<script>
function cancelPay(index) {
	var i = index;
	console.log(i);
	
	var imp_uid = 'imp_'+$('input[data-subuid="'+index+'"]').val();
	var pay = $('input[data-sub_price="'+index+'"]').val();
	
	console.log(imp_uid);
	console.log(pay);
	
	console.log('삭제실행');
	
	$.ajax({

	      url: "/payment/cancel", 
	      type: "Post",
	      data: ({
	        imp_uid: imp_uid, //주문번호
	        amount: pay, //결제금액
	        
      })
    }).done(function(result) { // 환불 성공시 로직 
        alert("환불 성공");
    
	        $.ajax({

	            url: "/alpha/delete", 
	            type: "Post",
	            data: ({
	                  imp_uid: imp_uid, //주문번호    
	            })
	        })
    
        alert("삭제완료");
	    location.reload();
    
    }).fail(function(error) { // 환불 실패시 로직
      	alert("환불 실패");
    });
	
}

</script>

<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>

</body>
</html>