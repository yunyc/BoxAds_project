<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
	<div id="container">
			<div class="about_wrap">
		<!-- 이용안내 시작 -->	
				<div class="path">
					<ul>
						<li>홈</li>
						<li>서비스 소개</li>
					</ul>
				 </div>
				 <div class="about_tit">
					<h3>서비스 소개</h3>
				 </div>
				 <div class="service_con1">
					<div class="service_con1_wrap">
						<ul>
							<li>
								<div class="img_wrap">
									<img src="../images/etc/service_con1_img.png" alt="서비스소개 이미지">
								</div>
							</li>
							<li>
								<div class="txt_box">
									<div class="tit">
										<h4>
											“ 매일 온라인 쇼핑에서 특정 브랜드 제품을
											구매한 <strong>고객에게 타겟 광고</strong>를 보내세요 ”
										</h4>
									</div>
									<div class="txt_wrap">
										<h5>박스(Box)</h5>
										<p>매일 고객에게 보내는 택배 포장 시 간단한 작업으로 추가 수익을 얻을 수 있습니다.</p>
										<div class="btn_area">
											<a href="${path}/etc/guide_box" class="btn">쇼핑몰 판매자 이용 안내</a>
										</div>
									</div>
									<div class="txt_wrap">
										<h5>애드(Ads)</h5>
										<p>단 몇분만 투자하면 귀사의 제품, 서비스, 브랜드를 전국에 있는 소비자에게 100&#37; 도달하는 홍보를 할 수 있습니다.</p>
										<div class="btn_area type02">
											<a href="${path}/etc/guide_ads" class="btn">광고주 이용 안내</a>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>			
				 </div>
				 <div class="service_con2">
					<div class="service_con2_wrap type_table">
							<div class="left_con">
								<div class="img_wrap">
									<div class="img_box pc">
										<img src="../images/etc/service_con2_img.png" alt="광고주 박스애드(BoxAds) 소비자 쇼핑몰 판매자">
									</div>
								</div>
							</div>
							<div class="right_con">
								<div class="txt_box">
									<div><strong>박스애드(BoxAds)</strong>는 택배상자의 남는 공간에 <strong>광고주</strong>의 <strong>홍보물을 같이 포장, 발송</strong>하여 전국 <strong>소비자</strong>에게 <strong>저렴하고 효과적으로 배포</strong>할 수 있는 신개념 <strong>광고 중개 서비스</strong>입니다.</div>
									<p class="frs">광고주는 관심 제품을 판매하는 판매자의 박스(Box) 상품을 구매하면 됩니다.</p>
									<p class="sc">박스애드가 광고주 홍보물을 제작(인쇄)하여 판매자에게 전달하면 판매자는 택배 포장 시 홍보물을 동봉하여 발송하면 광고비를 지급받습니다.</p>
									<p class="th">소비자는 기다리던 택배 상자를 설레는 마음으로 열어보다, 동봉된 홍보물을 읽어보고 QR code를 스캔하여 광고주 프로모션에 참여합니다.</p>
								</div>
							</div>
					</div>
				 </div>
				 <div class="service_con3">
				 	<div class="tit_box">
						<h4>박스애드 광고 상품 구성</h4>
						<p>택배를 보낼 때 상자(봉투) 안과 밖의 빈 공간에 광고를 동봉할 수 있는 상품기획</p>
					</div>
					<div class="service_con3_wrap">
						<ul>
							<li>
								<div class="img_wrap">
									<div class="img_box type01">
										이미지영역
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">전단지 광고</p>
									<div class="txt_wrap">
										<p>
											전단지는 소비자에게 확실히 배포되고 읽혀지면 
											다른 광고 매체보다 홍보 효과가 높고, 저렴한
											비용으로 누구나 손쉽게 할 수 있어 
											오래토록 사랑받는 홍보 수단입니다. 
										</p>
									</div>
								</div>
								<div class="btn_area align_c">
									<a href="javascript:modal_open('guide01');" class="btn">상품 자세히 보기</a>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box type02">
										이미지영역
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">스티커 광고</p>
									<div class="txt_wrap">
										<p>
											택배상자의 옆 면은 고객에게 배송되고
											재활용장으로 보내지기까지
											많은 사람들에게 노출됩니다.
											특정, 불특정 소비자 대상 홍보를 해보세요.
										</p>
									</div>
								</div>
								<div class="btn_area align_c">
									<a href="javascript:modal_open('guide02');" class="btn">상품 자세히 보기</a>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box type03">
										이미지영역
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">제품 샘플 홍보</p>
									<div class="txt_wrap">
										<p>
											소비자의 구매에 도움을 주기 위해 제품의 샘플을
											제작하여 많이 배포를 합니다. 인건비 걱정없이
											소비자를 찾아 집과 사무실 안까지
											도달하는 배포 방법을 이용해보세요.
										</p>
									</div>
								</div>
								<div class="btn_area align_c">
									<a href="javascript:modal_open('guide03');" class="btn">상품 자세히 보기</a>
								</div>
							</li>
						</ul>
					</div>
				 </div>
				 <div class="service_con4">
					<div class="txt_box">
						<p>총 누적 광고 중개 거래 금액</p>
						<p><strong>000,000,000 </strong>원 / <strong>000,000,000 </strong>건</p>
					</div>
				 </div>
				 <div class="service_con3 type02">
					<div class="tit_box">
						<h4>총 000,000,000개 택배 박스(Box) 등록</h4>
						<p>관심 있는 상품을 지금 찾아 보세요. 다양한 온라인 쇼핑 고객에게 지금 광고를 할 수 있습니다.</p>
					</div>
					<div class="box_upload">
						<ul>
							<li>
								<div class="img_wrap">
									<a href="http://xco.ddns.net:8081/main?cate=38">
										<div class="img_box type01">
											<span>패션 의류</span>
										</div>
									</a>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<a href="http://xco.ddns.net:8081/main?cate=37">
										<div class="img_box type02">
											<span>뷰티 · 잡화</span>
										</div>
									</a>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<a href="http://xco.ddns.net:8081/main?cate=1">
										<div class="img_box type03">
											<span>출산 · 육아</span>
										</div>
									</a>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<a href="http://xco.ddns.net:8081/main?cate=2">
										<div class="img_box type04">
											<span>디지털 · 가전</span>
										</div>
									</a>
								</div>
							</li>
						</ul>
					</div>
				 </div>
				 <div class="service_con3">
					<div class="tit_box">
						<h4>총 000,000개 광고 애드(Ads) 등록</h4>
						<p>중개 거래는 상호 요구가 맞아야 성사됩니다. 기다리지 말고 적극적으로 광고를 유치하세요.</p>
					</div>
					<div class="box_upload type02">
						<ul>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지1">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지2">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지3">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지4">
									</div>
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지5">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지6">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지7">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지8">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지9">
									</div>
								</div>
							</li>
							<li>
								<div class="img_wrap">
									<div class="img_box">
										<img src="../images/etc/ads_box_img0123.png" alt="이미지10">
									</div>
								</div>
							</li>
						</ul>
						<div class="btn_area align_c">
							<a href="${path}/main?ad=Y" class="btn">더 많은 애드(Ads) 보러 가기</a>
						</div>
					</div>
				 </div>
				 <div class="service_con3 type02">
				 	<div class="tit_box">
						<h4>광고주, 쇼핑몰 판매자, 소비자 모두 만족하는 광고 중개 서비스</h4>
						<p>이 보다 더 만족할 수는 없다. 이용자 모두를 위한 진정한 중개 플랫폼, 박스애드(BoxAds) 입니다!</p>
					</div>
					<!-- Swiper -->
					<div class="product">
						  <div class="swiper-container product_sli">
							<div class="swiper-wrapper">
							  <div class="swiper-slide">
								<div class="img_wrap">
									<div class="img_box type01">
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">조은정(의류쇼핑몰 대표님)</p>
									<p>번거로울 줄 알았던 일들이 부가수입이 되니 든든하네요~~^^
											매일매일 택배포장도 지겨운데, 광고물까지 넣으라니 처음엔 반신반의 했어요.
											그런데 하다보니, 어차피 하는 일에 조금만 보태면 되는 일이더라구요.
											한 달이 지나고 정산금액을 보니까 택배비용을 보태고도 남는 금액이 되니 든든하더라구요.</p>
								</div>
							  </div>
							  <div class="swiper-slide">
									<div class="img_wrap">
										<div class="img_box type02">
										</div>
									</div>
									<div class="txt_box">
										<p class="txt_purple">임수정(뷰티쇼핑몰 대표님)</p>
										<p>박스애드를 통해 고객님께 필요한 정보를 전달할 수 있어 뿌듯해요!
											네일 상품을 판매하면서 헤어제품에 대한 안내를 할 수 있으면 좋겠다고 생각하던 차에 
											박스애드를 만나 동종업계에 있는 중소기업의 광고를 전달할 수 있어 보람을 느낍니다.</p>
									</div>
							  </div>
							  <div class="swiper-slide">
								<div class="img_wrap">
									<div class="img_box type03">
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">최재운(육아쇼핑몰 대표님)</p>
									<p>인프라를 구축할 수 있고 상부상조할 수 있어 사업확장에 도움이 됩니다.
											일의 특성상 혼자서 일을 진행해야 하는 경우가 많아 막막할 때가 많은데
											박스애드를 통해 동종업계 분들을 알게 되어 서로 도움을 주고 받을 수 있어
											사업의 영역을 넓히는데 보탬이 되고 있습니다.</p>
								</div>
							  </div>
								<div class="swiper-slide">
								<div class="img_wrap">
									<div class="img_box type04">
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">손정환(가전쇼핑몰 대표님)</p>
									<p>샘플광고를 통해 고객님들께 좋은 이미지를 남길 수 있어 이득입니다!
											가전제품을 판매하면서 고객분들께 작은 선물이라고 드리고 싶은 마음이 들었어요.
											그렇게 생각하던 중에 박스애드를 통해 샘플광고를 하게 되어 광고비도 정산받고 
											고객님들께 선물도 드릴 수 있어 일석이조랍니다!</p>
								</div>
							  </div>
							  <div class="swiper-slide">
									<div class="img_wrap">
										<div class="img_box type05">
										</div>
									</div>
									<div class="txt_box">
										<p class="txt_purple">김덕진(남성의류 중소기업 대표님)</p>
										<p>홍보의 벽을 무너뜨리니 제품이 날개돋힌 듯이 팔립니다!
											제조까지 완료된 제품을 홍보할 길이 없어 막막해서 한숨을 쉬고 있던 차에,
											박스애드를 만나 전국에 제품을 알리게 되니, 매출이 하루가 다르게 올라갑니다.</p>
									</div>
							  </div>
							  <div class="swiper-slide">
								<div class="img_wrap">
									<div class="img_box type06">
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">김이진(화장품 중소기업 대표님)</p>
									<p>유망고객을 발굴하는 기회가 되었습니다!
										새로운 브랜드를 런칭할 때 마다 홍보를 어떻게 해야 하나 답답했는데,
										박스애드를 통해 각 브랜드에 해당되는 유망 고객분들을 찾아서 
										홍보할 수 있게 되었습니다.</p>
								</div>
							  </div>
							  <div class="swiper-slide">
								<div class="img_wrap">
									<div class="img_box type07">
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">박진형(육아용품 중소기업 대표님)</p>
									<p>샘플광고 덕을 톡톡히 보고 제품을 완성하게 되었습니다!
										육아용품의 특성상 제품을 써보고 사시는 고객님들이 많으셔서
										박스애드에서 진행하는 샘플광고를 통해 런칭전에 시장반응을
										살피고 제품에 완전을 기하는 기회가 되었습니다.</p>
								</div>
							  </div>
							  <div class="swiper-slide">
								<div class="img_wrap">
									<div class="img_box type08">
									</div>
								</div>
								<div class="txt_box">
									<p class="txt_purple">홍진성(가전제품 중소기업 대표님)</p>
									<p>인건비 상승에 대한 해답을 매출에서 찾았습니다!
										중소기업의 현실에서 마케팅에 대한 인재를 영입하기가 부담스러운
										부분이 있었는데, 박스애드를 통해 전국에 광고를 진행하게 되니
										자연스럽게 매출이 늘어 부담도 줄이고 회사에 자산이 쌓이게 되었습니다.</p>
								</div>
							  </div>
							</div>
							<!-- Add Arrows -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<!-- Add Pagination -->
						  </div>
					  </div>
				</div>
				<div class="service_con5">
					<div class="advice_wrap">
						<ul>
							<li class="fst">
								<div class="txt_box">
									<div class="txt_purple">소비자에게 새로운 광고를 하고 싶으세요?</div>
									<div class="txt_wrap">
										<p>포털 검색 광고, SNS 마케팅을 해보셨다면, </p>
										<p>이젠 박스애드(BoxAds) 광고를 시작하세요. </p>
										<p>비용대비 높은 광고 효과를 경험하실 수 있습니다.</p>
										<div class="txt_p">
											<span>도달률 <strong>95</strong>&#37;</span>
											<i class="arrow"></i>
											<span>확인률 <strong>100</strong>&#37;</span>
										</div>
									</div>
									<div class="btn_area">
										<a href="${path}/ad/write" class="btn">신규 광고 애드(Ads) 등록 하기</a>
									</div>
								</div>
							</li>
							<li class="sc">
								<div class="txt_box">
									<div class="txt_purple">쇼핑몰 운영하며 신규 수익이 필요하세요?</div>
									<div class="txt_wrap">
										<p>온라인 쇼핑몰 매출이 늘어도 고정비용이 같이 늘어나면, </p>
										<p>수익률 제자리로 고민이셨다면 박스애드를 시작하세요. </p>
										<p>택배 포장 시 간단한 작업으로 기대 이상의 추가 수익을 얻을 수 있습니다.</p>
										<div class="txt_p">
											<span>기존 <strong>0</strong>원</span>
											<i class="vs"></i>
											<span>박스애드<strong>전액</strong>신규</span>
										</div>
									</div>
									<div class="btn_area">
										<a href="${path}/box/write" class="btn">신규 택배 박스(Box) 등록 하기</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
														
		<!-- 이용안내 끝 -->
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	<!-- 광고유형 가이드 -->
	<div id="guide01" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title">광고유형 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="conts scroll">
							<div class="guide_tab tab">
								<ul>
									<li class="active"><a href="javasscript:;">전단지</a></li>
									<li><a href="javasscript:;">스티커</a></li>
									<li><a href="javasscript:;">샘플</a></li>
								</ul>
							</div>
							<div class="tab-content_wrap">
								<div class="tab-content" style="display:block">
									<p class="tab_title">전단지 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 전단지 광고는 택배 상자(봉투) 안, 빈공간에 넣어 제품과 같이 포장된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하여 소비자에게 배포되는 새로운 전단지 광고 기법입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">고급지</p>
												<p class="txt">전단지 재질은 고급지를 사용하여 보내는 광고주의 브랜드, 제품, 서비스 가치를 높이고, 받는 소비자의 품격을 만족시켜줍니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 전단지 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">단면/양면</p>
												<p class="txt">전단지 이미지를 1장 등록하면 단면인쇄, 2장 등록하면 양면인쇄가 자동 됩니다.</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 14장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;20원~150원</p>
											</div>
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>전단지 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>A4</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>B5</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>쿠폰</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content">
									<p class="tab_title">스티커 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 스티커 광고는 택배 상자(봉투) 밖, 옆 면에 부착된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하며, 배송 중 불특정 다수에게도 노출되는 효과도 있는 상품입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">내구성</p>
												<p class="txt">스티커는 물로 인한 번짐과 외부 긁힘에 내구성이 강한 재질의 전문 종이를 사용하여 배송중, 고객 도착, 재활용 처리되는 동안 광고 내용이 유지될 수 있도록 제작합니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 스티커 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">봉투형</p>
												<p class="txt">스티커형 전단지는 최근 많이 사용되는 봉투형 포장재에도 부착이 용이하여 더 다양한 쇼핑몰 상품에도 광고를 할 수 있습니다</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 4장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;40원~200원</p>
											</div>
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>스티커 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
											
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content">
									<p class="tab_title">제품 샘플 홍보 상품 소개</p>
									<p>박스애드(BoxAds)의 제품 샘플 홍보는 기업 마케팅에 특화된 상품으로 소비자에게 신제품 홍보와 구매를 유도하여 매출을 증대시키고, 전단지/스티커 광고를 병행하면 소비자의 반응도 확인할 수 있습니다</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">전국</p>
												<p class="txt">제품의 샘플을 전국 소비자에게 직접 전달하여 제품 홍보 및 신규 구매를 유도하여 마케팅과 고객 확보까지 한번에 해결할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 샘플 종류를 선택하여 홍보 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">전단지</p>
												<p class="txt">전단지/스티커 광고 상품 병행 시 QR code를 통해 소비자의 반응도 확인 할 수 있습니다.</p>
											</li>
											
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 5개</p>
												<p><strong>개당 광고 단가 </strong>&nbsp; I &nbsp;70원~500원</p>
											</div>
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>샘플 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
							</div>
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- <script type="text/javascript">UI.GuideTab();</script> -->
	<script type="text/javascript" src="/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/js/util.js"></script>
		<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="/js/editorSetting.js"></script>
	
	</div>

	<div id="guide01" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title">광고유형 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="conts scroll">
							<div class="guide_tab tab">
								<ul>
									<li class="active"><a href="javasscript:;">전단지</a></li>
									<li><a href="javasscript:;">스티커</a></li>
									<li><a href="javasscript:;">샘플</a></li>
								</ul>
							</div>
							<div class="tab-content_wrap">
								<div class="tab-content" style="display:block">
									<p class="tab_title">전단지 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 전단지 광고는 택배 상자(봉투) 안, 빈공간에 넣어 제품과 같이 포장된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하여 소비자에게 배포되는 새로운 전단지 광고 기법입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">고급지</p>
												<p class="txt">전단지 재질은 고급지를 사용하여 보내는 광고주의 브랜드, 제품, 서비스 가치를 높이고, 받는 소비자의 품격을 만족시켜줍니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 전단지 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">단면/양면</p>
												<p class="txt">전단지 이미지를 1장 등록하면 단면인쇄, 2장 등록하면 양면인쇄가 자동 됩니다.</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_paperNcoupon.jpg" alt="전단지 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 14장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;20원~150원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>전단지 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>A4</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>B5</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>쿠폰</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content">
									<p class="tab_title">스티커 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 스티커 광고는 택배 상자(봉투) 밖, 옆 면에 부착된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하며, 배송 중 불특정 다수에게도 노출되는 효과도 있는 상품입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">내구성</p>
												<p class="txt">스티커는 물로 인한 번짐과 외부 긁힘에 내구성이 강한 재질의 전문 종이를 사용하여 배송중, 고객 도착, 재활용 처리되는 동안 광고 내용이 유지될 수 있도록 제작합니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 스티커 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">봉투형</p>
												<p class="txt">스티커형 전단지는 최근 많이 사용되는 봉투형 포장재에도 부착이 용이하여 더 다양한 쇼핑몰 상품에도 광고를 할 수 있습니다</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_sticker_1.jpg.jpg" alt="스티커 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 4장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;40원~200원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>스티커 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
											
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content">
									<p class="tab_title">제품 샘플 홍보 상품 소개</p>
									<p>박스애드(BoxAds)의 제품 샘플 홍보는 기업 마케팅에 특화된 상품으로 소비자에게 신제품 홍보와 구매를 유도하여 매출을 증대시키고, 전단지/스티커 광고를 병행하면 소비자의 반응도 확인할 수 있습니다</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">전국</p>
												<p class="txt">제품의 샘플을 전국 소비자에게 직접 전달하여 제품 홍보 및 신규 구매를 유도하여 마케팅과 고객 확보까지 한번에 해결할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 샘플 종류를 선택하여 홍보 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">전단지</p>
												<p class="txt">전단지/스티커 광고 상품 병행 시 QR code를 통해 소비자의 반응도 확인 할 수 있습니다.</p>
											</li>
											
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_sample_1.JPG" alt="샘플 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 5개</p>
												<p><strong>개당 광고 단가 </strong>&nbsp; I &nbsp;70원~500원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>샘플 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
							</div>
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- <script type="text/javascript">UI.GuideTab();</script> -->
	<script type="text/javascript" src="/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/js/util.js"></script>
		<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="/js/editorSetting.js"></script>
	
	</div>
	<div id="guide02" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title">광고유형 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="conts scroll">
							<div class="guide_tab tab">
								<ul>
									<li><a href="javasscript:;">전단지</a></li>
									<li class="active"><a href="javasscript:;">스티커</a></li>
									<li><a href="javasscript:;">샘플</a></li>
								</ul>
							</div>
							<div class="tab-content_wrap">
								<div class="tab-content">
									<p class="tab_title">전단지 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 전단지 광고는 택배 상자(봉투) 안, 빈공간에 넣어 제품과 같이 포장된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하여 소비자에게 배포되는 새로운 전단지 광고 기법입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">고급지</p>
												<p class="txt">전단지 재질은 고급지를 사용하여 보내는 광고주의 브랜드, 제품, 서비스 가치를 높이고, 받는 소비자의 품격을 만족시켜줍니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 전단지 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">단면/양면</p>
												<p class="txt">전단지 이미지를 1장 등록하면 단면인쇄, 2장 등록하면 양면인쇄가 자동 됩니다.</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_paperNcoupon.jpg" alt="전단지 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 14장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;20원~150원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>전단지 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>A4</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>B5</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>쿠폰</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content"  style="display:block">
									<p class="tab_title">스티커 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 스티커 광고는 택배 상자(봉투) 밖, 옆 면에 부착된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하며, 배송 중 불특정 다수에게도 노출되는 효과도 있는 상품입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">내구성</p>
												<p class="txt">스티커는 물로 인한 번짐과 외부 긁힘에 내구성이 강한 재질의 전문 종이를 사용하여 배송중, 고객 도착, 재활용 처리되는 동안 광고 내용이 유지될 수 있도록 제작합니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 스티커 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">봉투형</p>
												<p class="txt">스티커형 전단지는 최근 많이 사용되는 봉투형 포장재에도 부착이 용이하여 더 다양한 쇼핑몰 상품에도 광고를 할 수 있습니다</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_sticker_1.jpg.jpg" alt="스티커 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 4장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;40원~200원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>스티커 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
											
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content">
									<p class="tab_title">제품 샘플 홍보 상품 소개</p>
									<p>박스애드(BoxAds)의 제품 샘플 홍보는 기업 마케팅에 특화된 상품으로 소비자에게 신제품 홍보와 구매를 유도하여 매출을 증대시키고, 전단지/스티커 광고를 병행하면 소비자의 반응도 확인할 수 있습니다</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">전국</p>
												<p class="txt">제품의 샘플을 전국 소비자에게 직접 전달하여 제품 홍보 및 신규 구매를 유도하여 마케팅과 고객 확보까지 한번에 해결할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 샘플 종류를 선택하여 홍보 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">전단지</p>
												<p class="txt">전단지/스티커 광고 상품 병행 시 QR code를 통해 소비자의 반응도 확인 할 수 있습니다.</p>
											</li>
											
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_sample_1.JPG" alt="샘플 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 5개</p>
												<p><strong>개당 광고 단가 </strong>&nbsp; I &nbsp;70원~500원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>샘플 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
							</div>
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- <script type="text/javascript">UI.GuideTab();</script> -->
	<script type="text/javascript" src="/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/js/util.js"></script>
		<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="/js/editorSetting.js"></script>
	
	</div>
	<div id="guide03" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title">광고유형 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="conts scroll">
							<div class="guide_tab tab">
								<ul>
									<li><a href="javasscript:;">전단지</a></li>
									<li><a href="javasscript:;">스티커</a></li>
									<li class="active"><a href="javasscript:;">샘플</a></li>
								</ul>
							</div>
							<div class="tab-content_wrap">
								<div class="tab-content">
									<p class="tab_title">전단지 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 전단지 광고는 택배 상자(봉투) 안, 빈공간에 넣어 제품과 같이 포장된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하여 소비자에게 배포되는 새로운 전단지 광고 기법입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">고급지</p>
												<p class="txt">전단지 재질은 고급지를 사용하여 보내는 광고주의 브랜드, 제품, 서비스 가치를 높이고, 받는 소비자의 품격을 만족시켜줍니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 전단지 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">단면/양면</p>
												<p class="txt">전단지 이미지를 1장 등록하면 단면인쇄, 2장 등록하면 양면인쇄가 자동 됩니다.</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_paperNcoupon.jpg" alt="전단지 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 14장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;20원~150원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>전단지 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>A4</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>B5</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>쿠폰</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content">
									<p class="tab_title">스티커 광고 상품 소개</p>
									<p>박스애드(BoxAds)의 스티커 광고는 택배 상자(봉투) 밖, 옆 면에 부착된 후 택배 기사가 고객의 집과 사무실 안 까지 안전하게 배송하며, 배송 중 불특정 다수에게도 노출되는 효과도 있는 상품입니다.</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">내구성</p>
												<p class="txt">스티커는 물로 인한 번짐과 외부 긁힘에 내구성이 강한 재질의 전문 종이를 사용하여 배송중, 고객 도착, 재활용 처리되는 동안 광고 내용이 유지될 수 있도록 제작합니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 스티커 종류를 선택하여 광고 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">봉투형</p>
												<p class="txt">스티커형 전단지는 최근 많이 사용되는 봉투형 포장재에도 부착이 용이하여 더 다양한 쇼핑몰 상품에도 광고를 할 수 있습니다</p>
											</li>
											<li>
												<p class="tit">QR 코드</p>
												<p class="txt">전단지에는 광고주가 등록한 인터넷주소(URL)로 만든 QR code가 같이 인쇄되어, 광고 효과를 직접 확인할 수 있습니다.</p>
											</li>
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_sticker_1.jpg.jpg" alt="스티커 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 4장</p>
												<p><strong>장당 광고 단가 </strong>&nbsp; I &nbsp;40원~200원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>스티커 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
											
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
								<div class="tab-content"  style="display:block">
									<p class="tab_title">제품 샘플 홍보 상품 소개</p>
									<p>박스애드(BoxAds)의 제품 샘플 홍보는 기업 마케팅에 특화된 상품으로 소비자에게 신제품 홍보와 구매를 유도하여 매출을 증대시키고, 전단지/스티커 광고를 병행하면 소비자의 반응도 확인할 수 있습니다</p>
									<div class="img_area">
										<img src="#" alt="">
									</div>
									<div class="desc_list">
										<ul>
											<li>
												<p class="tit">전국</p>
												<p class="txt">제품의 샘플을 전국 소비자에게 직접 전달하여 제품 홍보 및 신규 구매를 유도하여 마케팅과 고객 확보까지 한번에 해결할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">상자사이즈</p>
												<p class="txt">택배상자(봉투) 크기에 맞는 샘플 종류를 선택하여 홍보 할 수 있습니다.</p>
											</li>
											<li>
												<p class="tit">전단지</p>
												<p class="txt">전단지/스티커 광고 상품 병행 시 QR code를 통해 소비자의 반응도 확인 할 수 있습니다.</p>
											</li>
											
										</ul>
									</div>
									<div class="table_desc">
										<div class="left_desc">
											<div class="img_box">
												<img src="../../../resources/images/order/ads_sample_1.JPG" alt="샘플 예시">
											</div>
											<!-- <div class="inner_box">
												<p><strong>1 BOX</strong>&nbsp; I &nbsp;최대 5개</p>
												<p><strong>개당 광고 단가 </strong>&nbsp; I &nbsp;70원~500원</p>
											</div> -->
										</div>
										<div class="table_wrap">
											<table>
												<caption>사이즈 테이블</caption>
												<colgroup>
													<col>
													<col>
													<col>
													<col>
												</colgroup>
												<thead>
													<tr>
														<th>샘플 종류</th>
														<th>택배상자 크기</th>
														<th>광고이미지<br>(사이즈)</th>
														<th>광고이미지<br>(해상도)</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th>중형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													<tr>
														<th>소형</th>
														<td>X</td>
														<td>X</td>
														<td></td>
													</tr>
													
												</tbody>
											</table>
										</div>
										<p>(주의) 광고 이미지 등록 시 위 기준 이상의 파일을 제공해야 고품질 인쇄 제작이 가능합니다.</p>
									</div>
								</div>
							</div>
						
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- <script type="text/javascript">UI.GuideTab();</script> -->
	<script type="text/javascript" src="/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/js/util.js"></script>
		<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="/js/editorSetting.js"></script>
	
	</div>
	</div>
	<script>
	/*스와이프*/
	 var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 30,
      slidesPerGroup: 1,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });

	/*레이어팝업*/
		$(' .tab li a').bind('touchend, click', function () {
			$li=$(this).closest("li");
			$ul = $(this).closest("ul");
			$tab = $(this).closest(".tab");
			$tabconts = $tab.next(".tab-content_wrap")

			var length = $ul .children().length+1 ;
			var idx = $li.index();
				$li.addClass('active').siblings().removeClass('active');
				$tabconts.find('.tab-content').eq(idx).show().siblings().hide();
				
	});
	</script>
</body>
</html>