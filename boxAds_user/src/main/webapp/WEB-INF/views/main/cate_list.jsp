<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp" %>

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
				<div class="sub_wrap shop_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li><span id="cateName"></span> (<strong>${bxTotal + adTotal}</strong>)</li>
						</ul>
					</div>		
				<div class="main_tab_content content_area">
					<div class="tab_btn">
						<button type="button" class="btn on" id="bxBtn">박스(Box)</button>
						<button type="button" class="btn" id="adBtn">애드(Ads)</button>
					</div>
					<div class="main_tab_content" id="mainTab0" style="display: block;">
						<div class="sort_area">
							<input type="radio" name="orderBx" id="box_new" value="N" checked>
							<label for="box_new" class="chk">신상품 순</label>
							<input type="radio" name="orderBx" id="box_view" value="V">
							<label for="box_view" class="chk">조회수 순</label>
							<input type="radio" name="orderBx" id="box_chk" value="F">
							<label for="box_chk" class="chk">찜수 순</label>
						</div>
						<%-- <c:if test="${bxTotal <= 0}"> --%>
							<div class="nodata type02" style="display: none" id="boxNoData">상품이 존재하지 않습니다.</div>
						<%-- </c:if> --%>
						<ul id="pageBxUl">
							
						</ul>
						<c:if test="${bxTotal > 0}">
							<div class="btn_area">
								<button type="button" id="moreBox" class="btn">더보기 +</button>
							</div>	
						</c:if>
					</div> 
					<div class="main_tab_content" id="mainTab1" style="display: none;">
						<div class="sort_area">
							<input type="radio" name="orderAd" id="ads_new" value="N" checked>
							<label for="ads_new" class="chk">신상품 순</label>
							<input type="radio" name="orderAd" id="ads_view" value="V">
							<label for="ads_view" class="chk">조회수 순</label>
							<input type="radio" name="orderAd" id="ads_chk" value="F">
							<label for="ads_chk" class="chk">찜수 순</label>
						</div>
						<%-- <c:if test="${adTotal <= 0}"> --%>
							<div class="nodata type02" style="display: none" id="adNoData">상품이 존재하지 않습니다.</div>
						<%-- </c:if> --%>
						<ul id="pageAdUl" class="ads_list">
						</ul>						
						<c:if test="${adTotal > 0}">
							<div class="btn_area">
								<button type="button" id="moreAd" class="btn">더보기 +</button>
							</div>													
						</c:if>
					</div>
						<input type="hidden" id="start" value="0">
						<input type="hidden" id="total" value="${bxTotal}">
						<input type="hidden" id="url" value="${path}/box/bxAjaxList">
				</div>
			</div>
			
		</div>		
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>	
	$(function(){		
		$("#wrap").addClass("fixed_gnb");			
		$("#moreBox, #moreAd").on("click", function(){ appendList(ulId, orNm); })
	})
	
	appendList("pageBxUl", "orderBx");
	noDataChk("boxNoData", "${bxTotal}");

	$("#adBtn").on("click", function(){
		setParam("pageAdUl", "${adTotal}", "${path}/ad/adAjaxList", "orderAd");
		appendList("pageAdUl", "orderAd");
		noDataChk("adNoData", "${adTotal}");
	})
	
	$("#bxBtn").on("click", function(){
		setParam("pageBxUl", "${bxTotal}", "${path}/box/bxAjaxList", "orderBx");
		appendList("pageBxUl", "orderBx");
		noDataChk("boxNoData", "${bxTotal}");
	})	
	
	function setParam(ulId, total, url, odNm){
		$("#"+ulId).html("");
		$("#total").val(total);
		$("#start").val("0");
		$("#url").val(url);		
	}	

	</script>
</body>
</html>