<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<nav class="header_gnb">
	<ul>
		
	</ul>
</nav>
<nav class="mobile_gnb">
	<div class="swiper-container">
		<ul class="swiper-wrapper">
			
		</ul>
	</div>
</nav>

<script>
var cate = "${param.cate}";

$(function() {	
	$(document).on("mouseover", ".header_gnb > ul > li > a", function(){
		$(this).parent("li").addClass("selected");			
	})
	
	$(document).on("mouseleave", ".header_gnb > ul > li > a", function(){		
		if(cate != $(this).attr("data-cate")){
			$(this).parent("li").removeClass("selected"); 
		}
	})	
	
	// 카테고리 정보 가져와서 list 채우기	
	$.ajax({
		type : "POST",	
		url : "${path}/common/category",	
		data : {type:"C", depth:1, useFlag:"Y"},	
		dataType : "json",
		success : function(result){
			var html = "";	
			var mHtml = "";
			
			result.forEach(function(c, i) {
				if(cate == c.idx){
					html += '<li class="selected">';
					$("#cateName").text(c.name)
				} else {
					html += '<li>';
				}				
				html +=	'<a href="${path}/cate_list?cate='+c.idx+'" data-cate="'+c.idx+'">'+c.name+'</a></li>'
				mHtml += '<li class="swiper-slide"><a href="${path}/cate_list?cate='+c.idx+'" data-cate='+c.idx+' class="s_dep'+i+'">'+c.name+'</a></li>'				
			})
			
			$(".header_gnb > ul").append(html);
			$(".mobile_gnb > div > ul").append(mHtml);

						
		},complete: function() {
			
			var gnbSwiper = new Swiper('.mobile_gnb .swiper-container', {
				slidesPerView: 'auto',
				cssWidthAndHeight: true,
				spaceBetween: 34,
				freeMode: true,
		    });

			$(".mobile_gnb > .swiper-container > ul > li > a").each(function(c) {
				if($(this).attr("data-cate") == cate){
					$(this).parent("li").addClass("selected"); 
					gnbSwiper.slideTo($(this).parent("li").index(), 0, false);
				}
			})
 
	     },error : function() {
			console.log("에러가 발생되었습니다");	
		}	
	});	
})
</script>
