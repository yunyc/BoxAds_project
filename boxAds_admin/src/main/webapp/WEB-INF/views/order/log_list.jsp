<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<c:forEach items="${logList}" var="logList">
	<c:choose>
		<c:when test="${! empty logList.realName}">
			<tr>
				<td class="align_l">
				<p>${logList.content}</p>
					<div class="mt20">
						<c:set var="urlList" value="${fn:split(logList.url, ',')}"/>
						<c:forEach var="i" begin="0" end="${fn:length(urlList) - 1}">
							<img src="${path}${urlList[i]}" alt="1차 인증 사진 이미지0${i}" class="ml15" style="width:95px; height:85px;">
						</c:forEach>
					</div>
					</td>
				<td>${logList.insertDate}</td>
			</tr>
		</c:when>
		<c:when test="${logList.type eq 'B6'}">
			<tr>
				<td class="align_l">${logList.content} <a href="#" class="btn ml15" download>다운로드</a></th>
				<td>${logList.insertDate}</td>
			</tr>
		</c:when>
		<c:when test="${! empty logList.delivery}">
			<tr>
				<td class="align_l">${logList.content} <span class="ml15 bdr">${logList.delivery} ${logList.mesg}</span></th>
				<td>${logList.insertDate}</td>
			</tr>
		</c:when>
		
		
		<c:otherwise>
			<tr>
				<td class="align_l">${logList.content}</td>
				<td>${logList.insertDate}</td>
			</tr>
		</c:otherwise>
	</c:choose>
	
	
					
								
								
</c:forEach>

