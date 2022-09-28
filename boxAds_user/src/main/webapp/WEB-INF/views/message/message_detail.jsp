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
						<c:if test="${total > 20}">
							<!-- <div class="list_before"><button type="button" id="moreMessage" class="btn btn_before">이전 메시지 불러오기</button></div> -->						
						</c:if>
						
					
					</div>
					<div class="send-message">
					<!--
						<div class="msg_name_area">
							<p>상대방 닉네임</p>
							<strong>라이프 어패럴 차이나</strong>
						</div>
						-->
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
					</div>
					<input type="hidden" id="start" value="0">
					<input type="hidden" id="total" value="${total}">
					<input type="hidden" id="url" value="${path}/member/messageDetailAjaxList">
					
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
			
		$("#submit").click(function() {
			if ($("textarea[name=content]").val() === "" &&  uploadList.length == 0) {
				alert("내용을 입력해주세요");
			} else {
				if( uploadList.length > 0 && $("textarea[name=content]").val() == ""){
					$("textarea[name=content]").val("[첨부파일]");
				}
				
				$("#uploadFile").val("");
				ajax("frm", "message_detail", "등록하였습니다.");
			}
		});

		$("#uploadFile").change(function() {
			var file = this.files[0];
			if (file !== undefined) {
				var element = '';
				element +=  '<li>'
				element +=  '<div class="thumbnail" style="background-size: cover; background-image: url(../images/etc/add_img.jpg);">'
				element +=  '<div class="file_area">'
				element +=  '<div class="btn_area txt_btn">'
				element +=  '<button type="button" value="" class="list_btn_del intro_img_del_btn delete_img">삭제</button>'
				element +=  '</div>'
				element +=  '</div>'
				element +=  '</div>'
				element +=  '<div class="photo_txt_area">'
				element +=  '<p class="name">' + file.name + '</p>'
				element +=  '<p class="capacity">' + bytesToSize(file.size) + '</p>'
				element +=  '</div>'
				element +=  '</li>'

				$(".chat_photo_list").append(element);
				console.log(file)
				
				var validImageTypes = ["image/gif", "image/jpeg", "image/png"];
				if ($.inArray(file['type'], validImageTypes) > 0) {				     
					readURL(this, ".thumbnail:last");
				} 
				uploadList.push(file);
				$("#uploadFile").val("");
			}			
		});

		// 이미지 삭제
		$(document).on("click", ".delete_img", function() {
			var idx = $(".delete_img").index(this);
			uploadList.splice(idx, 1);

			$(".chat_photo_list > li").eq(idx).remove();	
		});		
	})	
	</script>
</body>