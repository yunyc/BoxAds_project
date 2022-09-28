<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${empty alarmList}">
<!-- 		<div class="message_area">
			<div class="notice">
				<div class="txt_area">
					<a href="#" class="txt">알림 내역이 없습니다.</a>
				</div>
				
			</div>
		</div> -->
	</c:when>
	<c:otherwise>
		<c:forEach var="i" begin="0" end="${fn:length(alarmDate) - 1}" >
			<div class="message_area">
				<p class="m_date">${alarmDate[i]}</p>
					<c:forEach items="${alarmList}" var="alarm">
						<c:if test="${alarmDate[i] eq alarm.insertDate}">
							<div class="notice">
								<div class="txt_area">
									<a href="#" class="txt">${alarm.content}</a>
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
		$(".over_tab > button").eq(1).append('<i class="new">new</i>');		
	}
</script>