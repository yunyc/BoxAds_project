<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="lnb">
	<h2 class="tit"><span>상품 관리</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="../product/list" <c:if test='${param.menuOn eq "0"}'>class="skin_bg"</c:if>>박스</a>
		</li>
		<li class="btn_sub">
			<a href="../product/list?type=A" <c:if test='${param.menuOn eq "1"}'>class="skin_bg"</c:if>>애드</a>
		</li>
	</ul>
</aside>