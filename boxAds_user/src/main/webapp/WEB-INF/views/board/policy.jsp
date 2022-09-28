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
							<li>이용안내</li>
							<li>개인정보 취급방침</li>
						</ul>
					</div>
					<h2 class="title">개인정보 취급방침</h2>
					<div class="policy_wrap">
						${boardVO.content}
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<!-- 이미지 가이드 -->
	<div id="guide02" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title" >이미지 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="msg">
						
						</div>
						<div class="btn_area">
							<button type="button" class="btn">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--// 이미지 가이드 -->
</body>
</html>