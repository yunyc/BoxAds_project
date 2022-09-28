<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="member_wrap">
				<div class="login_wrap">
					<form:form modelAttribute="memberVO" enctype="multipart/form-data">
						<c:if test="${! empty login}">
							<input type="hidden" name="authkey" value="${login.authkey}"/>
						</c:if>
					 <!-- ${login.idx} -->
						<fieldset>
							<legend>비밀번호 재설정</legend>
							
							<h2 class="member_tit">비밀번호 재설정</h2>
							<p class="mem_caption">회원님의 계정 비밀번호를 재설정해주세요.</p>
							<div class="input_wrap search">
								<div class="input_area">
									<input type="password" name="pw" id="srch_pw_1" placeholder="비밀번호"/>
									<label for="srch_pw_1" class="blind">비밀번호</label>
								</div>
								<div class="input_area">
									<input type="password" name="pwConfirm" id="srch_pw_2" placeholder="비밀번호 확인" />
									<label for="srch_pw_2" class="blind">비밀번호 확인</label>
								</div>
								<div class="btn_area">
									<button id="submit" type="submit" class="btn btn_join">확인</button>
								</div>
								
							</div>
						</fieldset>
					</form:form>
					<div class="bot_txt">
						<ul>
							<li>비밀번호는 영문, 숫자혼용 특수문자 포함 8~12자 입력해주세요.</li>
							<li>아이디와 동일한 비밀번호는 사용할 수 없습니다.</li>
							<li>현재 비밀번호와 다른 비밀번호를 사용하세요.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="floatingBtnWrap">
			<div class="floatingBtn">
				<a href="javascript:;" class="ftTop"><span>상단으로 이동</span></a>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js?a=2"></script>
	<script>
		$(function() {
			$("#memberVO").submit(function() {
				var pw = $("input[name=pw]").val();
				var pwConfirm = $("input[name=pwConfirm]").val();

				if (!pw) {
					alert('<spring:message code="login.pwSet.pw" javaScriptEscape="true"/>');
					return false;
				} else if (!pwConfirm) {
					alert('<spring:message code="login.pwSet.pwConfirm" javaScriptEscape="true"/>');
					return false;
					
				} else if (pw !== pwConfirm) {
					alert('<spring:message code="login.pwSet.equal" javaScriptEscape="true"/>');
					return false;
					
				} else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/.test(pw)) {
					alert('<spring:message code="login.pwSet.pattern" javaScriptEscape="true"/>');
					return false;
					
				}
				
			});
		});
	</script>
</body>
</html>