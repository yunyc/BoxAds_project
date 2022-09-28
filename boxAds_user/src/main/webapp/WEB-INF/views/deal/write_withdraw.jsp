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
							<li><a href="${path}/deal/deal_info">거래 정보</a></li>
							<li class="on"><a href="${path}/deal/deal_withdraw">출금 정보</a></li>
						</ul>
					</div>
					<p class="info_txt">보유 캐시의 출금 신청에 필요한 업체 계좌 정보를 등록해주세요. 예금주명이 업체 정보와 다를 경우 출금이 제한될 수 있습니다.</p>
					<form:form modelAttribute="bankInfoVO" enctype="multipart/form-data">
					<div class="input_area_wrap">
						<dl>
							<dt>거래은행</dt>
							<dd>
								<div class="input_area">
									<input type="text" name="bank" id="box_acont01" required="required" title="거래은행" value="${bankInfo.bank}"/>
									<!-- <select name="box_acont01" id="box_acont01" title="거래은행 선택">
										<option value="">거래은행 선택</option>
									</select> -->
									<!--<input type="text" name="bank" id="bank" required="" placeholder="입력해주세요." title="거래은행">-->
								</div>
							</dd>
						</dl>
						<dl>
							<dt>계좌번호</dt>
							<dd>
								<div class="input_area">
									<input type="text" name="accNumber" id="account_num" required="required" placeholder="(-)를 포함해서 입력해주세요." title="계좌번호" value="${bankInfo.accNumber}">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>예금주 명</dt>
							<dd>
								<div class="input_area">
									<input type="text" name="depositor" id="account_holder" required="required" placeholder="입력해주세요." title="예금주 명" value="${bankInfo.depositor}">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>사업자 통장 사본</dt>
							<dd>
								<div class="upload_file rbtn">
								   
								</div>
								<input type="file" name="bankbook" id="bankbook_file" class="file_input">
								<label for="bankbook_file">파일 찾기</label>
								<c:forEach items="${bankbookList}" var="bankbook">
									<div class="input_tag">
										<span>
											${bankbook.realName}
											<button id="delete" type="button">삭제</button>
											<c:set var="idx" value="${bankbook.idx}"/>
										</span>
									</div>
								</c:forEach>
								<input id="file_idx" name="fileIdx" type="hidden" value="${! empty idx ? idx : 0}"/>
								<input id="file_delete" name="deleteIdx" type="hidden" value="0" />
								<%-- <div class="input_tag">
									<span>
										사업자등록증.png
										<button type="button">삭제</button>
									</span>
								</div> --%>
								<%-- <div class="input_area">
									<input type="file" name="bankbook" id="bankbook_file" required="required">
									<label for="bankbook_file" class="file_txt">
										사업자 통장 사본<strong class="required">*</strong>
									</label>
								</div> --%>
							</dd>
						</dl>
					</div>
					<div class="btn_area">
						<button type="submit" class="btn btn_finish">저장</button>
					</div>
					</form:form>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script>
		$(function(){
			$("input[name=bankbook]").change(function(){
				var file = $("input[name=bankbook]").get(0).files[0];
				
				if (file!== undefined) {
					$("#file_delete").val($("#file_idx").val());
					$(".input_tag").remove();
					$(".input_area_wrap dl:nth-child(4) dd").append('<div class="input_tag"><span>' + file.name + '<button id="delete" type="button">삭제</button></span></div>');
				}
				$("#file_idx").val(0);
			});
			
			$(document).on("click", "#delete", function(){
				$("input[name=bankbook]").val("");
				$(".input_tag").remove();
				$("#file_delete").val($("#file_idx").val());
			});
			
			$("#bankInfoVO").submit(function(){
				var confirm = window.confirm("저장하시겠습니까?");
				
				if(!confirm) {
					return false;
				}				
				if(!$("input[name=bank]").val()) {
					alert('<spring:message code="bankinfo.write.bank" javaScriptEscape="true"/>');
					return false;
				}
				if(!$("input[name=accNumber]").val()) {
					alert('<spring:message code="bankinfo.write.accNumber" javaScriptEscape="true"/>');
					return false;
				}
				if(!$("input[name=depositor]").val()) {
					alert('<spring:message code="bankinfo.write.depositor" javaScriptEscape="true"/>');
					return false;
				}
				if(!$("input[name=bankbook]").val() && !$(".input_tag").length > 0) {
					alert('<spring:message code="bankinfo.write.bankbook" javaScriptEscape="true"/>');
					return false;
				}
			});
		});
	</script>
</body>
</html>
