<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="lnb">
	<h2 class="tit"><span>부가기능관리</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="../coupon/list" <c:if test='${param.menuOn eq "0"}'>class="skin_bg"</c:if>>쿠폰 관리</a>
		</li>
	</ul>
</aside>