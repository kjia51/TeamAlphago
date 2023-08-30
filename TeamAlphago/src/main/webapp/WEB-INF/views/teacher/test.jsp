<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
	.hasDatepicker {
		display: inline-block;
		padding: .2em .2em 0;
		float: left;
	}
</style>
<body>


<div class="my-datepicker"></div>



<script>

$(document).ready(function() {
    $(".my-datepicker").datepicker({
        showOtherMonths: true,
        showMonthAfterYear: true,
        selectOtherMonths: true,
        buttonText: "선택",
        yearSuffix: "년",
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
        minDate: "+1D",
        maxDate: "+1y",
        dateFormat: 'yy-mm-dd',
        onSelect: function(selectedDate) {
            var startDate = new Date(selectedDate);
            startDate.setDate(startDate.getDate() + 90); // Add 90 days
            
            var year = startDate.getFullYear();
            var month = ("0" + (startDate.getMonth() + 1)).slice(-2); // Adding 1 because getMonth() is 0-based
            var day = ("0" + startDate.getDate()).slice(-2);
            
            var endDateFormatted = year + "-" + month + "-" + day;
            
            $('#startdate').val(selectedDate);
            $('#enddate').val(endDateFormatted);
        }
    });
});
</script>




</body>
</html>