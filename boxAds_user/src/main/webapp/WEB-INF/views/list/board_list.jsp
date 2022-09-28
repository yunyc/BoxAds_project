<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<c:if test="${type eq 'N'}">
	<c:forEach items="${boardList}" var="boardList" varStatus="status">
		<tr>
			<td>
				<c:choose>
					<c:when test="${boardList.noticeFlag eq 'Y'}">
						공지
					</c:when>
					<c:otherwise>			
						<c:set var= "num" value="${total - start - status.index}"/>			
						${num}
					</c:otherwise>
				</c:choose>
			</td>
			<td data-cell-header="제목：" class="subject">
			<a href="${path}/board/detail?idx=${boardList.idx}&type=${param.type}" class="title01">
					<div class="sub-wrapper">
						<div class="final-wrapper">
							<c:if test="${boardList.newFlag eq 'T'}">
								<div class="icon">
									<i class="new_i">N</i>
								</div>
							</c:if>
							<div class="text">
								${boardList.title}
							</div>
						</div>
					</div>
			</a></td>
			<td data-cell-header="작성일：" class="date">
					${fn:substring(boardList.insertDate, 0, 10)}
			</td>
			<td data-cell-header="첨부파일：">
				<c:if test="${boardList.parent ne 0}">
					<a href="#" class="file">파일다운로드</a>
				</c:if>
			</td>
			<td data-cell-header="조회수：" class="last">
				${boardList.viewCnt}
			</td>
		</tr>
	</c:forEach>
</c:if>

<c:if test="${type eq 'F'}">
	<c:forEach items="${boardList}" var="boardList">
		<dt>
			<a href="javascript:;">
				<span class="title"><c:out value="${boardList.title}"/></span>
				<i class="ico_list">열림/닫힘</i>
			</a>
		</dt>
		<dd style="display: none;">
			<div class="inner_con">
				<p>
					${boardList.content}
				</p>
				
			</div>
		</dd>
	</c:forEach>		
</c:if>

<c:if test="${type eq 'Q'}">
	<c:choose>
		<c:when test="${empty boardList}">
			<tr><td colspan="5">등록된 문의글이 없습니다.</td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${boardList}" var="boardList">
				<tr>
					<td><c:out value="${boardList.idx}" /></td>
					<td data-cell-header="제목：" class="subject"><a
						href="${path}/board/detail?idx=${boardList.idx}&type=${param.type}"
						class="title01">
							<div class="sub-wrapper">
								<div class="final-wrapper">
									<c:if test="${boardList.newFlag eq 'T'}">
										<div class="icon">
											<i class="new_i">N</i>
										</div>
									</c:if>
									<div class="text">
										<c:out value="${boardList.title}" />
									</div>
								</div>
							</div>
					</a></td>
					<td data-cell-header="등록일：" class="date">
						${fn:substring(boardList.insertDate, 0, 10)}
					</td>
					<td data-cell-header="진행상태：" class="status">
						${boardList.replyFlag}</td>
					<td data-cell-header="조회수：" class="last">
						${boardList.viewCnt}
					</td>
				</tr>
			</c:forEach>		
		</c:otherwise>
	</c:choose>
</c:if>
<script>
/* if('${type}' == 'F'){
	console.log('${total}')
	$("#total").val('${total}');
} */
	
</script>