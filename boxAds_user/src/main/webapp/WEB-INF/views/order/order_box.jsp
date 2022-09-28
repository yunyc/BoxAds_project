<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/js/order.js"></script>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>			
	<!-- 1217 -->
		<div id="container" class="sub_content">
			<div class="sub_wrap order_wrap">
				<div class="path">
					<ul>
						<li>홈</li>
						<li>박스(Box)</li>
						<li>박스주문</li>
					</ul>
				</div>
				<h2 class="title m_on">박스주문</h2>
				<div class="left_cnt">
					<div class="box_area02">
						<div class="img_box" style="background-image: url(${path}${box.fileName});">
							<div class="img_area"><img src="${path}${box.profile}" alt="박스(box) 등록 프로필"></div>
							<div class="com_name">${box.name}</div>
						</div>
						<div class="text_box">
							<span class="small_tit">${box.boxCode}</span>
							<p><c:out value="${box.title}"></c:out></p>
							<a href="${box.url}" class="link" target="_blank">${box.url}</a>
						</div>
					</div>
					<div class="table_wrap_dl">
						<div class="table_tit ">
							<p class="tit m_on">카테고리</p>
							<div class="right_box">
								<span>${box.secCtg}</span>
								<span class="last">${box.thrCtg}</span>
							</div>
						</div>
						<div class="row-2">
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
						</div>
					</div>
					 <div class="ads_select_box">
						<div class="tit_area">
							<span>애드(Ads) 선택</span> 
							
						</div>
						<div class="select_area02">
							<p class="align_r"><a href="javascript:modal_open('guide01');" class="btn_guide"><span>광고유형 가이드</span></a></p>
							
							<select name="deposit" id="adSelect" >
								<option value="0">선택</option>
								<c:choose>
									<c:when test="${empty myAdList}">
										<option value="" disabled="disabled">-</option>										
									</c:when>
									<c:otherwise>
										<c:forEach items="${myAdList}" var="avo">
											<option value="${avo.idx}" data-cidx="${avo.pCIdx}">${avo.title}</option>
										</c:forEach>										
									</c:otherwise>
								</c:choose>
							</select>
							
							<div class="bg_box">
								<p>박스에 동봉할 광고를 선택해주세요. 인쇄비는 박스수, 애드(Ads) 상품 유형, 등록 광고 이미지 수를 기준으로 자동 계산됩니다. </p>
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
										<em class="adPrice">0</em> 원
										<p class="btm_txt">(${box.unit}원/개당)</p>
									</dd>
								</dl>
								<dl>
									<dt>인쇄비</dt>
									<dd><em class="prPrice">0</em> 원</dd>
								</dl>
							</div>
							<div class="select_area">
								<select name="deposit" class="cpSelect" >
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
						</div>
						<dl class="total_num">
							<dt>총결제 금액</dt>
							<dd><em class="totalPrice">0</em> 원</dd>
						</dl>
						<div class="info_result">
							<div class="num_txt">
								<span>보유 캐시 : <em><fmt:formatNumber value="${myCash}" pattern="#,###" /></em> 원</span>
								<a href="${path}/wallet/cash_charge" class="link charge">충전하기<i></i></a>
							</div>
							<p>박스상품 주문은 캐시만 사용 가능합니다. 상품 주문하시려면 미리 캐시를 충전하세요.</p>
							<button type="button" class="btn orderBtn" onclick="validOrderBox()">주문하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="payment_wrap type2 m_on">
				<div class="click_on">
					<div class="btn_top">
						<button class="btn">더보기</button>
					</div>
					<div class="num_wrap">
						<div class="num_list">
							<dl>
								<dt>박스 수</dt>
								<dd><em>${box.boxCnt}</em> 개</dd>
							</dl>
							<dl>
								<dt>광고비</dt>
								<dd>
									<em class="adPrice">0</em> 원
									<p class="btm_txt">(${box.unit}원/개당)</p>
								</dd>
							</dl>
							<dl>
								<dt>인쇄비</dt>
								<dd><em class="prPrice">0</em> 원</dd>
							</dl>
						</div>
						<div class="select_area">
							<select name="deposit" class="cpSelect" >
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
								<a href="${path}/wallet/cash_charge" class="link charge">충전하기<i></i></a>
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
					<button type="button" class="btn orderBtn">주문하기</button>
				</div>
			</div>
		</div>
		<!-- //1217 -->
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<c:import url="/WEB-INF/views/inc/product_guide.jsp"/>
	<form action="" method="post"></form>
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
		if("${box.soldOutFlag}" == "Y"){
			alert("품절된 상품입니다.");
			history.back();
		}
		
		const boxUnit = "${box.unit}";		
		const boxCnt = "${box.boxCnt}";
		const boxCidx = "${box.pCIdx}";
		const boxIdx = "${box.idx}";
		const myCash = "${myCash}";
		
		var adIdx = 0;
		var total, cpIdx;
		var flag = false;
		
		// init
		setPrice(boxCnt, boxUnit, null);
		
	</script>
</body>
</html>

