<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${pageMarker.startPage-10>0}">
 	<a href='javascript:goPage("${pageMarker.startPage-10}","${param.perPage}")' class="next">이전 10 페이지</a>
</c:if>
<c:if test="${pageMarker.paging.page >1}">
   	<a href='javascript:goPage("${pageMarker.paging.page-1}","${param.perPage}")' class="prev">이전 페이지</a>
</c:if>
<c:forEach begin="${pageMarker.startPage}" end="${pageMarker.endPage}" step="1" varStatus="status">
   	<a href='javascript:goPage("${status.index}","${param.perPage}")' <c:if test="${pageMarker.paging.page == status.index}">class="on"</c:if>>${status.index}</a>
</c:forEach>
 <c:if test="${pageMarker.endPage>1 and pageMarker.paging.page<pageMarker.endPage}">
 	<a href='javascript:goPage("${pageMarker.paging.page+1}","${param.perPage}")' class="next">다음 페이지</a>
</c:if>
<c:if test="${pageMarker.paging.page ne param.perPage && (pageMarker.totalCount/param.perPage)>param.perPage}">
 	<a href='javascript:goPage("${pageMarker.startPage+10}","${param.perPage}")' class="next">다음 10 페이지</a>
</c:if>
