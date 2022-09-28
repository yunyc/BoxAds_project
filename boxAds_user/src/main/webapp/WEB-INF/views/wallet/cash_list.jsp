<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

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
						<li>지갑관리</li>
						<li>캐시내역</li>
					</ul>
				</div>
				<div class="wallet_stat_box">
					<div class="stat_info_top">
						<div class="profile_img">
							<img src="${path}/images/shop/company_profile.jpg" alt="업체명">
						</div>
						<div class="title">
							<p class="name"><strong><c:out value="${login.name}"/></strong> 님</p>
							<p class="money"><strong><fmt:formatNumber pattern="#,###" value="${myCash.cash}"/></strong> 원</p>
						</div>
					</div>
					<dl>
						<dt>예상 총 캐시 </dt>
						<dd><strong><fmt:formatNumber pattern="#,###" value="${myCash.cash + myCash.income}"/></strong> 원</dd>
					</dl>
					<dl>
						<dt>수입예정 캐시 </dt>
						<dd><strong><fmt:formatNumber pattern="#,###" value="${myCash.income}"/></strong> 원</dd>
					</dl>
					<dl>
						<dt>지출예정 캐시 </dt>
						<dd><strong><fmt:formatNumber pattern="#,###" value="${myCash.outcome}"/></strong> 원</dd>
					</dl>
				</div>
				<div class="wallet_layout">
					<div class="side_menu">
						<ul>
							<li class="on"><a href="cash">캐시 내역</a></li>
							<li><a href="cash_charge">캐시 충전</a></li>
							<li><a href="cash_withdraw">캐시 출금</a></li>
							<li><a href="coupon">쿠폰 북</a></li>
						</ul>	
					</div>
					<div class="srch_wrap">
						<p class="big">캐시내역</p>
                        <form action="">
    						<fieldset>
    							<legend>목록 검색</legend>
    							<div class="srch_sub_box">
    								<label for="srch_sel" class="blind">검색조건 선택</label>
    								<select id="srch_sel" name="category" class="option_box op1">
    									<option value="">구분</option>
    									<option value="P"<c:if test="${cashVO.category eq 'P'}"> selected</c:if>>수입</option>
    									<option value="M"<c:if test="${cashVO.category eq 'M'}"> selected</c:if>>지출</option>
    								</select>
    								<select id="srch_sel2" name="type" class="option_box op2">
    									<option value="">방식</option>
    									<option value="I"<c:if test="${cashVO.type eq 'I'}"> selected</c:if>>충전</option>
    									<option value="S"<c:if test="${cashVO.type eq 'S'}"> selected</c:if>>판매</option>
    									<option value="R"<c:if test="${cashVO.type eq 'R'}"> selected</c:if>>환불</option>
                                        <option value="B"<c:if test="${cashVO.type eq 'B'}"> selected</c:if>>구매</option>
                                        <option value="O"<c:if test="${cashVO.type eq 'O'}"> selected</c:if>>출금</option>
                                        <%-- <option value="C"<c:if test="${cashVO.type eq 'C'}"> selected</c:if>>출금</option> --%>
    								</select>
    								
    								<div class="srch_date">
    									<div class="input_area input_date">
    										<input type="text" name="insertDate" title="시작일" placeholder="시작일" id="datepicker1" value="<c:out value="${cashVO.insertDate}"/>">
    									</div>
    									<span class="hypen">~</span>
    									<div class="input_area input_date">
    										<input type="text" name="endDate" title="종료일" placeholder="종료일" id="datepicker2" value="<c:out value="${cashVO.endDate}"/>">
    									</div>
    								</div>
    								<div class="srch_sub_box2">
    									<label for="srch_input" class="blind">검색어 입력</label>
    									<input type="text" id="srch_input" name="keyword" placeholder="거래내역, 거래처" value="<c:out value="${cashVO.keyword}"/>">
    									<button type="submit" class="btn">검색</button>
    								</div>
    								
    							</div>
    						</fieldset>
                        </form>
					</div>
					<c:choose>
                        <c:when test="${total < 1}">
                            <p class="nodata">
                              	캐시내역이 없습니다.
                            </p>
                        </c:when>
                        <c:otherwise>
        					<div class="item_list_wrap">
        						<div class="table_wrap over_t">
        							<table>
        								<caption>결제내역</caption>
        								<colgroup>
        									<col style="width:20%;">
        									<col style="width:70px">
        									<col style="width:18%">
        									<col>
        									<col>
        									<col>
        								</colgroup>
        								<thead>
        									<tr>
        										<th scope="col">거래일시</th>
        										<th scope="col">구분</th>
        										<th scope="col">방식</th>
        										<th scope="col">거래내역</th>
        										<th scope="col">거래처</th>
        										<th scope="col" class="align_r">금액(원)</th>
        									</tr>
        								</thead>
        								<tbody id="listBody">
                                            <%-- <c:forEach var="cashLog" items="${cashLogList}">
                                                <tr>
                                                    <td><c:out value="${cashLog.insertDate}"/></td>
                                                    <td><c:out value="${cashLog.category}"/></td>
                                                    <td><c:out value="${cashLog.type}"/></td>
                                                    <td><p class="ellipsis"><c:out value="${cashLog.content}"/></p></td>
                                                    <td><c:out value="${cashLog.name}"/></td>
                                                    <td class="align_r"><span class="${cashLog.cashIncrease ge 0 ? 'c_blue' : 'c_red'}"><c:if test="${cashLog.cashIncrease lt 0}">- </c:if><fmt:formatNumber pattern="#,###" value="${cashLog.cashIncrease ge 0 ? cashLog.cashIncrease : -cashLog.cashIncrease}"/></span></td>
                                                </tr>
                                            </c:forEach> --%>
        								</tbody>
        							</table>
        						</div>
        						<!-- <div class="btn_area"><button type="button" class="btn btn_more" onclick="cash_more();">더보기 +</button></div> -->
        						<div class="btn_area"><button type="button" class="btn btn_more" id="moreText">더보기 +</button></div>
        					</div>
                        </c:otherwise>
                    </c:choose>
				</div>
				<input type="hidden" id="start" value="0">
				<input type="hidden" id="total" value="${total}">
				<input type="hidden" id="url" value="${path}/wallet/cashAjaxList">
			</div>
			</div>
		</div>
        <c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
    <script>
    //var page = 1;
    appendTextList("listBody", 20);
    /* function cash_more(){
    	var end = <c:out value="${cashRows}"/>;
    	var start = page * end;
    	var category = '<c:out value="${cashVO.category}"/>';
    	var type = '<c:out value="${cashVO.type}"/>';
    	var insertDate = '<c:out value="${cashVO.insertDate}"/>';
        var endDate = '<c:out value="${cashVO.endDate}"/>';
        var keyword = '<c:out value="${cashVO.keyword}"/>';
    	$.post('cashAjaxList', {
    		'start':start,
    		'end':end,
    		'category':category,
    		'type':type,
    		'insertDate':insertDate,
    		'endDate':endDate,
    		'keyword':keyword,
		}, function(data){
        	page++;
            $(".item_list_wrap .table_wrap tbody").append(data);
        });
    } */
    </script>
</body>
</html>
