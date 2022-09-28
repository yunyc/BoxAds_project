<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp" %>

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container" class="main_content">
			<div class="main_banner">
				<div class="inner">
					<div class="banner_slide pc">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach items="${bannerList}" var="banner">
									<c:if test="${banner.type eq 'B'}">
										<div class="swiper-slide">
											<a <c:if test="${banner.window eq 'W'}">target="_blank"</c:if> href="${banner.siteUrl}">
												<img src="${path}${banner.url}" alt="${banner.title}">
											</a>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="swiper_util">
								<div class="swiper-pagination"></div>
								<button type="button" class="btn">재생/정지</button>
							</div>
						</div>
					</div>
					<div class="banner_slide mobile">
						<div class="swiper-container">
							<div class="swiper-wrapper">
							<c:forEach items="${bannerList}" var="banner">
									<c:if test="${banner.type eq 'MB'}">
										<div class="swiper-slide">
											<a <c:if test="${banner.window eq 'W'}">target="_blank"</c:if> href="${banner.siteUrl}">
												<img src="${path}${banner.url}" alt="${banner.title}">
											</a>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<div class="main_info">
						<div class="info_box">
						<c:choose>
							<c:when test="${!empty login}">
								<div class="ib_inner login">
									<div class="ib_name">환영합니다. <strong><em>${login.name}</em>님</strong></div>
									<dl>
										<dt>마이박스 판매</dt>
										<dd>
											<strong>${dash.bIng}/${dash.bTotal}</strong> 건
										</dd>
									</dl>
									<dl>
										<dt>박스 구매</dt>
										<dd>
											<strong>${dash.bmIng}/${dash.bmTotal}</strong> 건
										</dd>
									</dl>
									<dl>
										<dt>마이애드 요청</dt>
										<dd>
											<strong>${dash.aIng}/${dash.aTotal}</strong> 건
										</dd>
									</dl>
									<dl>
										<dt>애드 신청</dt>
										<dd>
											<strong>${dash.amIng}/${dash.amTotal}</strong> 건
										</dd>
									</dl>
								</div> <!-- 로그인 후 -->
							</c:when>
							<c:otherwise>
								<div class="ib_inner">
									<dl>
										<dt>박스(Box) 수</dt>
										<dd class="Titilium">
											<strong>${dash.boxCnt}</strong>개
										</dd>
									</dl>
									<dl>
										<dt>애드(Ads) 수</dt>
										<dd class="Titilium">
											<strong>${dash.adCnt}</strong>개
										</dd>
									</dl>
									<dl>
										<dt>총거래 수</dt>
										<dd class="Titilium">
											<strong>${dash.orderCnt}</strong>개
										</dd>
									</dl>
									<dl>
										<dt>총 회원수</dt>
										<dd class="Titilium">
											<strong>${dash.memberCnt}</strong>명
										</dd>
									</dl>
								</div> <!-- 로그인 전 -->
							</c:otherwise>
						</c:choose>
						</div>
						<div class="box_slider">
							<a href="${path}/etc/guide_box"><img src="${path}/images/main/small_banner01.jpg" alt="판매자 박스(BOX) 이용방법"></a>
						</div>
					</div>
				</div>
			</div>
			<div class="content_area">
				<div class="inner">
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
						<ul id="pageBxUl">
							
						</ul>
						<c:if test="${bxTotal > 0}">
							<div class="btn_area">
								<button type="button" id="moreBox" class="btn">더보기 +</button>
							</div>	
						</c:if>
					</div>
					<div class="main_tab_content" id="mainTab1">
						<div class="sort_area">
							<input type="radio" name="orderAd" id="ads_new" value="N" checked>
							<label for="ads_new" class="chk">신상품 순</label>
							<input type="radio" name="orderAd" id="ads_view" value="V">
							<label for="ads_view" class="chk">조회수 순</label>
							<input type="radio" name="orderAd" id="ads_chk" value="F">
							<label for="ads_chk" class="chk">찜수 순</label>
						</div>
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
			
		$("#adBtn").on("click", function(){
			setParam("pageAdUl", "${adTotal}", "${path}/ad/adAjaxList", "orderAd");
			appendList("pageAdUl", "orderAd");
		})		
		$("#bxBtn").on("click", function(){
			setParam("pageBxUl", "${bxTotal}", "${path}/box/bxAjaxList", "orderBx");
			appendList("pageBxUl", "orderBx");
		})	
	})
	
	appendList("pageBxUl", "orderBx");
	
	function setParam(ulId, total, url, odNm){
		$("#"+ulId).html("");
		$("#total").val(total);
		$("#start").val("0");
		$("#url").val(url);		
	}

	if('${param.ad}' != ''){
		$("#bxBtn").removeClass("on");
		$("#adBtn").addClass("on");
		trigerChk();
	}	
	</script>
</body>
</html>