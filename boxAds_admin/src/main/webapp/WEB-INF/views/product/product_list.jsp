<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>

<c:choose>
	<c:when test="${param.type eq 'A'}">
		<c:set var="val" value="1" />
		<c:set var="title" value="애드" />
		<c:set var="pdt" value="신청수" />
		<c:set var="state1" value="광고대기" />
		<c:set var="state2" value="광고중" />
		<c:set var="state3" value="일시중지" />
		<c:set var="state4" value="광고종료" />
	</c:when>
	<c:otherwise>
		<c:set var="val" value="0" />
		<c:set var="title" value="박스" />
		<c:set var="pdt" value="판매수" />
		<c:set var="state1" value="판매대기" />
		<c:set var="state2" value="판매중" />
		<c:set var="state3" value="일시중지" />
		<c:set var="state4" value="판매종료" />
	</c:otherwise>
</c:choose>
	<div class="sub_wrap">
		<c:import url="../inc/left_product.jsp">
			<c:param name="menuOn" value="${val}" />
		</c:import>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>${title}</h3>
				</div>
				<div class="list">
					<div class="view">
					<form:form modelAttribute="pvo">
					<input type="hidden" name="curPage" value="${page.curPage}"/>
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
								
									<tr>
										<th scope="row">키워드 
											
										</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
												<select name="searchType" id="kwd01" name="kwd01">
													<option value="title" <c:if test="${param.searchType eq 'title'}">selected</c:if>>${title} 명</option>
													<option value="no" <c:if test="${param.searchType eq 'no'}">selected</c:if>>${title}번호</option>
													<c:if test="${param.type ne 'A'}">
													<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>박스 판매자</option>
													</c:if>
													
												</select>
												
											<input type="text" id="kwd02" name="keyword" value="${param.keyword}">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" name="adStartDate" value="${param.adStartDate}" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행시가긴_1" name="adEndDate" value="${param.adEndDate}" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
										</td>
									</tr>
									<tr>
										<th scope="row">상태</th>
										<td>
											<div>
											    <c:set var="stateList" value="${fn:join(paramValues.stateList, ',')}"/>
												<input type="checkbox" id="all01" name="stateList" value="" <c:if test="${empty stateList}">checked</c:if>><label for="all01">전체</label>
												<input type="checkbox" id="sele01" name="stateList" value="N" <c:if test="${fn:contains(stateList, 'N')}">checked</c:if>><label for="sele01">${state1}</label>
												<input type="checkbox" id="sele02" name="stateList" value="Y" <c:if test="${fn:contains(stateList, 'Y')}">checked</c:if>><label for="sele02">${state2}</label>
												<input type="checkbox" id="sele03" name="stateList" value="P" <c:if test="${fn:contains(stateList, 'P')}">checked</c:if>><label for="sele03">${state3}</label>
												<input type="checkbox" id="sele04" name="stateList" value="E" <c:if test="${fn:contains(stateList, 'E')}">checked</c:if>><label for="sele04">${state4}</label>
											</div>
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
						<a href="#" class="btn">엑셀다운로드</a>
					</div>
						<div class="mt20">
							<h4>총 : <span class="txt_red">${page.totalCnt}</span>건</h4>
						</div>
						<div class="table_wrap ofa">
								<table class="detail mt20 eree">
									<caption>박스 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col style="width:10%">
										<col style="width:8%">
										<col style="*">
										<col style="width:6%">
										<col style="width:10%">
										<col style="*">
										<c:if test="${param.type ne 'A'}">
										<col style="width:8%">
										</c:if>
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">등록일시</th>
										<th scope="col">${title}번호</th>
										<c:choose>
												<c:when test="${param.type ne 'A'}">
												<th scope="col">박스(Box)</th>
												<th scope="col">판매자</th>
												</c:when>
												<c:otherwise>
												<th scope="col">애드(Ads)</th>
												<th scope="col">광고주</th>
												</c:otherwise>
											</c:choose>
										<th scope="col">광고유형</th>
										<c:choose>
										<c:when test="${param.type ne 'A'}">
										<th scope="col">판매월</th>
										</c:when>
										<c:otherwise>
										<th scope="col">광고기간</th>
										</c:otherwise>
										</c:choose>
										<c:if test="${param.type ne 'A'}">
										<th scope="col">광고비</th>
										</c:if>
										<th scope="col">조회수</th>
										<th scope="col">찜수</th>
										<th scope="col">${pdt}</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<c:forEach items="${productList}" var="productList">

										<tr>
											<td>${productList.idx}</td>
											<td>${fn:substring(productList.insertDate, 0, 19)}</td>
											<td>${productList.pNo}</td>
											<c:choose>
												<c:when test="${param.type eq 'A'}">
													<td><a href="${path}/product/detail?idx=${productList.idx}&type=A">${productList.title}</a></td>
												</c:when>
												<c:otherwise>
													<td><a href="${path}/product/detail?idx=${productList.idx}">${productList.title}</a></td>
												</c:otherwise>
											</c:choose>
											<td>${productList.name}</td>
											<td>${productList.secPro} ${productList.thrPro}</td>
											
											<c:choose>
												<c:when test="${param.type ne 'A'}">
												<td>${productList.sellDate}</td>
												</c:when>
												<c:otherwise>
												<td>${productList.adStartDate}</td>
												</c:otherwise>
											</c:choose>
											<c:if test="${param.type ne 'A'}">
											<td>${productList.adPrice}</td>
											</c:if>
											<td>${productList.viewCnt}</td>
											<td>${productList.favCnt}</td>
											<td>${productList.odCnt}</td>
											<td>
											${productList.state}
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="pagination mt50">
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	$(function() {
		$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));

		$(".excel").on("click", function (){
	    	let defAction = $("#pvo").attr("action");
	    	$("#pvo").attr("action", "../excel/product_excel");

	    	if (${! empty param.type}) {
	    		$("#pvo").attr("action", "../excel/product_excel?type=${param.type}");
		    }
	    	
	    	$("#pvo").submit();
	    	$("#pvo").attr("action", defAction);
	    })
	});
	
	
	$('#gnb ul li').eq(1).addClass('on');
	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
</script>
</body>
</html>