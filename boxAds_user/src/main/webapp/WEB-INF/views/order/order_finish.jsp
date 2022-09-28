<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
		<div id="container" class="sub_content">
			<div class="sub_wrap order_wrap order_finish_wrap">
				<div class="path">
					<ul>
						<li>홈</li>
						<li>박스(Box)</li>
						<li>박스주문 완료</li>
					</ul>
				</div>
				<h2 class="title m_on">박스주문 완료</h2>
				<div class="left_cnt">
					<div class="order_info_wrap">
						<div class="order_info_box">
							<p><strong>주문이 완료되었습니다.</strong></p>
							<div class="order_sum">
								<span>결제번호: ${order.orderCode}</span>
								<span>결제일시: ${order.insertDate}</span>
							</div>
						</div>
					</div>
					<div class="box_wrap pos_top">
						<div class="box_area02">
							<a href="#">
								<div class="img_box" style="background-image: url(${path}${box.fileName});">
									<div class="img_area"><img src="${path}${box.profile}" alt="박스(box) 등록 프로필"></div>
									<div class="com_name">${box.name}</div>
								</div>
							</a>
							<div class="text_box">
								<span class="small_tit"><em>${box.boxCode}</em></span>
								<p><c:out value="${box.title}"></c:out></p>
								<div class="goods_info">
									<div class="data">
										<span>${box.secCtg}&gt;${box.thrCtg}</span>
										
									</div>
								</div>
								<a href="${box.url}" class="link" target="_blank">${box.url}</a>
								<a href="../box/detail?idx=${box.idx}&writer=${box.writer}" class="more">더보기 +</a>
							</div>
						</div>
						<div class="table_wrap_dl">
							<div class="row-2">
								<dl class="m_on">
									<dt>카테고리</dt>
									<dd>
										<p><span>${box.secCtg}&gt;${box.thrCtg}</span></p>
									</dd>
								</dl>
								<dl>
									<dt>고객 연령</dt>
									<dd>
										<p>${box.ctmAge}</p>
									</dd>
								</dl>
								<dl>
									<dt>고객 성별</dt>
									<dd>
										<p>${box.ctmGender}</p>
									</dd>
								</dl>
								<dl>
									<dt>고객 유형</dt>
									<dd>
										<p>${box.ctmType}</p>
									</dd>
								</dl>
							</div>
							<div class="row-2 m_border">
								
								<dl>
									<dt>광고유형</dt>
									<dd>
										<p>${box.secPro} ${box.thrPro}</p>
									</dd>
								</dl>
								<dl>
									<dt>구매가능 수</dt>
									<dd>
										<p>${box.pdtCnt - box.sellCnt}개 (총${box.pdtCnt}개)</p>
									</dd>
								</dl>
								<dl>
									<dt>판매 월</dt>
									<dd>
										<p>${box.sellDate}</p>
									</dd>
								</dl>
								<dl class="link">
									<dt>상품 웹페이지</dt>
									<dd>
										<p><a href="${box.url}" target="_blank">${box.url}</a></p>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="box_wrap ads_box">
						<div class="box_area02">
							<div class="img_box" style="background-image: url(${path}${ad.fileName});">
								
							</div>
							<div class="text_box">
								<span class="small_tit"><em>${ad.adCode}</em><em>${ad.secPro} ${ad.thrPro}</em></span>
								<p><c:out value="${ad.title}"></c:out></p>
								
								<div class="goods_info">
									<div class="data">
									<c:forTokens items="${ad.fir}" delims="," var="item">
										<span>${item}</span>									
									</c:forTokens>										
									</div>
									<p class="term"><span>광고기간 : </span>${ad.adStartDate} ~ ${ad.adEndDate}</p>
								</div>
								<div class="good_info m_on">
									<dl>
										<dt></dt>
										<dd class="data mt15">
											<c:forTokens items="${ad.fir}" delims="," var="item">
												<span>${item} </span>									
											</c:forTokens>
										</dd>
									</dl>
								</div>

								<a href="../ad/detail?idx=${ad.idx}&writer=${ad.writer}" class="more">더보기 +</a>
							</div>
						</div>
					</div>
				</div>
				<div class="right_cnt">
					<div class="payment_wrap">
						<div class="num_wrap">
							<div class="num_list">
								<dl>
									<dt>박스 수</dt>
									<dd><em><fmt:formatNumber value="${box.boxCnt}" pattern="#,###" /></em> 개</dd>
								</dl>
								<dl>
									<dt>광고비</dt>
									<dd>
										<em><fmt:formatNumber value="${order.pdtUnit * box.boxCnt}" pattern="#,###" /></em> 원
										<p class="btm_txt">(${order.pdtUnit}원/개당)</p>
									</dd>
								</dl>
								<dl>
									<dt>인쇄비</dt>
									<dd><em><fmt:formatNumber value="${order.printPrice}" pattern="#,###" /></em>원</dd>
								</dl>
								<dl class="discount">
									<dt>쿠폰 할인</dt>
									<dd><em>- <fmt:formatNumber value="${order.cpPrice}" pattern="#,###" /> </em>원</dd>
								</dl>
							</div>
							
						</div>
						<dl class="total_num">
							<dt>총결제 금액</dt>
							<dd><em><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" /> </em>원</dd>
						</dl>
						<div class="info_result">
							<a href="../main" class="btn btn_home">메인페이지</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</html>
