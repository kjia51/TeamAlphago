<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="icon" href="/resources/images/favicon.ico"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 결제api -->
<script src="https://kit.fontawesome.com/1028c0334c.js" crossorigin="anonymous"></script>

</head>
<style>

#my_modal {
    display: none;
    width: 360px;
    padding: 20px 35px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
}

#cartList, #payList, #no_content {
    display: none;
    height: 300px;
    padding: 30px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    text-align: center;
}
#cartList .modal_close_btn, #payPopUp .modal_close_btn, #no_content .modal_close_btn{

    border: 1px solid black;
    padding: 10px;
    border-radius: 5px;
    margin: 20px;
}
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

  .circle {
    width: 50px; /* 동그라미(원)의 너비 */
    height: 50px; /* 동그라미(원)의 높이 */
    background-color: #ff0000; /* 동그라미(원)의 배경색 */
    border-radius: 50%; /* 동그라미(원) 모양으로 만듭니다. */
    display: inline-block; /* 다른 내용과 나란히 표시하기 위해 inline-block을 사용합니다. */
  }
  select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background-image: none; /* 화살표 이미지 없애기 */
    background-color: transparent; /* 배경색 없애기 */
}

</style>

<body>
<%@ include file="../common/header.jsp" %>


<div id="payList">
	<hr>
	<h2 style="height:50px;">결제<i class="fa-solid fa-cart-shopping"></i> </h2>

		<table border="1" style="width:100%;">
			<colgroup>
				<col style="width:5%">
				<col style="width:40%">
				<col style="width:6%">
				<col style="width:15%">
				<col style="width:10%">
				<col style="width:25%">
			</colgroup>
		<thead>
		<tr>
			<th>No</th>
			<th>강의명</th>
			<th>정원</th>
			<th>가격</th>
			<th>기간</th>
			<th>소계</th>
		</tr>
		</thead>
		<tbody id="tbdy1">
		</tbody>
		</table>
		<br>
			<div>
				<input type="submit" class="btnTopSrch btn btn-primary" value="결제하기" id="payment">
		    	<button><a class="modal_close_btn">닫기</a></button>
			</div>
		
</div>
        
        <!-- 메인 -->
			<div id="container">


				<c:set value="${contentVO }" var="con"/>

			    <div class="wrap">
			        <div class="content_wrap" id="competition_wrap">
			
			<div doz_type="inside" class="inside"><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
			
			<div doz_type="widget" id="w20210714d09491b0de793"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
			</div>
			</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
			
			
			</div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12">
			<div class="_widget_data " data-widget-name="메뉴 타이틀" data-widget-type="menu_title" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N" style="text-align:right"><h1 class="widget_menu_title" style="color : #000;font-size : 20px;letter-spacing : px;text-align : left;font-weight : bold;font-style : normal; padding-top:50px; padding-bottom:50px">${con.level }반</h1>
			
			<c:choose>
			    <c:when test="${sessionScope.memberVO.m_division==3}">
					<input type="submit" class="btnTopSrch btn btn-primary" value="수정" id="contentEdit"> 
					<input type="submit" class="btnTopSrch btn btn-primary" value="삭제" id="contentDelete"> 
			
			    </c:when>
			    <c:otherwise>
			    </c:otherwise>
			</c:choose>
			
			</div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w20210715be3c6ca598194"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
			</div>
			</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="4" doz_clear="Y" class="col-dz col-dz-4   col-xdz-clear"><div doz_type="widget" id="w20210715ceae24ddd84c4"><div class="_widget_data " data-widget-name="동영상" data-widget-type="video" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N">	<div id="video_w20210715ceae24ddd84c4" class="widget movie _video_wrap " style="position: relative">
						</div>
						
								
						</div></div></div><div doz_type="grid" doz_grid="1" doz_clear="Y" class="col-dz col-dz-1   col-xdz-clear"><div doz_type="widget" id="w20210715f41a89f6d262e"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
			</div>
			</div></div></div><div doz_type="grid" doz_grid="7" class="col-dz col-dz-7"><div doz_type="widget" id="w20210715c9014fa59a703"><div class="_widget_data " data-widget-name="텍스트" data-widget-type="text" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N" style="text-align:right">
				<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w20210715c9014fa59a703">
					
							<div class="text-table " style="text-align:left"><div>
							<p style="line-height: 2;">
							<strong><span style="font-size: 16px;">한기원 <span style="color: #074691;">${con.level }반</span></span></strong>
							</p>
							<p style="line-height: 2;"><strong><span style="font-size: 16px;">${con.c_content }</span></strong></p>
							<hr style="line-height: 2;"><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- ${con.level } (1반, 2반, 3반, 4반 운영중)</strong></span></p>
							<p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 바둑 수업</strong></span></p>
							<p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 9줄, 13줄, 19줄 바둑판 수업 진행</strong></span></p>
							<p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 1수업 : 50분 기준</strong></span></p> 
							<p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 수업요일 : 월 ~ 금</strong></span></p>
							</div></div>		
							
				</div>
				
			<c:choose>
			    <c:when test="${sessionScope.memberVO.m_division==1}">
					<input type="submit" class="btnTopSrch btn btn-primary" value="장바구니" id="cartPopUp"> 
					<input type="submit" class="btnTopSrch btn btn-primary" value="결제하기" id="payPopUp"> 
			    </c:when>
			    <c:otherwise>
			    </c:otherwise>
			</c:choose>

			</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107157d792e5155a14"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
				<div id="padding_w202107157d792e5155a14" style="width:100%; min-height:1px; height:30px; "></div>
			</div>
			</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107145fca6702e7268"><div class="_widget_data " data-widget-name="가로선" data-widget-type="hr" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><div class="widget line type01 _hide" id="hr_w202107145fca6702e7268">
				<div class="line_box holder" style="width:100%; ">
					<hr style="border-top-width:1px; border-color:#074691;">	</div>
			</div>
			
			</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107135a7c3f268ba63"><div class="_widget_data " data-widget-name="쇼핑" data-widget-type="shopping" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N">	<div class="shop-content widget">
					<div class="shop-grid">
						<div class="thumb-fluid _item_container  ">
												<div class="shop-tools clearfix" style="display: ">
																	<div class="inline-blocked float_l">
																					<span class="text-brand _unit" style="right-margin:500px" >${con.level }반  ${getContentCnt }</span>
																								<div class="down-btn" style="display: inline-block;">
										<!-- <select class="form-control" name="deliv_option_type" onchange="document.location.href = encodeURI('/24/?sort='+$(this).val())" title="정렬 바꾸기" >
											<option value="recent">등록순</option>
											<option value="like">인기순</option>
											<option value="min_price">낮은가격순</option>
											<option value="max_price">높은가격순</option>
											<option value="comment">상품평 많은순</option>
											<option value="abc">이름순</option>
											<option value="descabc">이름역순</option>
										</select> -->
									</div>
											</div>
																				
														</div>
													<div class="thumb-row m-list-type3 hover_none thumb-item-5 _item_wrap " id="container_w202107135a7c3f268ba63" style="visibility: visible; margin: 0px -10px;">
										<div class="shop-item _shop_item" style=" padding: 0px 10px; height: auto; display: flex; flex-wrap: wrap;">
					
					
					<input id="m_id" type="hidden" data-mid="${status.index}" value="${m_id }">
					<c:forEach items="${contentList}" var="con"  varStatus="status">
					
				<c:set var="discount" value="${con.c_discount}" />
				<fmt:formatNumber var="discountWithoutDecimal" value="${discount}" pattern="#0" />
					<input id="m_id" type="hidden" data-mid="${status.index}" value="${memberVO.m_id }">
					<%--결제에 필요한 값 가져오기 --%>
					<input type="hidden" id="c_no" data-cno="${status.index}"value="${con.c_no }">
					<input type="hidden" id="c_name" data-cname="${status.index}" value="${con.c_name }">
					<input type="hidden" class="index" id="c_sellpice" data-price="${status.index}" value="${con.c_sellprice }">
					<input type="hidden" class="index" id="cnt" data-cnt="${status.index}" value="${con.c_able }">
					
					
					<div class="item-wrap" style="position: relative; padding:18px">
			            	<input type="hidden" id="c_no" value=" ${con.c_no }">
			            	<c:choose>
							    <c:when test="${sessionScope.memberVO.m_division==1}">
					            	<input type="checkbox" name="chkbox" style="display:block; margin-bottom:10px" id="chk" value="${status.index}">
							    </c:when>
							    <c:otherwise>
							    </c:otherwise>
							</c:choose>
						<a href="" class="_fade_link shop-item-thumb hover_img_none" style="position:relative">
							<img data-prodcode="s2023081114659ed573520" alt="" src="/alpha/display?fileName=${con.savepath}" class="_org_img org_img _lazy_img" data-original="" data-src="" style="display: inline; width:200px;height:200px;">

						</a>
			
			
					<!-- 세부 콘텐츠 -->
					<div class="item-detail">
									<div class="item-pay" style="display:block">
			                				<h2 style="display: ">
								<a class="_fade_link" href="#" onclick="getContent(${status.index})">${con.level }반 - 정원 ${con.c_able }명</a>
							</h2>
							<div class="item-pay-detail" style="font-size:1.3em; display:inline">
							 <c:if test="${con.c_able>30}">
								<p class="pay inline-blocked" style="text-decoration:line-through; display:inline-block"> ${con.c_price }</p> <p class="pay inline-blocked" style="display:inline-block; color:red; font-weight:bold">→ ${con.c_sellprice }</p>
							</c:if>
							<c:if test="${con.c_able<=30}">
								<p class="pay inline-blocked" style=" display:inline-block"> ${con.c_price }</p>
							</c:if>
							</div>
								<div class="ns-icon clearfix">
									<!--<span class="new bg-brand">NEW</span>-->
									<div class="item-icon _unit_list unit-list">

											</div>
										</div>
									</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="comment-the">
			                        <button type="button" id="theBtn">콘텐츠 더보기<i class="ico ico-cbox-more"></i></button>
			            </div>
				
				
			</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w20210714f9516606b3272"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
				<div id="padding_w20210714f9516606b3272" style="width:100%; min-height:1px; height:30px; "></div>
			</div>
			</div></div></div></div></div>
			
			
			
			</div>
			</div>
			</div>
			</div>
			
			
			<div id="no_content" style="height:100px">
				<h3>더 이상의 콘텐츠가 없습니다. </h3>
			<button type="button" class="modal_close_btn" style="width:60px; height:30px; padding:5px">닫기</button>
			</div>
			
			<%-- 모달창 --%>
			<div id="my_modal">
				<hr>
				<h2 style="text-align: center;">결제 완료</h2><br>
			
				<div style="width: 100%; text-align: center;">
				    <button class="btn btn-default" style="margin: 10px;" onClick="location.href='/alpha/mysubList?t_m_id=${memberVO.m_id }'">구독내역으로 가기</button>
				    <button class="btn btn-default" style="margin: 10px;" onClick="location.href='/alpha/teacher'">리스트로 돌아가기</button>
			    </div>
			</div>
			</div>
			</div>

<div id="cartList">
	<hr>
	<h2 style="height:50px;">장바구니<i class="fa-solid fa-cart-shopping"></i> </h2>
		<table border="1" style="width:100%;" id="cartTable">
			<colgroup>
				<col style="width:5%">
				<col style="width:10%">
				<col style="width:40%">
				<col style="width:10%">
				<col style="width:20%">
				<col style="width:20%">
			</colgroup>
		<thead>
		<tr>
			<th><input type="checkbox" style="margin-top: 5px;" onclick="selectAll(this)"/></th>
			<th>No</th>
			<th>강의명</th>
			<th>정원</th>
			<th>가격</th>
			<th>소계</th>
		</tr>
		</thead>
		<tbody id="tbdy">
		</tbody>
		</table>
		<br>
			<div>
				<input type="submit" class="btnTopSrch btn btn-primary" value="장바구니" id="cartContent"> 
		    	<button><a class="modal_close_btn">닫기</a></button>
			</div>
</div>
<%@ include file="../common/footer.jsp" %>



</body>
<script src="/resources/js/content/myPage.js"></script>
<script src="/resources/js/content/contentEdit.js"></script>
<script src="/resources/js/content/payment.js"></script>
</html>