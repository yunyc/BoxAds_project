<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${empty messageList}">
	</c:when>
	<c:otherwise>		
		<c:forEach var="i" begin="0" end="${fn:length(messageDate) - 1}" >
			<div class="message_area">
				<p class="m_date">${messageDate[i]}</p>
					<c:forEach items="${messageList}" var="message">
						<c:if test="${messageDate[i] eq message.insertDate}">
							<div class="message clearfix">
								<div class="img_area fl_l"><img src="${message.prImg}" onerror="this.src='${path}/images/main/list_profile01.png'" alt="프로필"></div>
								<div class="txt_area fl_l">
									<c:set var="receiver" value="${login.idx eq message.writer ? message.receiver : message.writer }"/>
									<a href="${path}/member/message_detail?writer=${login.idx}&receiver=${receiver}" class="txt">
										<c:out value="${message.content}"/>
									</a>
									<p class="name">${message.name}</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>

<script>
	if('${newFlag}' == 1){
		$(".over_tab > button").eq(0).append('<i class="new">new</i>');		
		$(".btn_notice").addClass("on");
	}
</script>