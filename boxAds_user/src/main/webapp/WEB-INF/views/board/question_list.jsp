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
							<li>이용안내</li>
							<li>1:1 문의</li>
						</ul>
					</div>
					<h2 class="title">1:1 문의</h2>
					<div class="board_wrap">
						<div class="srch_wrap">
							<p>총 : <strong><c:out value="${boardCnt}"/></strong> 건 </p>
							<fieldset>
								<legend>목록 검색</legend>
								<div class="srch_sub_box">
								<form:form modelAttribute="memberVO">
									<label for="srch_sel0" class="blind">상태 선택</label>
									<select id="srch_sel0" name="replyFlag" class="option_box optfirst">
										<option value="" selected>전체</option>
										<option value="N" <c:if test="${param.replyFlag eq 'N'}">selected</c:if>>답변대기</option>
										<option value="Y" <c:if test="${param.replyFlag eq 'Y'}">selected</c:if>>답변완료</option>
									</select>
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
									<input type="hidden" id="url" value="${path}/board/boardAjaxList?type=Q">
									</form:form>
								</div>
								
							</fieldset>
						</div>
						
						<div class="list_type_01">
							<table>
								<caption>신청정보</caption>
								<colgroup>
									<col style="width:7.5% ;">
									<col>
									<col style="width:12% ;">
									<col style="width:12% ;">
									<col style="width:10% ;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">등록일</th>
										<th scope="col">진행상태</th>
										<th scope="col">조회수</th>
									</tr>
								</thead>
								<tbody id="pageList">
									<c:if test="${boardCnt eq 0}">
										<tr><td colspan="5">등록된 문의글이 없습니다.</td></tr>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="btn_area under_table">
							<button onclick="location.href='${path}/board/qna_write?type=Q'" type="button" class="btn btn_write">문의하기</button>
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
	<!-- 이미지 가이드 -->
	<div id="guide02" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title" >이미지 가이드<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="msg">
						
						</div>
						<div class="btn_area">
							<button type="button" class="btn">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--// 이미지 가이드 -->
</body>
<script>
	appendTextList("pageList", 10);
</script>
</html>