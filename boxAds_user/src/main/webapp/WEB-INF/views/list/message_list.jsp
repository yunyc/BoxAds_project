<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:forEach items="${list}" var="vo" varStatus="status">
	<li class="item-message">
		<div class="primary_wrap">
			<c:set var="receiver" value="${login.idx eq vo.writer ? vo.receiver : vo.writer }"/>
			<div class="msg-check">
				<span class="cbox"><input type="checkbox" value="${receiver}" name="delete" id="chk${status.index}"><label for="chk${status.index}">선택</label></span>
			</div>
			<div class="ms-img">
				<div class="img_prof">
					<img src="${vo.prImg}" onerror="this.src='${path}/images/main/list_profile01.png'" alt="프로필">
				</div>
			</div>
			<div class="msg-content">
				<div class="inner_box">
					<div class="msg-title">${vo.name}</div>
					<a href="${path}/member/message_detail?writer=${login.idx}&receiver=${receiver}" class="title01">
						<div class="sub-wrapper"><div class="final-wrapper">
						<c:if test="${vo.newFlag eq 'Y'}">
							<div class="icon">
								<i class="new_i">N</i>
							</div>						
						</c:if>
						<div class="text"><c:out value="${vo.content}"/></div></div></div>
					</a>
				</div>
			</div>
			<div class="msg-date">
				${vo.insertDate}
			</div>
		</div>
	</li>
</c:forEach>
