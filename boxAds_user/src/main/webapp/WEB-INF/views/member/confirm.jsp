<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="member_wrap confirm">
				<h2 class="member_tit">회원가입 완료</h2>
				<div class="inner">
					<i class="ico mem_logo">boxads</i>
					<p class="confirm_tit">
						<strong>회원가입이 정상적으로 완료</strong>되었습니다.
					</p>
					<p class="confirm_caption type-02">
						로그인하시면 다양한 박스(Box) 상품과 애드(Ads) 상품을 만나실 수 있습니다. <br />
						박스애드(BoxAds)는 사업자 인증 후 정상 서비스 이용이 가능합니다.  
					</p>
					<div class="table_wrap">
						<table>
							<caption>회원가입 정보</caption>
							<colgroup>
								<col class="col01_1">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="col01_1">아이디</th>
									<td><c:out value="${memberVO.id}"/></td>
								</tr>
								<tr>
									<th scope="row" class="col01_1">신청일자</th>
									<td><c:out value="${fn:substring(memberVO.insertDate, 0, 10)}"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="confirm_caption type-03">
						<strong>가입하신 기업정보를 토대로 사업자 인증 심사가 진행됩니다.</strong> <br />
						최대 24시간이 소요되며, 인증 확인 이메일이 발송됩니다. <br />
						회원가입신청 관련 문의는 <strong>help@BoxAds.io</strong>로 이메일 부탁드립니다.
					</p>
					<div class="btn_area">
						<a href="${path}/login" class="btn btn_join">로그인</a>
						<a href="${path}/main" class="btn form02">메인페이지</a>
					</div>
				</div>
			</div>
		</div>
		
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</html>