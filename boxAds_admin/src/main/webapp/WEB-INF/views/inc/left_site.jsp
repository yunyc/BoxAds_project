<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<aside id="lnb">
	<h2 class="tit"><span>사이트 관리</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="../board/list?type=N" <c:if test='${param.menuOn eq "0"}'>class="skin_bg"</c:if>>공지사항</a>
		</li>
		<li class="btn_sub">
			<a href="../board/list?type=F" <c:if test='${param.menuOn eq "1"}'>class="skin_bg"</c:if>>FAQ</a>
		</li>
		<li class="btn_sub">
			<a href="../board/list?type=Q" <c:if test='${param.menuOn eq "2"}'>class="skin_bg"</c:if>>문의 관리</a>
		</li>
		<li class="btn_sub">
			<a href="../board/banner?type=B" <c:if test='${param.menuOn eq "3"}'>class="skin_bg"</c:if>>메인 배너</a>
		</li>
		<li class="btn_sub">
			<a href="../board/banner?type=A" <c:if test='${param.menuOn eq "4"}'>class="skin_bg"</c:if>>알림 관리</a>
		</li>
		<li class="btn_sub">
			<a href="../board/terms?type=S" <c:if test='${param.menuOn eq "5"}'>class="skin_bg"</c:if>>약관 관리</a>
		</li>		
		<li class="btn_sub">
			<a href="../board/terms?type=CP" <c:if test='${param.menuOn eq "6"}'>class="skin_bg"</c:if>>취소 / 환불 정책</a>
		</li>
	</ul>
</aside>