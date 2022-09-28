<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="lnb">
	<h2 class="tit"><span>설정</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="../setting/admin_list" <c:if test='${param.menuOn eq "0"}'>class="skin_bg"</c:if>>운영자관리</a>
		</li>
		<li class="btn_sub">
			<a href="../setting/code_list?type=P" <c:if test='${param.menuOn eq "1"}'>class="skin_bg"</c:if>>코드관리</a>
		</li>
		<li class="btn_sub">
			<a href="../setting/unit_list?type=A" <c:if test='${param.menuOn eq "2"}'>class="skin_bg"</c:if>>단가관리</a>
		</li>
		<li class="btn_sub">
			<a href="../setting/fees_list?type=B" <c:if test='${param.menuOn eq "3"}'>class="skin_bg"</c:if>>수수료 관리</a>
		</li>		
	</ul>
</aside>