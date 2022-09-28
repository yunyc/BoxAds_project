<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>

	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap shop_wrap">
			<div class="inner">
				<div class="path">
					<ul>
						<li>홈</li>
						<li>찜리스트</li>
					</ul>
				</div>
				<h2 class="title wish_tit">찜리스트</h2>
				<div class="main_tab_content content_area">
					<div class="tab_btn">
						<button class="btn on" id="bxBtn">박스(Box)</button>
						<button class="btn" id="adBtn">애드(Ads)</button>
					</div>
					<div class="sort_area">
							<input type="radio" name="order" id="ads_new" value="N" checked>
							<label for="ads_new" class="chk">신상품 순</label>
							<input type="radio" name="order" id="ads_view" value="V">
							<label for="ads_view" class="chk">조회수 순</label>
							<input type="radio" name="order" id="ads_chk" value="F">
							<label for="ads_chk" class="chk">찜수 순</label>
						</div>
					<ul id="pageBxUl">
						
					</ul>
					<ul id="pageAdUl"style="display: none;">
						
					</ul>
					<input type="hidden" id="start" value="0">
					<input type="hidden" id="total" value="${bxTotal}">
					<input type="hidden" id="url" value="${path}/box/bxAjaxList?favFlag=Y">
					<div class="btn_area"><button id="more" type="button" class="btn">더보기 +</button></div>
				</div>
			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
<script>
	appendList("pageBxUl", "order");
	
	$("#adBtn").on("click", function(){
		$("#pageBxUl").fadeOut();
		$("#pageAdUl").fadeIn();
		setParam("pageAdUl", "${adTotal}", "${path}/ad/adAjaxList?favFlag=Y", "order");
		appendList("pageAdUl", "order");
	});
	
	$("#bxBtn").on("click", function(){
		$("#pageAdUl").fadeOut();
		$("#pageBxUl").fadeIn();
		setParam("pageBxUl", "${bxTotal}", "${path}/box/bxAjaxList?favFlag=Y", "order");
		appendList("pageBxUl", "order");
	});
	
	function setParam(ulId, total, url, odNm){
		$("#"+ulId).html("");
		$("#total").val(total);
		$("#start").val("0");
		$("#url").val(url);	
	}
</script>
</html>