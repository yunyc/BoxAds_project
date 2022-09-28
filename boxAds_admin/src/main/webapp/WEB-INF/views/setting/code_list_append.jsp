<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<h4>${param.depth}차 카테고리</h4>
<button type="button" class="btn add" data-parent="${param.parent}" data-depth="${param.depth}">추가 +</button>			
<table>
	<colgroup>
		<col style="width: 20%">
		<col style="">
		<col style="width: 20%">
		<col style="width: 18%">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">순서</th>
			<th scope="col">카테고리명</th>
			<th scope="col">노출여부</th>
			<th scope="col"></th>
		</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${!empty codeList}">
			<c:forEach var="code" items="${codeList}" varStatus="status">
				<tr>
					<td><input type="text" name="sort" value="${code.sort}" data-idx="${code.idx}"></td>
					<td><button class="blue_btn" data-idx="${code.idx}" data-depth="${code.depth}">${code.name}</button></td>
					<td>
						<c:choose>
							<c:when test="${code.useFlag eq 'Y'}">노출</c:when>
							<c:otherwise>미노출</c:otherwise>
						</c:choose>
					</td>
					<td><a href="code_write?idx=${code.idx}" class="btn">수정</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr><td colspan="4">해당 데이터가 없습니다.</td></tr>
		</c:otherwise>		
	</c:choose>
	</tbody>
</table>
<c:if test="${!empty codeList}">
<div class="btn_area fl_r">
	<button class="btn sortSave" type="button">순서저장</button>
</div>
</c:if>