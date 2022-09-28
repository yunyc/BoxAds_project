<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:forEach var="coupon" items="${couponList}">
    <tr>
        <td><p class="align_l"><strong><c:out value="${coupon.title}"/></strong></p></td>
        <td><p class="align_l"><c:out value="${coupon.mesg}"/></p></td>
        <td class="align_r"><strong><fmt:formatNumber pattern="#,###" value="${coupon.price}"/></strong></td>
        <td> ~<c:out value="${fn:replace(coupon.endDate, '-', '.')}"/>년까지</td>
    </tr>
</c:forEach>
