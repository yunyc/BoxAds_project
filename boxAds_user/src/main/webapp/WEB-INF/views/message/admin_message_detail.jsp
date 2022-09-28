<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>
<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap" class="no_gnb_wrap full-height">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
			<div id="container">
			<div class="sub_wrap mypage_wrap">
				<section id="container" class="contents msg_wrap">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>메시지</li>
						</ul>
					</div>
					<form enctype="multipart/form-data" id="frm" method="post" action="message_detail">
					<input type="hidden" value="${param.receiver}" name="receiver">					
					<h2 class="chat_tit"><i></i> <span>${receiver.name}님과의 메시지</span></h2>
					<div class="chat_list" id="listBody">
									
					</div>
<!-- 					<div class="send-message">
					
						<div class="msg_name_area">
							<p>상대방 닉네임</p>
							<strong>라이프 어패럴 차이나</strong>
						</div>
						
						<div class="item-input-wrapper">
							<textarea placeholder="안전한 거래를 위해 직거래를 제안하거나 연락처를 요구 시 서비스 이용이 제한될 수 있습니다" id="msg_textarea" name="content"></textarea>
							<input type="file" name="uploadFile" id="uploadFile">
							<label for="uploadFile" class="add">
								<i class="ico_file"></i><span>첨부파일</span>
							</label>
						</div>
						<ul class="my_photo_list chat_photo_list" id="listBody">							
						</ul>
						<div class="btn_area"><button id="submit" type="button" class="btn btn_send">전송</button></div>
					</div> -->
					<input type="hidden" id="start" value="0">
					<input type="hidden" id="total" value="${total}">
					<input type="hidden" id="url" value="${path}/admin/messageDetailAjaxList">
					
					<input type="hidden" name="writer" value="${param.writer}">
					<input type="hidden" name="receiver" value="${param.receiver}">
					</form>
				</section>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<script>		
	$(function(){		
		appendTextListCustom("listBody", 20);		
		$(document).on("click", "#moreMessage", function(){
			appendTextListCustom(ulId, orNm);
			$(this).parent("div").remove();
		})			
	})	
	</script>
</body>