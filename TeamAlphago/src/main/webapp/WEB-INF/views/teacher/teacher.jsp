<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 조회</title>
<link rel="icon" href="/resources/images/favicon.ico"/>
</head>


<style>
.main-box {
    display: flex;
    width: 60%;
    height: 100%;
    background-color: #fff;
    border: 1px solid #d8dfe6;
    margin: 0 auto;
    justify-content: center;
}

div .InfoBox {
	border: 1px solid black;
	width: 100%;
	height: 100%;
}

div .InfoBox .info {
	text-align: center;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 3;

}

/* 나란히 표시될 컨테이너 스타일링 */
.search-controls {
    display: flex; /* 아이템들을 가로로 나란히 배치 */
    align-items: center; /* 수직 가운데 정렬 */
}

/* "정렬" 셀렉트 박스 스타일링 */
.business-srch select {
    margin-right: 10px; /* 오른쪽 여백 추가 */
}

/* "카테고리" 라디오 버튼 그룹 스타일링 */
.searchBox fieldset {
    border: none; /* fieldset 테두리 제거 */
    margin: 0; /* 기본 마진 제거 */
}

.searchBox legend {
    font-weight: bold; /* 범례 텍스트를 볼드체로 */
    margin-right: 10px; /* 오른쪽 여백 추가 */
}

.searchBox label {
    display: inline-block;
    vertical-align: middle;
}

.searchBox input[type="radio"] {
    margin-right: 5px; /* 라디오 버튼과 텍스트 사이의 간격을 조절합니다. */
    vertical-align: middle;
}

</style>
<body>

<%@ include file="../common/header.jsp" %>

<div id="container">
    <div class="wrap">

<form id="searchForm" method="get" name="searchForm" class="content_wrap">
    <input type="hidden" name="pageNo" value="${pageDto.cri.pageNo}">
    <div class="titleBox">
        <h2 class="t_title">콘텐츠 조회</h2>
    </div>
    
    <div class="searchWrap searchWrap_wide searchWrap_normal">
        <div class="searchBox searchBox-mid searchBox-center" style="text-align:center">
            <fieldset>
                <input type="hidden" name="p" value="1">
                <legend>전체 검색</legend>
                <select title="검색 분류" name="searchField" value="${pageDto.cri.searchField}">
                    <option value="c_name">제목</option>
                </select>
                <input type="text" class="inputSrch" title="검색어를 입력해주세요." placeholder="검색어를 입력해주세요." 
                        name="searchWord" value="${pageDto.cri.searchWord}" />
                <input type="submit" class="btn btn-primary" value="검색" />
            </fieldset>    
    
	<div class="search-controls" style="text-align:center">


<div class="searchBox" style="text-align:center">
    <fieldset style="text-align:center">
        <legend>카테고리</legend>
		        <label><input type="radio" name="c_level" value="0">전체</label>
		        <label><input type="radio" name="c_level" value="1">초급</label>
		        <label><input type="radio" name="c_level" value="2">중급</label>
		        <label><input type="radio" name="c_level" value="3">고급</label>
		    </fieldset>
		</div>
	</div>
	        </div>
    </div>  
</form>
	    <div class="business-srch" style="margin-bottom:20px">
총 ${totalCnt } 건
	        <select title="정렬" name="order" id="orderSelect" style="width: 120px; margin-left:785px">
	            <option value="none">=== 선택 ===</option>
	            <option value="new">최신순</option>
	            <option value="price1">가격높은순</option>
	            <option value="price2">가격낮은순</option>
	            <option value="level1">레벨높은순</option>
	            <option value="level2">레벨낮은순</option>
	        </select>
	    </div>
	<c:set var="i" value="0" />
	<c:set var="j" value="3" />
	
	
<c:choose>
<c:when test="${contentList != null && fn:length(contentList) > 0 }">
                    <ul class="pList">
	  <c:forEach  var="con" items="${contentList }" varStatus="status">

	  		<input type="hidden" class="index" id="c_level" data-clevel="${status.index}" value="${con.c_level }"readonly>
			<input type="hidden" class="index" id="c_no" data-cid="${status.index}" value="${con.c_no }"readonly>
	  
	    <c:if test="${i%j == 0 }">
                         </c:if>
                         <li>
                         	
                            <a href="" class="img">
                                <img src="/alpha/display?fileName=${con.savepath}" class="card-img-top" alt="..." style="height:120px; width:200px;     background-size: contain; padding:10px">
                                <span class="text"><em>${status.index}</em></span></a>
                            <p class="desc">
                            <c:if test="${fn:length(con.c_name)>=20}" var="len">
                                <a onclick="godetail(${status.index})"><strong class="tit">${fn:substring(con.c_name,0,19) }..</strong></a>
                            </c:if>
                            <c:if test="${not len}" >
                                <a onclick="godetail(${status.index})"><strong class="tit">${con.c_name}</strong></a>
                            </c:if>
                            
                                <span class="date">${con.c_price}원</span><em>|</em><span class="hit">학습수준 : ${con.c_level }</span>
                            </p>
                       </li>
  	    <c:if test="${i%j == j-1 }">
                       	    </c:if>
	  </c:forEach>
                    </ul>
	     </c:when>
  <c:otherwise>
    <li>존재하지 않습니다.</li>

  </c:otherwise>
  </c:choose>                                               
        </div>
        <!-- //content close -->


    </div>
</div>
<script>
function truncateText(text, maxLength) {
	  if (text.length > maxLength) {
	    return text.substring(0, maxLength) + "...";
	  } else {
	    return text;
	  }
	}
//선택 요소와 라디오 버튼에 대한 이벤트 리스너 추가
const orderSelect = document.getElementById('orderSelect');
const radioButtons = document.querySelectorAll('input[name="c_level"]');
const searchForm = document.getElementById('searchForm');

orderSelect.addEventListener('change', function() {
    searchForm.submit();
});

// 라디오 버튼의 값을 기존에 선택한 값에서 변경된 값으로 업데이트
radioButtons.forEach(function(radioButton) {
    radioButton.addEventListener('change', function() {
        const paramName = "c_level";
        const paramValue = Array.from(radioButtons)
            .filter(checkbox => checkbox.checked)
            .map(checkbox => checkbox.value);
        updateURLParameter(paramName, paramValue);
        searchForm.submit();
    });
});

// "정렬" 선택 요소 변경 시 URL에 반영
document.getElementById('orderSelect').addEventListener('change', function () {
    const selectedValue = this.value;
    updateURLParameter('order', selectedValue);
});

// URL 파라미터 업데이트 함수
function updateURLParameter(paramName, paramValue) {
    const currentUrl = new URL(window.location.href);
    const searchParams = new URLSearchParams(currentUrl.search);
    searchParams.set(paramName, paramValue.join(',')); // 배열을 문자열로 조인
    currentUrl.search = searchParams.toString();
    window.history.replaceState({}, '', currentUrl);
}

//페이지 로드 시 URL에서 파라미터 읽어와 선택 상태 복원
window.addEventListener('DOMContentLoaded', function () {
    const currentUrl = new URL(window.location.href);
    const searchParams = new URLSearchParams(currentUrl.search);

    // 정렬 선택 요소 복원
    const orderValue = searchParams.get('order');
    if (orderValue) {
        document.getElementById('orderSelect').value = orderValue;
    }

    // 카테고리 선택 요소 복원
    const categoryValues = searchParams.getAll('c_level');
    if (categoryValues.length > 0) {
        radioButtons.forEach(function (radioButton) {
            const value = radioButton.value;
            radioButton.checked = categoryValues.includes(value);
        });
    }
});

function godetail(index) {
	
	var i = index;
	console.log(i);

	var c_no= $('input[data-cid="'+index+'"]').val();
	//alert(c_no);

	console.log(c_no);
	window.location.replace("/alpha/teacher/detail?c_no="+c_no);
	
}
function go(page){
	//alert(page);
	document.searchForm.pageNo.value=page;
	document.searchForm.action = "/alpha/teacher";
	document.searchForm.submit();
}
</script>
<div style="text-align:center"><%@include file = "pageNavi.jsp" %></div>
<%@ include file="../common/footer.jsp" %>



</body>
</html>