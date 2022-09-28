<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/js/order.js"></script>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
			<div id="container" class="sub_content">
				<div class="sub_wrap mypage_wrap order_wrap order_finish_wrap">
					<div class="path">
						<c:choose>
							<c:when test="${param.type eq 'A' }">
							<c:set value="마이 애드 요청" var="title"/>
							<c:set value="신청번호" var="odCodeText"/>
							<c:set value="신청일시" var="insertDate"/>
							<c:set value="ad/ad_request" var="goList"/>
								<ul>
									<li>홈</li>
									<li>애드(Ads)</li>
									<li>마이 애드 요청</li>
									<li>진행 상세</li>
								</ul>	
							</c:when>
							<c:when test="${param.type eq 'B' }">
							<c:set value="박스 구매" var="title"/>
							<c:set value="결제번호" var="odCodeText"/>
							<c:set value="거래일시" var="insertDate"/>
							<c:set value="box/box_buy" var="goList"/>
								<ul>
									<li>홈</li>
									<li>박스(Box)</li>
									<li>박스 구매</li>
									<li>거래 상세</li>
								</ul>	
							</c:when>
						</c:choose>
						
					</div>
					<h2 class="title">${title}</h2>
					<div class="left_cnt">
						<div class="box_wrap pos_top ads_box">
							<div class="box_area02">
								<a href="#">
									<div class="img_box" style="background-image: url(${path}${ad.fileName});">
										
									</div>
								</a>
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
											<dt>카테고리</dt>
											<dd class="data">
												<c:forTokens items="${ad.fir}" delims="," var="item">
													<span>${item} </span>									
												</c:forTokens>
											</dd>
										</dl>
									</div>
	
									<a href="../ad/detail?idx=${ad.idx}" class="more">더보기 +</a>
								</div>
							</div>
						</div>
						<div class="box_wrap box_box">
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
									<a href="../box/detail?idx=${box.idx}" class="more">더보기 +</a>
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
											<p>${box.url}</p>
										</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="right_cnt">
						<div class="payment_wrap">
							<div class="order_sum_wrap">
								<p class="tit">
									<span>
										<c:choose>
											<c:when test="${order.state eq 'A1'}">광고신청</c:when>
											<c:when test="${order.state eq 'A2'}">신청승인</c:when>
											<c:when test="${order.state eq 'A3'}">광고집행</c:when>
											<c:when test="${order.state eq 'A4'}">신청취소</c:when>
											<c:when test="${order.state eq 'B1'}">광고구매</c:when>
											<c:when test="${order.state eq 'B2'}">광고승인</c:when>
											<c:when test="${order.state eq 'B3'}">광고진행</c:when>
											<c:when test="${order.state eq 'B4'}">1차광고인증</c:when>
											<c:when test="${order.state eq 'B5'}">2차광고인증</c:when>
											<c:when test="${order.state eq 'B6'}">광고완료</c:when>
											<c:when test="${order.state eq 'B7'}">구매취소</c:when>
											<c:when test="${order.state eq 'B8'}">판매종료</c:when>
										</c:choose>	
									</span>
								</p>
								
								<p class="order_txt">${odCodeText} : <strong>${order.orderCode}</strong></p>
								<p class="order_txt">${insertDate} : 
									<strong>
										<fmt:parseDate var="dateString" value="${order.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${dateString}" pattern="yy.MM.dd HH:mm:ss"/>
									</strong>
								</p>
							</div>
							<div class="num_wrap pconly">
								<div class="num_list">
									<dl>
										<dt>박스 수</dt>
										<dd><em><fmt:formatNumber value="${order.boxCnt}" pattern="#,###" /></em> 개</dd>
									</dl>
									<dl>
										<dt>광고비</dt>
										<dd>
											<em><fmt:formatNumber value="${order.pdtUnit * order.boxCnt}" pattern="#,###" /></em> 원
											<p class="btm_txt">(${order.pdtUnit}원/개당)</p>
										</dd>
									</dl>
									<dl>
										<dt>인쇄비</dt>
										<dd><em><fmt:formatNumber value="${order.printPrice}" pattern="#,###" /></em>원</dd>
									</dl>
									<dl class="discount">
										<dt>쿠폰 할인</dt>
										<dd><em id="cpPrice">- <fmt:formatNumber value="${order.cpPrice}" pattern="#,###" /></em>원</dd>
									</dl>
									
								</div>
								<c:if test="${param.type eq 'A'}">
									<div class="select_area">
										<select name="deposit" id="cpSelect" >
											<option value="0">쿠폰선택</option>
											<c:choose>
												<c:when test="${empty myCpList}">
													<option value="" disabled="disabled">-</option>										
												</c:when>
												<c:otherwise>
													<c:forEach items="${myCpList}" var="cvo">
														<option value="${cvo.price}" data-idx="${cvo.idx}">${cvo.title}</option>
													</c:forEach>										
												</c:otherwise>
											</c:choose>
										</select>
									</div>								
								</c:if>
							</div>
							<dl class="total_num pconly">
								<dt>총결제 금액</dt>
								<dd><em class="totalPrice">0</em> 원</dd>
							</dl>
							<c:choose>
								<c:when test="${param.type eq 'A'}">
									<div class="info_result pconly">
										<div class="num_txt">
											<span>보유 캐시 : <em><fmt:formatNumber value="${myCash}" pattern="#,###" /></em> 원</span>
											<a href="${path}/wallet/cash_charge" class="link off" id="charge">충전하기<i></i></a>
										</div>
										<p>박스상품 주문은 캐시만 사용 가능합니다. 상품 주문하시려면 미리 캐시를 충전하세요.</p>
										<c:choose>
											<c:when test="${order.state eq 'A2' && box.soldOutFlag eq 'Y'}">
												<button class="btn soldout">품절</button>
											</c:when>
											<c:when test="${order.state eq 'A2' && box.soldOutFlag ne 'Y'}">
												<button type="button" class="btn" value="${box.soldOutFlag}" onclick="validOrder()">주문하기</button>				
											</c:when>
										</c:choose>
									</div>
								</c:when>
								<c:when test="${param.type eq 'B'}">
									<c:if test="${order.state eq 'B1' || order.state eq 'B2' && logList[0].type eq 'B10' || order.state eq 'B2' && logList[0].type eq 'B4'}">
										<div class="action_bar">
											<span>결제를 취소하시겠습니까?</span>
											<button type="button" class="btn btn_cancel" onclick="setDataForUpdate(this, '취소')" value="B7" data-logType="B23">결제취소</button>
										</div>									
									</c:if>
								</c:when>
							</c:choose>							
							<div class="info_result">
								<div class="stat">도착메세지 <span><strong>${messageCnt.yet}</strong> / ${messageCnt.total}</span></div>
								<div class="btn_area">								
									<c:set var="receiver" value="${login.idx eq ad.writer ? box.writer : ad.writer }"/>
									<a href="../member/message_detail?writer=${login.idx}&receiver=${receiver}" class="btn btn_chat"><span>채팅문의</span></a>
									<a href="../${goList}" class="btn btn_list">목록보기</a>
								</div>
							</div>
							
						</div>
					</div>					
					<c:import url="/WEB-INF/views/boxad/process_log.jsp"/>
								
					
					<c:if test="${param.type eq 'A'}">
						<!--모바일용 주문하기 -->
						<div class="payment_wrap type2 m_on">
							<div class="click_on" >
								<div class="btn_top">
									<button class="btn">더보기</button>
								</div>
								<div class="num_wrap">
									<div class="num_list">
										<dl>
											<dt>박스 수</dt>
											<dd><em><fmt:formatNumber value="${order.boxCnt}" pattern="#,###" /></em> 개</dd>
										</dl>
										<dl>
											<dt>광고비</dt>
											<dd>
												<em class="adPrice"><fmt:formatNumber value="${order.pdtUnit * order.boxCnt}" pattern="#,###" /></em> 원
												<p class="btm_txt">(${box.unit}원/개당)</p>
											</dd>
										</dl>
										<dl>
											<dt>인쇄비</dt>
											<dd><em class="prPrice"><fmt:formatNumber value="${order.printPrice}" pattern="#,###" /></em> 원</dd>
										</dl>
									</div>
									<div class="select_area">
										<select name="deposit" class="cpSelect">
											<option value="0">쿠폰선택</option>
											<c:choose>
												<c:when test="${empty myCpList}">
													<option value="" disabled="disabled">-</option>										
												</c:when>
												<c:otherwise>
													<c:forEach items="${myCpList}" var="cvo">
														<option value="${cvo.price}" data-idx="${cvo.idx}">${cvo.title}</option>
													</c:forEach>										
												</c:otherwise>
											</c:choose>
										</select>
									</div>
									<div class="info_result">
										<div class="num_txt">
											<span>보유 캐시 : <em><fmt:formatNumber value="${myCash}" pattern="#,###" /></em> 원</span>
											<a href="${path}/wallet/cash_charge" class="link off">충전하기<i></i></a>
										</div>
										<p>박스상품 주문은 캐시만 사용 가능합니다. <br>상품 주문하시려면 미리 캐시를 충전하세요.</p>
										
									</div>
								</div>
								<dl class="total_num">
									<dt>총결제 금액</dt>
									<dd><em class="totalPrice">0</em> 원</dd>
								</dl>
							</div>
							<div class="btn_area_fixed">
								<c:choose>
									<c:when test="${order.state eq 'A2' && box.soldOutFlag eq 'Y'}">
										<button class="btn soldout">품절</button>
									</c:when>
									<c:when test="${order.state eq 'A2' && box.soldOutFlag ne 'Y'}">
										<button type="button" class="btn">주문하기</button>				
									</c:when>
								</c:choose>	
							</div>
						</div>
						<!--//모바일용 주문하기 -->
					
					</c:if>
				</div>
			</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
		<form action="" method="post"></form>
	</div>
	<script>
		$('.btn_area_fixed .btn').on('click', function () {
			$('.payment_wrap .click_on').fadeIn('fast');			
			$('.btn_area_fixed .btn').attr("onclick", "validOrderBox()");
		});
		
		$('.payment_wrap .btn_top .btn').on('click', function () {
			$('.payment_wrap .click_on').fadeOut('fast');
			$('.btn_area_fixed .btn').removeAttr("onclick");
		});
	</script>
	<script>	
	const oIdx = "${order.idx}";
	const adIdx = "${ad.idx}";		
	const boxIdx = "${box.idx}";
	const myCash = "${myCash}";
		
	var total;
	var cpIdx;
	flag = true;
	if("${param.type}" == 'A'){
		total = Number("${box.boxCnt}") * Number("${order.pdtUnit}") + Number("${order.printPrice}");		
		setTotal(total, null);
	} else {		
		setTotal("${order.totalPrice}", "${order.cpPrice}");
	}
	
		
	</script>
</body>