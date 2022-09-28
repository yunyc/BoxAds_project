<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>

	<div class="sub_wrap">
		<c:import url="../inc/left_calcul.jsp">
			<c:param name="menuOn" value="1" />
		</c:import>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>결제(충전) 관리</h3>
				</div>
				<div class="list">
					<div class="view">
					<form:form method="get">
						<input type="hidden" name="curPage" value="${page.curPage}">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">키워드</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
											<select id="kwd01" name="searchType">
												<option value="id" <c:if test="${param.searchType eq 'id'}">selected</c:if>>아이디</option>
												<option value="cashCode" <c:if test="${param.searchType eq 'cashCode'}">selected</c:if>>결제번호</option>
												<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>광고주</option>
											</select>
											<input type="text" id="kwd02" name="keyword" value="${param.keyword}">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" placeholder="YYYY-MM-DD" name="insertDate" value="${param.insertDate}" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행시가긴_1" placeholder="YYYY-MM-DD" name="endDate" value="${param.endDate}" class="ico_date" id="datepicker2">
											<button type="button" class="btn date" onclick="changeDateDay(this, 0)">오늘</button>
											<button type="button" class="btn date" onclick="changeDateDay(this, 7)">1주일</button>
											<button type="button" class="btn date" onclick="changeDateMonth(this, 1)">1달</button>
										</td>
									</tr>
									<tr>
										<th scope="row">결제방식</th>
										<td>
											<c:set var="typeList" value="${fn:join(paramValues.type, ',')}"/>
											<input type="checkbox" id="all" name="type" value="" onclick="checkAll('all', 'type')" <c:if test="${empty typeList}">checked</c:if>><label for="all">전체</label>
											<input type="checkbox" id="card" name="type" value="CARD" <c:if test="${fn:contains(typeList, 'CARD')}">checked</c:if>><label for="card">신용카드</label>
											<input type="checkbox" id="account" name="type" value="BANK" <c:if test="${fn:contains(typeList, 'BANK')}">checked</c:if>><label for="account">계좌이체</label>
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button type="submit" class="btn">검색</button>
					</div>
					</form:form>
						<div class="btn_area excel fl_r">		
							<button type="button" class="btn">엑셀다운로드</button>
						</div>
						<div class="mt20">
							<h4>총 : <span class="txt_red">${page.totalCnt}</span>건</h4>
						</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>결제(충전) 리스트</caption>
									<colgroup>
										<col style="width:4%">
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">결제일시</th>
										<th scope="col">결제승인번호</th>
										<th scope="col">충전상품</th>
										<th scope="col">결제금액</th>
										<th scope="col">결제방식</th>
										<th scope="col">결제결과</th>
										<th scope="col">회원명</th>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty list}">
												<tr><td colspan="8">결제 내역이 없습니다.</td></tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${list}" var="vo" varStatus="status">
												<tr>
													<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
													<td>${vo.insertDate}</td>
													<td>${vo.cashCode}</td>
													<td class="align_r">${vo.cash}원</td>
													<td class="align_r">${vo.amt}원</td>
													<td>${vo.type}</td>
													<td>${vo.pStr}</td>
													<td>${vo.name}</td>
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
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#gnb ul li').eq(3).addClass('on');
</script>
<script>	
	$(function() {
		$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));
		
		$(".excel").on("click", function (){
	    	let defAction = $("form").attr("action");
	    	$("form").attr("action", "../excel/calcul_payment_excel");
	    	$("form").submit();
	    	$("form").attr("action", defAction);
	    })
	})
</script>
</body>
</html>
