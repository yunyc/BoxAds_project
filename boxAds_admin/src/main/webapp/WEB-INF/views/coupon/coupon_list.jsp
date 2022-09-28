<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_coupon.jsp">
			<c:param name="menuOn" value="0" />
		</c:import>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>쿠폰 관리</h3>
				</div>
				<div class="list">
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
									<form:form modelAttribute="cvo">
									<tr>
										<th scope="row">쿠폰관리</th>
										<td>
											<input type="text" id="kwd02" name="title" placeholder="쿠폰 명" value="${param.title}">
											<label for="kwd02" class="blind">쿠폰명 입력란</label>
										</td>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1" name="startDate" value="${param.startDate}">
											<span class="mlr15">~</span>
											<input type="text" title="행사기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2" name="endDate" value="${param.endDate}">
										</td>
									</tr>
									</form:form>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button type="button" class="btn search">검색</button>
					</div>
					<div class="btn_area excel fl_r">		
						<a href="${path}/coupon/write" class="btn">쿠폰등록</a>
					</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>결제(충전) 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col style="width:10%">
										<col>
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:20%">
										<col style="width:8%">
										<col style="width:6%">
									</colgroup>
									<thead>
										<th scope="col"><input type="checkbox" id="chkAll"></th>
										<th scope="col">쿠폰 명</th>
										<th scope="col">쿠폰 혜택</th>
										<th scope="col">할인</th>
										<th scope="col">시작일</th>
										<th scope="col">종료일</th>
										<th scope="col">유효기간</th>
										<th scope="col">등록일자</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
									<c:choose>
			                        	<c:when test="${empty couponList}">
			                        		<tr><td colspan="9">등록된 쿠폰이 없습니다</td></tr>
			                        	</c:when>
			                        	<c:otherwise>
											<c:forEach items="${couponList}" var="couponList">
											<tr>
												<td><input type="checkbox"></td>
												<td><a href="${path}/coupon/write?idx=${couponList.idx}" style="width:100%"><c:out value="${couponList.title}"/></a></td>
												<td><a href="${path}/coupon/write?idx=${couponList.idx}" style="width:100%"><c:out value="${couponList.mesg}"/></a></td>
												<td><c:out value="${couponList.price}"/></td>
												<td><c:out value="${couponList.startDate}"/></td>
												<td><c:out value="${couponList.endDate}"/></td>
												<td>
													<c:choose>
														<c:when test="${couponList.periodFlag eq 'Y'}">
															${couponList.ableStartDate} ~ ${couponList.ableEndDate}														
														</c:when>
														<c:otherwise>
															제한없음
														</c:otherwise>
													</c:choose>												
												</td>
												<td><c:out value="${couponList.insertDate}"/></td>
												<td>
													<c:choose>
														<c:when test="${couponList.state eq 'N'}">
															등록
														</c:when>
														<c:when test="${couponList.state eq 'Y'}">
															발행
														</c:when>
														<c:when test="${couponList.state eq 'E'}">
															종료
														</c:when>
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
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#gnb ul li').eq(4).addClass('on');
	$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));

	$(".search").on("click", function(){
		if(!checkInputName("title", "쿠폰명을")) return false;

		$("#cvo").submit();
	})
</script>
</body>
</html>

