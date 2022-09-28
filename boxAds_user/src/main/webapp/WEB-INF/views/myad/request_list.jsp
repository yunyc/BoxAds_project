<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
			<div id="container">
				<div class="sub_wrap mypage_wrap mylist_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>애드(Ads)</li>
							<li>마이 애드 요청</li>
							<li>목록</li>
						</ul>
					</div>
					<h2 class="title">마이 애드 요청</h2>
					<div class="list_top_area">
						<ul class="stat_area">
							<li>보유 캐시 : <strong><fmt:formatNumber value="${myCash}" pattern="#,###" /></strong> 원</li>
							
						</ul>
						<a href="${path}/ad/write" class="btn btn_write">신규 애드 등록</a>
					</div>
					<div class="srch_wrap">
						<p>마이 애드 요청</p>
							<fieldset>
								<legend>목록 검색</legend>
								<div class="srch_sub_box">
								<form:form>
									<label for="srch_sel" class="blind">검색조건 선택</label>
									<select id="srch_sel" name="state" class="option_box">
										<option value="">상태선택</option>
										<option value="A1"<c:if test="${param.state eq 'A1'}">selected</c:if>>광고신청</option>
										<option value="A2"<c:if test="${param.state eq 'A2'}">selected</c:if>>신청승인</option>
										<option value="A3"<c:if test="${param.state eq 'A3'}">selected</c:if>>광고집행</option>
										<option value="A4"<c:if test="${param.state eq 'A4'}">selected</c:if>>신청취소</option>
									</select>
									<div class="srch_date">
										<div class="input_area input_date">
											<input type="text" name="startDate" value="${param.startDate}" title="시작일" placeholder="시작일" id="datepicker1">
										</div>
										<span class="hypen">~</span>
										<div class="input_area input_date">
											<input type="text" name="endDate" value="${param.endDate}" title="종료일" placeholder="종료일" id="datepicker2">
										</div>
									</div>
									<div class="srch_sub_box2">
										<label for="srch_input" class="blind">검색어 입력</label>
										<input type="text" id="srch_input" name="title" value="${param.title}" placeholder="애드 명">
										<button type="submit" class="btn">검색</button>
									</div>
									<input type="hidden" id="start" value="0">
									<input type="hidden" id="total" value="${total}">
									<input type="hidden" name="table" value="A">
									<input type="hidden" id="url" value="${path}/ad/adRequestAjaxList">
								</form:form>
								</div>
							</fieldset>
					</div>
				<c:choose>
					<c:when test="${total <= 0}">
						<p class="nodata">
							요청된 광고(Ads)가 없습니다.
						</p>
					</c:when>
					<c:otherwise>
						<div class="item_list_wrap">
							<div class="table_wrap over_t">
								<table>
									<caption>마이 애드 요청 목록</caption>
									<colgroup>
										<col style="width:14%;">
										<col style="width:18%">
										<col style="width:18%">
										<col>
										<col>
										<col>
										<col>
										<col style="width:12%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">신청일시</th>
											<th scope="col">마이 애드(Ads)</th>
											<th scope="col">박스(Box)</th>
											<th scope="col">판매자</th>
											<th scope="col">판매 월</th>
											<th scope="col">박스 수</th>
											<th scope="col">광고비</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody id="listBody">
										
									</tbody>
								</table>
							</div>
							<div class="btn_area"><button type="button" class="btn btn_more" id="moreText">더보기 +</button></div>
						</div>						
					</c:otherwise>
				</c:choose>
			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>	
	$(function(){	
		$("#searchBtn").on("click", function(){	
			console.log("?")	
			$("#start").val("0");
			$("#listBody").html("");
			
			appendTextList("listBody", 20);
		})
	})
	
	appendTextList("listBody", 20);
	</script>
</body>