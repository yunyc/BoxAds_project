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
							<li>고객센터</li>
							<li>공지사항</li>
						</ul>
					</div>
					<h2 class="title">공지사항</h2>
					<div class="board_wrap">
						<div class="view_container">
							<div class="view_title">
								<p><span>
									<c:choose>
										<c:when test="${boardList.noticeFlag eq 'Y'}">
											공지
										</c:when>
										<c:otherwise>
											<c:out value="${boardList.idx}"/>
										</c:otherwise>
									</c:choose>
								</span><c:out value="${boardList.title}"/></p>
								<div class="view_writer"><p><span>등록일 : <strong><c:out value="${fn:substring(boardList.insertDate, 0, 10)}"/></strong>
								</span><span>조회 : <strong><c:out value="${boardList.viewCnt}"/></strong></span></p></div>
							</div>
							<div class="view_con">
								<div>${boardList.content}</div>
							</div>
							<p class="file_txt">첨부파일 <strong>2</strong></p>
							<ul class="file_list">
								<c:forEach items="${fileList}" var="fileList">
									<li><a href="${path}/download?idx=${fileList.idx}"><i></i>${fileList.realName}</a></li>
								</c:forEach>
							</ul>
							<div class="btn_area">
								<a href="${path}/board/list?type=${param.type}" class="btn list_btn"><i></i>목록</a>
							</div>
						</div>						
					</div>				


				</div>
				</c:forEach>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>
		$(function() {
			var fileCnt = $(".file_list > li").length;
			$(".file_txt > strong").text(fileCnt);
		});
	</script>
</body>
</html>