<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<header id="header">
	<div class="header_top">
		<div class="inner relative">
			<h1>ADMINISTRATOR</h1>
			<div class="user_name">
				<span class="ico"></span>
				<p class="txt">${login.name}님</p>
				<span class="info">${login.grp}</span>
			</div>
			<ul class="btn_wrap clearfix">
				<li class="homepage"><a href="http://xco.ddns.net:8081/">HOMEPAGE</a></li>
				<li class="logout"><a href="../logout">LOG-OUT</a></li>
			</ul>
		</div>
	</div>
	<nav id="gnb">
		<ul class="clearfix">
			<li><a href="../main/home" >홈</a></li>
			<li><a href="../product/list" >상품관리</a></li>
			<li><a href="../order/list?state=B" >주문관리</a></li>
			<li><a href="../calcul/calcul_list" >정산관리</a></li>
			<li><a href="../coupon/list" >부가기능관리</a></li>			
			<li><a href="../member/list?state=Y">회원관리</a></li>
			<li><a href="../board/list?type=N">사이트관리</a></li>
			<li><a href="../setting/admin_list">설정</a></li>
			<li><a href="#">통계</a></li>
			<li><a href="../print/print_list">인쇄관리</a></li>
		</ul>
	</nav>
	
</header>