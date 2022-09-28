<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						<li>캐시 충전</li>
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
							<li><a href="cash">캐시 내역</a></li>
							<li class="on"><a href="cash_charge">캐시 충전</a></li>
							<li><a href="cash_withdraw">캐시 출금</a></li>
							<li><a href="coupon">쿠폰 북</a></li>
						</ul>	
					</div>
					<h2 class="title">캐시 충전</h2>
					<p class="confirm_top"><i class="ico mem_logo">boxads</i></p>
					<p class="confirm_tit">
						<strong>캐시 충전이 완료되었습니다.</strong>
					</p>
					<p class="confirm_caption">
						결제내역은 거래내역에서 확인하실 수 있습니다.
					</p>
					<div class="table_wrap confirm">
						<table>
							<caption>캐시 충전 완료 정보</caption>
							<colgroup>
								<col>
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">결제 상품</th>
									<td><c:out value="${cash.pGoods}"/></td>
								</tr>
								<tr>
									<th scope="row">결제 번호</th>
									<td><c:out value="${cash.cashCode}"/></td>
								</tr>
								<tr>
									<th scope="row">결제 일시</th>
									<td>${fn:substring(cash.pAuthDt, 0, 4)}.${fn:substring(cash.pAuthDt, 4, 6)}.${fn:substring(cash.pAuthDt, 6, 8)} ${fn:substring(cash.pAuthDt, 8, 10)}:${fn:substring(cash.pAuthDt, 10, 12)}</td>
								</tr>
								<tr>
									<th scope="row">결제 총액</th>
									<td><strong><fmt:formatNumber pattern="#,###" value="${cash.pAmt}"/></strong> 원 (VAT 포함)</td>
								</tr>
								<tr>
									<th scope="row">결제 내역</th>
									<td>[${cash.type eq 'CARD' ? '신용카드':(cash.type eq 'BANK' ? '계좌이체':'')}] <c:out value="${cash.pFnNm}"/> ${cash.pIntMon eq '00' ? '일시불' : (cash.pIntMon+0)}<c:if test="${cash.pIntMon ne '00'}">개월</c:if></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_area">
						<button type="button" class="btn btn_finish" onclick="location.href='${path}/main';">확인</button>
					</div>
				</div>
				
			</div>
			</div>
		</div>
        <c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</html>
