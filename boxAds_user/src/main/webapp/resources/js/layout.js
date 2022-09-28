$(document).ready(function () {

	/* gnb_메시지·알람 탭버튼 */
	$('.over_wrap .over_tab .btn').on('click',function(){
		
		var $overIndex = $(this).index();

		$('.over_wrap .over_tab .btn').removeClass('on');
		$('.over_wrap .tab_content').hide();
		$(this).addClass('on');
		$('.over_wrap .tab_content#overTab'+$overIndex).fadeIn();
	});

	$('.top_right > ul > li').each(function(){	
		$(this).mouseover(function() {
			$(this).addClass('_on');
		});
		$(this).mouseout(function() {
			$(this).removeClass('_on');
		});
	});
	
	var bannerSwiper = new Swiper('.banner_slide .swiper-container', {
		spaceBetween: 0,
		speed:1200,
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		autoplay:{
			delay: 4000,
		},
	});

	$(".banner_slide .swiper_util .btn").on('click',function(){
		if ($(this).hasClass('stop')) {
			$(this).removeClass('stop');
			bannerSwiper.autoplay.start();
		} else {
			$(this).addClass('stop');
			bannerSwiper.autoplay.stop();
		}
	});
	$("#promo .promo_close").on('click',function(){
		
		$("#promo").removeClass('active');
		$("#wrap").removeClass('promo_on');
	});

	if ($("#promo").length > 0){
		
		$("#wrap").addClass('promo_on');
		
		/*var promolslider = new Swiper('.promo_slider', {
			 loop: true,
			pagination: {
				el: '.promo-pager',
				clickable: true,
				renderBullet: function (index, className) {
			//	  return '<span class="' + className + '">' + '0'+(index + 1) + '</span>';
		
		//	 return '<span class="' + className + '">' + String(index + 1).padStart(2, '0') + '</span>';
			 return '<span class="' + className + '">' + pad(index + 1,2) + '</span>';
					},
			
				},
				navigation: {
				nextEl: '.promo_btn_next',
				prevEl: '.promo_btn_prev',
				},
				autoplay:{
					delay: 4000,
				},
		});*/
		
	}
	
	$("#promo .promo_close").on('click',function(){
		
		$("#promo").removeClass('active');
		$("#wrap").removeClass('promo_on');
	});


	var gnbSwiper = new Swiper('.mobile_gnb .swiper-container', {
		slidesPerView: 'auto',
		cssWidthAndHeight: true,
		spaceBetween: 34,
		freeMode: true,
    });

	/* 메인페이지 리스트 탭 */
	$(".content_area .tab_btn .btn").on('click',function(){
		var $mt = $(this).index();
		$(".content_area .tab_btn .btn").removeClass('on');
		$(".content_area .main_tab_content").hide();
		$(this).addClass('on');
		$(".content_area .main_tab_content#mainTab" + $mt).fadeIn();
	});


	/* 메뉴닫기 */
	$('#aside_menu .aside_bg').on('click',function(){
		$('#aside_menu').fadeOut(300);
		$('.aside_wrap').animate({
			right : '-500px'
		}, 300);
	});

	/* aside 토글*/
	$('.aside_wrap .aside_list .depth a').on('click',function(){
		$(this).toggleClass('on');
		$(this).siblings('.depth2').stop().slideToggle(300);
	});

	/* 공통 플로팅 버튼 */
	$('.floatingBtnWrap').hide();
	floatingBtn();

	/*모달 창 닫기 */
	$(".layerpopup .btn_close").on("click", function () {
		$(this).closest(".layerpop-box").removeClass("open");
		//$(".layerpop-box ").removeClass("open");
		$('html').css({'overflow': 'auto', 'height': '100%'}); //scroll hidden 해제		
		});
	
	//가이드 텝
	$(' .guide_tab li a').bind('touchend, click', function () {
			$li=$(this).closest("li");
			$ul = $(this).closest("ul");
			$tab = $(this).closest(".tab");
			$tabconts = $tab.next(".tab_con_wrap")

			var length = $ul .children().length+1 ;
			var idx = $li.index();
				$li.addClass('active').siblings().removeClass('active');
				$tabconts.find('.tab_con').eq(idx).show().siblings().hide();
				
	});
});

function floatingBtn() {
    var el;

    el = $('.floatingBtnWrap');

    if (el.length <= 0) {
        return;
    }

    $(window).on('scroll.floatingBtnWrap, resize.floatingBtnWrap', function () {
        var $footer = $('#footer'),
            $fbw = $('.floatingBtnWrap'),
            winScrT = $(window).scrollTop(),
            totH = winScrT + $(window).height(),
            footerTop = $footer.offset().top,
            pos = totH - footerTop;

        if (winScrT > 300) {
            $fbw.fadeIn()
        } else {
            $fbw.fadeOut()
        }

        //위치
        if (totH >= footerTop) {
            $fbw.css({
                'position': 'absolute',
                //'bottom': pos+'px',
                'bottom': 'auto',
                'top': '-50px'
            });
//			console.log(pos);
        } else {
            $fbw.css({
                'position': 'fixed',
                'bottom': '50px',
                'top': 'auto'
            })
        }
    });

    $(document).on('click', '.floatingBtn .ftTop', function (e) {
        e.preventDefault();
        $("html, body").animate({scrollTop: 0}, 'slow');
    });

}

function btn_menu_open() {
	$('#aside_menu').fadeIn(100);
	$('.aside_wrap').animate({
		right : '0'
	}, 500);
	$("html, body").css({"overflow":"hidden", "height":"100%"});
}
function btn_menu_close() {
	$('#aside_menu').fadeOut(300);
	$('.aside_wrap').animate({
		right : '-500px'
	}, 300);
	$("html, body").css({"overflow":"auto", "height":"auto"});
}
/*모달창 오픈*/
function modal_open(el){
$('#'+ el).addClass("open");
$('html').css({'overflow': 'hidden', 'height': '100%'}); // 모달팝업 중 html의 scroll을 hidden시킴
}

function pad(n, width) {
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
}

function inputTextDel(selector){
	$(":text[name="+selector+"]").val("")
}

$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			prevText: '이전 달',
			nextText: '다음 달',
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			showMonthAfterYear: true,
			yearSuffix: '년',
			autoclose: true,
		  });

		  $(function() {
			$("#datepicker1, #datepicker2,#datepicker3,#datepicker4").datepicker();
		  });

		  

var UI = {

snsOpen : function(){

	$(".btn_share").on("click", function(){
		$(this).closest(".btn_share_wrap").find('.share_box').toggleClass('open');
	});
	$(".share_box .sns_close").on("click", function(){
		$(this).closest(".share_box").removeClass('open');
	});
    
   },

GuideTab : function(){

	$(' .tab li a').bind('touchend, click', function () {
			$li=$(this).closest("li");
			$ul = $(this).closest("ul");
			$tab = $(this).closest(".tab");
			$tabconts = $tab.next(".tab-content_wrap")

			var length = $ul .children().length+1 ;
			var idx = $li.index();
				$li.addClass('active').siblings().removeClass('active');
				$tabconts.find('.tab-content').eq(idx).show().siblings().hide();
				
	});
   },





}
