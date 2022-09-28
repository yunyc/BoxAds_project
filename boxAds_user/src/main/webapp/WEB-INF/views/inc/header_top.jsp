<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="inner">
	<div class="header_top">
		<div class="top_left">
			<h1 class="logo"><a href="${path}/main">Boxads</a></h1>
				<div class="srch_wrap">
				<form action="${path}/search_list" method="get">
					<input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색어를 입력하세요." value="${param.searchKeyword}">
					<label for="searchKeyword" class="blind">검색</label>
					<button type="button" class="btn delete" onclick="inputTextDel('searchKeyword')">삭제</button>
					<button type="submit" class="btn">검색</button>
				</form>
				</div>
			<button type="button" class="btn btn_menu" onclick="btn_menu_open();">메뉴열기</button>
		</div>
		<div class="top_right">
		<c:choose>
			<c:when test="${! empty login}">
			<ul class="util customer">
				<li>
					<a href="javascript:;">메시지</a>
					<div class="over_wrap message">
						<div class="inner">
							<div class="over_tab">
								<button type="button" class="btn on">메시지</button>
								<button type="button" class="btn">알림</button>
							</div>
							<div class="tab_content" id="overTab0" style="display: block;">
								<div class="scroll_wrap">
									
								</div>
								<div class="link_area"><a href="${path}/member/message">전체보기<i></i></a></div>
							</div>
							<div class="tab_content" id="overTab1">
								<div class="scroll_wrap">									
								</div>
								<!-- <div class="link_area"><a href="javascript:alarmAppend(0)">전체보기<i></i></a></div> -->
							</div>
						</div>
					</div>
				</li>
				<li>
					<a href="javascript:;">박스(Box)</a>
					<div class="over_wrap">
						<div class="inner">
							<ul>
								<li><a href="${path}/box/box_sell">마이 박스 판매</a></li>
								<li><a href="${path}/box/box_buy">박스 구매</a></li>
								<li><a href="${path}/box/list">마이 박스 관리</a></li>
								<li><a href="${path}/box/write">마이 박스 등록</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="javascript:;">애드(Ads)</a>
					<div class="over_wrap">
						<div class="inner">
							<ul>
								<li><a href="${path}/ad/ad_request">마이 애드 요청</a></li>
								<li><a href="${path}/ad/ad_apply">애드 신청</a></li>
								<li><a href="${path}/ad/list">마이 애드 관리</a></li>
								<li><a href="${path}/ad/write">마이 애드 등록</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="profile">
					<a href="#" class="clearfix">
						<div class="img_area fl_l"><img src="${path}${prImg.url}" alt="프로필이미지" onerror="this.src='${path}/images/main/list_profile01.png'"></div>
						<p class="fl_l"><strong>${login.name}</strong>님</p>
					</a>
					<div class="over_wrap profile">
						<div class="inner">
							<ul>
								<li><a href="${path}/wallet/cash">지갑관리</a></li>
								<li><a href="${path}/deal/deal_history">거래관리</a></li>
								<li><a href="${path}/member/wish_list">찜리스트</a></li>
								<li><a href="${path}/member/message">메시지</a></li>
								<li><a href="${path}/member/profile">계정관리</a></li>
								<li><a href="${path}/login/logout">로그아웃</a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul> <!-- 로그인 후 -->
			</c:when>
			<c:otherwise>
			 <ul class="util standard">
				<li><a href="${path}/etc/guide_box">판매시작하기</a></li>
				<li><a href="${path}/etc/guide_ads">광고시작하기</a></li>
				<li><a href="${path}/login" class="on">로그인</a></li>
				<li class="bg"><a href="${path}/login/join">무료 회원가입</a></li>
			</ul>  <!-- 로그인 전 -->
			</c:otherwise>
			</c:choose>
		</div>
	</div>
		<c:import url="/WEB-INF/views/inc/header_category.jsp"/>
</div>
<script>
	 $(function() {
		
		 
		 if('${login.idx}' != ''){ 
			 alarmAppend(7); 
			 messageAppend(7);
		 }
	 });

	 function alarmAppend(end) {
		 $.post("${path}/common/alarm", {end: end}, function(data) {			 
			 $("#overTab1 .scroll_wrap > *").remove();
			 $("#overTab1 .scroll_wrap").append(data);
			 
		 });
	 }

	 function messageAppend(end) {
		 $.post("${path}/common/message", {end: end}, function(data) {
			 $("#overTab0 .scroll_wrap > *").remove();
			 $("#overTab0 .scroll_wrap").append(data);
			 
		 });
	 }
	</script>