<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"> -->
<meta name="format-detection" content="telephone=no">
<meta name="Keywords" content="">
<meta name="Description" content="">

<title>ADMINISTRATOR</title>
<link rel="shortcut icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="32x32"
	href="../images/common/favicon.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="../images/common/favicon.png">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/general.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layout.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/paging.js"></script>
<script type="text/javascript">
	$(document).ready(
		function() {
			$("#datepicker1, #datepicker2,#datepicker3,#datepicker4").attr("autocomplete", "off");
			
			//날짜 선택 창
			$.datepicker.setDefaults({
				dateFormat : 'yy-mm-dd',
				prevText : '이전 달',
				nextText : '다음 달',
				monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
						'8월', '9월', '10월', '11월', '12월' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
						'7월', '8월', '9월', '10월', '11월', '12월' ],
				dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				showMonthAfterYear : true,
				yearSuffix : '년'
			});

			var tmpdate;
			//$(function() {
			$("#datepicker1, #datepicker2 ,#datepicker3, #datepicker4").datepicker({
				beforeShow : function() {
					if (this.id == "datepicker1") {
						tmpdate = $(this).val();
					}
				}

				/*, onSelect : function(dateText, inst) {
					if (this.id == "datepicker1") {
						var date1 = new Date(dateText);
						var str1 = $("#datepicker2").val();
						if (str1 != "") {
							var date2 = new Date(str1);
							if (date1 > date2) {
								$(this).val(tmpdate);
								alert("시작일은 종료일보다 클수 없습니다.");
							}
						}
					}
				} */
			});
		});
</script>
</head>
<body>
	<div id="wrap" class="skin_type01">