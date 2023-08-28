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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<style>
body{
color: #000;
font-size: 15px;
line-height: 26px;
letter-spacing: -0.5px;
font-family: Nanum Gothic,"나눔고딕",NanumGothic,'Roboto','noto sans kr','noto sans', 'Droid Sans','Helvetica',"AppleGothicNeoSD","Apple SD 산돌고딕 Neo",'Apple-Gothic','애플고딕',"Microsoft NeoGothic",'Malgun Gothic',"맑은 고딕",'dotum','돋움','gulim','굴림',sans-serif;
-webkit-text-size-adjust: none;
margin: 0;
padding: 0 20px;
}
    
.discountInfo, .cancleInfo {
	border: 1px solid black;

}

#my_modal {
    display: none;
    width: 400px;
    height: 250px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    text-align: center;
    line-height: 115px;

}

#my_modal .modal_close_btn {

    border: 1px solid black;
    padding: 10px;
    border-radius: 5px;
    margin: 20px;
    
}


</style>


<body>

<%@ include file="../common/header.jsp" %>

<div id="container">
    <div class="wrap">
        <div class="content_wrap" id="competition_wrap">

<div doz_type="inside" class="inside"><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w20210714d09491b0de793"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
	<div id="padding_w20210714d09491b0de793" style="width:100%; min-height:1px; height:30px; "></div>
</div>
</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w20210714e8469939b2ea9"><div class="_widget_data " data-widget-name="메뉴/카테고리" data-widget-type="sub_menu" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><div class="widget">
	<div class="nav sub-menu sub_menu_hide  h-menu-type2 menu-horizontal row-cnt-3 row-cnt-mobile-3">
		<ul class="">
	
	<li style="" class="depth-01    " data-code="m202107131b65631b8ec6b">
		<a href="/23" data-url="23" data-has_child="N" data-is_folder_menu="N" class=" _fade_link   ">
			<span class="plain_name" data-hover="">체험수업</span>
		</a>
		
	</li>
	
	<li style="" class="depth-01  active   active-real   " data-code="m20210713c6b1f64c8f069">
		<a href="/24" data-url="24" data-has_child="N" data-is_folder_menu="N" class=" _fade_link   active   active-real ">
			<span class="plain_name" data-hover="">입문반</span>
		</a>
		
	</li>
	
	<li style="" class="depth-01    " data-code="m202107138ffa571de48c4">
		<a href="/25" data-url="25" data-has_child="N" data-is_folder_menu="N" class=" _fade_link   ">
			<span class="plain_name" data-hover="">입문심화반</span>
		</a>
		
	</li>
	
	<li style="" class="depth-01    " data-code="m20210713e3b6e8472f75d">
		<a href="/27" data-url="27" data-has_child="N" data-is_folder_menu="N" class=" _fade_link   ">
			<span class="plain_name" data-hover="">초급반</span>
		</a>
		
	</li>
	
	<li style="" class="depth-01    " data-code="m20211209de133b619501c">
		<a href="/47" data-url="47" data-has_child="N" data-is_folder_menu="N" class=" _fade_link   ">
			<span class="plain_name" data-hover="">중급반</span>
		</a>
		
	</li>
	
	<li style="" class="depth-01    " data-code="m2021071318a14583d2b21">
		<a href="/28" data-url="28" data-has_child="N" data-is_folder_menu="N" class=" _fade_link   ">
			<span class="plain_name" data-hover="">개인결제창</span>
		</a>
		
	</li>
	
	</ul>	</div>
</div>

</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107153732fa2ac5cd5"><div class="_widget_data " data-widget-name="메뉴 타이틀" data-widget-type="menu_title" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><h1 class="widget_menu_title" style="color : #000;font-size : 20px;letter-spacing : px;text-align : left;font-weight : bold;font-style : normal;">입문반</h1>


</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w20210715be3c6ca598194"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
	<div id="padding_w20210715be3c6ca598194" style="width:100%; min-height:1px; height:30px; "></div>
</div>
</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="4" doz_clear="Y" class="col-dz col-dz-4   col-xdz-clear"><div doz_type="widget" id="w20210715ceae24ddd84c4"><div class="_widget_data " data-widget-name="동영상" data-widget-type="video" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N">	<div id="video_w20210715ceae24ddd84c4" class="widget movie _video_wrap " style="position: relative">
			</div>
			
					
			</div></div></div><div doz_type="grid" doz_grid="1" doz_clear="Y" class="col-dz col-dz-1   col-xdz-clear"><div doz_type="widget" id="w20210715f41a89f6d262e"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
	<div id="padding_w20210715f41a89f6d262e" style="width:100%; min-height:1px; height:30px; "></div>
</div>
</div></div></div><div doz_type="grid" doz_grid="7" class="col-dz col-dz-7"><div doz_type="widget" id="w20210715c9014fa59a703"><div class="_widget_data " data-widget-name="텍스트" data-widget-type="text" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N">
	<div doz_type="text" class="widget _text_wrap widget_text_wrap fr-view  default_padding " id="text_w20210715c9014fa59a703">
		
				<div class="text-table "><div><p style="line-height: 2;"><strong><span style="font-size: 16px;">키바온라인 <span style="color: rgb(255, 108, 0);">입문반</span>은 한 판의 대국을 진행하려면 꼭 알아야 하는</span></strong></p><p style="line-height: 2;"><strong><span style="font-size: 16px;">필수적인 이론과 방법들을 재미있는 교육 컨텐츠를 통해 배우며</span></strong></p><p style="line-height: 2;"><strong><span style="font-size: 16px;">바둑을 더 쉽게 이해할 수 있는 "도전!바둑왕, 교재별학습반, 어린이대국실" 로 학습하는 단계입니다.</span></strong></p><hr style="line-height: 2;"><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 입문반 (입문 1반, 2반, 3반, 4반 운영중)</strong></span></p><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 바둑 초기 이론 수업</strong></span></p><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 9줄, 13줄, 19줄 바둑판 수업 진행</strong></span></p><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 1대4 정원 수업 진행</strong></span></p><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 1수업 : 50분 기준</strong></span></p><p style="line-height: 2;"><span style="font-size: 16px;"><strong>- 수업요일 : 월 ~ 금</strong></span></p><p style="line-height: 2;"><strong><span style="font-size: 16px;">- 수업시간 : 오후 2시 ~ 오후 9시 (시간 선택)</span></strong></p></div></div>		
	</div>
	
</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107157d792e5155a14"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
	<div id="padding_w202107157d792e5155a14" style="width:100%; min-height:1px; height:30px; "></div>
</div>
</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107145fca6702e7268"><div class="_widget_data " data-widget-name="가로선" data-widget-type="hr" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><div class="widget line type01 _hide" id="hr_w202107145fca6702e7268">
	<div class="line_box holder" style="width:100%; ">
		<hr style="border-top-width:1px; border-color:#ff6c00;">	</div>
</div>

</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w202107135a7c3f268ba63"><div class="_widget_data " data-widget-name="쇼핑" data-widget-type="shopping" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N">	<div class="shop-content widget">
		<div class="shop-grid">
			<div class="thumb-fluid _item_container  ">
									<div class="shop-tools clearfix" style="display: ">
														<div class="inline-blocked float_l">
									입문반									<span class="text-brand _unit">3</span>
								</div>
																	
																					<div class="down-btn" style="display: ">
							<select class="form-control" name="deliv_option_type" onchange="document.location.href = encodeURI('/24/?sort='+$(this).val())" title="정렬 바꾸기">
								<option value="recent">등록순</option>
								<option value="like">인기순</option>
								<option value="min_price">낮은가격순</option>
								<option value="max_price">높은가격순</option>
								<option value="comment">상품평 많은순</option>
								<option value="abc">이름순</option>
								<option value="descabc">이름역순</option>
							</select>
						</div>
											</div>
										<div class="thumb-row m-list-type3 hover_none thumb-item-5 _item_wrap " id="container_w202107135a7c3f268ba63" style="visibility: visible; margin: 0px -10px;">
							<div class="shop-item _shop_item" style="width: 204px; padding: 0px 10px; height: auto;">
		<div class="item-wrap" style="position: relative;">
			<a href="/24/?idx=63" class="_fade_link shop-item-thumb hover_img_none">
				<img data-prodcode="s2023081114659ed573520" alt="" src="https://cdn.imweb.me/thumbnail/20210713/a40bef34a9fba.png" class="_org_img org_img _lazy_img" data-original="" data-src="" style="display: inline; width:200px;height:100px;">
								<div class="item-overlay">
					<div class="item-pay">
						<div>
							<h2>입문반 - 12회차반</h2>
							                                                            <p class="pay inline-blocked" style=";;">
                                    300,000원                                </p>
                            																						<div class="ns-icon clearfix">
									<!--<span class="new bg-brand">NEW</span>-->
									<div class="prod_icon text-danger icon_default best">BEST</div><div class="prod_icon icon_default md">MD</div>								</div>
													</div>
					</div>
				</div>
			</a>
		</div>
		<div class="item-detail" style="">
						<div class="item-pay">
                				<h2 style="display: ">
					<a class="_fade_link" href="/24/?idx=63">입문반 - 12회차반</a>
				</h2>
				<div class="item-pay-detail">
					<p class="no-margin">
												</p><p class="pay inline-blocked" style=";;">
							300,000원						</p>
																				<p></p>
				</div>
													<div class="ns-icon clearfix">
						<!--<span class="new bg-brand">NEW</span>-->
						<div class="prod_icon text-danger icon_default best">BEST</div><div class="prod_icon icon_default md">MD</div>					</div>
								</div>
						<div class="item-icon _unit_list unit-list">
				                                        <span class="im-icon-wrap" onclick="location.href='https://kibaonline.co.kr/24/?idx=63'">
                        <i class="im-icon im-ico-review"></i><span class="_unit" data-value="0">0</span>
                    </span>
				                    <span class="im-icon-wrap" onclick="SITE_SHOP_DETAIL.addProdWish('s2023081114659ed573520', 'LzI0')">
                        <i id="wish-icon-s2023081114659ed573520" class="wish-icon-s2023081114659ed573520 im-icon im-ico-like"></i>
                        <span class="wish-text-s2023081114659ed573520 _unit" data-value="0">0</span>
                    </span>
								
			</div>
		</div>
	</div>

					</div>
							</div>
		</div>
			</div>
	
	
</div></div></div></div><div doz_type="row" doz_grid="12" class="doz_row"><div doz_type="grid" doz_grid="12" class="col-dz col-dz-12"><div doz_type="widget" id="w20210714f9516606b3272"><div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N"><div class="widget padding" data-height="30" style="margin-top:px; margin-bottom:px;">
	<div id="padding_w20210714f9516606b3272" style="width:100%; min-height:1px; height:30px; "></div>
</div>
</div></div></div></div></div>



</div>
</div>
</div>
<%@ include file="../common/footer.jsp" %>



</body>
<script src="/resources/js/content/contentEdit.js"></script>
</html>