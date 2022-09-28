<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<aside id="lnb">
	<h2 class="tit"><span>통합관리자</span></h2>
	<ul class="menu">
		<li class="btn_sub">
			<a href="#">회원관리</a>
			<ul class="sub_menu">
				<li><a href="../member/member_list01.jsp">일반회원</a></li>
				<li><a href="../member/member_list02.jsp">종사자회원</a></li>
				<li><a href="#">휴면회원(일반)</a></li>
				<li><a href="#">휴면회원(종사자)</a></li>
			</ul>
		</li>
		<li class="btn_sub">
			<a href="#">운영관리</a>
			<ul class="sub_menu">
				<li><a href="../member/popup_list.jsp">팝업관리</a></li>
				<li><a href="../member/banner_list.jsp">배너관리</a></li>
				<li><a href="../member/code_list.jsp">코드관리</a></li>
			</ul>
		</li>
		<li class="btn_sub">
			<a href="#">관리자관리</a>
			<ul class="sub_menu">
				<li><a href="manager_list01.jsp">담당관리자관리</a></li>
				<li><a href="connect_list.jsp">관리자접속기록</a></li>
			</ul>
		</li>
		<li class="btn_sub">
			<a href="#">통계관리</a>
			<ul class="sub_menu">
				<li><a href="statistics01.jsp">방문자 통계</a></li>
				<li><a href="statistics02.jsp">이용 통계</a></li>
			</ul>
		</li>
	</ul>
</aside>