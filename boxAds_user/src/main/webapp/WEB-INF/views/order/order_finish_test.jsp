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
								<span>결제번호: 22132123123</span>
								<span>결제일시: 2020.01.02 10:00:00</span>
							</div>
							<div class="order_sum" style="margin-top:10px">
								<span>결제내역: [신용카드]우리카드 3개월</span>
							</div>
						</div>
					</div>
					<div class="box_wrap pos_top">
						<div class="box_area02">
							<a href="#">
								<div class="img_box" style="background-image: url(../images/sub/box_img_bg01.jpg);">
									<div class="img_area"><img src="../images/main/list_profile01.png" alt="박스(box) 등록 프로필"></div>
									<div class="com_name">스튜디오엑스</div>
								</div>
							</a>
							<div class="text_box">
								<span class="small_tit"><em>BX1909-00748</em></span>
								<p>상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄...</p>
								<div class="goods_info">
									<div class="data">
										<span>스킨케어&gt;스킨</span>
										
									</div>
								</div>
								<a href="#" class="link">https://www.daum.net</a>
								<a href="#" class="more">더보기 +</a>
							</div>
						</div>
						<div class="table_wrap_dl">
							<div class="row-2">
								<dl class="m_on">
									<dt>카테고리</dt>
									<dd>
										<p><span>스킨케어&gt;스킨</span></p>
									</dd>
								</dl>
								<dl>
									<dt>고객 연령</dt>
									<dd>
										<p>25~34세, 35~44세</p>
									</dd>
								</dl>
								<dl>
									<dt>고객 성별</dt>
									<dd>
										<p>주로 여성</p>
									</dd>
								</dl>
								<dl>
									<dt>고객 유형</dt>
									<dd>
										<p>일반 고객</p>
									</dd>
								</dl>
							</div>
							<div class="row-2 m_border">
								
								<dl>
									<dt>광고유형</dt>
									<dd>
										<p>전단지 A4</p>
									</dd>
								</dl>
								<dl>
									<dt>구매가능 수</dt>
									<dd>
										<p>13개 (총14개)</p>
									</dd>
								</dl>
								<dl>
									<dt>판매 월</dt>
									<dd>
										<p>2019년 10 월</p>
									</dd>
								</dl>
								<dl class="link">
									<dt>상품 웹페이지</dt>
									<dd>
										<p>https://www.daum.net</p>
									</dd>
								</dl>
							</div>
						</div>
					</div>
					<div class="box_wrap ads_box">
						<div class="box_area02">
							<div class="img_box" style="background-image: url(../images/sub/box_img_bg01.jpg);">
								
							</div>
							<div class="text_box">
								<span class="small_tit"><em>BX1909-00748</em><em>전단지 A4</em></span>
								<p>상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄까지 상품 이름은 최대 두 줄...</p>
								
								<div class="goods_info">
									<div class="data">
										<span>스킨케어&gt;스킨</span>
										<span>패션의류&gt;출산·육아</span>
										<span>가구&gt;인테리어</span>
										<span>스포츠·취미·반려&gt;도서·문구·티켓</span>
									</div>
									<p class="term"><span>광고기간 : </span>19. 08. 09 ~20. 02. 25</p>
								</div>
								<div class="good_info m_on">
									<dl>
										<dt></dt>
										<dd class="data mt15">
											<span>스킨케어&gt;스킨</span>
											<span>패션의류&gt;출산·육아</span>
											<span>가구&gt;인테리어</span>
											<span>스포츠·취미·반려&gt;도서·문구·티켓</span>
										</dd>
									</dl>
								</div>

								<a href="#" class="more">더보기 +</a>
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
									<dd><em>10</em> 개</dd>
								</dl>
								<dl>
									<dt>발송비</dt>
									<dd>
										<em>100,000</em> 원
										<p class="btm_txt">(10,000원/개당)</p>
									</dd>
								</dl>
								<dl>
									<dt>인쇄비</dt>
									<dd><em>486,000 </em>원</dd>
								</dl>
								<dl class="discount">
									<dt>쿠폰 할인</dt>
									<dd><em>- 2,000 </em>원</dd>
								</dl>
							</div>
							
						</div>
						<dl class="total_num">
							<dt>총결제 금액</dt>
							<dd><em>486,000 </em>원</dd>
						</dl>
						<div class="info_result">
							<div class="btn btn_home">메인페이지</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</html>
