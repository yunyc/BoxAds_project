<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:forEach items="${hList}" var="vo" varStatus="status">
	<tr>
		<td>${vo.ccCode}</td>
		<td>${vo.insertDate}</td>
		<td><c:out value="${vo.bTitle}"/></td>
		<td><c:out value="${vo.aTitle}"/></td>
		<td>${vo.sellDate}</td>
		<td>${vo.boxCnt}</td>
		<td class="align_r"><fmt:formatNumber value="${vo.adFee}" pattern="#,###" />원</td>
		<td class="align_r"><fmt:formatNumber value="${vo.prPrice}" pattern="#,###" />원</td>
		<td class="align_r"><fmt:formatNumber value="${vo.cpPrice}" pattern="#,###" />원</td>
		<td class="align_r"><fmt:formatNumber value="${vo.margin}" pattern="#,###" />원</td>									
	</tr>
</c:forEach>	
								