function PopupCenter(url, title, w, h) {
    // Fixes dual-screen position                         Most browsers      Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : window.screenX;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : window.screenY;

    var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, title, 'scrollbars=no, location=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
}
function popup_layer(a_tag) {
	var $iframe = $("<iframe><\/iframe>");
	$iframe.attr("id", "popup_iframe");
	$iframe.attr("src", typeof a_tag == "string" ? a_tag : a_tag.href);
	$iframe.attr("allowtransparency", "true");
	$iframe.attr("scrolling", "yes");
	$("body").append($iframe);
	$("#popup_iframe").css({
		"width": "100%",
		"height": "100%"
	}).wrap("<div id='popup_iframe_wrap' style='background-color:transparent; overflow:scroll; -webkit-overflow-scrolling:touch; position:fixed; left:0; top:0; right:0; bottom:0; z-index:150'><\/div>");

	$("body").css({overflow:'hidden','height':'100%'});

	$("#popup_iframe_wrap").on("DOMNodeRemoved", function() {
		console.log("DOMNodeRemoved");
		$("body", parent.document).css({'overflow': 'auto', 'height': 'auto'});
	});

	return false;
}



function popup_layer_close() {
	if (parent) {
		console.log("popup_layer_close-parent");
		$("#popup_iframe_wrap", parent.document).remove();
		this.close();
	} else {
		console.log("popup_layer_close");
		$("#popup_iframe_wrap").remove();
	}

	return false;
}

$(document).ready(
	function() {
	$("li.btn_sub > a").click(
		function() {
			var submenu = $(this).next(".sub_menu");
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	$( "li.btn_sub > a" ).click(function() {
		$( this ).toggleClass( "skin_bg");
	});

	function tabSplit () {
		$('.list_tab li a').on('click', function () {
			//1) 클릭한 버튼 부모li의 인덱스번호 변수 저장
			var tgIdx = $(this).parent().index();
			console.log(tgIdx);
			
			//2) .cnt > div 중에서 저장한 변수에 해당하는 인덱스번호만 보여지게 처리, 나머지 형제들은 숨기기
			$('.tab_pop').eq(tgIdx).addClass('on').siblings().removeClass('on');
			
			//3) 활성화된 li에 .on 추가하기
			$(this).parent().addClass('on').siblings().removeClass('on');
		});
	}
	tabSplit ();

});


