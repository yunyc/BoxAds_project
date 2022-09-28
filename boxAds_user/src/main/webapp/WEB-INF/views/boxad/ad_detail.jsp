<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/js/order.js"></script>
<script type="text/javascript">
	if('${login.idx}' != '${adList.writer}' && '${adList.state}' == 'P'){
		if(confirm("일시 중지 된 상품입니다. 해당 판매자의 다른 상품을 보시겠습니까?")){
			location.href="/search_list?searchKeyword=${adList.name}";
		} else {
			history.back();	
		} 
	} else if('${login.idx}' != '${adList.writer}' && '${adList.state}' == 'E'){
		if(confirm("판매 종료 된 상품입니다. 해당 판매자의 다른 상품을 보시겠습니까?")){
			location.href="/search_list?searchKeyword=${adList.name}";
		} else {
			history.back();	
		} 
	}
	
</script>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
		<%-- <c:forEach items="${adList}" var="adList">
			<c:if test="${adList.idx eq param.idx}"> --%>
			<input type="hidden" class="favFlag" value="${adList.favFlag}"/>
			<c:set value="${adList.pCIdx}" var="adCidx"/>
			<div class="sub_wrap view_wrap">
				<div class="left_cnt">
					<div class="">
						<div class="path">
							<ul>
								<li>홈</li>
								<li>애드(Ads)</li>
								<li>광고 상세소개</li>
							</ul>
						</div>
						<h2 class="title mobileonly">광고 상세소개</h2>
						<div class="pic_area">
							<div class="swiper-container gallery-top">									
								<ul class="swiper-wrapper">
									<c:forEach items="${fileList}" var="repList">
									<c:if test="${repList.type eq 'A'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${repList.url});">
										</div>
									</li>
									</c:if>
									</c:forEach>
								<c:forEach items="${fileList}" var="fileList">
									<c:if test="${fileList.type eq 'D'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${fileList.url});">
										</div>
									</li>
									</c:if>
									</c:forEach>
								</ul>
								<div class="gallery-pager"></div>
							</div>
							
							<div class="swiper-container gallery-thumbs">
								<ul class="swiper-wrapper">
									<c:forEach items="${fileList}" var="repList">
									<c:if test="${repList.type eq 'A'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${repList.url});">
										</div>
									</li>
									</c:if>
									</c:forEach>
								<c:forEach items="${fileList}" var="fileList">
									<c:if test="${fileList.type eq 'D'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${fileList.url});">
										</div>
									</li>
									</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="right_part">
							<div class="prd_detail">
								<div class="prd_top">
									<div class="btn_area">
										<c:import url="/WEB-INF/views/boxad/sns_share.jsp"/>
										
										<div class="pos_right">
											<button id="wish" type="button">
											<i <c:if test="${adList.favFlag eq 'Y'}">style="background-image:url(../images/main/ico_like_on.png); 
																							background-size:cover;"</c:if> class="ico_like"></i>
											<span>찜하기</span></button>
											<span class="cnt">${adList.favCnt}</span>
										</div>
									</div>
								</div>
								<div class="prd_title">
									${adList.title}
								</div>
								<div class="prd_info_wrap front_box">
									<div class="goods_info">
										<div class="sort">
											<em class="sort_tit">카테고리</em>
											<div class="data">
												<span>${adList.fir}</span>
											</div>
										</div>
									</div>
									<div class="prd_info_box">
										<dl>
											<dt>타겟 연령</dt>
											<dd>${adList.ctmAge}</dd>
										</dl>
										<dl>
											<dt>타겟 성별</dt>
											<dd>${adList.ctmGender}</dd>
										</dl>
										<dl>
											<dt>타겟 유형</dt>
											<dd>${adList.ctmType}</dd>
										</dl>
										<dl>
											<dt>홍보 웹페이지</dt>
											<dd><a target="_blank" href="${adList.url}">${adList.url}</a></dd>
										</dl>
										<dl>
											<dt>광고 기간</dt>
											<dd>${fn:substring(adList.adStartDate, 2, 10)} ~ ${fn:substring(adList.adEndDate, 2, 10)}</dd>
										</dl>
										<dl>
											<dt>광고 유형</dt>
											<dd>${adList.secPro} ${adList.thrPro}</dd>
										</dl>
									</div>
									<div class="cnt_box">
										<div class="cnt_table">
											
											<dl>
												<dt>광고 신청 건수</dt>
												<dd><strong class="color_txt"><fmt:formatNumber value="${adList.odCnt}" pattern="#,###" /></strong> 개</dd>
											</dl>
										</div>
									</div>
									<div class="prd_desc">
										<p>${adList.intro}</p>
									</div>

									<div class="payment_wrap type2">
										<div class="click_on">
											<div class="btn_top">
												<button class="btn">더보기</button>
											</div>
											<div class="num_wrap">
												<div class="cnt_box">
													<div class="select_wrap">
														<dl>
															<dt>박스(BOX) 선택	<a href="javascript:modal_open('guide01');" class="btn_guide"><span>광고유형 가이드</span></a></dt>
															<dd>
																<select id="select_box" name="select_box" title="박스(BOX) 선택" >
																	<option value="0">선택하세요</option>
																</select>
																<p>※ 광고를 동봉하여 소비자에게 배포할 박스 상품을 선택해주세요.</p>
															</dd>
														</dl>
													</div>
												</div>
											</div>
										</div>
										<div class="btn_area_fixed">
											<div class="btn_area ">
												<button class="btn btn_order" type="button" onclick="validOrderAd()">광고 신청</button>	
												<!--품절 -->
												<!--
												<button class="btn soldout">품절</button>
												-->
												<!--품절 -->
												<a href="../member/message_detail?writer=${login.idx}&receiver=${adList.writer}" class="btn btn_ask mobileonly">문의</a>
											</div>
										</div>
									</div>
								</div>
								
								<div class="company_info front_box">
									<div class="company_info_top">
										<div class="profile_img">
											<img src="${path}${adList.profile}" alt="업체명">
										</div>
									</div>
									<div class="profile_title">
										<p class="company_name">${adList.name}</p>
										<p class="site_url"><a href="${adList.siteUrl}" target="_blank">${adList.siteUrl}</a></p>
									</div>
									<div class="company_desc">
										<p>${adList.memIntro}</p>
									</div>
									<div class="btn_area">
										<a href="../member/message_detail?writer=${login.idx}&receiver=${adList.writer}" class="btn btn_ask" >문의하기</a>
									</div>
								</div>
							</div>
							<div class="link_wrap pconly">
								<a href="javascript:history.back();" class="btn_list">목록보기</a>
							</div>
						</div>
						<div class="prd_info_wrap">
							<div class="floating-menu">
								<ul class="tab_pro">
									<li class="m active"><a href="#tab1">상세소개</a></li>
									<li class="m "><a href="#tab2">광고주의 다른 상품</a></li>
								</ul>
							</div>
							<div class="tab_content_wrap">
								<div class="tab_content scroll" id="tab1">
									<div class="description">
									상세소개 내용
									<div>
										${adList.content}
									</div>
									</div>
								</div>
								<div class="tab_content scroll" id="tab2">
									<div class="other_items">
										<p class="tit">광고주의 다른 상품 <span>총 <strong>${adCnt}</strong>개</span></p>
										<div class="main_tab_content" >
											<div class="items_slider swiper-container">
												<ul class="ads_list swiper-wrapper">
												<c:forEach items="${ads}" var="ads">
													<c:if test="${ads.idx ne param.idx}">
													<li class="swiper-slide">
														<div class="list_top">
															<div class="img_area">
																<a href="${path}/ad/detail?idx=${ads.idx}&writer=${ads.writer}"><img src="${path}${ads.fileName}" alt="애드(ads) 리스트 이미지">
																<span></span></a>
															</div>
															<div class="info_area">
																<!-- <a href="#"> -->
																	<div class="img_area"><img src="${path}${ads.profile}" alt="애드(ads) 등록 프로필"></div>
																	<p>${ads.name}</p>
																<!-- </a> -->
															</div>
															<div class="like_area">
																<input type="checkbox" name="favIdx" id="ad_like${ads.idx}" value="${ads.idx}" data-type="A" <c:if test="${ads.favFlag eq 'Y'}">checked</c:if>>
																<label for="ad_like${ads.idx}" class="chk">좋아요</label>
															</div>
														</div>
														<div class="list_content">
															<div class="goods_info">
																<p class="sort">${ads.secPro} ${ads.thrPro}</p>
																<!--  <span class="soldout">품절</span>--><!-- 품절시 soldout class추가 -->
															</div>
															<div class="list_title">
																<a href="${path}/ad/detail?idx=${ads.idx}&writer=${ads.writer}">${ads.title}</a>
															</div>
															<dl>
																<dt>카테고리</dt>
																<dd><p>${ads.fir}</p></dd>
															</dl>
															<dl>
																<dt>광고기간</dt>
																<dd><strong class="roboto">${ads.adStartDate} ~ ${ads.adEndDate}</strong></dd>
															</dl>
															<div class="list_sub_info">
																<span class="like"><i>좋아요 아이콘</i><strong class="roboto">${ads.favCnt}</strong></span>
																<span><strong class="roboto">${ads.viewCnt}</strong>개의 조회</span>
															</div>
														</div>
													</li>
													</c:if>
													</c:forEach>
												</ul>
											</div>
											<c:if test="${adCnt > 0}">
												<div class="item_pager">
													<button type="button" class="item_btn_prev"></button>
													<button type="button" class="item_btn_next"></button>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="company_info front_box">
								<div class="company_info_top">
									<div class="profile_img">
										<img src="${path}${adList.profile}" alt="업체명">
									</div>
								</div>구매
								<div class="profile_title">
									<p class="company_name">${adList.name}</p>
									<p class="site_url"><a href="${adList.siteUrl}">${adList.siteUrl}</a></p>
								</div>
								<div class="company_desc">
									<p>${adList.memIntro}</p>
								</div>
							</div>
						</div>
						<div class="link_wrap mobileonly">
							<a href="javascript:history.back();" class="btn_list">목록보기</a>
						</div>
					</div>
				</div>
				
			</div>
		<%-- 	</c:if>
		</c:forEach> --%>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<c:import url="/WEB-INF/views/inc/product_guide.jsp"/>
	
<script>
	$(function() {
			
			if ('${login.idx}' != '' && $("#select_box option").length == 1) {
				var obj = {writer: '${login.idx}'};

				$.post("${path}/ad/select_box", obj, function(data) {

					$.each(data.boxList, function(i, item) {
						var element = '<option value="' + item.idx + '" data-cidx="' + item.pCIdx + '" data-cnt="' + item.boxCnt + '"' + '>' + item.title + '</option>'

						$("#select_box").append(element);
					});
					
				});
			}
	});
</script>
<script>
/*슬라이드 */

var galleryThumbs = new Swiper('.gallery-thumbs', {
  spaceBetween: 20,
    touchRatio: 0,
  slidesPerView: 5,
  freeMode: true,
  watchSlidesVisibility: true,
  watchSlidesProgress: true,
});
var galleryTop = new Swiper('.gallery-top', {
//   spaceBetween: 10,
effect: 'fade',
/*
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },*/
   pagination: {
    el: '.gallery-pager',
    clickable: true,
  },
  thumbs: {
    swiper: galleryThumbs
  }
});

 var itemswiper = new Swiper('.items_slider', {
slidesPerView: 'auto',
  spaceBetween: 25,

  freeMode: true,
   navigation: {
    nextEl: '.item_btn_next',
    prevEl: '.item_btn_prev',
  },
});

/*스크롤 메뉴 */

var $menu = $('.floating-menu.type02 li.m'), 
$contents = $('.scroll'), 
$doc = $('html, body');

//해당 섹션으로 스크롤 이동

$menu.on('click','a', function(e){ 
   
	var $target = $(this).parent(), 
	idx = $target.index(), 
	section = $contents.eq(idx);
	offsetTop = section.offset().top;
	
	if ($('.payment_wrap.type2').css("position") == "fixed")
		{
		 offsetTop = section.offset().top -30 ; 
		}else{
		
		 offsetTop = section.offset().top - 56; 
		}
	

	$doc.stop() 
		.animate({ 
			scrollTop :offsetTop
			}, 800);
			
		return false; 
		

	});

//menu class 추가 
$(window).scroll(function(){ 

var scltop = $(window).scrollTop();
	$.each($contents, function(idx, item){ 
		var $target = $contents.eq(idx), 
		i = $target.index(), 
		targetTop = $target.offset().top; 
	//	console.log('targetTop:'+i + ":"+targetTop);
		if ($('.payment_wrap.type2').css("position") == "fixed")
		{
		targetTop =	targetTop - 70;
		}else{
		
		targetTop =	targetTop - 70;
		}
		if($target == 2){
			$contents.eq(idx)
		}
		if (targetTop <= scltop) { 
			$menu.removeClass('active'); 
			$menu.eq(idx).addClass('active');
			//console.log(idx);
		} 
		
		console.log(targetTop,scltop,idx)
		if (!(200 <= scltop)) { 
			$menu.removeClass('active'); } 
		if ((900 <= scltop)) { 
			$('.floating-menu').addClass('fixed');
			$('#header').addClass('st');
			console.log('fixed');
			} 
			
			else{
					if($(".floating-menu").hasClass("fixed")){
						
						$('.floating-menu').removeClass('fixed');
						$('#header').removeClass('st')
					
					} 
				}			
		}) 				
	});
	
// 공유버튼 클릭 

	$(".btn_share").on("click", function(){
		$(this).closest(".btn_share_wrap").find('.modal-bg2').toggleClass('open');
		$(this).closest(".btn_share_wrap").find('.mobile_url input').select(); 
	});
// 공유하기 닫기 
	$(".share_box .sns_close").on("click", function(){
		$(this).closest(".modal-bg2").removeClass('open');
	});

// 광고 신청 클릭 
	$('.btn_area_fixed .btn_order').on('click', function () {

		if ($('.payment_wrap.type2').css("position") == "fixed"){  // 모바일 상태이면 

			$('.payment_wrap .click_on').fadeIn('fast'); // 박스 선택창 보여주기 
		
		}else {
		// 모바일 상태가 아니면 진행할 부분 


		}
			
	});
// 모바일에서 광고 선택 창 닫기 		
	$('.payment_wrap .btn_top .btn').on('click', function () {
		
			$('.payment_wrap .click_on').fadeOut('fast');
		
	});

var adIdx = "${param.idx}";
var adCidx = "${adCidx}";
var boxIdx;

var type = "A";
var favIdx = "${param.idx}";

</script>
 
</body>
</html>