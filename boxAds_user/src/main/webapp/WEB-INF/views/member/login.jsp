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
					<form:form modelAttribute="memberVO">
						<fieldset>
							<legend>로그인</legend>
							<h2 class="member_tit">로그인</h2>
							<div class="input_wrap">
								<div class="input_area">
									<input type="text" name="id" id="user_mail" placeholder="이메일" />
									<label for="user_mail" class="blind">이메일</label>
								</div>
								<div class="input_area">
									<input type=password name="pw" id="user_pw" placeholder="비밀번호" />
									<label for="user_pw" class="blind">비밀번호</label>
								</div>
								<div class="btn_area">
									<button type="submit" class="btn btn_join">로그인</button>
									<a href="${path}/login/join" class="btn">무료 회원가입</a>
								</div>
								<div class="login_caption">
									<div class="chk_area">
										<input type="checkbox" name="remember" id="save" value="true">
										<label for="save" class="chk">
											<i class="ico_chk"></i>
											로그인 유지하기
										</label>
									</div>
									<a href="${path}/login/search" class="btn srch_txt">비밀번호 찾기</a>
								</div>
							</div>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>
		$(function() {

			$("#memberVO").submit(function() {

				if (!$("input[name=id]").val()) {
					alert('<spring:message code="login.login.id" javaScriptEscape="true"/>');
					return false;
				} else if (!$("input[name=pw]").val()) {
					alert('<spring:message code="login.login.pw" javaScriptEscape="true"/>');
					return false;
				}
			});
		});
		
	</script>
	<c:choose>
		<c:when test="${state eq 'H'}">
			<script>
				var confirm = window.confirm('<spring:message code="login.login.humun" javaScriptEscape="true"/>');
				if (confirm) {
					location.href = "";
				}
			</script>
		</c:when>
		<c:when test="${state eq 'P'}">
			<script>
				var confirm = window.confirm('<spring:message code="login.login.pause" javaScriptEscape="true"/>');
				if (confirm) {
					location.href = "";
				}
			</script>
		</c:when>
	</c:choose>
</body>
</html>