<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp" %>
<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<%-- <c:import url="../inc/left_print.jsp">
			<c:param name="menuOn" value="0" />
		</c:import> --%>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>인쇄관리</h3>
				</div>
				<div class="score_wrap">
					<ul>
						<li>
							<div>
								<p>신규 발주</p>
								<span class="txt_blue"><fmt:formatNumber minIntegerDigits="2" value="${dash.b4Cnt}" type="number"/></span>
							</div>
						</li>
						<li>
							<div>
								<p>디자인 검수</p>
								<span class="txt_blue"><fmt:formatNumber minIntegerDigits="2" value="${dash.b5Cnt}" type="number"/></span>
							</div>
						</li>
						<li>
							<div>
								<p>디자인 수정</p>
								<span class="txt_blue"><fmt:formatNumber minIntegerDigits="2" value="${dash.b6Cnt}" type="number"/></span>
							</div>
						</li>
						<li>
							<div>
								<p>홍보물<br>제작중</p>
								<span class="txt_blue"><fmt:formatNumber minIntegerDigits="2" value="${dash.b7Cnt}" type="number"/></span>
							</div>
						</li>
						<li>
							<div>
								<p>홍보물<br>제작완료</p>
								<span class="txt_blue"><fmt:formatNumber minIntegerDigits="2" value="${dash.b8Cnt}" type="number"/></span>
							</div>
						</li>
						<li>
							<div>
								<p>배송처리</p>
								<span class="txt_blue"><fmt:formatNumber minIntegerDigits="2" value="${dash.b9Cnt}" type="number"/></span>
							</div>
						</li>
					</ul>
				</div>
				<div class="list">
				<form:form action="${path}/print/print_list">
					<input type="hidden" name="curPage" value="${page.curPage}">
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">키워드</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
											<select id="kwd01" name="searchType">
												<option value="OD" <c:if test="${param.searchType eq 'OD'}">selected</c:if>>주문번호</option>
												<option value="BX" <c:if test="${param.searchType eq 'BX'}">selected</c:if>>박스명</option>
												<option value="AD" <c:if test="${param.searchType eq 'AD'}">selected</c:if>>애드명</option>
											</select>
											<input type="text" id="kwd02" name="searchKeyword" value="${param.searchKeyword}">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
										<th scope="row">키워드</th>
										<td>
											<input type="text" title="시작일" name="startDate" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1" value="${param.startDate}">
											<span class="mlr15">~</span>
											<input type="text" title="종료일" name="endDate" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2" value="${param.endDate}">
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button href="#" class="btn">검색</button>
					</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>인쇄관리</caption>
									<colgroup>
										<col style="width:5%">
										<col>
										<col>
										<col>
										<col style="width:7%">
										<col style="width:7%">
										<col style="width:7%">
										<col>
										<col>
										<col style="width:10%">
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">주문번호</th>
										<th scope="col">박스 명</th>
										<th scope="col">애드명</th>
										<th scope="col">판매 월</th>
										<th scope="col">광고유형</th>
										<th scope="col">인쇄수량</th>
										<th scope="col">발주일시</th>
										<th scope="col">완료일시</th>
										<th scope="col">인쇄 상태</th>
									</thead>
									<tbody>
									<c:choose>
			                        	<c:when test="${empty list}">
			                        		<tr><td colspan="10">등록된 인쇄관리가 없습니다</td></tr>
			                        	</c:when>
			                        	<c:otherwise>
											<c:forEach items="${list}" var="vo" varStatus="status">
												<tr>
													<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
													<td>${vo.orderCode}</td>
													<td class="align_l"><a href="print_detail?idx=${vo.idx}">${vo.boxTitle}</a></td>
													<td class="align_l"><a href="print_detail?idx=${vo.idx}">${vo.adTitle}</a></td>
													<td>${vo.sellDate}</td>
													<td>${vo.pro}</td>
													<td>${vo.boxCnt}</td>
													<td>${vo.insertDate}</td>
													<td>${vo.recentDate}</td>
													<td>
														<c:choose>
															<c:when test="${vo.state eq 'B0'}">발주취소</c:when>
															<c:when test="${vo.state eq 'B4'}">신규발주</c:when>
															<c:when test="${vo.state eq 'B5'}">디자인 검수</c:when>
															<c:when test="${vo.state eq 'B6'}">디자인 수정</c:when>
															<c:when test="${vo.state eq 'B7'}">홍보물 제작중</c:when>
															<c:when test="${vo.state eq 'B8'}">홍보물 제작완료</c:when>
															<c:when test="${vo.state eq 'B9'}">배송처리</c:when>
														</c:choose>
													</td>
												</tr>	
											</c:forEach>	
										</c:otherwise>
									</c:choose>								
									</tbody>
								</table>
								<div class="pagination mt50">									
								</div>
							</div>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>	
$(function() {
	$('#gnb ul li').eq(9).addClass('on');
	$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));
})

</script>
</body>
</html>
