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
			<c:param name="menuOn" value="3" />
		</c:import>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>증빙자료 관리</h3>
				</div>
				<div class="list">
					<div class="view">
						<form:form>
							<input type="hidden" name="curPage" value="${page.curPage}">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:15%">
									<col>
									<col style="width:15%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">발행구분</th>
										<td>
											<c:set var="subjectList" value="${fn:join(paramValues.subject, ',')}"/>
											<input type="checkbox" id="all" name="subject" value="" onchange="checkAll('all', 'subject')" <c:if test="${empty subjectList}">checked</c:if>><label for="all">전체</label>
											<input type="checkbox" value="A" id="sale" name="subject" <c:if test="${fn:contains(subjectList, 'A')}">checked</c:if>><label for="sale">매출(충전)</label>
											<input type="checkbox" value="M" id="pchs" name="subject" <c:if test="${fn:contains(subjectList, 'M')}">checked</c:if>><label for="pchs">매입(출금)</label>
										</td>
										<th scope="row">증빙유형</th>
										<td>
											<c:set var="typeList" value="${fn:join(paramValues.type, ',')}"/>
											<input type="checkbox" id="all02" name="type" onchange="checkAll('all02', 'type')" value="" <c:if test="${empty typeList}">checked</c:if>><label for="all02">전체</label>
											<input type="checkbox" id="taxe" name="type" value="N" <c:if test="${fn:contains(typeList, 'N')}">checked</c:if>><label for="taxe">세금계산서</label>
											<input type="checkbox" id="cultion" name="type" value="S" <c:if test="${fn:contains(typeList, 'S')}">checked</c:if>><label for="cultion">계산서</label>
											<input type="checkbox" id="bill" name="type" value="F" <c:if test="${fn:contains(typeList, 'F')}">checked</c:if>><label for="bill">영수증</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" placeholder="YYYY-MM-DD" name="startDate" value="${param.startDate}" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행사기간_1" placeholder="YYYY-MM-DD" name="endDate" value="${param.endDate}" class="ico_date" id="datepicker2">
										</td>
										<th scope="row">상태</th>
										<td>
											<c:set var="stateList" value="${fn:join(paramValues.state, ',')}"/>
											<input type="checkbox" id="all03" name="state" onchange="checkAll('all03', 'state')" value="" <c:if test="${empty stateList}">checked</c:if>><label for="all03">전체</label>
											<input type="checkbox" id="publisher01" name="state" value="N" <c:if test="${fn:contains(stateList, 'N')}">checked</c:if>><label for="publisher01">발행요청</label>
											<input type="checkbox" id="publisher02" name="state" value="Y"<c:if test="${fn:contains(stateList, 'Y')}">checked</c:if>><label for="publisher02">발행완료</label>
											<input type="checkbox" id="fix" name="state" value="R"><label for="fix" <c:if test="${fn:contains(stateList, 'R')}">checked</c:if>>수정발행</label>
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">
						<button class="btn" type="submit">검색</button>
					</div>
					</form:form>
					<div class="btn_area excel fl_r">		
						<button type="button" class="btn">엑셀다운로드</button>
					</div>
						<div class="table_wrap">
								<div class="mt20">
									<h4>총 : <span class="txt_red">${page.totalCnt}</span>건</h4>
								</div>
								<table class="detail mt20 eree">
									<caption>증빙 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col>
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
										<th scope="col">번호</th>
										<th scope="col">요청일자</th>
										<th scope="col">업체명</th>
										<th scope="col">발행구분</th>
										<th scope="col">증빙 유형</th>
										<th scope="col">공급가액</th>
										<th scope="col">세액</th>
										<th scope="col">합계</th>
										<th scope="col">처리 일자</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty billList}">
												<tr><td colspan="10">증빙 내역이 없습니다.</td></tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${billList}" var="vo" varStatus="status">
													<tr>
														<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
														<td>${vo.insertDate}</td>
														<td>${vo.name}</td>
														<td><a href="bill_detail?idx=${vo.idx}" style="width:100%">${vo.subjectStr}</a></td>
														<td><a href="bill_detail?idx=${vo.idx}" style="width:100%">${vo.typeStr}</a></td>
														<td class="align_r"><fmt:formatNumber value="${vo.amount}" pattern="#,###" />원</td>
														<td class="align_r"><fmt:formatNumber value="${vo.fee}" pattern="#,###" />원</td>
														<td class="align_r"><fmt:formatNumber value="${vo.total}" pattern="#,###" />원</td>
														<td>${vo.updateDateStr}</td>
														<td>${vo.stateStr}</td>
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

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
</script>
<script>
	$(function() {
		$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));

		$(".excel").on("click", function (){
	    	let defAction = $("form").attr("action");
	    	$("form").attr("action", "../excel/calcul_bill_excel");
	    	$("form").submit();
	    	$("form").attr("action", defAction);
	    }) 
	})
	
</script>
</body>
</html>
