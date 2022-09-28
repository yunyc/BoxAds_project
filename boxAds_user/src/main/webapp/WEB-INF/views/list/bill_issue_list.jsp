<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>	
	<c:when test="${empty list}">
		<tr><td colspan="8">검색된 증빙서류 발행내역이 없습니다.</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="vo" varStatus="status">	
			<tr>
				<td>${vo.insertDate}</td>
				<td><strong>${vo.subject}</strong></td>
				<td><strong>${vo.type}</strong></td>
				<td class="align_r"><fmt:formatNumber value="${vo.amount}" pattern="#,###" /></td>
				<td class="align_r"><fmt:formatNumber value="${vo.fee}" pattern="#,###" /></td>
				<td class="align_r"><strong><fmt:formatNumber value="${vo.total}" pattern="#,###" /></strong></td>
				<td>${vo.updateDate}</td>
				<td><strong>${vo.state}</strong></td>
			</tr>
		</c:forEach>
	</c:otherwise>	
</c:choose>
