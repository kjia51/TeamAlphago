//get방식 요청
function fetchGet(url,callback){
	console.log(url);
	console.log(callback);
	
	try {
	//url 요청
	fetch(url)
		//요청 결과json 문자열을 javascript 객체로 반환
		.then(response => response.json())
		//매개로 받은 콜백함수 실행
		.then(map => callback(map));
		
	} catch (e) {
		console.log(e);
	}
	
	
}

//post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'post'
					,headers : {'Content-Type' : 'application/json'} 
					,body  : JSON.stringify(obj)
			  })
			//요청 결과json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			//매개로 받은 콜백함수 실행
			.then(map => callback(map))
			
		} catch (e) {
			console.log(e);

		}
	
}



function modal(id) { //모달창 띄우기
    var zIndex = 9999;
    var modal = $('#' + id);



    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('.modal_close_btn')
        .on('click', function() {
            modal.hide();
        });
}


function saleContent(){
	searchLayout.innerHTML='';
	chartHead.innerHTML='';
	chartBdy.innerHTML='';
	myChart.style.display = "none";
    var row = document.createElement('tr');
    row.innerHTML = ''
	                    +'<th scope="col" style="width:20%;">검색</th>'
	                    +'<td style="width:80%;">'
	                        +'<input type="text">'
	                            +'<input type="button" class="btn btn-primary" id="btnContent" value="조회">'
	                    +'</td>';
	searchLayout.appendChild(row);
    var row1 = document.createElement('tr');
    row1.innerHTML = ''
			        +'<tr>'
			        +'<th>콘텐츠명</th>'
			        +'<th>매출액</th>'
			        +'<th>매출건수</th>'
			        +'</tr>';
    chartHead.appendChild(row1);
	$('#btnContent').click(function () {
		myChart.style.display = "block";
		getChartCList();
	})
}
function saleDate(){
	searchLayout.innerHTML='';
	chartHead.innerHTML='';
	chartBdy.innerHTML='';
	myChart.style.display = "none";
    var row = document.createElement('tr');
    row.innerHTML = ''
                    +'<th scope="col" style="width:20%;">조회기간</th>'
                    +'<td style="width:80%;">'
                    +'<div class="searchBox" style="display:inline-block;">'
                    +'<input type="text" class="input" name="startdate" id="startdate" value="" maxlength="8" style="width:120px; text-align:center">'
                    +'<span style="margin-left:10px; margin-right:10px">~</span>'
                    +'<input type="text" class="input" name="enddate" id="enddate" value="" maxlength="8" style="width:120px; text-align:center">'
                    +'<button type="button" id="cal" class="cal-btn-open" data-calendar-module="true" data-calendar-display="false" style="margin-top:5px; margin-left:10px; margin-right:10px""><i class="fa-regular fa-calendar" style="font-size:30px"></i></button>'
                    +'</div>'
                    +'<div class="searchBox" style="display:inline-block; margin-left:50px">'

                    +'<button type="button" value="1일" class="blue" style="width:40px;height:30px; margin-right:15px" id="day">1일</button>'
                    +'<button type="button" value="1개월" class="blue" style="width:40px;height:30px; margin-right:15px" id="month">1개월</button>'
                    +'<button type="button" value="6개월" class="blue" style="width:40px;height:30px; margin-right:15px" id="hmonth">6개월</button>'
                    +'<button type="button" value="1년" class="blue" style="width:40px;height:30px; margin-right:15px" id="year">1년</button>'
                    +'<input type="button" class="btn btn-primary" id="btnDate" value="조회">'
                    +'</div>'
                    +'</td>';
    searchLayout.appendChild(row);
    var row1 = document.createElement('tr');
    row1.innerHTML = ''
			        +'<tr>'
			        +'<th>일자</th>'
			        +'<th>매출액</th>'
			        +'<th>매출건수</th>'
			        +'</tr>';
    chartHead.appendChild(row1);
    var now = nowDate();
    $('#startdate').val(now);
	$('#enddate').val(now);
	$('#btnDate').click(function () {
		myChart.style.display = "block";
		getChartDList();
	})
	
	$('#day').click(function () {
		var before = addDays(now, 1);
		$('.blue').removeClass("disabled");
		$('#day').addClass("disabled");
		$('#startdate').val(now);
		$('#enddate').val(now);
	})
	
	$('#month').click(function () {
		var before = addMonths(now, -1);
		$('.blue').removeClass("disabled");
		$('#month').addClass("disabled");
		$('#startdate').val(before);
		$('#enddate').val(now);
	})
	
	$('#hmonth').click(function () {
		var before = addMonths(now, -6);
		$('.blue').removeClass("disabled");
		$('#hmonth').addClass("disabled");
		$('#startdate').val(before);
		$('#enddate').val(now);
	})
	
	$('#year').click(function () {
		var before = addYear(now, -1);
		$('.blue').removeClass("disabled");
		$('#year').addClass("disabled");
		$('#startdate').val(before);
		$('#enddate').val(now);
	})
	
	$('#cal').click(function () {
		$('.blue').removeClass("disabled");
		modal('calendarList');
		$('#test').datepicker({
			
			showOtherMonths: true,
		    showMonthAfterYear: true,
		    selectOtherMonths: true,
		    buttonText: "선택",
		    yearSuffix: "년",
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		    minDate: new Date(new Date().getFullYear() - 1, new Date().getMonth(), new Date().getDate()), // 1년 전
		    maxDate: new Date(),
		    dateFormat: 'yy-mm-dd',
		    onSelect: function(selectedDate) {
		        var startDate = new Date(selectedDate);
		        var year = startDate.getFullYear();
		        var month = ("0" + (startDate.getMonth() + 1)).slice(-2); // Adding 1 because getMonth() is 0-based
		        var day = ("0" + startDate.getDate()).slice(-2);
		        var endDateFormatted = year + "-" + month + "-" + day;
		       
		        
		        $('#startdate').val(selectedDate);
		    }
			
		});
		$('#test2').datepicker({
			
			showOtherMonths: true,
			showMonthAfterYear: true,
			selectOtherMonths: true,
			buttonText: "선택",
			yearSuffix: "년",
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
		    minDate: new Date(new Date().getFullYear() - 1, new Date().getMonth(), new Date().getDate()), // 1년 전
		    maxDate: new Date(),
			dateFormat: 'yy-mm-dd',
			onSelect: function(selectedDate) {
				var startDate = new Date(selectedDate);
				
				var year = startDate.getFullYear();
				var month = ("0" + (startDate.getMonth() + 1)).slice(-2); // Adding 1 because getMonth() is 0-based
				var day = ("0" + startDate.getDate()).slice(-2);
				
				var endDateFormatted = year + "-" + month + "-" + day;
				
				$('#enddate').val(endDateFormatted);
			}
		
		});
	})
	
}

	function nowDate() {
	    // Get the current date
	    var currentDate = new Date();
	    var year = currentDate.getFullYear();
	    var month = ("0" + (currentDate.getMonth() + 1)).slice(-2); // Adding 1 because getMonth() is 0-based
	    var day = ("0" + currentDate.getDate()).slice(-2);
	    var todayFormatted = year + "-" + month + "-" + day;
	    // Set the current date to the #startdate input field
	    return todayFormatted;
	}
	
	function addDays(dateStr, days) {
	    var date = new Date(dateStr);
	    date.setDate(date.getDate() + days);
	    return formatDate(date);
	}
	
	function addMonths(dateStr, months) {
	    var date = new Date(dateStr);
	    date.setMonth(date.getMonth() + months);
	    return formatDate(date);
	}
	
	function addYear(dateStr, years) {
		var date = new Date(dateStr);
		date.setFullYear(date.getFullYear() + years);
		return formatDate(date);
	}
	
	function formatDate(date) {
	    var year = date.getFullYear();
	    var month = ("0" + (date.getMonth() + 1)).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);
	    return year + "-" + month + "-" + day;
	}

	//덧글 조회 및 출력
	function getChartDList(){
        let startdate = $('#startdate').val();
        let enddate = $('#enddate').val();
        console.log(startdate);
        console.log(enddate);
		fetchGet('/alpha/content/chartDate/'+startdate+'/'+enddate, resultChartDate);
	}

	function resultChartDate(map){
		let s_date = [];
		let date_sales = [];
		let dateList = map.dateList;
		let contentList = map.contentList;
		$('#myChart').remove();
		$('#myChartView').append('<canvas id="myChart"></canvas>');
		const ctx = document.getElementById('myChart');
		console.log(dateList);
		chartBdy.innerHTML='';
		dateList.forEach(function(chart) {
			console.log(chart.s_sales)
			s_date.push(chart.s_date);
			date_sales.push(chart.s_sales);
			
			if(chart.s_sales!=0){
	    	let cprice = dateList.price;
	    	let cnt = dateList.c_able;
	        var row = document.createElement('tr');
	        row.innerHTML = `
	            <td>${chart.s_date}</td>
	            <td>${chart.s_sales}원</td>
	        	<td>${chart.s_count}건</td>
	        `;
	        chartBdy.appendChild(row);
			}
		});
		

		new Chart(ctx, {
			type: 'line',
			data: {
		    	
		      labels: s_date,
		      
		      datasets: [{
			    label: '매출조회',
		        data: date_sales,
		        
		      }]
		    },
		    options: {
		      scales: {
		      }
		    }
		  });
		

	}
	//덧글 조회 및 출력
	function getChartCList(){
		fetchGet('/alpha/content/chartContent', resultChartContent);
	}
	
	function resultChartContent(map){
		let sub_c_no = [];
		let content_sales = [];
		let contentList = map.contentList;
		$('#myChart').remove();
		$('#myChartView').append('<canvas id="myChart"></canvas>');
		const ctx = document.getElementById('myChart');

		chartBdy.innerHTML='';
		contentList.forEach(function(chart) {
			sub_c_no.push(chart.sub_c_no);
			content_sales.push(chart.s_sales);
			
			let cprice = contentList.price;
			let cnt = contentList.c_able;
			var row = document.createElement('tr');
			row.innerHTML = `
				<td>${chart.c_name}</td>
				<td>${chart.s_sales}원</td>
				<td>${chart.s_count}건</td>
				`;
			chartBdy.appendChild(row);
		});

		new Chart(ctx, {
			type: 'line',
			data: {
				
				labels: sub_c_no,
				
				datasets: [{
					label: '매출조회',
					data: content_sales,
				}]
			},
			options: {
				scales: {
				}
			}
		});
		
		
	}


window.addEventListener('load', function(){
	saleDate();
})

$('#saleDate').on('click', function() {		
	saleDate();
})
$('#saleContent').on('click', function() {		
	saleContent();
})




