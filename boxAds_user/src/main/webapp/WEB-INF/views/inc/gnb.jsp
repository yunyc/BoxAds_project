<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- gnb 영역 -->
	<div class="gnb_wrap">
		<div id="promo" class="active">
			<div class="promo_inner">
				<div class="promo_slider">
					<div class="swiper-wrapper" id="alimList">
							
					</div>
				</div>
				<div class="promo-pager">
				</div>
				<button type="button" class="promo_close">Close</button>
			</div>
		</div>
		<header id="header">
			<c:import url="/WEB-INF/views/inc/header_top.jsp"/>
		</header>
	</div>
		<aside id="aside_menu">
			<div class="aside_bg"></div>
			<button class="btn btn_close" type="button" onclick="btn_menu_close();">닫음</button>
			<div class="aside_wrap">
				<c:choose>
					<c:when test="${! empty login}">
						<div class="aside_info_wrap">
							<div class="aside_info">
								<div class="img_area"><img src="${path}${prImg.url}" onerror="this.src='${path}/images/main/list_profile01.png'" alt="프로필이미지"></div>
								<p class="name"><span><strong>${login.name}</strong>님.</span></p>
							</div>
							<a href="/member/message" class="btn btn_notice">알림</a>
							<a href="/member/profile" class="btn btn_setting">설정</a>
						</div>
					</c:when>
					<c:otherwise>
						<!-- 로그인 전 -->
						<div class="aside_info_wrap login_n">
							<div class="aside_info">
								<div class="img_area"><img src="../images/common/no-profile.png" alt="프로필이미지"></div>
								<p class="name"><span>로그인이<br> 필요합니다</span></p>
							</div>
							<div class="btn_area">
								<a href="${path}/login" class="btn login">로그인</a>
								<a href="${path}/login/join" class="btn join">회원가입</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="aside_srch">
					<form action="${path}/search_list" method="get">
						<input type="text" name="searchKeyword" id="searchKeywordm" placeholder="검색어를 입력하세요" value="${param.searchKeyword}">
						<label for="searchKeywordm" class="blind">검색어 입력</label>
						<button type="button" class="btn delete" onclick="inputTextDel('searchKeyword')">삭제</button>
						<button type="submit" class="btn">검색</button>
					</form>
				</div>
				<div class="aside_list">
					<ul>
						<li><a href="${path}/main"><span>홈</span></a></li>
					</ul>
				</div>
				<c:if test="${!empty login}">
					<div class="aside_list aside_list02">
						<ul>
							<li><a href="${path}/wallet/cash"><span>지갑관리</span></a></li>
							<li><a href="${path}/deal/deal_history"><span>거래관리</span></a></li>
							<li><a href="${path}/member/wish_list"><span>찜리스트</span></a></li>
							<li><a href="${path}/member/message"><span>메시지</span></a></li>
						</ul>
					</div>
					<div class="aside_list aside_list02">
						<ul>
							<li class="depth">
								<a href="javascript:;"><span>박스(Box)</span></a>
								<ul class="depth2">
									<li><a href="${path}/box/box_sell">마이 박스 판매</a></li>
									<li><a href="${path}/box/box_buy">박스 구매</a></li>
									<li><a href="${path}/box/list">마이 박스 관리</a></li>
									<li><a href="${path}/box/write">마이 박스 등록</a></li>
								</ul>
							</li>
							<li class="depth">
								<a href="javascript:;"><span>애드(Ads)</span></a>
								<ul class="depth2">
									<li><a href="${path}/ad/ad_request">마이애드요청</a></li>
									<li><a href="${path}/ad/ad_apply">애드 신청</a></li>
									<li><a href="${path}/ad/list">마이 애드 관리</a></li>
									<li><a href="${path}/ad/write">마이 애드 등록</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</c:if>
				<div class="aside_list aside_list02">
					<ul>
						<li class="depth">
							<a href="javascript:;"><span>이용안내</span></a>
							<ul class="depth2">
								<li><a href="${path}/etc/service_intro">서비스 소개</a></li>
								<li><a href="${path}/etc/guide_box">판매자 박스(Box) 이용법</a></li>
								<li><a href="${path}/etc/guide_ads">광고주 박스(Ads) 이용법</a></li>
							</ul>
						</li>
						<li class="depth">
							<a href="javascript:;" class="aside_inquire"><span>고객센터</span></a>
							<ul class="depth2">
								<li><a href="${path}/board/list?type=N">공지사항</a></li>
								<li><a href="${path}/board/list?type=F">FAQ</a></li>
								<li><a href="${path}/board/qna?type=Q">1:1 문의</a></li>
							</ul>
						</li>
						<c:if test="${!empty login}">
							<li><a href="${path}/login/logout"><span>로그아웃</span></a></li>
						</c:if>
					</ul>
				</div>
				<div class="aside_sub">
					<i class="cs"></i>
					<div class="as_inner">
						<p>고객센터</p>
						<span><strong><a href="tel:070-5159-3690">070-5159-3690</a></strong> (평일 10시~ 17시)</span>
					</div>
				</div>
			</div>
		</aside>
	<!-- //gnb 영역 끝-->
