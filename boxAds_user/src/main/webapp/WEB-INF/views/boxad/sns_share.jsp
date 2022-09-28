<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<div class="btn_share_wrap">
	<button type="button" class="btn_share"><i class="ico_share"></i><span>공유하기</span></button>
	<div class="modal-bg2">
		<div class="share_box">
			<div class="head">
				<span>공유하기</span>
				<button type="button" class="sns_close" onclick="shareClose();">닫기</button>
			</div>
			<ul>
				<li id="share_facebook" class="face">
					<a href="#" onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" class="sns" title="새창이동">
					<i></i>
					<span>페이스북</span>
					</a>
				</li>
				<li id="share_twit" class="twit">
					<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Twitter" class="sns" title="새창이동">
						<i></i>
						<span>트위터</span>
					</a>
				</li>
				<!-- <li id="share_kakao" class="kakao">
					<a href="javascript:;" class="sns" title="새창이동">
						<i></i>
						<span>카카오페이지</span>
					</a>
				</li> -->
				<li id="share_naver" class="naver">
					<a href="#" onclick="javascript:window.open('http://share.naver.com/web/shareView.nhn?url=' +encodeURIComponent(document.URL)+'&title='+encodeURIComponent(document.title), 'naversharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Naver" class="sns" title="새창이동">
						<i></i>
						<span>네이버블로그</span>
					</a>
				</li>
				<li id="share_url" class="url">
					<a href="#" onclick="urlShare()" class="sns">
						<i>URL</i>
						<span>URL복사</span>
					</a>
				</li>
				
			</ul>
			<div class="mobile_url">
				<label for="url_copy">URL 공유시, 터치하여 복사하세요.</label>
				<input type="text" name="url" id="url_copy" value="" onclick="urlShare()">
			</div>
		</div>
	</div>
</div>
<script>
$("#url_copy").val(window.document.location.href)

function urlShare(){
	var urlbox = $("#url_copy");
	urlbox.select();
    document.execCommand('Copy');
    alert('URL이 복사 되었습니다.');	
};

</script>