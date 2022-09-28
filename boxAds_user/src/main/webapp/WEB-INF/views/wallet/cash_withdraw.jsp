<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
						<li>캐시 출금</li>
					</ul>
				</div>
				<div class="wallet_stat_box">
					<div class="stat_info_top">
						<div class="profile_img">
							<img src="../images/shop/company_profile.jpg" alt="업체명">
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
							<li class="on"><a href="cash_withdraw">캐시 출금</a></li>
							<li><a href="coupon">쿠폰 북</a></li>
						</ul>	
					</div>
					<h2 class="title">캐시 출금</h2>
					<div class="cash_area">
						<p class="ctit">출금 정보 입력</p>
						<div class="input_area_info check_box">
							<dl>
								<dt>보유 캐시</dt>
								<dd><div class="dsp"><strong><fmt:formatNumber pattern="#,###" value="${myCash.cash}"/></strong> 원</div></dd>
							</dl>
							<dl>
								<dt>출금 신청 캐시</dt>
								<dd>
									<div class="input_area">
										<input type="text" name="cashIncrease" id="cashIncrease" required placeholder="입력" title="캐시" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</div>
									<span>원</span> 
									<span class="cbox"><input type="checkbox" name="all" id="all"><label for="all">전액 신청</label></span>	
								</dd>
							</dl>
						</div>
						<div class="total_mnt">
							<span class="tit">캐시 잔액</span>
							<span class="pric"><strong id="rest">${myCash.cash}</strong> 원</span>
						</div>
					</div>
					<div class="pay_method">
						<p class="ctit">송금 계좌 정보</p>
						<div class="pay_info">
							<p class="pay"><strong>${bank.bank} ${bank.accNumber} ${bank.depositor}</strong></p>
							<p>보유 캐시는 계좌이체 방식으로 출금됩니다. 송금은 “거래내역 > 출금정보”에 등록된 계좌 정보로 처리됩니다. 단, 예금주명이 업체 정보와 다를 경우 출금이 제한될 수 있습니다.</p>
						</div>
					</div>
					<div class="check_area">
						<p class="ctit">증빙서류 발행 요청</p>
						<div class="check_box">
							<span class="cbox">
								<input type="checkbox" name="issue" id="issue" value="Y"><label for="issue">								
									<c:choose>
										<c:when test="${!empty bill && bill.type eq 'N'}">세금 계산서</c:when>
										<c:when test="${!empty bill && bill.type eq 'S'}">영수증</c:when>
										<c:when test="${!empty bill && bill.type eq 'F'}">계산서</c:when>
										<c:otherwise>세금 계산서</c:otherwise>
									</c:choose>
									 발행
								</label>
						
							</span>
							<p>
								박스애드는 업체간 거래이기에 출금 신청하시는 회원은 적격 증빙을 발행해주세요. 출금 이체 완료 후 일정 기한이 지난 후에도 증빙서류가 발행되지 않으면, 매입세금계산서를 발행하게 됩니다. 증빙서류 발행에 필요한 박스애드 사업자등록증은 “고객센터 > 공지사항” 게시판에서 다운로드 받을 수 있습니다
							</p>
						</div>
					</div>
					<div class="btn_area">
						<button type="submit" class="btn btn_finish" onclick="sendCashInfo()">출금하기</button>
					</div>
					<div class="info_box">
						<ul>
							<li>캐시 출금 신청은 언제나 가능하며, 신청 캐시의 현금 이체는 신청일로부터 최장 5 영업일 이내 처리합니다</li>
							<li>출금은 상품 판매 수입 중 가장 오래전 정산 받은 캐시, 그 다음 충전 캐시로 유효기간 만료일이 가까운 순서대로 처리됩니다.</li>
							<li>실제 이체된 금액은 회원 기업형태(일반, 간이, 면세)에 따라 부가세를 포함하며, 이체수수료를 제한 금액으로 처리됩니다.<br>  
								단, 신용카드 방식으로 캐시 충전 후 서비스내 사용 없이 바로 출금 신청할 경우 카드수수료, 이체수수료를 제한 금액이 처리됩니다. (카드사의  신용카드 결제완료 승인 확인이 지연될 경우 출금이 지연될 수 있습니다.)
							</li>
							<li>충전 캐시의 유효기간은 충전일로부터 5년입니다.</li>
							
						</ul>
					</div>					
		

				</div>
				
			</div>
			</div>
		</div>
        <c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>
	$(function() {
		$("#all").on("change", function(){
			if($(this).prop('checked')){
				setCash(cash);
			} else {
				setCash(0);				
			}			
		})

		$("#cashIncrease").on("keyup", function(){
			setCash($(this).val());
		})
	})
	
	const cash = "${myCash.cash}";

	function setCash(paramCash){
		if(Number(cash) - Number(paramCash) < 0){
			alert("출금신청 캐시는 보유캐시 금액을 초과할 수 없습니다."); 
			$(":text[name='cashIncrease']").val("");
			return false;
		}
		
		$(":text[name='cashIncrease']").val(paramCash);
		$("#rest").text(Number(cash) - Number(paramCash));		
	}

	function sendCashInfo(){
		if(confirm("출금신청 하시겠습니까?")){
			let cashIncrease = $(":text[name='cashIncrease']").val();
			let issue = $(":checkbox[name='issue']:checked").val();
			let bill = '${bill.idx}';
			let bank = '${bank.idx}';
			
			if(Number(cash) - Number(cashIncrease) < 0){
				alert("출금신청 캐시는 보유캐시 금액을 초과할 수 없습니다.");
				return false; 
			}
	
			if(cashIncrease <= 0){
				alert("출금신청 금액이 없습니다.");
				return false; 
			}
	
			if(bank <= 0){
				alert("출금정보가 없습니다.");
				return false; 
			}
	
			if(issue == 'Y' && bill <= 0){
				alert("거래정보가 없습니다.");
				return false; 
			}
			
	 		$.post("cashWithdraw", {cashIncrease:cashIncrease, issue:issue}, function(data) {
	 			if(data > 0){
	 				alert("출금 신청 되었습니다.");	 		
	 				location.reload();		
	 			} else {
	 				alert("실패했습니다.");
	 			}
			});
		}		
	}

	</script>
	
</body>
</html>


