<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="lnb">
	<h2 class="tit"><span>회원 관리</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="../member/list?state=Y" <c:if test='${param.menuOn eq "0"}'>class="skin_bg"</c:if>>활동회원</a>
		</li>
		<li class="btn_sub">
			<a href="../member/list?state=H" <c:if test='${param.menuOn eq "1"}'>class="skin_bg"</c:if>>휴면 회원</a>
		</li>
		<li class="btn_sub">
			<a href="../member/list?state=N" <c:if test='${param.menuOn eq "2"}'>class="skin_bg"</c:if>>탈퇴 회원</a>
		</li>
		<li class="btn_sub">
			<a href="../member/message" <c:if test='${param.menuOn eq "3"}'>class="skin_bg"</c:if>>메세지 관리</a>
		</li>
	</ul>
</aside>