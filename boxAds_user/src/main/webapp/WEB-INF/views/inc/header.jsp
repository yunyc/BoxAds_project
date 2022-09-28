<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- head 영역 -->
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	
	<meta property="og:image" content="/favicon/og-image.png">
	 
	<link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-touch-icon.png">
	
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">

	
	<title>boxads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css?v=1910">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/layout.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/js/paging.js"></script>
	<script src="${pageContext.request.contextPath}/js/fav.js"></script>
	
	<!--슬라이더 관련 호출 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.css">
	<script src="${pageContext.request.contextPath}/js/swiper.min.js"></script>
	<!--//슬라이더 관련 호출 끝 -->
	<!-- head 영역 끝 -->
	<script>
		function getPath(){
			return "${pageContext.request.contextPath}";
		}

		function getSessionIdx(){
			return "${login.idx}";
		}
				
		$(function(){			
			/* $("img").on("error", function(){
				$(this).attr("src", "${pageContext.request.contextPath}/images/common/boxads_no_image.png")
			})	 */	

			$("#datepicker1, #datepicker2,#datepicker3,#datepicker4").attr("autocomplete", "off");

			$.ajax({
				type : "POST",	
				url : "${pageContext.request.contextPath}/alimBanner",					
				dataType : "json",
				success : function(data){
					$.each(data, function(i, item) {
						var element = '<div class="promo-content swiper-slide">'
							element += '<p>'+item.title+'<a href="'+item.siteUrl+'" class="go"'
							if(item.window == 'W'){ element += 'target="_blank"'; }						
							element += '>바로가기</a></p></div>'
							
						$("#alimList").append(element);
					});	
								
				},complete: function() {
					
					var promolslider = new Swiper('.promo_slider', {
						 loop: true,
						pagination: {
							el: '.promo-pager',
							clickable: true,
							renderBullet: function (index, className) {					
						 		return '<span class="' + className + '">' + pad(index + 1,2) + '</span>';
								},						
							},
							navigation: {
							nextEl: '.promo_btn_next',
							prevEl: '.promo_btn_prev',
							},
							autoplay:{
								delay: 4000,
							},
					});
				    
			     },error : function() {
					console.log("에러가 발생되었습니다");	
				}	
			});	
		});
	</script>
</head>
