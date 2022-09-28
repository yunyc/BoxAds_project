<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>

	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap">
				<section id="container" class="contents msg_wrap mypage_wrap mylist_wrap">
					<div class="inner">
						<div class="path">
							<ul>
								<li>홈</li>
								<li>메시지</li>
								<li>목록</li>
							</ul>
						</div>
						<div class="srch_wrap">
							<h2 class="title">메시지</h2>
							<fieldset>
								<legend>목록 검색</legend>
								<div class="srch_sub_box">
								<form:form>
									<label for="srch_sel" class="blind">검색조건 선택</label>
									<select id="srch_sel" name="searchType" class="option_box">
										<!-- <option value="">구분</option> -->
										<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>업체명</option>
										<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
									</select>
									
									<div class="srch_sub_box2">
										<label for="srch_input" class="blind">검색어 입력</label>
										<input type="text" id="srch_input" name="keyword" value="${param.keyword}" placeholder="검색어 입력">
										<button type="submit" class="btn">검색</button>
									</div>
									<input type="hidden" id="start" value="0">
									<input type="hidden" id="total" value="${total}">
									<input type="hidden" id="url" value="${path}/member/messageAjaxList">
									</form:form>
								</div>
							</fieldset>
						</div>
						<div class="message_list">
							<c:if test="${total == 0}">
								<p class="nodata">메시지가 없습니다.</p>
							</c:if>
							<ul id="messageList">
								<!-- <p class="nodata">메시지가 없습니다.</p> -->
							</ul>
						</div>
						<div class="srch_btn del">
							<button class="btn btn_del" id="delBtn" type="button"><span>삭제</span></button>
						</div>
						<div class="btn_area"><button type="button" class="btn btn_more" id="more">더보기 +</button></div>
					</div>
				</section>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
<script>
	$("#delBtn").on("click", function(){
		let idxArr = [];
		$("input[name='delete']:checkbox:checked").each(function(i, item) {
			idxArr.push($(item).val());				
		});		
			
		if(confirm("삭제하시겠습니까?")){
			if(idxArr.length > 0){
				$.post("../common/messageDelete", { delIdx:idxArr.toString() }, function(result){
					console.log(result)
					if(result > 0){
						alert("삭제되었습니다.");
						location.reload();					
					} else {
						alert("실패했습니다.");
					}
				})
			} else {
				alert("선택된 메시지가 없습니다.");
			}		
		}		
	})
	
	appendTextList("messageList", 20);
</script>
</html>