<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${empty list}">
		<tr><td colspan="8">검색된 광고(Ads)가 없습니다.</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="vo" varStatus="status">	
			<tr onClick="location.href='#'">
				<td>${vo.insertDate}</td>
				<td><p class="ellipsis"><c:out value="${vo.adTitle}"/></p></td>
				<td><p class="ellipsis"><c:out value="${vo.boxTitle}"/></p></td>
				<td>${vo.name}</td>
				<td>${vo.sellDate}</td>
				<td class="align_r">${vo.boxCnt}</td>
				<td class="align_r">${vo.adPrice}</td>
				<td>
					<span class="step">
						<c:choose>
							<c:when test="${vo.state eq 'A1'}">광고신청</c:when>
							<c:when test="${vo.state eq 'A2'}">신청승인</c:when>
							<c:when test="${vo.state eq 'A3'}">광고집행</c:when>
							<c:when test="${vo.state eq 'A4'}">신청취소</c:when>
						</c:choose>
					</span>
				</td>
			</tr>
		</c:forEach>
	</c:otherwise>	
</c:choose>
