<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="guide_wrap">
		<!-- 이용안내 시작 -->
				<div class="guide_con1">
					<h3 class="tit">광고주 애드(Ads)이용법</h3>
					<div class="con1_wrap">
						<div class="img_wrap">
							<div class="img_box">
								<img src="../images/etc/boxads_moni_img.jpg" alt="박스에드 모니터 이미지">
							</div>
						</div>
						<div class="txt_area">
							<h4 class="sub_tit txt_purple">광고에 날개를 달자!</h4>
							<h5 class="sub_tit02">고객을 찾는다면 박스애드에서</h5>
							<div class="p_box">
								<span>특정 브랜드, 제품 구매 고객을 타겟으로 광고하여 신규 고객을 확보하세요.</span>
								<span>박스애드는 온라인 쇼핑몰의 다양한 제품 판매자가 보유한 구매 고객군 정보와</span>
								<span>판매 정보를 제공하며, 광고주께서는 보유 브랜드, 제품, 서비스의 홍보 대상 </span>
								<span>고객군과 일치하는 타겟을 선택하면 됩니다.</span>
								<span>광고 이미지를 등록하면 박스애드가 인쇄하고 쇼핑몰 판매자에게 전달되어,</span>
								<span>광고 구매한 월 1일부터 택배상자에 동봉하여 타겟 고객에게 전달됩니다.</span>
								<span>원하는 고객을 확보 하려면, 지금 바로 클릭 몇 번으로 손쉽게 목적을 달성하세요.</span>
							</div>
							<div class="btn_area">
								<a href="${path}/ad/write" class="btn">지금 광고 애드 (Ads) 시작하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="guide_con2">
					<div class="con2_wrap">
							<h4 class="sub_tit align_c sdd">광고 기대 효과</h4>
							<div class="effect">
								<ul>
									<li>
										<div class="effect_list list_01">
											<div class="effect_list_bg">전단지광고 타겟 아이콘</div>
											<h5 class="sub_tit02 align_c">전단지로 타겟 광고가 가능</h5>
											<div class="p_box align_c">
												<span>특정 브랜드. 제품 구매 고객을 타겟으로 광고하여 신규 고객을 확보하세요.</span>
												<span>박스애드는 온라인 쇼핑몰의 다양한 제품판매자가 보유한 구매 고객군 정보와 판매정보를 제공하며,광고주께서는 보유브랜드,제품,서비스의 홍보대상</span>
												<span>고객군과 일치하는 타겟을 선택하면 됩니다.</span>
											</div>
										</div>
									</li>
									<li>
										<div class="effect_list list_02">
											<div class="effect_list_bg">전국 소비자 대상 동시 다발적 배포 아이콘</div>
											<h5 class="sub_tit02 align_c">전국 소비자 대상 동시 다발적 배포</h5>
											<div class="p_box align_c">
												<span>특정 브랜드, 제품 구매 고객을 타겟으로 광고하여 신규 고객을 확보하세요.</span>
												<span>박스애드는 온라인 쇼핑몰의 다양한 제품 판매자가 보유한 구매 고객군 정보와 판매정보를 제공하여,광고주께서는 보유 브랜드, 제품, 서비스의 홍보 대상</span>
												<span>고객군과 일치하는 타겟을 선택하면 됩니다.</span>
											</div>
										</div>
									</li>
									<li>
										<div class="effect_list list_03">
											<div class="effect_list_bg">100% 광고 확인율 아이콘</div>
											<h5 class="sub_tit02 align_c">100% 광고 확인율</h5>
											<div class="p_box align_c">
												<span>특정 브랜드, 제품 구매 고객을 타겟으로 광고하여 신규 고객을 확보하세요.</span>
												<span>박스애드는 온라인 쇼핑몰의 다양한 제품 판매자가 보유한 고객군 정보를 제공하며, 광고주께서는 보유 브랜드,제품,서비스의 홍보 대상</span>
												<span>고객군과 일치하는 타겟을 선택하면 됩니다.</span>
											</div>
										</div>
									</li>
									<li>
										<div class="effect_list list_04">
											<div class="effect_list_bg">유명 브랜드, 제품과 파트너십 구축 아이콘</div>
											<h5 class="sub_tit02 align_c">유명 브랜드, 제품과 파트너십 구축</h5>
											<div class="p_box align_c">
												<span>특정 브랜드, 제품 구매 고객을 타겟으로 광고하여 신규 고객을 확보하세요.</span>
												<span>박스애드는 온라인 쇼핑몰의 다양한 제품 판매자가 보유한 구매 고객군 정보와 판매 정보를 제공하며, 광고주께서는 보유 브랜드, 제품, 서비스의 홍보 대상</span>
												<span>고객군과 일치하는 타겟을 선택하면 됩니다.</span>
											</div>
										</div>
									</li>
									<li>
										<div class="effect_list list_05">
											<div class="effect_list_bg">QR code 이용 고객 방문 유도 아이콘</div>
											<h5 class="sub_tit02 align_c">QR code 이용 고객 방문 유도</h5>
											<div class="p_box align_c">
												<span>특정 브랜드. 제품 구매 고객을 타겟으로 광고하여 신규 고객을 확보하세요.</span>
												<span>박스애드는 온라인 쇼핑몰의 다양한 제품판매자가 보유한 구매 고객군 정보와 판매정보를 제공하며,광고주께서는 보유브랜드,제품,서비스의 홍보대상</span>
												<span>고객군과 일치하는 타겟을 선택하면 됩니다.</span>
											</div>
										</div>
									</li>
								</ul>	
							</div>
						</div>										
					</div>
					<div class="guide_con1">
						<h4 class="sub_tit align_c">총 000,000,000개 택배 박스(Box) 제공</h4>
						<div class="p_box align_c">
							<span>많은 스타트업부터 유명 브랜드 기업의 제품을 판매하는 온라인 쇼핑몰 판매자를 찾으세요.</span>
							<span>타겟 고객군이 유사한 브랜드 제품 판매자에게 광고를 제공하여 더 많은 고객을 확보하세요.</span>
						</div>
						<div class="box_offer">
							<ul>
								<li>
									<div>
										<div class="left_con"></div>
										<div class="right_con"><span>241,000 박스</span></div>
									</div>
								</li>
								<li>
									<div>
										<div class="left_con"></div>
										<div class="right_con"><span>241,000 박스</span></div>
									</div>
								</li>
								<li>
									<div>
										<div class="left_con"></div>
										<div class="right_con"><span>241,000 박스</span></div>
									</div>
								</li>
								<li>
									<div>
										<div class="left_con"></div>
										<div class="right_con"><span>241,000 박스</span></div>
									</div>
								</li>
								<li>
									<div>
										<div class="left_con"></div>
										<div class="right_con"><span>241,000 박스</span></div>
									</div>
								</li>
								<li>
									<div>
										<div class="left_con"></div>
										<div class="right_con"><span>241,000 박스</span></div>
									</div>
								</li>
							</ul>
						</div>	
						<div class="btn_area align_c">
							<a href="${path}/main" class="btn type01">광고 가능 박스(Box) 상품 보기</a>
						</div>
					</div>
					<div class="guide_con2">
						<h4 class="sub_tit align_c">광고 진행 절차</h4>
						<div class="progress">
							<div class="progress_img_wrap ads">
								<div class="progress_img">
									등록하기(광고정보) 구매하기(박스상품 주문) 홍보물 배포(한달 간 택배 동봉/발송) 소비자 확인 (집/사무실 100% 도달)광고 효과 확인(QR code 이용)
								</div>
							</div>
							<div class="p_box">
								<p><em>1.</em> 애드(Ads) 등록 : 브랜드, 제품, 서비스의 계획하고 있는 광고 정보(이미지 포함)와 타겟 정보를 간단하게 애드(Ads) 등록</p>
								<p><em>2.</em> 박스(Box) 구매 : 온라인 쇼핑몰 판매자의 브랜드, 제품과 구매자 정보, 광고비+인쇄비 확인 후 홍보 전략과 일치하는 박스(Box) 구매</p>
								<p><em>3.</em> 홍보물 인쇄/배포 : 광고 이미지를 박스애드가 고품질로 인쇄하여 판매자에게 전달하면, 한달 동안 택배상자 포장 시 홍보물을 동봉 후 소비자에게 발송(배포)하고 완료 시 에스크로 된 광고비를 지급
								<span>샘플은 광고주가 판매자에게 직접 전달</span></p>
								<p><em>4.</em> 홍보물 소비자 확인 : 쇼핑몰 구매 제품을 설레는 마음으로 박스 개봉할 때 예비 고객이 홍보물을 보고 자세히 확인</p>
								<p><em>5.</em> 광고효과 확인 : 예비 고객은 홍보물에 인쇄된 QR code를 이용해서 광고주 웹사이트를 접속할 수 있어 광고효과 확인 가능</p>
							</div>
							<div class="p_box02">
								<p>광고 상품 중 샘플은 인쇄비가 없으며, 광고주가 판매자에게 직접 제품 샘플을 배송 합니다.</p>
								<p>인쇄 품질은 등록 광고 이미지에 따라 차이가 발생 할 수 있으며, 종이 품질은 동일한 고품질 재질을 사용 합니다.</p>
								<p>판매자에게 정산하는 광고비는 판매자의 홍보물 인증 정보 등록(월 초, 월 말 각 1회) 후 박스애드 운영진 검증을 거쳐 승인되어야만 처리됩니다.</p>
								<p>박스애드 서비스 내 상품 구매 결제는 미리 충전한 캐시가 사용됩니다.</p>
								<p>QR code는 광고주가 애드(Ads) 정보를 등록할때 입력한 인터넷주소(URL)를 기준으로 자동 생성하여 홍보물에 인쇄 됩니다.</p>
							</div>
							<div class="btn_area align_c">
								<a href="#" class="btn type02" download><span>사용자 메뉴얼 다운받기</span></a>
							</div>
						</div>
					</div>
					<div class="guide_con1">
						<h4 class="sub_tit align_c">광고가격</h4>
						<div class="p_box align_c">
							<span>회원 가입은 무료이며 다양한 브랜드 제품을 구매하는 소비자에게</span>
							<span>회사의 브랜드, 제품, 서비스를 저렴한 비용에 효과적으로 홍보하는 비용을 제시합니다.</span>
						</div>
						<div class="price">
							<ul>
								<li>
									<div class="img_box price_01">
										다양한 제품 브랜드 선택 아이콘
									</div>
									<h5 class="sub_tit02 align_c">다양한 제품 브랜드 선택</h5>
									<div class="p_box align_c">
										<span>다양한 온라인 쇼핑몰 인기 브랜드 제품에 홍보</span>
										<span>기회를 제공합니다.특정 타겟 고객의 반응을</span>
										<span>확인하고 유사한 브랜드 상품에도 광고하세요.</span>
										<span>광고비의 투명한 공개/거래로 더 많은 브랜드 </span>
										<span>제품의 매력적인 가격대 상품을 만날 수 있습니다.</span>
									</div>
								</li>
								<li>
									<div class="img_box price_02">
										필요한 만큼 광고 쇼핑아이콘
									</div>
									<h5 class="sub_tit02 align_c">필요한 만큼 광고 쇼핑</h5>
									<div class="p_box align_c">
										<span>1년 365일 필요한 만큼 광고를 집행 할 수 있습니다.</span>
										<span>예산 범위 내에서 3개월 이후 까지 광고를</span>
										<span>예약 구매하여 편하게 신규 고객을 확보할 수</span>
										<span>있습니다.스타트업이 유명 브랜드 구매 고객에게  </span>
										<span>광고할 수 있는 기회!</span>
									</div>
								</li>
								<li>
									<div class="img_box price_03">
										광고비 + 인쇄비 아이콘
									</div>
									<h5 class="sub_tit02 align_c">광고비 + 인쇄비</h5>
									<div class="p_box align_c">
										<span>광고비는 판매 제품의 브랜드 가치, 판매 수량, </span>
										<span>구매 소비자의 쇼핑몰 구매 후기 등을 </span>
										<span>종합적으로 확인하고 결정하세요. 박스애드는</span>
										<span>전문 인쇄 파트너와 제휴하여 최고 품질의</span>
										<span>홍보물을 저렴한 가격에 인쇄/배송 합니다.</span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				
		<!-- 이용안내 끝 -->
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</body>
</html>