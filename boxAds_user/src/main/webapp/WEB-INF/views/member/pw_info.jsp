<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="member_wrap confirm">
				<h2 class="member_tit">비밀번호 재설정</h2>
				<div class="inner">
					<i class="ico mem_logo">boxads</i>
					<p class="confirm_tit">
						<strong>회원가입정보가</strong> 확인되었습니다.
					</p>
					<i class="ico ico_pw">회원가입 정보확인</i>
					<p class="confirm_caption">
						회원가입정보가 확인되었습니다. <br />
						<strong>가입하신 이메일 주소로 비밀번호 재설정 링크가 발송</strong>되었습니다. <br />
						수신된 이메일을 확인하여 주시기 바랍니다.
					</p>
					<div class="btn_area">
						<a href="${path}/login" class="btn btn_join">로그인</a>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</html>