<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<div class="login_bg"></div>
	<div class="login_box">
		<div class="logo">
			<h1>관리자</h1>
		</div>
		<div class="login">

			<p class="txt">관리자 페이지 입니다.<br>아이디와 패스워드를 입력해주세요</p>

			<form action="login" method="post">
				<fieldset>
					<legend>아이디, 비밀번호</legend>
					<div class="input_id">
						<span><input type="text" name="id" title="id" placeholder="Username"></span>
					</div>
					<div class="input_pw mt10">
						<span><input type="password" name="pw" title="password" placeholder="Password"></span>
					</div>
					<button class="btn_login" type="submit"><span>LOGIN</span></button>
				</fieldset>
			</form>
		</div>
		
	</div>
</div>
</body>
</html>