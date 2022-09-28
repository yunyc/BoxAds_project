<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:forEach var="cashLog" items="${cashLogList}">
    <tr>
        <td><c:out value="${cashLog.insertDate}"/></td>
        <td><c:out value="${cashLog.category}"/></td>
        <td><c:out value="${cashLog.type}"/></td>
        <td><p class="ellipsis"><c:out value="${cashLog.content}"/></p></td>
        <td><c:out value="${cashLog.name}"/></td>
        <td class="align_r"><span class="${cashLog.cashIncrease ge 0 ? 'c_blue' : 'c_red'}"><c:if test="${cashLog.cashIncrease lt 0}">- </c:if><fmt:formatNumber pattern="#,###" value="${cashLog.cashIncrease ge 0 ? cashLog.cashIncrease : -cashLog.cashIncrease}"/></span></td>
    </tr>
</c:forEach>
