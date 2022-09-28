<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${type eq 'box'}">
		<c:set var="type" value="박스"/>
		<c:set var="url" value="box"/>
		<c:set var="tag" value="Box"/>
		<c:set var="state1" value="판매대기"/>
		<c:set var="state2" value="판매중"/>
		<c:set var="state3" value="판매종료"/>
	</c:when>
	<c:when test="${type eq 'ad'}">
		<c:set var="type" value="애드"/>
		<c:set var="url" value="ad"/>
		<c:set var="tag" value="Ads"/>
		<c:set var="state1" value="광고대기"/>
		<c:set var="state2" value="광고중"/>
		<c:set var="state3" value="광고종료"/>
	</c:when>
</c:choose>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
		<div id="container">
			<div class="sub_wrap mypage_wrap mylist_wrap">
			<div class="inner">
				<div class="path">
					<ul>
						<li>홈</li>
						<li>${type}(${tag})</li>
						<li>마이 ${type} 관리</li>
					</ul>
				</div>
				<h2 class="title">마이 ${type} 관리</h2>
				<div class="list_top_area">
					<ul class="stat_area">
						<li>보유 캐시 : <strong><fmt:formatNumber value="${myCash}" pattern="#,###" /></strong> 원</li>
						<li>총 ${type} : <strong>${cnt}</strong> 개</li>
					</ul> 
					<a href="${path}/${url}/write" class="btn btn_write">신규  ${type} 등록</a>
				</div>
				<div class="srch_wrap">
					<p>전체 상품 : <strong>${cnt}</strong> 건 </p>
					<fieldset>
						<legend>목록 검색</legend>
						<div class="srch_sub_box">
						<form:form>
							<label for="srch_sel" class="blind">검색조건 선택</label>
							<select id="srch_sel" name="state" class="option_box">
								<option value="">상태선택</option>
								<option value="N" <c:if test="${param.state eq 'N'}">selected</c:if>>${state1}</option>
								<option value="Y" <c:if test="${param.state eq 'Y'}">selected</c:if>>${state2}</option>
								<option value="P" <c:if test="${param.state eq 'P'}">selected</c:if>>일시중지</option>
								<option value="E" <c:if test="${param.state eq 'E'}">selected</c:if>>${state3}</option>
							</select>
							<div class="srch_date">
								<div class="input_area input_date">
									<input type="text" title="시작일" value="${param.startDate}" name="startDate" placeholder="시작일" id="datepicker1" >
								</div>
								<span class="hypen">~</span>
								<div class="input_area input_date">
									<input type="text" title="종료일" value="${param.endDate}" name="endDate" placeholder="종료일" id="datepicker2" >
								</div>
							</div>
							<div class="srch_sub_box2">
								<label for="srch_input" class="blind">검색어 입력</label>
								<input type="text" id="srch_input" name="title" value="${param.title}" placeholder="${type} 명">
								<button type="submit" class="btn">검색</button>
							</div>
							<input type="hidden" id="start" value="0">
							<input type="hidden" id="total" value="${cnt}">
							<input type="hidden" id="url" value="${path}/${url}/${url}MyList">
							</form:form>
						</div>
					</fieldset>
				</div>
				<!-- 마이 박스 리스트 -->
				<div class="main_tab_content">
					<ul id="pageList">
						
					</ul>
					
					<div class="btn_area"><button id="moreText" type="button" class="btn btn_more">더보기 +</button></div>
				</div>
			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
<script>

appendTextList("pageList", 12);

</script>
</html>