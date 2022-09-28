<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>	
	<c:when test="${empty list}">
		<tr><td colspan="6">검색된 결제내역이 없습니다.</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="vo" varStatus="status">	
			<tr>
				<td>${vo.insertDate}</td>
				<td>${vo.cashCode}</td>
				<td class="align_l"><fmt:formatNumber value="${vo.cash}" pattern="#,###" /></td>
				<td class="align_r"><fmt:formatNumber value="${vo.pAmt}" pattern="#,###" /></td>
				<td>${vo.type}</td>
				<td>${vo.pFnNm}</td>
			</tr>
		</c:forEach>
	</c:otherwise>	
</c:choose>
