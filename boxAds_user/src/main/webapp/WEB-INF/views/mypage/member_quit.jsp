<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="member_wrap confirm member_quit">
				<h2 class="member_tit">회원탈퇴</h2>
				<div class="inner">
					<i class="ico mem_logo">boxads</i>
					
					<p class="confirm_caption type-05">
						그 동안 박스 애드를 이용해 주셔서 진심으로 감사합니다. <br>
						사이트 이용 시 불편했거나 부족했던 부분을 알려주시면, 더 좋은 모습으로 찾아 뵙기 위해 노력하겠습니다.

					</p>
					<div class="input_area">
					<form:form modelAttribute="memberVO">
						<textarea name="quitMsg" placeholder="최대 100자 까지 입력 가능합니다." maxlength="100"></textarea>
						<input type="hidden" name="idx" value="${login.idx}"/>
					</form:form>
					</div>
					
					<div class="confirm_caption type-06">
						<ul>
							<li>박스애드 마켓에 판매중(박스)이거나 광고중(애드)인 상품이 있을 경우 탈퇴 처리가 제한되니, 상품 관리에서 모두 판매 종료 처리를 해주세요.</li>
							<li>박스 구매 관련 거래가 진행 중일 경우 거래가 종료된 후 탈퇴가 가능합니다.</li>
							<li>환불 가능한 캐시가 있을 경우 탈퇴 전 출금 신청을 하세요. <br>(회원 탈퇴 시 캐시 출금을 하지 않으면 관련법에 따라 처리하는 것에 동의 한 것으로 간주합니다.)</li>
						</ul>
					</div>
					<div class="btn_area">
						
						<a href="#" onclick="$('#memberVO').submit()" class="btn form02">탈퇴하기</a>
						<a href="${path}/main" class="btn btn_join">취소하기</a>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</html>