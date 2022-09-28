<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap">
			<c:forEach items="${boardList}" var="boardList">		
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>이용안내</li>
							<li>1:1 문의</li>
						</ul>
					</div>
					<h2 class="title">1:1 문의</h2>
					<div class="notice_view">
						<div class="title_area">
							<p class="tit"><c:out value="${boardList.title}"/></p>
							<div class="additional">
								<span><c:out value="${boardList.name}"/></span>
								<span><c:out value="${fn:substring(boardList.insertDate, 0, 10)}"/></span>
								<span class="c_blue"><c:out value="${boardList.viewCnt}"/></span>
							</div>
						</div>
						<div class="content_area">
							<p>${boardList.content}</p>
							<div class="down_area">
								<c:forEach items="${fileList}" var="fileList">
								<div>
									<a href="${path}/download?idx=${fileList.idx}" class="file"><i></i><c:out value="${fileList.realName}"/></a>
								</div>
								</c:forEach>
							</div>
						</div>
							
					</div>
					
					<div class="btn_area">
						<a href="${path}/board/qna?type=Q" class="btn btn_white">목록</a>
						<a id="delete_board" href="#" class="btn">삭제</a>
					</div>
					<c:forEach items="${qnaList}" var="qnaList">
					<div class="notice_view">
						<div class="ripple_tit">답변 내용</div>
						<div class="title_area">
							<p class="tit">답변일자 표시(<c:out value="${fn:substring(qnaList.insertDate, 0, 10)}"/>)</p>
						</div>
						<div class="content_area">
							<p><c:out value="${qnaList.content}"/></p>
							<div class="down_area">
								<c:forEach items="${qnaFileList}" var="qnaFileList">
								<c:if test="${qnaFileList.parent ne 0 and qnaList.idx eq qnaFileList.parent}">
								<div>
									<a href="${path}/download?idx=${qnaFileList.idx}" class="file"><i></i><c:out value="${qnaFileList.realName}"/></a>
								</div>
								</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
				</c:forEach>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<!-- 이미지 가이드 -->
	<div id="guide02" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title" >이미지 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="msg">
						
						</div>
						<div class="btn_area">
							<button type="button" class="btn">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$("#delete_board").click(function() {
				var confirm = window.confirm("삭제하시겠습니까?");
				
				if (confirm) {
					location.href = "${path}/board/qna_delete?idx=${param.idx}&type=Q";
				}
			});
		});
	</script>
	<!--// 이미지 가이드 -->
</body>
</html>