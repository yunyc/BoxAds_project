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
					<h3 class="tit">판매점 박스(Box) 이용법</h3>
					<div class="con1_wrap">
						<div class="img_wrap sale_box">
							<div class="img_box">
								<img src="../images/etc/sale_box.jpg" alt="BoxAds 사용 전 BoxAds 사용 후">
							</div>
						</div>
						<div class="txt_area">
							<h4 class="sub_tit txt_purple">돈버는 택배상자!</h4>
							<h5 class="sub_tit02">추가 수익이 필요하면 박스애드에서</h5>
							<div class="p_box">
								<span>온라인 쇼핑몰을 운영하는 판매자라면? 매일 판매 상품을 포장하여 택배로 발송하시죠.?</span>
								<span>지금 박스애드(BoxAds)를 이용하면 택배상자로 쉽게 돈을 벌 수 있습니다.</span>
								<span>클릭 몇번으로 판매정보와 택배상자수를 등록하면 광고주로부터 연락이 올 것입니다.</span>
								<span>매일 반복되던 택배 포장에 작은 수고를 더하면 기대 이상의 수익을 얻을 수 있습니다.</span>
								<span>택배 상자 하나에 최대 14개의 광고주 홍보물을 유치할 수 있습니다.</span>
							</div>
							<div class="btn_area">
								<a href="${path}/box/write" class="btn">지금 택배 박스(BOX) 판매 시작하기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="guide_con2">
					<div class="con2_wrap">
							<div class="principle_wrap">
								<div class="principle con1">
									<h4 class="sub_tit sdd">돈 버는 택배 상자 원리</h4>
									<h5 class="sub_tit02">매월 500개 이상 판매하는 제품이 있으세요?</h5>
									<div class="p_box">
										<span>택배 상자에 종이 한장 넣을 공간만 있다면 바로 광고비를 벌 수 있습니다.</span>
										<span>홍보물 인쇄는 박스애드가 직접 제작하여 판매자에게 전달합니다.</span>
										<span>광고비는 판매자가 설정한 수수료를 제외하고 광고비의 90%를 정산합니다.</span>
									</div>
									
								</div>
								<div class="principle con2">
									<div class="img_wrap">
										<div class="img_box">
											광고주 쇼핑몰 판매자 소비자 홍보물(전단지,스티커,샘플) 광고비 택배 배송 100% 배포
										</div>
									</div>
								</div>
								<div class="btn_area">
									<a href="${path}/login/join" class="btn">무료 회원가입</a>
								</div>
							</div>
						</div>										
					</div>
					<div class="guide_con1">
						<h4 class="sub_tit align_c pl40">혜택</h4>
						<div class="price type02">
							<ul>
								<li>
									<div class="img_box benefits_01">
										쇼핑몰 판매자 아이콘
									</div>
									<h5 class="sub_tit02 align_c">쇼핑몰 판매자</h5>
									<div class="p_box align_c">
										<span>누구나 택배 상자로 신규 수익 발생</span>
										<span>취급 상품 수가 많을 수록, 발송 택배 상자 </span>
										<span>수가 많을 수록, 인기있는 브랜드 제품 판매 시, </span>
										<span>택배 상자에 남는 공간이 많을 수록 수익  </span>
										<span>급증합니다.택배포장, 운송비를 상쇄하거나 </span>
										<span>그 이상의 초과 수익을 올려보세요.  </span>
									</div>
								</li>
								<li>
									<div class="img_box benefits_02">
										기업 광고주 아이콘
									</div>
									<h5 class="sub_tit02 align_c">기업 광고주</h5>
									<div class="p_box align_c">
										<span>기업 홍보물이 타겟 소비자의 집/사무실</span>
										<span>안까지 100% 도달유명 브랜드 제품을 </span>
										<span>구매한 소비자 대상으로 광고 </span>
										<span>기회를 얻을 수 있습니다.</span>
									</div>
								</li>
								<li>
									<div class="img_box benefits_03">
										쇼핑몰 구매 소비자 아이콘
									</div>
									<h5 class="sub_tit02 align_c">쇼핑몰 구매 소비자 </h5>
									<div class="p_box align_c">
										<span>쇼핑 후 기다리던 제품 택배를 개봉하는 그 순간!</span>
										<span>소비자가 관심 있어 할 제품, 서비스</span>
										<span>정보를 추가로 얻을 수 있습니다.</span>
										<span>고품질 인쇄 홍보물과 제품 샘플로 </span>
										<span>소비자의 만족도도 상승합니다.</span>
									</div>
								</li>
							</ul>
							<div class="btn_area align_c">
								<a href="${path}/main" class="btn type01">마켓 박스(Box) 바로가기</a>
							</div>
						</div>				
					</div>
					<div class="guide_con2">
						<h4 class="sub_tit align_c">택배상자 광고 진행 절차</h4>
						<div class="progress">
							<div class="progress_img_wrap">
								<div class="progress_img">
									등록하기(광고정보) 판매(광고주 결제) 택배발송하기(홍보물 동봉) 정산받기 (광고비 수익) 출금하기(현금계좌 이체)
								</div>
							</div>
							<div class="p_box">
								<p><em>1.</em>박스(Box) 등록 : 쇼핑몰 판매 제품의 제품 정보, 평균 판매 정보, 주 구매 고객군 정보, 희망 광고 유형 및 광고 단가를 설정하면 광고주에게 노출</p>
								<p><em>2.</em> 박스(Box) 판매 : 광고주가 등록 박스(Box) 상품을 구매, 결제하면 판매자가 적합한 광고인지 확인 후 승인하면 거래가 완료되고, 광고주가 결제한 광고비는 광고 집행 완료까지 안전 거래 지원을 위해 예치(에스크로) 함</span>
								</p>
								<p><em>3.</em>홍보물 택배 동봉/발송 : 해당 월 1일부터 말일까지 상품 택배 포장 시, 박스애드 또는 광고주로 부터 전달 받은 홍보물을 동봉하여 발송하며, 월 2회 홍보물 동봉 사진을 등록하면 끝 </p>
								<p><em>4.</em> 판매대금 정산받기 : 판매자가 홍보물을 동봉 발송한 사진을 2회 등록하면 운영자가 확인 후 광고비의 90% 판매자에게 지급</p>
								<p><em>5.</em>현금 출금 : 정산 받은 광고비(캐시)를 출금 신청하면 등록된 판매자 계좌로 현금 이체 송금</p>
							</div>
							<div class="p_box02">
								<p>박스애드 서비스 내 상품 판매 결제는 캐시를 사용하며, 보유 캐시를 출금 신청하면 해당 금액(1캐시=1원)의 현금으로 지급됩니다.</p>
								<p>판매정보 등록 시 해당 제품의 직전 3개월 판매 실적(제품, 수량) 증빙 사진을 첨부하여 광고주와의 거래 신뢰성을 높일 수 있습니다.</p>
								<p>광고주는 판매자가 등록하는 홍보물 동봉 인증 사진으로 광고 집행 결과를 확인 할 수 있으며, 홍보물에 같이 인쇄한 QR code 이용 소비자 접속을 통해서도 배포 및 효과를 직접 검증할 수 있습니다.</p>
								<p>광고주가 홍보물의 정상 배포를 확인하기 위해 해당 월 판매자의 제품을 직접 구매하는 경우도 있어, 판매자에게 작은 매출 기여를 하기도 합니다.</p>
							</div>
							<div class="btn_area align_c">
								<a href="#" class="btn type02" download><span>사용자 메뉴얼 다운받기</span></a>
							</div>
						</div>
					</div>
					<div class="guide_con1">
						<h4 class="sub_tit calc_con_tit">판매 박스(Box) 상품 등록 무료</h4>
						<h5 class="sub_tit02 typ02 calc_con_tit02">예상 수익 계산기</h5>
						<div class="p_box calc_con_p">
							<span>판매 회원 가입 무료, 판매 상품 등록수 무제한</span>
							<span>매월 동일한 박스(Box) 상품 재판매 가능, 남는 공간 만큼 광고주 유치 가능</span>
						</div>
						<div class="calc_con">
							<div class="calc_wrap">
								<div class="calc">
									<ul>
										<li class="multiply">
											<div class="calc_box">
												<div class="p_box">
													<span><em>① </em>1개 제품 월 평균</span>
													<span>판매 수(택배상자 수)</span>
												</div>
												<div class="input_num">
													<input type="text" id="boxCnt" name="boxCnt" placeholder="입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<label for="boxCnt" class="blind">1개 제품 월 평균 판매 수 (택배상자 수)</label>
												</div>
											</div>
										</li>
										<li class="multiply">
											<div class="calc_box">
												<div class="p_box">
													<span><em>② </em>택배 상자 1개</span>
													<span>전단지 동봉 가능 수</span>
												</div>
												<div class="input_num">
													<input type="text" id="unitCnt" name="unitCnt" placeholder="입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<label for="unitCnt" class="blind">택배 상자 1개 전단지 동봉 가능 수</label>
												</div>
											</div>
										</li>
										<li class="multiply ty02">
											<div class="calc_box">
												<div class="p_box">
													<span><em>③ </em>전단지 1장</span>
													<span>희망 광고 단가</span>
												</div>
												<div class="input_num">
													<input type="text" id="price" name="price" placeholder="입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
													<label for="price" class="blind">전단지 1장 희망 광고 단가</label>
												</div>
											</div>
										</li>
										<li class="equal_sign">
											<div class="calc_box">
												<div class="p_box">
													<span>1달 예상 수익</span>
												</div>
												<div class="input_num">
													<input type="text" id="total" name="total" readonly="readonly">
													<label for="total" class="blind">1개 제품 월 평균 판매 수 (택배상자 수)</label>
												</div>
											</div>
										</li>
									</ul>
								</div>
								<div class="potio">
									<div class="p_box align_c">
										<span class="txt_purple">수익증가</span>
										<span>Χ 상품수</span>
										<span>Χ 판매월수</span>
									</div>
								</div>							
							</div>
							<div class="btn_area align_c">
								<button type="button" class="btn" onclick="sum()">① Χ ② Χ ③ 계산하기</button>
							</div>
						</div>
						<div class="p_box02">
							<p>상자 1개 평균 전단지 동봉 수는 4장, 최대 14장까지 가능. 빈 공간이 많으면 단가 높은 샘플 광고 추천.</p>
							<p>시중 전단지 직접 배포 단가 80원, 판매 제품 브랜드와 소비자 평가에 따라 희망 광고 단가 자율 책정 가능</p>
							<p>1개월 1개 판매 제품 기준 예상 수익 계산</p>
							<p>예상 수익은 광고주 결제 광고비 중 수수료 제외한 90% 정산 지급</p>
						</div>
					</div>
				
		<!-- 이용안내 끝 -->
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>

	function sum(){
		let unit = $("#unitCnt").val()
		let boxCnt = $("#boxCnt").val()
		let price = $("#price").val()
	
		if(unit == '' || boxCnt == '' || price == ''){
			alert("입력란을 채워주세요.")
			return false;
		}
		
		$("#total").val(addComma(Number(unit) * Number(boxCnt) * Number(price)));
	}
	
	
	
	</script>
</body>
</html>