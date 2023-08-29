<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.blue{
    background-color: #f6f7f9;
    border: 1px black solid;
    color: black;
    
    }
  #btn.disabled {
    background-color: #074691;
    color : white;
    cursor: not-allowed;
  }
</style>
</head>
<body>



<%@ include file="../common/header.jsp" %>

<div class="main-box">
<input id="m_id" type="text" value="${memberVO.m_id }">

<div id="container">
    <div class="wrap">


        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">장바구니 목록</h2>
            </div>


<div class="entry">
	<table class="table table-bordered">
		<caption>장바구니</caption>
		<colgroup>
		<col width="20%" />
		<col width="20%" />
		<col width="30%" />
		<col width="20%" />
		</colgroup>
			<thead>
    			<tr>
			        <th>No</th>
			        <th>품목명</th>
			        <th>가격</th> <%--수강가능인원/현재수강인원 --%>
			        <th>수량</th> <%-- 구독일 ~구독일+90 --%>
			        <th>그룹관리</th> <%-- 그룹삭제 / 학생관리 / 숙제관리 --%>
    			</tr>
			</thead>
			<tbody>
						<tr>
                            <th align="left" class="row"> <a href="https://www.kbaduk.or.kr/bbs/view/competition/domestic/864/"></a> </th>
                            <td align="center"> <input type="text" class="index" id="g_name" data-sub_price="${status.index}" value=""readonly></td>
                            <td align="center"> <input type="text" class="index" id="sub_price" data-sub_price="" value=""readonly></td>
                            <td align="center"></td>
                            <td align="center"><button>그룹관리</button></td>
                        </tr>
                        
                        <tr>선택항목 : 개 , 선택수량 :  개</tr>
         	</tbody>
        </table> 
        
    </div>
</div>
<!-- //content close -->

</div>
</div>
</div>



<%@ include file="../common/footer.jsp" %>

</body>
</html>