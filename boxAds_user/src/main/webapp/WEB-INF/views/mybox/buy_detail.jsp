<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
			<div id="container" class="sub_content">
				<div class="sub_wrap mypage_wrap order_wrap order_finish_wrap">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>박스(Box)</li>
							<li>박스 구매</li>
							<li>거래 상세</li>
						</ul>
					</div>
					<h2 class="title">박스 구매</h2>
					<div class="left_cnt">
						<div class="box_wrap pos_top ads_box">
							<div class="box_area02">
								<a href="#">
									<div class="img_box" style="background-image: url(${path}${box.fileName});">
										
									</div>
								</a>
								<div class="text_box">
									<span class="small_tit"><em>${box.boxCode}</em></span>
									<p><c:out value="${box.title}"></c:out></p>
									
									<div class="goods_info">
										<div class="data">
											<span>${box.secCtg}&gt;${box.thrCtg}</span>
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
	
									<a href="#" class="more">더보기 +</a>
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
									<a href="#" class="link">${box.url}</a>
									<a href="#" class="more">더보기 +</a>
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
											<c:when test="${order.state eq 'A1'}">
												광고신청
											</c:when>
											<c:when test="${order.state eq 'A2'}">
												신청승인
											</c:when>
											<c:when test="${order.state eq 'A3'}">
												광고집행
											</c:when>
											<c:when test="${order.state eq 'A4'}">
												신청취소
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>	
									</span>
								</p>
								
								<p class="order_txt">신청번호 : <strong>${order.orderCode}</strong></p>
								<p class="order_txt">신청일시 : <strong>${order.insertDate}</strong></p>
							</div>
							<div class="num_wrap pconly">
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
									
								</div>
								<div class="select_area">
									<select name="deposit" id="deposit">
										<option value="">쿠폰선택</option>
										<option value="">-</option>
									</select>
								</div>
							</div>
							<dl class="total_num pconly">
								<dt>총결제 금액</dt>
								<dd><em>486,000 </em>원</dd>
							</dl>
							<div class="info_result pconly">
								<div class="num_txt">
									<span>보유 캐시 : <em>2,000</em> 원</span>
									<a href="${path}/wallet/cash_charge" class="link">충전하기<i></i></a>
								</div>
								<p>박스상품 주문은 캐시만 사용 가능합니다. 상품 주문하시려면 미리 캐시를 충전하세요.</p>
								<c:if test="${order.state eq 'A2'}">
									<button type="button" class="btn btn_order">주문하기</button>								
								</c:if>
							</div>
							<div class="info_result">
								<div class="stat">도착메세지 <span><strong>0</strong> / 100</span></div>
								<div class="btn_area">
									<a href="#" class="btn btn_chat"><span>채팅문의</span></a>
									<a href="#" class="btn btn_list">목록보기</a>
								</div>
							</div>
							
						</div>
					</div>
					<div class="ing_list_wrap">
						<h3 class="title">진행사항</h2>
						<ul>
							<li class="act">
								<div class="desc_area">
									<p>업체명님의 광고 유치 신청이 마음에 들면 “좋아요” 승인해주세요.</p>
								</div>
								<div class="act_tit">
									<button class="btn" type="button">신청승인</button>
									
								</div>
							</li>
							<li class="act">
								<div class="desc_area">
									<p>광고주 OOO님, 신청 받은 박스 상품을 주문하세요. <br>전국에 있는 신규 고객을 확보 할 수 있는 새로운 광고 채널, 박스애드를 지금 이용해보세요.</p>
								</div>
								
							</li>
							<li>
								<div class="desc_area">
									<p>판매자 업체명님이  광고 유치 신청을 취소하였습니다.</p>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<li>
								<div class="desc_area">
									<p>광고주 OOO님이 신청 받은 박스 상품을 구매하였습니다..</p>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<li>
								<div class="desc_area">
									<p>광고주 OOO님이 광고 유치 신청을 "좋아요" 승인하였습니다.</p>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							
							<li>
								<div class="desc_area">
									<p>판매자 업체명님이  광고 유치를 신청하였습니다.</p>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<!-- 필요할지 몰라서 일단 주석처리해둡니다. -->
							
							<li>
								<div class="desc_area">
									<p class="tit">광고완료</p>
									<p>광고주 OOO님 홍보물의 전국 배포가 완료되었습니다. <br>박스애드에서 최종 확인 후 결제 후 에스크로되어 있던 광고비와 인쇄비를 정산합니다.  <br>정산 결과는 캐시내역 메뉴에서 확인하실 수 있습니다</p>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<li>
								<div class="desc_area">
									<p class="tit">2차 광고인증 승인결과</p>
									<p>박스애드에서 2차 인증사진을 승인하였습니다.</p>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<li>
								<div class="desc_area">
									<p>판매자 업체님이 2차 인증사진을 등록하였습니다.</p>
									<div class="img_list img_dps">
										<ul>
											<li>
												<div class="imgbox" style="background-image:url(../images/main/main_list02.jpg)"></div>	
											</li>
											<li>
												<div class="imgbox" style="background-image:url(../images/main/main_list02.jpg)"></div>	
											</li>
										</ul>
									</div>
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<li class="act">
								<form action="">
								<div class="desc_area">
									<p>판매자 업체명님이  1차로 등록한 인증사진이 반려 되었습니다 <span class="res">(사유 : 광고가 성인용품이라서요)</span></p>
									
									<div class="img_input">
										<ul class="img_list">
											<li>
												<div class="imgbox" style="background-image:url(../images/main/main_list02.jpg)">
													
													<button type="button">삭제</button>
												</div>
												<div class="img_txt">
													박스인증....jpg
												</div>
											</li>
											<li>
												<div class="imgbox">
													<label for="img_input02" class="file_img">
														이미지 업로드
													</label>
													<button type="button" style="display:none">삭제</button>
												</div>
												<div class="img_txt">
													이미지 등록
												</div>
											</li>
										</ul>
									</div>
								</div>
								<div class="act_tit">
									<button class="btn" type="button">저장</button>
								</div>
								</form>
							</li>
							<li>
								<div class="desc_area">
									<p class="tit">배송처리</p>
									<p>판매자 OOO님에게 인쇄 홍보물이 발송되었습니다. <a href="#"><span class="res">(로젠택배 : 122481227278)</span></a></p>  
								</div>
								<div class="act_tit">
									<span class="stdate">19. 10. 23  10:35:00</span>
								</div>
							</li>
							<li class="act">
								<form action="">
								<div class="desc_area">
									<p>판매자 업체명님 배송정보를 입력해주세요.</p>
									<div class="input_area rbtn">
										<input type="text" name="deliver" title="택배사" placeholder="택배사 입력 " class="d1"><input type="text" name="deliver_no"  placeholder="운송장정보 입력" title="운송장정보"  class="d2"> <button type="button" class="btn">저장</button>
									</div>	
									<div class="data_area">
										<dl>
											<dt>홍보 담당자명</dt>
											<dd>홍길동</dd>
										</dl>
										<dl>
											<dt>홍보 담당자 연락처 </dt>
											<dd>010. 5589. 9850</dd>
										</dl>
										<dl>
											<dt>홍보물 수령주소 </dt>
											<dd>서울시 송파구 송파대로 167</dd>
										</dl>
										<p class="btn_txt"><span>판매자업체명님에게 홍보정보 등록을 요청해주세요.</span> <button class="btn btn_req">홍보정보 등록요청</button></p>
									</div>
								</div>						
								</form>
							</li>
							
							<!-- //필요할지 몰라서 일단 주석처리해둡니다. -->
						</ul>
					</div>
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
										<dd><em>10</em> 개</dd>
									</dl>
									<dl>
										<dt>광고비</dt>
										<dd>
											<em>100,000</em> 원
											<p class="btm_txt">(10,000원/개당)</p>
										</dd>
									</dl>
									<dl>
										<dt>인쇄비</dt>
										<dd><em>486,000 </em>원</dd>
									</dl>
								</div>
								<div class="select_area">
									<select name="deposit" id="deposit">
										<option value="">쿠폰선택</option>
										<option value="">-</option>
									</select>
								</div>
								<div class="info_result">
									<div class="num_txt">
										<span>보유 캐시 : <em>2,000</em> 원</span>
										<a href="${path}/wallet/cash_charge" class="link">충전하기<i></i></a>
									</div>
									<p>박스상품 주문은 캐시만 사용 가능합니다. <br>상품 주문하시려면 미리 캐시를 충전하세요.</p>
									
								</div>
							</div>
							<dl class="total_num">
								<dt>총결제 금액</dt>
								<dd><em>486,000 </em>원</dd>
							</dl>
						</div>
						<div class="btn_area_fixed">
							<button type="button" class="btn">주문하기</button>
						</div>
					</div>
					<!--//모바일용 주문하기 -->
				</div>
			</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>	
	</script>
</body>