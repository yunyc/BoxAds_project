<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<div class="layerpop-box"> ><!-- open 클래스 추가하면 팝업 -->
	<div class="modal-bg"></div>
	<div class="layerpopup msg-error" >
		<div class="inner">
			<div class="msgbox prompt">
				<div class="head_title"><a href="javascript:;" class="btn_close">닫기</a></div>
				<div class="msg">ID(이메일)을 입력해 주세요.</div>
				<div class="btn_area">
					<button class="btn btn_finish">확인</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
/* 메세지 팝업 보이게 하려면 */
/*
$(".layerpop-box").addClass("open");
$('html').css({'overflow': 'hidden', 'height': '100%'}); // 모달팝업 중 html의 scroll을 hidden시킴
*/

/*메세지 팝업 해제 */
/*
$(".layerpop-box").removeClass("open");
$('html').css({'overflow': 'auto', 'height': '100%'}); //scroll hidden 해제
*/


$(function(){

	$(".layerpopup .btn_close").on("click", function () {
		$(".layerpop-box ").removeClass("open");
		$('html').css({'overflow': 'auto', 'height': '100%'}); //scroll hidden 해제
		});
 });
</script>
