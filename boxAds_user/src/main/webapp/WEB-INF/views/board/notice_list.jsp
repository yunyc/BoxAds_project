<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>고객센터</li>
							<li>공지사항</li>
						</ul>
					</div>
					<h2 class="title">공지사항</h2>
					<div class="board_wrap">
						<div class="srch_wrap">
							<p>총 : <strong><c:out value="${boardCnt}"/></strong> 건 </p>
							<fieldset>
								<legend>목록 검색</legend>
								<div class="srch_sub_box">
									<form:form modelAttribute="memberVO">
									<label for="srch_sel" class="blind">검색조건 선택</label>
									<select id="srch_sel" name="searchType" class="option_box">
										<option value="title" <c:if test="${param.searchType eq 'title'}">selected</c:if>>제목</option>
										<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
									</select>
									<div class="srch_sub_box2">
										<label for="srch_input" class="blind">검색어 입력</label>
										<input type="text" id="srch_input" name="keyword" value="${param.keyword}">
										<button type="submit" class="btn">검색</button>
									</div>
									<input type="hidden" id="start" value="0">
									<input type="hidden" id="total" value="${boardCnt}">
									<input type="hidden" id="url" value="${path}/board/boardAjaxList?type=N">
									</form:form>
								</div>
							</fieldset>
						</div>
						<div class="list_type_01">
							<table>
								<caption>공지사항 글목록으로 번호 제목 등록자 등록일 조회 첨부를 목록으로 표시합니다.</caption>
								<colgroup>
									<col style="width: 6%">
									<col>
									<col style="width: 9%">
									<col style="width: 10%">
									<col style="width: 9%">
									<col style="width: 8%">
								</colgroup>
								<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">첨부파일</th>
									<th scope="col">조회수</th>
								</tr>
								</thead>
								<c:if test="${boardCnt == 0}">
									<tr><td colspan="5">등록된 공지사항이 없습니다.</td></tr>
								</c:if>
								<tbody id="pageList">
								
								</tbody>
							</table>
						</div>
						<div class="btn_area fulwidth">
							<button id="moreText" type="button" class="btn btn_more">더보기 +</button>
						</div>
					</div>				


				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
<script>
	appendTextList("pageList", 10);
</script>
</html>