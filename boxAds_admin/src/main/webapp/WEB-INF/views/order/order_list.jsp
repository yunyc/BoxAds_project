<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>

<c:choose>
	<c:when test="${param.state eq 'A'}">
		<c:set var="val" value="1" />
		<c:set var="title" value="애드 신청" />
	</c:when>
	<c:otherwise>
		<c:set var="val" value="0" />
		<c:set var="title" value="박스 판매" />
	</c:otherwise>
</c:choose>
	<div class="sub_wrap">
		<c:import url="../inc/left_order.jsp">
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
						<div class="tit02">
							<h4>${fn:substring(title, 0, 2)}</h4>
						</div>
						<form:form modelAttribute="orderVO">
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
												<option value="orderCode" <c:if test="${param.searchType eq 'orderCode'}">selected</c:if>>주문번호</option>
												<option value="bTitle" <c:if test="${param.searchType eq 'bTitle'}">selected</c:if>>박스명</option>
												<option value="aTitle" <c:if test="${param.searchType eq 'aTitle'}">selected</c:if>>애드명</option>
											</select>
											<input type="text" id="kwd02" name="keyword" value="${param.keyword}">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" name="startDate" value="${param.startDate}" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" name="endDate" value="${param.endDate}" title="행시가긴_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
											<button type="button" id="today" class="btn">오늘</button>
											<button type="button" id="week" class="btn">1주일</button>
											<button type="button" id="month" class="btn">1달</button>
										</td>
									</tr>
									<tr>
										<th scope="row">광고유형</th>
										<td>
											<div>
												<c:set var="pCIdxList" value="${fn:join(paramValues.pCIdx, ',')}"/>
												<input type="checkbox" onclick="checkAll('all01', 'pCIdx')" id="all01" name="pCIdx" value="" <c:if test="${empty pCIdxList}">checked</c:if>><label for="all01">전체</label>
												<input type="checkbox" id="bra4" name="pCIdx" value="21" <c:if test="${fn:contains(pCIdxList, '21')}">checked</c:if>><label for="bra4">전단지 - A4</label>
												<input type="checkbox" id="brb5" name="pCIdx" value="22" <c:if test="${fn:contains(pCIdxList, '22')}">checked</c:if>><label for="brb5">전단지 - B5</label>
												<input type="checkbox" id="brcup" name="pCIdx" value="23" <c:if test="${fn:contains(pCIdxList, '23')}">checked</c:if>><label for="brcup">전단지 - 쿠폰</label>
												<input type="checkbox" id="stimd" name="pCIdx" value="25" <c:if test="${fn:contains(pCIdxList, '25')}">checked</c:if>><label for="stimd">스티커 - 중</label>
												<input type="checkbox" id="stism" name="pCIdx" value="26" <c:if test="${fn:contains(pCIdxList, '26')}">checked</c:if>><label for="stism">스티커 - 소</label>
												<input type="checkbox" id="sti" name="pCIdx" value="27" <c:if test="${fn:contains(pCIdxList, '27')}">checked</c:if>><label for="stimd">샘플 - 중</label>
												<input type="checkbox" id="smpsm" name="pCIdx" value="28" <c:if test="${fn:contains(pCIdxList, '28')}">checked</c:if>><label for="smpsm">샘플 - 소</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">광고상태</th>
										<td>
											<div>
												<c:set var="oStateList" value="${fn:join(paramValues.oState, ',')}"/>
												<input type="checkbox" id="all02" onclick="checkAll('all02', 'oState')" name="oState" value="" <c:if test="${empty oStateList}">checked</c:if>><label for="all02">전체</label>
												<input type="checkbox" id="br_sel" name="oState" value="B1" <c:if test="${fn:contains(oStateList, 'B1')}">checked</c:if>><label for="br_sel">광고 구매</label>
												<input type="checkbox" id="br_conf" name="oState" value="B2" <c:if test="${fn:contains(oStateList, 'B2')}">checked</c:if>><label for="br_conf">광고 승인</label>
												<input type="checkbox" id="br_ing" name="oState" value="B3" <c:if test="${fn:contains(oStateList, 'B3')}">checked</c:if>><label for="br_ing">광고 진행</label>
												<input type="checkbox" id="frs_bnr" name="oState" value="B4" <c:if test="${fn:contains(oStateList, 'B4')}">checked</c:if>><label for="frs_bnr">1차 광고 인증</label>
												<input type="checkbox" id="sc_bnr" name="oState" value="B5" <c:if test="${fn:contains(oStateList, 'B5')}">checked</c:if>><label for="sc_bnr">2차 광고 인증</label>
												<input type="checkbox" id="cs_sel" name="oState" value="B7" <c:if test="${fn:contains(oStateList, 'B7')}">checked</c:if>><label for="cs_sel">구매 취소</label>
												<input type="checkbox" id="fsh_br" name="oState" value="B6" <c:if test="${fn:contains(oStateList, 'B6')}">checked</c:if>><label for="fsh_br">광고완료</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">인쇄상태</th>
										<td>
											<div>
												<input type="checkbox" onclick="checkAll('all03', 'rState')" id="all03" name="rState" checked><label for="all03">전체</label>
												<input type="checkbox" id="des_con" name="rState"><label for="des_con">디자인 검수</label>
												<input type="checkbox" id="des_fix" name="rState"><label for="des_fix">디자인 수정</label>
												<input type="checkbox" id="deliy" name="rState"><label for="deliy">배송처리</label>
												<input type="checkbox" id="pampl_fn" name="rState"><label for="pampl_fn">홍보물 제작완료</label>
												<input type="checkbox" id="pampl_ing" name="rState"><label for="pampl_ing">홍보물 제작 중</label>
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
									<caption>박스 판매 리스트</caption>
									<colgroup>
										<c:choose>
											<c:when test="${param.state eq 'B'}">
												<col style="width:5%">
													<col style="width:10%">
													<col style="width:8%">
													<col style="*">
													<col style="width:6%">
													<col style="*">
													<col style="width:10%">
													<col style="width:10%">
													<col style="width:8%">
													<col style="width:10%">
													<col style="width:6%">
													<col style="width:6%">
											</c:when>
											<c:when test="${param.state eq 'A'}">
												<col style="width:7%">
													<col style="width:16%">
													<col style="width:16%">
													<col style="width:35%">
													<col style="width:10%">
													<col style="width:35%">
													<col style="width:10%">
													<col style="width:10%">
													<col style="width:10%">
											</c:when>
										</c:choose>
									</colgroup>
									<thead>
										<c:choose>
											<c:when test="${param.state eq 'B'}">
												<th scope="col">번호</th>
												<th scope="col">거래일시</th>
												<th scope="col">거래번호</th>
												<th scope="col">박스(Box)</th>
												<th scope="col">판매자</th>
												<th scope="col">애드(Ads)</th>
												<th scope="col">광고주</th>
												<th scope="col">광고유형</th>
												<th scope="col">판매월</th>
												<th scope="col">총결제금액</th>
												<th scope="col">광고상태</th>
												<th scope="col">인쇄상태</th>
											</c:when>
											<c:when test="${param.state eq 'A'}">
												<th scope="col">번호</th>
												<th scope="col">신청일시</th>
												<th scope="col">신청번호</th>
												<th scope="col">애드(Ads)</th>
												<th scope="col">광고주</th>
												<th scope="col">박스(Box)</th>
												<th scope="col">판매자</th>
												<th scope="col">광고상태</th>
												<th scope="col">신청상태</th>
											</c:when>
										</c:choose>
									</thead>
									<tbody>
										
										<c:forEach items="${orderList}" var="orderList" varStatus="status">
										<tr>
											<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
											<td>${orderList.insertDate}</td>
											<td>${orderList.orderCode}</td>
											<c:choose>
											<c:when test="${param.state eq 'B'}">
												<td><a href="${path}/order/detail?idx=${orderList.idx}&state=${param.state}&aIdx=${orderList.aIdx}">${orderList.bTitle}</a></td>
												<td>${orderList.bName}</td>
												<td><a href="${path}/order/detail?idx=${orderList.idx}&state=${param.state}&aIdx=${orderList.aIdx}">${orderList.aTitle}</a></td>
												<td>${orderList.aName}</td>
												<td>${orderList.proType}</td>
												<td>${orderList.sellDate}</td>
												<td>${orderList.totalPrice}</td>
												<td>${orderList.oState}</td>												
												<td>${orderList.rState}</td>
											</c:when>
											<c:when test="${param.state eq 'A'}">
												<td><a href="${path}/order/detail?idx=${orderList.idx}&state=${param.state}&aIdx=${orderList.aIdx}">${orderList.aTitle}</a></td>
												<td>${orderList.aName}</td>
												<td><a href="${path}/order/detail?idx=${orderList.idx}&state=${param.state}&aIdx=${orderList.aIdx}">${orderList.bTitle}</a></td>
												<td>${orderList.bName}</td>
												<td>${orderList.aState}</td>
												<td>${orderList.oState}</td>
											</c:when>
										</c:choose>
											
											
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
	$('#gnb ul li').eq(2).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
	
	selectCheck("searchType", "${param.searchType}");
	
	$(function() {
		$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));

		$(".excel").on("click", function (){
	    	let defAction = $("#orderVO").attr("action");
	    	$("#orderVO").attr("action", "../excel/order_excel?state=${param.state}");
	    	
	    	$("#orderVO").submit();
	    	$("#orderVO").attr("action", defAction);
	    });

		var formatDate = today();
		
	    $("#today").click(function() {
		    $("#datepicker1").val(formatDate);
			$("#datepicker2").val(formatDate);
		});

	    $("#week").click(function() {
	    	var pastDate = lastWeek();
			$("#datepicker1").val(pastDate);
			$("#datepicker2").val(formatDate);
		});

	    $("#month").click(function() {
	    	var pastDate = lastMonth();
	    	$("#datepicker1").val(pastDate);
			$("#datepicker2").val(formatDate);

		});
	});
	/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
	function getDateStr(myDate){
		return (myDate.getFullYear() + '-' + (myDate.getMonth() + 1) + '-' + myDate.getDate())
	}

	/* 오늘 날짜를 문자열로 반환 */
	function today() {
	  var d = new Date()
	  return getDateStr(d)
	}

	/* 오늘로부터 1주일전 날짜 반환 */
	function lastWeek() {
	  var d = new Date()
	  var dayOfMonth = d.getDate()
	  d.setDate(dayOfMonth - 7)
	  return getDateStr(d)
	}

	/* 오늘로부터 1개월전 날짜 반환 */
	function lastMonth() {
	  var d = new Date()
	  var monthOfYear = d.getMonth()
	  d.setMonth(monthOfYear - 1)
	  return getDateStr(d)
	}
</script>
</body>
</html>