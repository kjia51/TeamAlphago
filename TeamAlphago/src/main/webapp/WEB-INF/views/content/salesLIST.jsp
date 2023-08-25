<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
<div id="container">

    <div class="wrap">
        <div class="content_wrap">
            <div class="titleBox">
                <h2 class="t_title">매출 조회</h2>
            </div>
            <div class="entry">
                <!--지도 들어가는곳-->
                <div class="map-import map-academy">
                    <div class="map-img-bg">
                        <div class="map-img-area">
                              <canvas id="myChart"></canvas>
                        </div>
                    </div>
                </div>
                <table class="table table-bordered univ-lineTop2" id="eve_academyTable">
                    <caption>바둑학원 정보</caption>
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="20%">
                        <col width="40%">
                        <col width="10%">
                    </colgroup>
                        <thead>
                            <tr>
                                <th>학원이름</th>
                                <th>학원원장</th>
                                <th>전화번호</th>
                                <th>주소</th>
                                <th>약도</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th colspan="5"> 학원 목록이 없습니다. </th>
                            </tr>
                        </tbody>
                </table>
            </div>
        </div>
        <!-- //content close -->
    </div>
</div>
	<%@ include file="../common/footer.jsp" %>
	<script>
  const ctx = document.getElementById('myChart');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
        label: '# of Votes',
        data: [12, 19, 3, 5, 2, 3],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
</body>
<script src="/resources/js/content/contentWrite.js"></script>
</html>