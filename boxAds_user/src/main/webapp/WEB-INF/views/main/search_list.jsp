<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp" %>

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap shop_wrap list_search_wrap">
			<div class="inner">
              
                <div class="path">
					<ul>
						<li>"${searchKeyword}"에 대한 <strong>총 ${adTotal + bxTotal}개</strong>의 결과를 찾았습니다.</li>
					</ul>
				</div>
				
				<div class="main_tab_content">
					<div class="tab_btn">
						<a href="#" class="btn on" id="bxBtn"><span>박스(Box) [총<strong>${bxTotal}</strong>건]</span></a>
						<a href="#" class="btn" id="adBtn"> <span>애드(Ads)[총<strong>${adTotal}</strong>건] </span></a>
					</div>	
					<div class="nodata type02" style="display: none;" id="noData">상품이 존재하지 않습니다.</div>
					
					<ul id="pageBxUl">
							
					</ul>
										
					<ul id="pageAdUl" style="display: none;">
							
					</ul>
					<input type="hidden" id="start" value="0">
					<input type="hidden" id="total" value="${bxTotal}">
					<input type="hidden" id="url" value="${path}/box/bxAjaxList">
					<c:if test="${bxTotal > 0}">
						<div class="btn_area"><button id="more" type="button" class="btn">더보기 +</button></div>
					</c:if>
				</div>
			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>
	
	$(function(){					
		$("#wrap").addClass("fixed_gnb");
	})
	
	appendList("pageBxUl", null);
	noDataChk("noData", "${bxTotal}");
	
	$("#adBtn").on("click", function(){
		$(".tab_btn > a").removeClass("on");
		$(this).addClass("on");		
		$(".main_tab_content > ul").hide();
				
		setParam("pageAdUl", "${adTotal}", "${path}/ad/adAjaxList", null);
		appendList("pageAdUl", null);
		noDataChk("noData", "${adTotal}");
	})
	
	if("${bxTotal}" == 0){
		$(".nodata").show();
	}
	$("#bxBtn").on("click", function(){
		$(".tab_btn > a").removeClass("on");
		$(this).addClass("on");		
		$(".main_tab_content > ul").hide();
		
		setParam("pageBxUl", "${bxTotal}", "${path}/box/bxAjaxList", null);
		appendList("pageBxUl", null);
		noDataChk("noData", "${bxTotal}");
	})	
	
	function setParam(ulId, total, url, odNm){		
		$("#"+ulId).show();		
		$("#"+ulId).html("");
		$("#total").val(total);
		$("#start").val("0");
		$("#url").val(url);		
	}
	
	</script>
</body>
</html>