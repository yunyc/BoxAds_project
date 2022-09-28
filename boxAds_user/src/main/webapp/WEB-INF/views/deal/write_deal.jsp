<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp" %>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap mylist_wrap">
			<div class="inner">
				<div class="path">
					<ul>
						<li>홈</li>
						<li>거래관리</li>
					</ul>
				</div>
				<h2 class="title">거래관리</h2>
				<!-- tab -->
				<div class="tab list_tab2">
					<ul>
						<li><a href="${path}/deal/deal_history">결제 내역</a></li>
						<li><a href="${path}/deal/deal_certification">증빙서류 발행내역</a></li>
						<li class="on"><a href="${path}/deal/deal_info">거래 정보</a></li>
						<li><a href="${path}/deal/deal_withdraw">출금 정보</a></li>
					</ul>
				</div>
				<form:form modelAttribute="billVO">
				<input type="hidden" name="path" value="${path}"/>
				<input type="hidden" name="mIdx" value="${bill.mIdx}" />
				<c:if test="${bill.idx ne null and bill.idx ne 0}">
					<input type="hidden" name="idx" value="${bill.idx}"/>
				</c:if>
				<div class="input_area_wrap">
					<dl>
						<dt>상호</dt>
						<dd>
							<div class="dsp">${bill.name}</div>
						</dd>
					</dl>
					<dl>
						<dt>사업자등록번호</dt>
						<dd>
							<div class="dsp">${bill.companyNumber}</div>
						</dd>
					</dl>
					<dl>
						<dt>업종/업태</dt>
						<dd>
							<div class="dsp">${bill.business}</div>
						</dd>
					</dl>
					<dl>
						<dt>대표자성명</dt>
						<dd>
							<div class="dsp">${bill.companyName}</div>
						</dd>
					</dl>
					<dl>
						<dt>주소</dt>
						<dd>
							<div class="dsp">${bill.address}</div>
						</dd>
					</dl>
					<dl>
						<dt>전화번호</dt>
						<dd>
							<div class="input_area">
								<input type="tel" name="phone" id="biz_phone" placeholder="(-빼고 입력)" pattern="\d*" title="전화번호" value="${bill.phone}" required />
							</div>
						</dd>
					</dl>
					<dl>
						<dt>Email(세금계산서 수취)</dt>
						<dd>
							<div class="input_area">
								<input type="email" name="email" id="biz_email" placeholder="입력해주세요." title="Email(세금계산서 수취)" value="${bill.email}" required />
							</div>
						</dd>
					</dl>
					<dl>
						<dt>사업자 구분</dt>
						<dd>
							<span class="rdo"><input type="radio" name="type" id="biz_cate01" value="N" required="required"<c:if test="${bill.type ne null and bill.type eq 'N'}"> checked="checked"</c:if>><label for="biz_cate01">일반</label></span>
							<span class="rdo"><input type="radio" name="type" id="biz_cate02" value="S" <c:if test="${bill.type ne null and bill.type eq 'S'}"> checked="checked"</c:if>><label for="biz_cate02">간이</label></span>
							<span class="rdo"><input type="radio" name="type" id="biz_cate03" value="F" <c:if test="${bill.type ne null and bill.type eq 'F'}"> checked="checked"</c:if>><label for="biz_cate03">면세</label></span>
						</dd>
					</dl>
					<p class="note">* 사업자등록 정보 변경 시 계정관리에서 수정하세요.</p>
				</div>
				</form:form>
				
				<div class="btn_area">
					<button id="submit" type="button" class="btn btn_finish">저장</button>
				</div>
			</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
<script>
	$(function(){
		$("#submit").click(function(){
			/* var confirm = window.confirm('<spring:message code="bill.write.confirm" javaScriptEscape="true"/>');
			
			if(confirm) {
			} */
				$("#billVO").submit();
		});
		
		$("#billVO").submit(function(){
			var emailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!$("input[name=phone]").val()){
				alert('<spring:message code="bill.write.phone" javaScriptEscape="true"/>');
				return false;
			}

			if(!$.isNumeric($("input[name=phone]").val())){
				alert('<spring:message code="bill.write.phoneChk" javaScriptEscape="true"/>');
				return false;
			}

			
			if(!$("input[name=email]").val()){
				alert('<spring:message code="bill.write.email" javaScriptEscape="true"/>');
				return false;
			}
			if($("input[name=email]").val().match(emailCheck) == null){
				alert('<spring:message code="bill.write.emailChk" javaScriptEscape="true"/>');
				return false;
			}
			if(!$("input[name=type]").is(":checked")){
				alert('<spring:message code="bill.write.type" javaScriptEscape="true"/>');
				return false;
			}
		});
	});
</script>
</html>
