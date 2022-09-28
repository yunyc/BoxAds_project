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
						<li>쿠폰 북</li>
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
							<li><a href="cash_charge">캐시 충전</a></li>
							<li><a href="cash_withdraw">캐시 출금</a></li>
							<li class="on"><a href="coupon">쿠폰 북</a></li>
						</ul>	
					</div>

   					<div class="item_list_wrap">
   							<h2 class="title">쿠폰 북</h2>
   							
				    <c:choose>
                        <c:when test="${empty couponList}">
                            <p class="nodata">
								쿠폰내역이 없습니다.
                            </p>
                        </c:when>
                        <c:otherwise>
        						<div class="table_wrap over_t">
        							<table>
        								<caption>결제내역</caption>
        								<colgroup>
        									<cols tyle="width:30%" >
        									<col>
        									<col style="width:18%">
        									<col style="width:200px">
        								</colgroup>
        								<thead>
        									<tr>
        										<th scope="col">쿠폰 명</th>
        										<th scope="col">쿠폰 혜택</th>
        										<th scope="col" class="align_r">쿠폰금액(원)</th>
        										<th scope="col">유효기간</th>
        									</tr>
        								</thead>
        								<tbody>
                                            <c:forEach var="coupon" items="${couponList}">
                                                <tr>
                                                    <td><p class="align_l"><strong><c:out value="${coupon.title}"/></strong></p></td>
                                                    <td><p class="align_l"><c:out value="${coupon.mesg}"/></p></td>
                                                    <td class="align_r"><strong><fmt:formatNumber pattern="#,###" value="${coupon.price}"/></strong></td>
                                                    <td> ~<c:out value="${fn:replace(coupon.endDate, '-', '.')}"/>년까지</td>
                                                </tr>
                                            </c:forEach>
        								</tbody>
        							</table>
        						</div>
        						<div class="btn_area"><button type="button" class="btn btn_more" onclick="coupon_more();">더보기 +</button></div>
                        </c:otherwise>
                    </c:choose>
     					</div>
				</div>
				
			</div>
			</div>
		</div>
        <c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
    <script>
    var page = 1;
    function coupon_more(){
        var end = <c:out value="${couponRows}"/>;
        var start = page * end;
        $.post('couponAjaxList', {
            'start':start,
            'end':end,
        }, function(data){
            page++;
            $(".item_list_wrap .table_wrap tbody").append(data);
        });
    }
    </script>
</body>
</html>
