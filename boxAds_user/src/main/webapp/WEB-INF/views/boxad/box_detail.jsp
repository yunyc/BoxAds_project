<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	if('${login.idx}' != '${boxList.writer}' && '${boxList.state}' == 'P'){
		if(confirm("일시 중지 된 상품입니다. 해당 판매자의 다른 상품을 보시겠습니까?")){
			location.href="/search_list?searchKeyword=${boxList.name}";
		} else {
			history.back();	
		} 
	} else if('${login.idx}' != '${boxList.writer}' && '${boxList.state}' == 'E'){
		if(confirm("판매 종료 된 상품입니다. 해당 판매자의 다른 상품을 보시겠습니까?")){
			location.href="/search_list?searchKeyword=${boxList.name}";
		} else {
			history.back();	
		} 
	}
	
</script>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
	<%-- <c:forEach items="${boxList}" var="boxList">
		<c:if test="${boxList.idx eq param.idx}"> --%>
		<input type="hidden" class="favFlag" value="${boxList.favFlag}"/>
		<div id="container">
			<div class="sub_wrap view_wrap">
				<div class="left_cnt">
					<div>
						<div class="path">
							<ul>
								<li>홈</li>
								<li>박스(Box)</li>
								<li>${boxList.secCtg}</li>
							</ul>
						</div>
						<h2 class="title mobileonly">박스 상세</h2>
						
						<div class="pic_area">
							<div class="swiper-container gallery-top">
								<ul class="swiper-wrapper">
								<c:forEach items="${fileList}" var="repList">
									<c:if test="${repList.type eq 'E'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${repList.url});">
										</div>
									</li>
									</c:if>
									</c:forEach>
								<c:forEach items="${fileList}" var="fileList">
									<c:if test="${fileList.type eq 'I'}">
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
									<c:forEach items="${fileList}" var="ImgList">
									<c:if test="${ImgList.type eq 'E'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${ImgList.url});">
										</div>
									</li>
									</c:if>
									</c:forEach>
									<c:forEach items="${fileList}" var="varImgList">
									<c:if test="${varImgList.type eq 'I'}">
									<li class="swiper-slide">
										<div class="img_box" style="background-image: url(${path}${varImgList.url});">
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
											<i <c:if test="${boxList.favFlag eq 'Y'}">style="background-image:url(../images/main/ico_like_on.png); 
																							background-size:cover;"</c:if> class="ico_like"></i>
											<span>찜하기</span></button>
											<span class="cnt">${boxList.favCnt}</span>
										</div>
									</div>
								</div>
								
								<div class="prd_title">
									<c:out value="${boxList.title}"/>
								</div>
								<div class="goods_info">
										<div class="sort">
											<em class="sort_tit">카테고리</em>
											<div class="data">
												<span>${boxList.secCtg}&gt;${boxList.thrCtg}</span>
											</div>
										</div>
									</div>
								<div class="prd_info_wrap front_box">
									
									<div class="prd_info_box">
										<dl>
											<dt>고객 연령</dt>
											<dd><c:out value="${boxList.ctmAge}"/></dd>
										</dl>
										<dl>
											<dt>고객 성별</dt>
											<dd><c:out value="${boxList.ctmGender}"/></dd>
										</dl>
										<dl>
											<dt>고객 유형</dt>
											<dd><c:out value="${boxList.ctmType}"/></dd>
										</dl>
										<dl>
											<dt>평균 주문액</dt>
											<dd><c:out value="${boxList.avgPrice}"/>원</dd>
										</dl>
										<dl>
											<dt>상품 웹페이지</dt>
											<dd><a href="${boxList.url}" target="_blank"><c:out value="${boxList.url}"/></a></dd>
										</dl>
										<dl>
											<dt>광고유형</dt>
											<dd>${boxList.secPro} ${boxList.thrPro}</dd>
										</dl>
										<dl>
											<dt>구매가능 수</dt>
											<dd><c:out value="${boxList.pdtCnt}"/>개 (총 ${boxList.totalCnt}장)</dd>
										</dl>
										<dl>
											<dt>판매 월</dt>
											<dd><c:out value="${boxList.sellDate}"/></dd>
										</dl>
									</div>
									<div class="cnt_box">
										<div class="cnt_table">
											<dl>
												<dt>박스 수</dt>
												<dd><strong>
												<fmt:formatNumber value="${boxList.boxCnt}" pattern="#,###" /></strong> 개</dd>
											</dl>
											<dl>
												<dt>광고비</dt>
												<dd><strong class="color_txt"><fmt:formatNumber value="${boxList.adPrice}" pattern="#,###" /></strong> 원 <p>(${boxList.unit}원/개당)</p></dd>
											</dl>
										</div>
									</div>
									<div class="prd_desc">
										<p><c:out value="${boxList.intro}"/></p>
									</div>
									
									<c:if test="${boxList.state eq 'Y'}">
										<div class="btn_area_fixed btn_area_fixed">
											<div class="btn_area ">
												<c:choose>
													<c:when test="${boxList.soldOutFlag eq 'Y'}">
														<!--품절 -->
														<button class="btn soldout">품절</button>
													</c:when>
													<c:otherwise>
														<a href="../order/order_box?idx=${boxList.idx}" class="btn btn_order">구매하기</a>	
													</c:otherwise>
												</c:choose>
												<a href="../member/message_detail?writer=${login.idx}&receiver=${boxList.writer}" class="btn btn_ask mobileonly">문의</a>
											</div>
										</div>									
									</c:if>
									
									
								</div>
									
								<div class="guard_box">
									<div class="mark"><img src="../images/shop/ico_guard.png" alt="guard 아이콘"></div>
									<div class="txt">박스애드(BoxAds)를 통해 결제하면 거래 완료시까지 결제 대금을 안전하게 보호 받을 수 있습니다.</div>
								</div>
								
								<div class="company_info front_box">
									<div class="company_info_top">
										<div class="profile_img">
											<img src="${path}${boxList.profile}" alt="업체명">
										</div>
									</div>
									<div class="profile_title">
										<p class="company_name">${boxList.name}</p>
										<p class="site_url"><a href="${boxList.siteUrl}" target="_blank">${boxList.siteUrl}</a></p>
									</div>
									<div class="company_desc">
										<p>${boxList.mIntro}</p>
									</div>
									<div class="btn_area">
										<a href="../member/message_detail?writer=${login.idx}&receiver=${boxList.writer}" class="btn btn_ask" >문의하기</a>
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
									<li class="m"><a href="#tab2">취소/환불 규정</a></li>
									<li class="m "><a href="#tab3">판매자의 다른 상품</a></li>
								</ul>
							</div>
							<div class="tab_content_wrap">
								<div class="tab_content scroll" id="tab1">
									<div class="description">
									상세소개 내용
										<div>
										${boxList.content}
										</div>
									</div>
									
								</div>
								<div class="tab_content scroll" id="tab2">
									<div class="description refund">
										취소/환불 규정 내용
										<div>
										${terms.content}
										</div>
									</div>
								</div>
								<div class="tab_content scroll" id="tab3">
									<div class="other_items">
										<p class="tit">판매자의 다른 상품 <span>총 <strong>${boxCnt}</strong>개</span></p>
										<div class="main_tab_content" >
											<div class="items_slider swiper-container">
												<ul class="swiper-wrapper">
												<c:forEach items="${boxes}" var="boxes">
													<c:if test="${boxes.idx ne param.idx}">
													<li class="swiper-slide">
														<div class="list_top">
															<div class="img_area">
																<a href="${path}/box/detail?idx=${boxes.idx}&writer=${boxes.writer}"><img src="${path}${boxes.fileName}" alt="박스(box) 리스트 이미지">
																<span></span></a>
															</div>
															<div class="info_area">
																<!-- <a href="#"> -->
																	<div class="img_area"><img src="${path}${boxes.profile}" alt="박스(box) 등록 프로필"></div>
																	<p>${boxes.name}</p>
																<!-- </a> -->
															</div>
															<div class="like_area">
																<input type="checkbox" name="favIdx" id="bx_like${boxes.idx}" value="${boxes.idx}" data-type="B" <c:if test="${boxes.favFlag eq 'Y'}">checked</c:if>>
																<label for="bx_like${boxes.idx}" class="chk">좋아요</label>
															</div>
														</div>
														<div class="list_content">
															<div class="goods_info">
																<p class="sort">${boxes.secCtg}&gt;${boxes.thrCtg}</p>
																<c:if test="${boxes.soldOutFlag eq 'Y'}">
																<span class="soldout">품절</span><!-- 품절시 soldout class추가 -->
																</c:if>
															</div>
															<div class="list_title">
																<a href="${path}/box/detail?idx=${boxes.idx}&writer=${boxes.writer}">${boxes.title}</a>
															</div>
															<dl>
																<dt>판매 월</dt>
																<dd><strong class="roboto">${boxes.sellDate}</strong></dd>
															</dl>
															<dl>
																<dt>박스 수</dt>
																<dd><strong class="roboto"><fmt:formatNumber value="${boxes.boxCnt}" pattern="#,###" /></strong> 개</dd>
															</dl>
															<dl>
																<dt>광고비</dt>
																<dd><strong class="roboto"><fmt:formatNumber value="${boxes.adPrice}" pattern="#,###" /></strong> 원 <span>(1원/개당)</span></dd>
															</dl>
															<div class="list_sub_info">
																<span class="like"><i>좋아요 아이콘</i><strong class="roboto">${boxes.favCnt}</strong></span>
																<span><strong class="roboto">${boxes.viewCnt}</strong>개의 조회</span>
															</div>
														</div>
													</li>
													</c:if>
													</c:forEach>
												</ul>
											</div>
											<c:if test="${boxCnt > 0}">
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
										<img src="${path}${boxList.profile}" alt="업체명">
									</div>
								</div>구매
								<div class="profile_title">
									<p class="company_name">${boxList.name}</p>
									<p class="site_url"><a href="${boxList.siteUrl}">${boxList.siteUrl}</a></p>
								</div>
								<div class="company_desc">
									<p>${boxList.intro}</p>
								</div>
							</div>
							
						</div>
						<div class="link_wrap mobileonly">
							<a href="javascript:history.back();" class="btn_list">목록보기</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		<%-- </c:if>
		</c:forEach> --%>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
<script>
/*슬라이드 */

    var galleryThumbs = new Swiper('.gallery-thumbs', {
      spaceBetween: 0,
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

var $menu = $('.floating-menu li.m'), 
	$contents = $('.scroll'), 
	$doc = $('html, body');

// 해당 섹션으로 스크롤 이동

$menu.on('click','a', function(e){ 
	   
		var $target = $(this).parent(), 
		idx = $target.index(), 
		section = $contents.eq(idx);
		
		
		if ($('.btn_area_fixed').css("position") == "fixed")
			{
			 offsetTop = section.offset().top - 35; 
			}else{
			
			 offsetTop = section.offset().top - 56; 
			}
		

		$doc.stop() 
			.animate({ 
				scrollTop :offsetTop
				}, 800);
				
			return false; 
			

		});

// menu class 추가 
$(window).scroll(function(){ 
	
	var scltop = $(window).scrollTop();
//	console.log('top:'+ scltop);
		$.each($contents, function(idx, item){ 
			var $target = $contents.eq(idx), 
			i = $target.index(), 
			targetTop = $target.offset().top; 
		//	console.log('targetTop:'+i + ":"+targetTop);
			if ($('.btn_area_fixed').css("position") == "fixed")
			{
			targetTop =	targetTop - 70;
			}else{
			
			targetTop =	targetTop -56;
			}
			if (targetTop <= scltop) { 
				$menu.removeClass('active'); 
				$menu.eq(idx).addClass('active');
			//	console.log(idx + 'active');
			} 
			
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


	$(".btn_share").on("click", function(){
		$(this).closest(".btn_share_wrap").find('.modal-bg2').toggleClass('open');
		$(this).closest(".btn_share_wrap").find('.mobile_url input').select(); 
	});
	$(".share_box .sns_close").on("click", function(){
		$(this).closest(".modal-bg2").removeClass('open');
	});

	var type = "B";
	var favIdx = "${param.idx}";
  </script>
</body>
</html>