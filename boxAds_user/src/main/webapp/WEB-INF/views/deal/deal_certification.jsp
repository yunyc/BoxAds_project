<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp" %>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap mylist_wrap">
			<div class="inner">
				<div class="path">
					<ul>
						<li>홈</li>
						<li>거래관리</li>
					</ul>
				</div>
				<h2 class="title">거래관리</h2>
				<!-- tab -->
				<div class="tab list_tab2">
					<ul>
						<li><a href="${path}/deal/deal_history">결제 내역</a></li>
						<li class="on"><a href="${path}/deal/deal_certification">증빙서류 발행내역</a></li>
						<li><a href="${path}/deal/deal_info">거래 정보</a></li>
						<li><a href="${path}/deal/deal_withdraw">출금 정보</a></li>
					</ul>
				</div>
				<div class="srch_wrap">
					<p class="big">증빙서류 발행내역 목록</p>
					<form:form method="get">
						<fieldset>
							<legend>목록 검색</legend>
							<div class="srch_sub_box">
								<label for="srch_sel" class="blind">검색조건 선택</label>
								<select id="srch_sel" name="state" class="option_box">
									<option value="">상태</option>
									<option value="N" <c:if test="${param.state eq 'N'}">selected</c:if>>발행요청</option>
									<option value="Y" <c:if test="${param.state eq 'Y'}">selected</c:if>>발행완료</option>
									<option value="R" <c:if test="${param.state eq 'R'}">selected</c:if>>수정발행</option>								
								</select>
								<div class="srch_date">
									<div class="input_area input_date">
										<input type="text" name="insertDate" value="${param.insertDate}" title="시작일" placeholder="시작일" id="datepicker1">
									</div>
									<span class="hypen">~</span>
									<div class="input_area input_date">
										<input type="text" name="endDate" value="${param.endDate}" title="종료일" placeholder="종료일" id="datepicker2">
									</div>
								</div>
								<div class="srch_btn">
									<button class="btn btn_search" type="submit"><span>검색</span></button>
								</div>
							</div>
						</fieldset>
					</form:form>
				</div>
				<c:choose>
					<c:when test="${total <= 0}">
						<p class="nodata">
							증빙서류 발행내역이 없습니다.
						</p>
					</c:when>
					<c:otherwise>						
							<div class="item_list_wrap">
								<div class="table_wrap over_t">
									<table>
										<caption>결제내역</caption>
										<colgroup>
											<col>
											<col>
											<col>
											<col>
											<col>
											<col>
											<col>
											<col>
										</colgroup>
										<thead>
											<tr>
												<th scope="col">요청일자</th>
												<th scope="col">발행 구분</th>
												<th scope="col">증빙 유형</th>
												<th scope="col" class="align_r">공급가액</th>
												<th scope="col" class="align_r">세액</th>
												<th scope="col" class="align_r">합계</th>
												<th scope="col">처리일자</th>
												<th scope="col">상태</th>
											</tr>
										</thead>
										<tbody id="listBody">
																					
										</tbody>
									</table>
								</div>
							<div class="btn_area"><button type="button" class="btn btn_more" id="moreText">더보기 +</button></div>
						</div>
						<input type="hidden" id="start" value="0">
						<input type="hidden" id="total" value="${total}">
						<input type="hidden" id="url" value="${path}/deal/dealAjaxList">
					</c:otherwise>
				</c:choose>				
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>	
	appendTextList("listBody", 20);

	</script>
</body>
</html>
