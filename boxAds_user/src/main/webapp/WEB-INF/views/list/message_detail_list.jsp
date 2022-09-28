<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />						
<c:forEach items="${list}" var="vo" varStatus="status">
	<c:choose>
		<c:when test="${vo.writer ne login.idx}">
			<div class="item-message">
				<div class="bubble left">
					<div class="img_prof">
						<img src="${receiver.prImg}" onerror="this.src='${path}/images/main/list_profile01.png'" alt="프로필">
					</div>
					<div class="msg-content">
						<div class="msg-title"><strong>${receiver.name}</strong></div>
						<div class="chat-box">
							<c:out value="${vo.content}"/>
							<c:if test="${!empty vo.url}">
								<div class="chat_add_wrap">
									<div class="img_area"><img src="${vo.url}" onerror="this.src='../images/etc/add_img.jpg'" alt="첨부파일"></div>
									<div class="txt_area">
										<a href="${path}/download?idx=${vo.fIdx}">${vo.realName}</a>
									</div>
								</div>
							</c:if>	
						</div>
						<div class="msg-date">${vo.insertDate}</div>
					</div>
				</div>
			</div>								
		</c:when>
		<c:when test="${vo.writer eq login.idx}">
			<div class="item-message">
				<div class="bubble right">
					<div class="msg-content">
						<div class="chat-box">
							<c:out value="${vo.content}"/>
							<c:if test="${!empty vo.url}">
								<div class="chat_add_wrap">
									<div class="img_area"><img src="${vo.url}" onerror="this.src='../images/etc/add_img.jpg'" alt="첨부파일"></div>
									<div class="txt_area">
										<a href="${path}/download?idx=${vo.fIdx}">${vo.realName}</a>
									</div>
								</div>
							</c:if>													
						</div>
						<div class="msg-date">${vo.insertDate}</div>
					</div>
				</div>
			</div>								
		</c:when>								
	</c:choose>
</c:forEach>
					