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
						<li>캐시 충전</li>
					</ul>
				</div>
				<div class="wallet_stat_box">
					<div class="stat_info_top">
						<div class="profile_img">
							<img src="${path}/images/shop/company_profile.jpg" alt="업체명">
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
							<li class="on"><a href="cash_charge">캐시 충전</a></li>
							<li><a href="cash_withdraw">캐시 출금</a></li>
							<li><a href="coupon">쿠폰 북</a></li>
						</ul>	
					</div>
					<h2 class="title">캐시 충전</h2>
					<div class="cash_area">
						<p class="ctit">충전 금액</p>
						<div class="rbox_list">
                            <c:forEach var="chargePrice" items="${chargePriceList}">
                                <span class="rbox"><input type="radio" name="cash" id="cash0<c:out value="${chargePrice.idx}"/>" value="<c:out value="${chargePrice.idx}"/>" data-cash="<c:out value="${chargePrice.price}"/>"<c:if test="${chargePrice.idx eq 1}"> checked</c:if>><label for="cash0<c:out value="${chargePrice.idx}"/>"><fmt:formatNumber pattern="#,###" value="${chargePrice.price}"/> 원</label></span>
                            </c:forEach>
						</div>
						<div class="total_mnt">
							<span class="tit">총결제금액</span>
							<span class="pric"><strong><fmt:formatNumber pattern="#,###" value="${chargePriceList[0].price * 1.1}"/></strong> 원 <em>(VAT 포함)</em></span>
						</div>
					</div>
					<div class="pay_method">
						<p class="ctit">결제방법</p>
						<div class="rbox_list">
							<span class="rbox"><input type="radio" name="paymethod" id="pay01" value="BANK"><label for="pay01">계좌이체</label></span>
							<span class="rbox"><input type="radio" name="paymethod" id="pay02" value="CARD"><label for="pay02">신용카드</label></span>
						</div>
					</div>
					<div class="check_area">
						<p class="ctit">증빙서류 발행</p>
						<div class="check_box">
							<span class="cbox">
								<input type="checkbox" name="taxBill" id="check01" value="Y" onclick="return false;">
								<label for="check01">		
									<c:choose>
										<c:when test="${!empty bill && bill.type eq 'N'}">세금 계산서</c:when>
										<c:when test="${!empty bill && bill.type eq 'S'}">영수증</c:when>
										<c:when test="${!empty bill && bill.type eq 'F'}">계산서</c:when>
										<c:otherwise>세금 계산서</c:otherwise>
									</c:choose>
								발행</label>
						
							</span>
							<p>
								박스애드는 업체간 거래이기에 캐시 충전 시 기본 세금계산서를 발행합니다. (단, 신용카드 결제는 카드 영수증이 적격증빙으로 인정되기에 별도 증빙서류를 발행하지 않습니다.) 결제가 완료되면 회원정보에 등록된 사업자 정보로 세금계산서가 발행(영수) 됩니다. 변경 사항이 있다면 충전 후 바로 최신 사업자정보로 변경해주세요
							</p>
						</div>
					</div>
					<div class="btn_area">
						<button type="button" class="btn btn_finish" onclick="charge();">충전하기</button>
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
				<form name="order_form" method="post" style="display:none;">
                    <!-- 결과처리를 위한 파라미터 -->
                    <input type="hidden" name="PHash" value="">
                    <input type="hidden" name="PData" value="">
                    <input type="hidden" name="PStateCd" value="">
                    <input type="hidden" name="POrderId" value="">
                    <!-- 결과처리를 위한 파라미터 -->
                
                    <input type="hidden" name="PNoteUrl" value="<%=request.getRequestURL().toString().replace(request.getRequestURI(), "")%>/wallet/pNote"> <!--db처리 url 예)http://www.***.com/rnoti.jsp -->
                    <input type="hidden" name="PNextPUrl" value="<%=request.getRequestURL().toString().replace(request.getRequestURI(), "")%>/wallet/pNext"> <!--성공,실패 화면처리 예)http://www.***.com/pay_rcv.jsp -->
                    <input type="hidden" name="PCancPUrl" value="<%=request.getRequestURL().toString().replace(request.getRequestURI(), "")%>/wallet/pCancel"> <!-- 결제창을 닫은 경우 화면처리 예)http://www.***.com/pay_rcv.jsp -->
                
                    <input type="hidden" name="PEmail" value=""> <!-- 결제자 e-mail -->
                    <input type="hidden" name="PPhone" value=""> <!-- 결제자 연락처 -->
                    <input type="hidden" name="POid"> <!-- P_OID를 회원사에서 직접넘겨주는 경우에 함수 on_load()에서 주문번호 넣는 부분을 주석처리하시기 바랍니다 -->
                    <input type="hidden" name="t_PGoods"> <!-- 상품명 -->
                    <input type="hidden" name="t_PNoti" value=""> <!-- 회원사에서 이용할 수 있는 여유필드 -->
                    <input type="hidden" name="t_PMname" value="박스애드"> <!-- 회원사 한글명 -->
                    <input type="hidden" name="t_PUname"> <!-- 결제자 이름-->
                    <input type="hidden" name="t_PBname" value="박스애드"> <!-- 계좌이체/가상계좌입금시 고객통장에 찍힐 통장인자명 -->
                    <input type="hidden" name="PEname" value="boxads"> <!-- 신용카드 결제시 영문가맹점명 -->
                    <input type="hidden" name="PUserid" value=""/> <!-- 가맹점 사용자 ID -->
                    <!-- 신용카드 결제시 사용 -->
                    <input type="hidden" name="PCardType" value=""/> <!-- 카드결제 타입 [ 3: 앱카드 전용 결제 ] / 6: 현대카드 페이샷  -->
                    <input type="hidden" name="PChainUserId" value=""/> <!-- 현대카드 페이샷 고객 키값 -->
                    
                    <!-- 한글처리위해 비워둡니다. -->
                    <input type="hidden" name="PGoods"> 
                    <input type="hidden" name="PNoti"> 
                    <input type="hidden" name="PMname">
                    <input type="hidden" name="PUname">
                    <input type="hidden" name="PBname">
                    
                    <input type="hidden" name="PMid" value=""> <!-- 상점아이디 -->
                    <input type="hidden" name="PAmt" value=""> <!-- 금액 -->
                </form>
			</div>
			</div>
		</div>
        <c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
    <script>
        webbrowser=navigator.appVersion;
    
        function on_pay(type){
            
            var width = 720;
            var height = 630;
            
            var xpos = (screen.width - width) / 2;
            var ypos = (screen.width - height) / 6;
            var position = "top=" + ypos + ",left=" + xpos;
            var features = position + ", width="+width+", height="+height+",toolbar=no, location=no";
            
            window.name = "STPG_CLIENT";
            wallet = window.open('', 'STPG_WALLET', features);
            
            if ( wallet != null) {
                strEncode();//한글인코딩
                document.order_form.action = getActionUrl(type);
                document.order_form.target = "STPG_WALLET";
                document.order_form.submit();
            } else {
    
                if ((webbrowser.indexOf("Windows NT 5.1")!=-1) && (webbrowser.indexOf("SV1")!=-1)) {    // Windows XP Service Pack 2
                    alert("팝업이 차단되었습니다. 브라우저의 상단 노란색 [알림 표시줄]을 클릭하신 후 팝업창 허용을 선택하여 주세요.");
                } else {
                    alert("팝업이 차단되었습니다.");
                }
            }
            
        }
    
        function getActionUrl(type){
            
            var actionUrl = "";
            if(type == "CARD"){
                actionUrl = "https://pg.settlebank.co.kr/card/NewCardAction.do";
            }else if (type == "BANK"){
                actionUrl = "https://pg.settlebank.co.kr/bank/NewBankAction.do";
            }
            
            return actionUrl;
        }
    
        //파라미터 값이 한글인 경우 여기서 인코딩을 해준다.
        function strEncode(){
            var order_form = document.order_form;
            order_form.PGoods.value = encodeURI(order_form.t_PGoods.value);
            order_form.PNoti.value = encodeURI(order_form.t_PNoti.value);
            order_form.PMname.value = encodeURI(order_form.t_PMname.value);
            order_form.PUname.value = encodeURI(order_form.t_PUname.value);
            order_form.PBname.value = encodeURI(order_form.t_PBname.value);
        }
    
        //goResult() - 함수설명 : 결재완료후 결과값을 지정된 결과페이지(pay_result.jsp)로 전송합니다.
        function goResult(){
            document.order_form.target = "";
            document.order_form.action = "${path}/wallet/pResult";
            document.order_form.submit();
        }
        // eparamSet() - 함수설명 : 결재완료후 (pay_rcv.jsp로부터)결과값을 받아 지정된 결과페이지(pay_result.jsp)로 전송될 form에 세팅합니다.
        function rstparamSet(data,hash,state,oid){
            document.order_form.PData.value     = data;
            document.order_form.PHash.value     = hash;
            document.order_form.PStateCd.value  = state;
            document.order_form.POrderId.value  = oid;
        }
    </script>
    <script>
    function charge() {
    	if ($('[name="cash"]:checked').length === 0) {
    		alert('충전금액을 선택하세요.');
    		return false;
    	}
    	if ($('[name="paymethod"]:checked').length === 0) {
    		alert('결제방법을 선택하세요.');
            return false;
    	}
		var idx = $('[name="cash"]:checked').val();
		var price = $('[name="cash"]:checked').attr('data-cash');
		var type = $('[name="paymethod"]:checked').val();
		var taxBill = $('[name="taxBill"]:checked').val() ? $('[name="taxBill"]:checked').val() : 'N';
    	$.post('cashChargeAjax', {
    		'idx':idx,
    		'price':price,
    		'type':type,
    		'taxBill':taxBill,
        }, function(data){
            if (data.result === 'success') {
                document.order_form.POid.value = data.cashCode;
                document.order_form.PMid.value = data.PMid;
                document.order_form.PAmt.value = data.PAmt;
                document.order_form.t_PUname.value = data.PMname;
                document.order_form.t_PGoods.value = data.PGoods;
                on_pay(type);
            } else {
            	alert(data.msg);
            }
        });
    }
    $('[name="cash"]').on('change', function () {
    	var cash = Number($(this).data('cash'));
    	$('.total_mnt .pric strong').text(addComma(Math.round(cash * 1.1)));
    });

    $('[name="paymethod"]').on('change', function () {    	
		let payment = $('[name="paymethod"]:checked').val();
    	if(payment == 'CARD'){
			$("[name='taxBill']").attr("checked", false);
		} else {
			$("[name='taxBill']").prop("checked", true);
			
		}
    });
    </script>
</body>
</html>
