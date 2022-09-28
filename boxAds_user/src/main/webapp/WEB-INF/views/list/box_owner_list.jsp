<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${type eq 'A' && empty list}">
		<tr><td colspan="7">검색된 광고(Ads)가 없습니다.</td></tr>
	</c:when>
	<c:when test="${type eq 'B' && empty list}">
		<tr><td colspan="8">검색된 박스(Box)가 없습니다.</td></tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="vo" varStatus="status">	
			<tr onClick="location.href='../order/box_order_detail?type=${type}&idx=${vo.idx}'">
				<td>${vo.insertDate}</td>
				<td><p class="ellipsis"><a href="#"><c:out value="${vo.boxTitle}"/></a></p></td>
				<td><p class="ellipsis"><a href="#"><c:out value="${vo.adTitle}"/></a></p></td>
				<td>${vo.name}</td>				
				<c:choose>
					<c:when test="${type eq 'A'}">
						<td>${vo.secPro} ${vo.thrPro}</td>					
						<td>${vo.adStartDate} ~ ${vo.adEndDate}</td>
					</c:when>
					<c:when test="${type eq 'B'}">
						<td>${vo.sellDate}</td>					
						<td class="align_r">${vo.boxCnt}</td>
						<td class="align_r">${vo.adPrice}</td>
					</c:when>
				</c:choose>
				<td>
					<span class="step">
						<c:choose>
							<c:when test="${vo.state eq 'A1'}">광고신청</c:when>
							<c:when test="${vo.state eq 'A2'}">신청승인</c:when>
							<c:when test="${vo.state eq 'A3'}">광고집행</c:when>
							<c:when test="${vo.state eq 'A4'}">신청취소</c:when>
							
							<c:when test="${vo.state eq 'B1'}">광고구매</c:when>
							<c:when test="${vo.state eq 'B2'}">광고승인</c:when>
							<c:when test="${vo.state eq 'B3'}">광고진행</c:when>
							<c:when test="${vo.state eq 'B4'}">1차광고인증</c:when>
							<c:when test="${vo.state eq 'B5'}">2차광고인증</c:when>
							<c:when test="${vo.state eq 'B6'}">광고완료</c:when>
							<c:when test="${vo.state eq 'B7'}">구매취소</c:when>
							<c:when test="${vo.state eq 'B8'}">판매종료</c:when>
						</c:choose>
					</span>
				</td>
			</tr>
		</c:forEach>
	</c:otherwise>	
</c:choose>