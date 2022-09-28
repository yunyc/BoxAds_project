<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="about_wrap">
		<!-- 이용안내 시작 -->	
				<div class="path">
					<ul>
						<li>홈</li>
						<li>About</li>
					</ul>
				 </div>
				 <div class="about_tit">
					<h3>회사소개</h3>
				 </div>
				 <div class="about_con1">
				 	<div class="ofh_con">
						<div class="stu_img_wrap">
							<img src="${path}/images/etc/con_about_img01.png" alt="x 19-TOP-5.12 18-5.13 D-TC 17-5.13 D-KJ 16-5.13 C-TC 15-5.14 D-KJ 13-5.14 D-KJ 14-5.14 C-TC 12-5.14 C-TC 11-5.13 C-KJ 10-5.14 A-TC 9-5.13 B-KJ 8-5.13 D-TC 7-5.14 A-KJ 6-5.13 C-TC 5-5.12 D-KJ 4-5.12 B-TC 3-5.13 D-KJ 2-5.13 A-TC 1-5.12 B-KJ">				
						</div>
						<div class="studio_con">
								<h4 class="studi_tit">Studio X</h4>
								<div class="p_box">
									<p class="fs_st">다양한 꿈과 다양한 비즈니스 기회가 만나는, <span>Creative Company</span></p>
									<div class="p_wrap">
										<p>이익 추구가 유일한 목표가 아니며</p>
										<p>고객보다 직원을 최우선으로 대우하고</p>
										<p>최신 기술보다 사용자의 즐거움이 중요합니다.</p>
									</div>
									<div class="p_wrap type02">
										<p>우리는 크고 위험하고 대담한 목표를 세워 끊임 없는</p>
										<p>도전과 실험으로 새로운 기술 가치를 발굴하고 제시할 것입니다.</p>
									</div>
									<div class="p_wrap type02">
										<p>​우리는 비즈니스 진화론자입니다.</p>
										<p>많은 것을 시도할 것이며, 그중 잘되는 것에 집중할 것입니다.</p>
									</div>
									<div class="p_wrap type02">
										<p>studio X는 흥미 진진한 이야기를 들려드릴 것입니다.</p>
									</div>
								</div>
								<div class="btn_area">
									<a href="#" class="btn">문의하기</a>
								</div>
						</div>
					</div>
				 </div>
				<div class="about_con2">
					<div class="boxads_bg">
						<div class="boxads_con_wrap">
							<div class="boxads_con01">
								<div class="boxads_tit">
									<h4>박스애드(BoxAds) 서비스 배경</h4>
								</div>
								<div class="btn_area pc">
									<a href="${path}/main" class="btn">마켓 바로가기</a>
								</div>
							</div>	
							<div class="boxads_con02">
								<div class="p_box">
									<div class="p_wrap">
										<p>박스애드는 중소기업, 스타트업 회사의 마케팅/홍보를 위한 신개념 광고 중개 플랫폼 입니다.</p>
										<p>우수한 제품, 서비스를 만들었지만 브랜드 인지도가 낮아 어려움을 겪고 있고, 전국에 있는 타겟 고객에게 </p>
										<p>직접 마케팅을 하고 싶은 바램과 경험을 바탕으로 출발하였습니다.</p>
									</div>
									<div class="p_wrap">
										<p>박스애드는 대부분 중소규모인 쇼핑몰 판매자의 제품 배송 택배상자에 저렴하고 효율적 홍보가 필요한 </p>
										<p>중소 광고주의 전단지/샘플을 간편하게 넣어 전국으로 100% 배포할 수 있는 광고 중개 서비스를 제공합니다.</p>
									</div>
									<div class="p_wrap">
										<p>신규 고객이 필요한 중소기업, 스타트업 광고주와 신규 수익이 도움이 되는 중소 쇼핑몰 판매자 모두 </p>
										<p>win-win하는 진정한 공유경제 모델을 실현합니다.</p>
									</div>
								</div>
							</div>
							<div class="btn_area mo">
								<a href="#" class="btn">마켓 바로가기</a>
							</div>
						</div>
					</div>
				</div>
				<div class="about_con3">
					<div class="boxads_goal">
						<div class="g_tit">
							<h3>BoxAds 목표</h3>
						</div>
						<div class="g_s_tit">박스애드는 온라인쇼핑몰과 택배물류 산업위에 기업광고를 결합하여 새로운 O2O 시장을 개척해나갈 것입니다.</div>
						<div class="goal_lr_wrap">
							<div class="goal_l_wrap">
								<p class="line_p">국내 온라인쇼핑 시장 (2018년)</p>
								<div class="goal_l">
									<img src="../images/etc/about_goal_bg01.png" alt="온라인쇼핑 택배물동량 19.4% 11.0% 급성장 성장 택배 연 25억개 (1인당 92.2개)">
								</div>
							</div>
							<div class="goal_r_wrap">
								<p class="line_p">글로벌 B2B광고중개플랫폼 진출</p>
								<div class="goal_r">
									<img src="../images/etc/about_goal_bg02.png" alt="1.중국 19.4% 2. 미국 18.6% 3. 영국 4.5% 4. 일본 3.7% 5. 한국 3.3% 6. 독일 2.6% 2018년 이커머스 매출 TOP6">									
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="about_con3 type02">
					<div class="roadmap">
						<div class="g_tit">
							<h3>서비스 Roadmap</h3>
						</div>
						<div class="g_s_tit">박스애드는 중소기업(광고주)과 온라인쇼핑몰 셀러(판매자)를 위한 광고 중개, 그 이상의 꿈을 함께 만들어 갑니다.</div>
						<div class="img_wrap pc">
							<img src="../images/etc/roadmap_con_bg.png" alt="step 01 서비스 런칭 전단 광고 상품 중개 서비스  step 02 디자인 대행런칭 전단 디자인 대행 서비스 크몽, 리우드소싱,오투잡 제휴 step03 택배 용품 판매 택배 용품 공구물 서비스 택배 박스, 테이프, 포장제 공동구매 테이프, 포장제 광고상품 도입 step 04 Ad Book & Sample Box · 광고주 프로모션 모음 책과 배포 무료샘플 큐레이션 박스 구독 서비스 step05 글로벌 출시">
						</div>
						<div class="img_wrap mo">
							<img src="../images/etc/about_2_03_mo.png" alt="step 01 서비스 런칭 전단 광고 상품 중개 서비스  step 02 디자인 대행런칭 전단 디자인 대행 서비스 크몽, 리우드소싱,오투잡 제휴 step03 택배 용품 판매 택배 용품 공구물 서비스 택배 박스, 테이프, 포장제 공동구매 테이프, 포장제 광고상품 도입 step 04 Ad Book & Sample Box · 광고주 프로모션 모음 책과 배포 무료샘플 큐레이션 박스 구독 서비스 step05 글로벌 출시">
						</div>
					</div>
				</div>
				<div class="about_con3 type03">
					<div class="team_ad">
						<div class="g_tit">
							<h3>Team 소개</h3>	
						</div>
						<div class="g_s_tit">우리는 검증된 기술력으로 미래를 만들어가는 " LAST MOVER " 입니다</div>
						<div class="team_mem">
							<ul>
								<li>
									<div class="img_wrap">
										<div class="img_box t01">
											김정석
										</div>
									</div>
									<div class="p_box">
										<p class="name">김정석</p>
										<p>business coordinator</p>
										<p>CEO</p>
									</div>
								</li>
								<li>
									<div class="img_wrap">
										<div class="img_box t02">
											최종인
										</div>
									</div>
									<div class="p_box">
										<p class="name">최종인</p>
										<p>Fintech, FIDO secuity</p>
										<p>기술이사</p>
									</div>
								</li>
								<li>
									<div class="img_wrap">
										<div class="img_box t03">
											김상수
										</div>
									</div>
									<div class="p_box">
										<p class="name">김상수</p>
										<p>S/W Programmer</p>
										<p>책임 연구원</p>
									</div>
								</li>
								<li>
									<div class="img_wrap">
										<div class="img_box t04">
											김이정
										</div>
									</div>
									<div class="p_box">
										<p class="name">김이정</p>
										<p>Graphic Designer</p>
										<p>책임 연구원</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>

		<!-- 이용안내 끝 -->
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
</body>
</html>