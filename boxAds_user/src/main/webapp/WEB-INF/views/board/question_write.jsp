<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>고객센터</li>
							<li>1:1문의</li>
						</ul>
					</div>
					<h2 class="title">1:1문의</h2>
					<div class="board_wrap">
						<!-- qna_info -->
						<div class="qna_info">
							<i class="ico_info"></i>
							<p class="info_txt">
								<strong>BOXADS에 궁금하신 점이나 의견을 남겨주세요</strong> <br>
								문의하신 내용은 최대한 빠르게 확인하여 친절하게 답변드리겠습니다.
							</p>
						</div>
						<!-- //qna_info -->
						<form:form modelAttribute="boardVO" enctype="multipart/form-data">
							<input type="hidden" name="writer" value="${login.idx}"/>
							<fieldset>
								<legend>QnA 등록</legend>
								<div class="table_wrap qna_table">
									<dl>
										<dt>
											<strong class="required">*</strong> 제목 <strong class="required mobile">(필수)</strong> 
										</dt>
										<dd>
											<div class="input_area">
												<input type="text" name="title" id="title" placeholder="제목을 입력해주세요." required>
												<label for="title" class="blind">제목</label>
											</div>
										</dd>
									</dl>
									<dl>
										<dt>
											<strong class="required">*</strong> 내용 <strong class="required mobile">(필수)</strong> 
										</dt>
										<dd>
											<textarea name="content" id="qna_content" placeholder="문의내용을 입력해주세요" title="문의내용을 입력해주세요" required></textarea>
											<label for="content" class="blind">내용</label>
										</dd>
									</dl>
									<dl>
										<dt>
											첨부파일
										</dt>
										<dd id="file">
											<div class="upload_file rbtn">
											</div>
											<input multiple="multiple" type="file" name="uploadFile" id="uploadFile" class="file_input">
											<label for="input_name1">파일 찾기</label>
											<div class="txt_area">
												<p>파일형식(ppt, pptx, xls, xlsx, doc, docx, pdf, jpg, jpeg, gif, zip) / 파일용량(5mb 이하)</p>
											</div>
											
										</dd>
									</dl>
								</div>
								<div class="btn_area qna_btn">
									<button type="button" onclick="location.href='${path}/board/qna?type=Q'" class="btn form02 btn_white">취소</button>
									<button id="submit" type="button" class="btn">등록</button>
								</div>
							</fieldset>
						</form:form>
					</div>		


				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<script>
		$(function() {
			
			$("#submit").click(function() {

				if ($("input[name=title]").val() === "") {
					alert("제목을 입력해주세요");
				} else if ($("textarea[name=content]").val() === "") {
					alert("내용을 입력해주세요");
				} else {
					$("#uploadFile").val("");
					ajax("boardVO", "${path}", "등록하였습니다.");
				}
			});

			$("#uploadFile").change(function() {
				var fileList = $("#uploadFile").get(0).files;

				if (fileList !== undefined) {
					validExt(fileList);
				}
			});

			$(document).on('click', '.upload_file .delete', function() {
				var index = $('.upload_file .delete').index(this);
            	uploadList.splice(index, 1);
            	
				$(".upload_file span").eq(index).remove();
				$(".upload_file button").eq(index).remove();
				
			});
			
		});

		function validExt(fileList) {
			var successExtention = ['ppt', 'pptx', 'xls', 'xlsx', 'doc', 'docx', 'jpg', 'jpeg', 'gif', 'zip'];
			var maxSize = 5 * 1024 * 1024;
			var $that = $(this);
			

			$.each(fileList, function(index, item) {
				var name = item.name;
				var extention = item.name.substring(item.name.lastIndexOf(".") + 1, item.name.length);

				if (name.length > 35) {
					name = name.substring(0, 35) + '...';
				}
    			
    			if ($.inArray(extention, successExtention) == -1) {
    				alert('지원하지 않는 파일 확장자입니다.');
    				$that.val("");
    			
    			} else if(item.size > maxSize) {
    				alert("파일 용량은 5mb를 넘지 않아야 합니다.");
    				$that.val("");
    				
    			} else {
        			var element = '<div><span>' + name + '</span><button class="delete" type="button">삭제</button></div>';
    				appendFile(item, ".upload_file", element);
    			}
			});
		}
	</script>
</body>
</html>