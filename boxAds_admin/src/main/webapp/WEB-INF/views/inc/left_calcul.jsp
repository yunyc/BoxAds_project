<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="lnb">
	<h2 class="tit"><span>정산 관리</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="../calcul/calcul_list" <c:if test='${param.menuOn eq "0"}'>class="skin_bg"</c:if>>정산관리</a>
		</li>
		<li class="btn_sub">
			<a href="../calcul/cash_list" <c:if test='${param.menuOn eq "1"}'>class="skin_bg"</c:if>>결제(충전)관리</a>
		</li>
		<li class="btn_sub">
			<a href="../calcul/withdraw_list" <c:if test='${param.menuOn eq "2"}'>class="skin_bg"</c:if>>출금관리</a>
		</li>
		<li class="btn_sub">
			<a href="../calcul/bill_list" <c:if test='${param.menuOn eq "3"}'>class="skin_bg"</c:if>>증빙자료 관리</a>
		</li>
	</ul>
</aside>