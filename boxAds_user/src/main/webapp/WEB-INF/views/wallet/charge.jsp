<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    							<img src="../images/shop/company_profile.jpg" alt="업체명">
    						</div>
    						<div class="title">
    							<p class="name"><strong>${login.name}</strong> 님</p>
    							<p class="money"><strong><fmt:formatNumber value="${myCash}" pattern="#,###" /></strong> 원</p>
    						</div>
    					</div>
    					<dl>
    						<dt>예상 총 캐시 </dt>
    						<dd><strong>200,000</strong> 원</dd>
    					</dl>
    					<dl>
    						<dt>수입예정 캐시 </dt>
    						<dd><strong>450,000</strong> 원</dd>
    					</dl>
    					<dl>
    						<dt>지출예정 캐시 </dt>
    						<dd><strong>450,000</strong> 원</dd>
    					</dl>
    				</div>
    				<form action="" method="post">
    					<div class="wallet_layout">
    						<div class="side_menu">
    							<ul>
    								<li><a href="#">캐시 내역</a></li>
    								<li class="on"><a href="#">캐시 충전</a></li>
    								<li><a href="#">캐시 출금</a></li>
    								<li><a href="#">쿠폰 북</a></li>
    							</ul>	
    						</div>
    						<h2 class="title">캐시 충전</h2>
    						<div class="cash_area">
    							<p class="ctit">충전 금액</p>
    							<div class="rbox_list">							
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash01" value="100000"><label for="cash01">100,000 원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash02" value="300000"><label for="cash02">300,000 원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash03" value="500000"><label for="cash03">500,000 원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash04" value="700000"><label for="cash04">700,000 원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash05" value="1000000"><label for="cash05">1,000,000원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash06" value="2000000"><label for="cash06">2,000,000원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash07" value="3000000"><label for="cash07">3,000,000원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash08" value="4000000"><label for="cash08">4,000,000원</label></span>
    								<span class="rbox"><input type="radio" name="cashIncrease" id="cash09" value="5000000"><label for="cash09">5,000,000원</label></span>
    							</div>
    							<div class="total_mnt">
    								<span class="tit">총 결제금액</span>
    								<span class="pric"><strong id="total">0</strong> 원 <em>(VAT 포함)</em></span>
    							</div>
    						</div>
    						<div class="pay_method">
    							<p class="ctit">결제방법</p>
    							<div class="rbox_list">
    								<span class="rbox"><input type="radio" name="pay" id="pay01"><label for="pay01">계좌이체</label></span>
    								<span class="rbox"><input type="radio" name="pay" id="pay02"><label for="pay02">신용카드</label></span>
    							</div>
    						</div>
    						<div class="check_area">
    							<p class="ctit">증빙서류 발행</p>
    							<div class="check_box">
    								<span class="cbox">
    									<input type="checkbox" name="check01" id="check01" ><label for="check01">세금 계산서 발행</label>
    							
    								</span>
    								<p>
    									박스애드는 업체간 거래이기에 캐시 충전 시 기본 세금계산서를 발행합니다. (단, 신용카드 결제는 카드 영수증이 적격증빙으로 인정되기에 별도 증빙서류를 발행하지 않습니다.) 결제가 완료되면 회원정보에 등록된 사업자 정보로 세금계산서가 발행(영수) 됩니다. 변경 사항이 있다면 충전 후 바로 최신 사업자정보로 변경해주세요
    								</p>
    							</div>
    						</div>
    						<div class="btn_area">
    							<!-- <button type="submit" class="btn btn_finish">충전하기</button> -->
    							<a href="charge_finish" class="btn btn_finish">충전하기</a><!-- 임시 페이지 이동 -->
    						</div>
    						<div class="info_box">
    							<ul>
    								<li>캐시는 박스애드의 서비스에서 사용할 수 상품권입니다. (1캐시 = 1원)</li>
    								<li>상품 구매 시 유효기간 만료일이 가까운 순서대로 사용됩니다.</li>
    								<li>캐시 충전은 박스애드와의 광고서비스 거래로 세금계산서 발행이 가능합니다. 개별 박스 상품 판매자와의 거래에 의한 건별 세금계산서 발행 방식이 아닙니다.</li>
    								<li>충전 캐시의 유효기간은 충전일로부터 5년입니다.</li>
    								<li>사용하고 남은 충전 캐시는 출금 신청을 통해 정산 받을 수 있습니다. 출금 신청 시 해당 금액에 대한 세금계산서가 발행됩니다.</li>
    								<li>카드 결제 후 취소는 불가하여 결제 시 주의하시기 바라며, 캐시 출금 기능을 통해 지정된 계좌로 소정의 카드/송금 수수료를 제한 전액이  환불처리 됩니다.</li>
    							</ul>
    						</div>	
    					</div>
    				</form>
    			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
<script>
$(function(){
	$(":radio[name='cashIncrease']").on("change", function(){	
		let cash = $(this).val();
		let total = Number(cash) + Number(cash) * 0.1;
		$("#total").text(addComma(total))
	})
	
})
</script>
</body>
</html>