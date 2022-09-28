<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>고객센터</li>
							<li>마케팅 수신 정보</li>
						</ul>
					</div>
					<h2 class="title">마케팅 수신 정보 </h2>
					<div class="policy_wrap">
						내용
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>	
</body>
</html>
