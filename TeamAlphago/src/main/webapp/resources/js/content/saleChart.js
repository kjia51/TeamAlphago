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
                    +'<div class="searchBox" style="display:inline-block">'
                    +'<input type="text" class="input" name="strtDd" id="strtDd" value="20230823" maxlength="8" style="width:100px; text-align:center">'
                    +'<span>~</span>'
                    +'<input type="text" class="input" name="endDd" id="endDd" value="20230831" maxlength="8" style="width:100px; text-align:center">'
                    +'<button type="button" class="cal-btn-open" data-calendar-module="true" data-calendar-display="false" ><i class="fa-regular fa-calendar" style="font-size:25px"></i></button>'
                    +'</div>'
                    +'<div class="searchBox" style="display:inline-block; margin-left:50px">'
                    +'<input type="text" class="inputSrch" value="1일" name="day" id="day" style="width:40px; text-align:center" readonly>'
                    +'<input type="text" class="inputSrch" value="1개월" name="month" id="month" style="width:40px; text-align:center" readonly>'
                    +'<input type="text" class="inputSrch" value="6개월" name="half" id="half" style="width:40px; text-align:center" readonly>'
                    +'<input type="text" class="inputSrch" value="1년" name="year" id="year" style="width:40px; text-align:center" readonly>'
                    +'<input type="button" class="btn btn-primary" id="btnDate" value="조회">'
                    +'</div>'
                    +'</td>';
    searchLayout.appendChild(row);
    var row1 = document.createElement('tr');
    row1.innerHTML = ''
			        +'<tr>'
			        +'<th></th>'
			        +'<th>매출액</th>'
			        +'<th>매출건수</th>'
			        +'</tr>';
    chartHead.appendChild(row1);

	$('#btnDate').click(function () {
		myChart.style.display = "block";
		getChartDList();
	})
}

	//덧글 조회 및 출력
	function getChartDList(){
		fetchGet('/alpha/content/chartDate', resultChartDate);
	}

	let s_date = [];
	let date_sales = [];
	function resultChartDate(map){
		let dateList = map.dateList;
		let contentList = map.contentList;
		const ctx = document.getElementById('myChart');
		chartBdy.innerHTML='';
		dateList.forEach(function(chart) {
			s_date.push(chart.s_date);
			date_sales.push(chart.s_sales);
			
	    	let cprice = dateList.price;
	    	let cnt = dateList.c_able;
	        var row = document.createElement('tr');
	        row.innerHTML = `
	            <td>${chart.s_date}</td>
	            <td>${chart.s_sales}</td>
	        	<td>${chart.s_count}</td>
	        `;
	        chartBdy.appendChild(row);
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
	
	let sub_c_no = [];
	let content_sales = [];
	function resultChartContent(map){
		let contentList = map.contentList;
		const ctx = document.getElementById('myChart');
		chartBdy.innerHTML='';
		contentList.forEach(function(chart) {
			sub_c_no.push(chart.sub_c_no);
			content_sales.push(chart.s_sales);
			
			let cprice = contentList.price;
			let cnt = contentList.c_able;
			var row = document.createElement('tr');
			row.innerHTML = `
				<td>${chart.sub_c_no}</td>
				<td>${chart.s_sales}</td>
				<td>${chart.s_count}</td>
				`;
			chartBdy.appendChild(row);
		});
	    if (ctx) {
	    	ctx.destroy();
	    }
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

