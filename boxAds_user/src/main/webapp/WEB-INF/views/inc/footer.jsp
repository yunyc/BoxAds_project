<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!--footer -->
		<footer id="footer">
			<div class="floatingBtnWrap">
				<div class="floatingBtn">
					<a href="#" class="ftTop"><span>상단으로 이동</span></a>
				</div>
			</div>
			<div class="m_list">
				<a href="${path}/etc/company_about" class="btn">회사소개</a>
				<a href="${path}/board/terms?type=S" class="btn">이용약관</a>
				<a href="${path}/board/terms?type=P" class="btn">개인정보처리방침</a>
			</div>
			<div class="inner">
				<div class="foot_l">
					<h2 class="logo"><a href="javascript:;">boxads</a></h2>
					<div class="footer_info">
						<span class="call"><i>전화번호</i>070-5159-3690</span>
						<span class="mail"><i>이메일</i>help@boxads.io</span>
						<span class="location"><i>주소</i>서울시 강북구 도봉로76가길 55, B동 106호</span>
					</div>
					<div class="address">
						<span>(주)스튜디오엑스코</span><span>대표: 김정석</span><span>개인보호책임: 최종인</span> <br />
						<span>사업자등록번호 116-81-77652</span><span>통신판매업신고: 2019-서울강북-0865호</span>
						<span class="db">&copy; BoxAds</span>
					</div>
					<div class="footer_sub_info">
						<h3>고객센터</h3>
						<p><strong>070-5159-3690</strong> 평일 오전 10시 ~ 오후 5시 (주말, 공휴일 제외)</p>
						<div class="footer_sns">
							<a href="https://www.facebook.com/boxads.io/" class="sns01" target="_blank">페이스북 새창이동</a>
							<a href="https://www.youtube.com/channel/UCicS-hcJv-JAwsdADDgTaLQ" class="sns02" target="_blank">유투브 새창이동</a>
							<a href="https://www.instagram.com/BoxAds_Ko/" class="sns03" target="_blank">인스타그램 새창이동</a>
							<a href="https://blog.naver.com/boxads" class="sns04" target="_blank">네이버블로그 새창이동</a>
						</div>
					</div>
				</div>
				<div class="foot_r">
					<dl>
						<dt>ABOUT</dt>
						<dd><a href="${path}/etc/company_about">회사소개</a></dd>
						<dd><a href="${path}/etc/service_intro">서비스소개</a></dd>
					</dl>
					<dl>
						<dt>이용안내</dt>
						<dd><a href="${path}/etc/guide_box">판매자 박스(Box) 이용법</a></dd>
						<dd><a href="${path}/etc/guide_ads">광고주 애드(Ads) 이용법</a></dd>
					</dl>
					<dl>
						<dt>고객센터</dt>
						<dd><a href="${path}/board/list?type=N">공지사항</a></dd>
						<dd><a href="${path}/board/list?type=F">FAQ</a></dd>
						<dd><a href="${path}/board/qna?type=Q">1:1문의</a></dd>
						<dd><a href="${path}/board/terms?type=S">이용약관</a></dd>
						<dd><a href="${path}/board/terms?type=P">개인정보 취급방침</a></dd>
					</dl>
				</div>
			</div>
		</footer>
		<!--// footer 끝 -->