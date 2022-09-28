<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
							<legend>아이디/비밀번호 찾기</legend>
							<!-- <h2 class="member_tit">아이디 찾기</h2>
							<div class="input_wrap search">
								<div class="input_area">
									<input type="text" name="search01_1" id="search01_1" onchange="this.className = this.value ? this.className + ' not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
									required />
									<label for="search01_1">이름</label>
								</div>
								<div class="input_area">
									<input type="text" name="search01_2" id="search01_2" onchange="this.className = this.value ? this.className + ' not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
									required />
									<label for="search01_2">이메일</label>
								</div>
								<div class="btn_area">
									<button type="button" class="btn btn_join on">확인</button>
								</div>
							</div> -->
							<h2 class="member_tit">비밀번호 찾기</h2>
							<p class="mem_caption">
								비밀번호가 생각나지 않으세요? <br>
								아래 정보를 입력해주시면 가입시 입력하신 이메일로 비밀번호를 안내해 드립니다.
							</p>
							<div class="input_wrap search">
								<div class="input_area">
									<input type="text" name="companyNumber" id="srch_pw_1" placeholder="사업자등록번호"/>
									<label for="srch_pw_1" class="blind">사업자등록번호</label>
								</div>
								<div class="input_area">
									<input type="text" name="id" id="srch_pw_2" placeholder="이메일" />
									<label for="srch_pw_2" class="blind">이메일</label>
								</div>
								<div class="btn_area">
									<button type="submit" class="btn btn_join">확인</button>
								</div>
							</div>
						</fieldset>
					</form:form>
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
</body>
</html>