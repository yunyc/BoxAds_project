<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${param.type eq 'N'}">
		<c:set var="title" value="공지사항" />
		<c:set var="menuon" value="0" />
	</c:when>
	<c:when test="${param.type eq 'F'}">
		<c:set var="title" value="FAQ" />
		<c:set var="menuon" value="1" />
	</c:when>
	<c:when test="${param.type eq 'Q'}">
		<c:set var="title" value="QNA" />
		<c:set var="menuon" value="2" />
	</c:when>
	<c:when test="${param.type eq 'B'}">
		<c:set var="title" value="메인 배너" />
		<c:set var="menuon" value="3" />
		<c:set var="url" value="banner_" />
	</c:when>
	<c:when test="${param.type eq 'A'}">
		<c:set var="title" value="알림 관리" />
		<c:set var="menuon" value="4" />
		<c:set var="url" value="banner_" />
	</c:when>
</c:choose>

<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
	<c:import url="../inc/left_site.jsp">
    	<c:param name="menuOn" value="${menuon}" />
    </c:import>

		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>${title}</h3>
            </div>
            <div class="view">
                <table class="detail mt20">
                    <caption>게시글 상세</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
                    <c:forEach items="${boardList}" var="boardList">
                    <c:choose>
                    	<c:when test="${param.type eq 'N'}">
                    		<tr>
		                        <th scope="row">등록자</th>
		                        <td colspan="3">
		                            <c:out value='${boardList.name}'/>
		                        </td>
		                    </tr>
		                    <!-- 등록일 -->
		                     <tr>
		                        <th scope="row">등록일</th>
		                        <td colspan="3">
		                          <c:out value='${fn:substring(boardList.insertDate, 0, 19)}'/>
		                        </td>
		                        </tr>
		                    <!-- 노출 상태 -->
		                    <tr>
		                        <th scope="row">노출 상태</th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                                <li><label>
		                                ${boardList.state}
		                                </label></li>
		                            </ul>
		                        </td>
		                    </tr>
		                    <!-- 대상 소속 그룹 -->
		                    	<tr>
			                        <th scope="row">대상 소속 그룹</th>
			                        <td colspan="3">
			                           ${boardList.adGroup}
			                        </td>
			                    </tr>
			                    <!-- 제목 -->
								<tr>
			                        <th scope="row">제목</th>
			                        <td colspan="3">
			                          <c:out value='${boardList.title}'/>
			                        </td>
			                    </tr>
		                    <!-- 내용 -->
		                    <tr>
		                        <th scope="row">내용</th>
		                        <td colspan="3">
		                        ${boardList.content}
		                         </td>
		                    </tr>
		                    <!-- 첨부파일 -->
                    
		                    <c:if test="${param.type eq 'N' or param.type eq 'Q'}" >
							<tr>
		                        <th scope="row">첨부파일</th>
		                        <td colspan="3">
		                        <c:forEach items="${fileList}" var="fileList">
			                        <a href="${path}/download?idx=${fileList.idx}"><c:out value="${fileList.realName}" /></a>
			                    </c:forEach>
		                        </td>
		                    </tr>
		                    </c:if>
                    	</c:when>
                    	<c:when test="${param.type eq 'F'}">
                    		<!-- 등록일 -->
		                     <tr>
		                        <th scope="row">등록일</th>
		                        <td colspan="3">
		                          <c:out value='${fn:substring(boardList.insertDate, 0, 19)}'/>
		                        </td>
		                        </tr>
		                        <!-- 구분 -->
		                        <tr>
		                        <th scope="row">구분</th>
		                        <td colspan="3">
			                        <c:out value="${boardList.categoryName}"/> 
		                        </td>
		                    
		                    </tr>
		                    <!-- 노출 상태 -->
		                    <tr>
		                        <th scope="row">노출 상태</th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                                <li><label>
		                                ${boardList.state}
		                                </label></li>
		                            </ul>
		                        </td>
		                    </tr>
		                    <!-- 제목 -->
							<tr>
		                        <th scope="row">제목</th>
		                        <td colspan="3">
		                          <c:out value='${boardList.title}'/>
		                        </td>
		                    </tr>
		                    <!-- 내용 -->
		                    <tr>
		                        <th scope="row">내용</th>
		                        <td colspan="3">
		                        ${boardList.content}
		                         </td>
		                    </tr>
                    	</c:when>
                    	<c:when test="${param.type eq 'Q'}">
                    		<tr>
		                        <th scope="row">등록자</th>
		                        <td colspan="3">
		                            <c:out value='${boardList.name}'/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">이메일</th>
		                        <td colspan="3">
		                            <c:out value='${boardList.email}'/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">등록일</th>
		                        <td colspan="3">
		                            <c:out value='${fn:substring(boardList.insertDate, 0, 19)}'/>
		                        </td>
		                    </tr>
		                    <!-- 답변 여부 -->
	                    	<tr>
		                        <th scope="row">답변여부</th>
		                        <td colspan="3">
		                          ${boardList.replyFlag}
		                        </td>
		                    </tr>
		                     <!-- 제목 -->
							<tr>
		                        <th scope="row">제목</th>
		                        <td colspan="3">
		                          <c:out value='${boardList.title}'/>
		                        </td>
		                    </tr>
		                     <!-- 내용 -->
							<tr>
		                        <th scope="row">내용</th>
		                        <td colspan="3">
		                          ${boardList.content}
		                        </td>
		                    </tr>
		                    <!-- 첨부파일 -->
		                    <tr>
		                        <th scope="row">첨부파일</th>
		                        <td colspan="3">
		                        <c:forEach items="${fileList}" var="fileList">
			                        <a href="${path}/download?idx=${fileList.idx}"><c:out value="${fileList.realName}" /></a>
			                    </c:forEach>
		                        </td>
		                    </tr>
                    	</c:when>
                    	<c:when test="${param.type eq 'B' or param.type eq 'A'}">
                    	<!-- 제목 -->
							<tr>
		                        <th scope="row">제목</th>
		                        <td colspan="3">
		                          <c:out value='${boardList.title}'/>
		                        </td>
		                    </tr>
		                    <!-- 노출 상태 -->
		                    <tr>
		                        <th scope="row">노출 상태</th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                                <li><label>
		                                ${boardList.state}
		                                </label></li>
		                            </ul>
		                        </td>
		                    </tr>
		                    <!-- 등록자 -->
		                    <tr>
		                        <th scope="row">등록자</th>
		                        <td colspan="3">
		                            <c:out value='${boardList.name}'/>
		                        </td>
		                    </tr>
		                    <!-- 등록일 -->
							<tr>
		                        <th scope="row">등록일</th>
		                        <td colspan="3">
		                          <c:out value='${fn:substring(boardList.insertDate, 0, 19)}'/>
		                        </td>
		                    </tr>
		                    <!-- 링크URL -->
		                    <tr>
		                        <th scope="row">링크URL</th>
		                        <td colspan="3">
		                          <c:out value='${boardList.url}'/>
		                          <c:choose>
		                          	<c:when test="${boardList.window eq 'H'}">
		                          		현재창
		                          	</c:when>
		                          	<c:when test="${boardList.window eq 'W'}">
		                          		새창
		                          	</c:when>
		                          </c:choose>
		                        </td>
		                    </tr>
		                    <!-- 노출 기간 -->
	                     <tr>
	                        <th scope="row">노출기간</th>
	                        <td colspan="3">
	                          <c:set var="date" value="${fn:split(boardList.startDate, '~')}"/>
	                          <c:out value='${date[0]}'/> <c:out value='${boardList.startTime}'/>시 ~
	                          <c:out value='${date[1]}'/> <c:out value='${boardList.endTime}'/>시
	                        </td>
	                        </tr>
                    		<!-- 첨부파일 내용 -->
                    		<c:if test="${param.type eq 'B'}">
		                    <tr>
		                        <th scope="row">PC 이미지</th>
		                        <td colspan="3">
		                        <c:forEach items="${fileList}" var="pcFile">
		                        	<c:if test="${pcFile.type eq 'B' or pcFile.type eq 'AL'}">
		                        	<img src="${path}${pcFile.url}" style="max-width: 500px; max-height: 500px;"/>
		                        	</c:if>
		                        </c:forEach>
		                         </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">모바일 이미지</th>
		                        <td colspan="3">
		                        	<c:forEach items="${fileList}" var="mobileFile">
		                        	<c:if test="${mobileFile.type eq 'MB' or mobileFile.type eq 'MAL'}">
		                        	<img src="${path}${mobileFile.url}" style="max-width: 500px; max-height: 500px;"/>
		                        	</c:if>
		                        	</c:forEach>
		                         </td>
		                    </tr>
		                    </c:if>		                  
                    	</c:when>
                    </c:choose>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="btn_area align_r mt20">
                <c:if test="${param.type ne 'Q'}">
                    <button type="button" onclick="fn_update('register')" class="btn">수정</button>
                    <button type="button" onclick="fn_update('delete')"class="btn">삭제</button>
                    </c:if>
                    <c:choose>
                		<c:when test="${param.type eq 'B' or param.type eq 'A'}">
                			<a href="${path}/board/banner?type=${param.type}" style="float:left" class="btn">목록</a>
                		</c:when>
                		<c:otherwise>
                			<a href="${path}/board/list?type=${param.type}" style="float:left" class="btn">목록</a>
                		</c:otherwise>
                	</c:choose>
                </div>
                
                <!-- 답변내용 -->
                <c:if test="${param.type eq 'Q'}">
                	<table class="detail mt20">
                	<form:form modelAttribute="boardVO" enctype="multipart/form-data">
                	<input type="hidden" name="idx" value="${param.idx}"/>
                	<input type="hidden" name="writer" value="${login.idx}"/>
                	<input type="hidden" name="title" value="${boardVO.title}"/>
                	<input type="hidden" name="type" value="${param.type}"/>
                    <caption>게시글 상세</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
                     <tr>
                        <th scope="row">답변내용</th>
                        <td colspan="3">
                            <textarea name="content" id="reply_content"  cols="30" rows="10" ></textarea>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">첨부파일</th>
                        <td colspan="3">
                            <div class="file_area">
                                 <input type="text" id="file_name01" name="file_name01">
											<input type="file" id="uploadFile" name="uploadFile" class="blind">
											<label for="uploadFile" class="btn v_ab">찾아보기</label>
											<span>(파일형식 : jpg,jpge, bmp, gif / 사이즈 : 000*0000 / 파일용량 : 5mb 이하)</span>
                                <ul class="mt10">
                            </ul>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                    
                    </form:form>
                </table>
                <div class="btn_area align_r mt20">
                	<span class="align_l">※ 답변된 내용은 수정/삭제가 불가능 합니다. 신중히 답변해주시기 바랍니다.</span>
                    <button type="button" onclick="checkReply()" class="btn">답변하기</button>
                </div>
                
				<c:forEach items="${qnaList}" var="qnaList" varStatus="status">
                	<table class="detail mt20">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row">답변자</th>
                        <td colspan="3">
                            <c:out value='${qnaList.name}'/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">답변일시</th>
                        <td colspan="3">
                            <c:out value='${fn:substring(qnaList.insertDate, 0, 19)}'/>
                        </td>
                    </tr>
                     <tr>
                        <th scope="row">답변내용</th>
                        <td colspan="3">
							${qnaList.content}
                        </td>
                    </tr>                 
                    <tr>
                        <th scope="row">첨부파일</th>
                        <td colspan="3">
                        <c:forEach items="${qnaList.fileList}" var="fvo">
	                        <a href="${path}/download?idx=${fvo.idx}"><c:out value="${fvo.realName}" /></a>
	                    </c:forEach>
                        </td>
                    </tr>
                    </tbody>
                </table>
                </c:forEach>
                </c:if>
            </div>
            
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${path}/js/util.js"></script>
<script>
    $(function() {
    	$("#gnb").find("li").eq(6).addClass("on");
    });
    
    function fn_update(type) {
    	var path = "${path}/board/${url}" + type + "?idx=${boardVO.idx}&type=${param.type}"
        
    	if (type === "delete") {
        	var confirm = window.confirm("삭제하시겠습니까?");
            
        	if (confirm) {
            	location.href = path;
            }
    	} else {
    		location.href = path;
        }
    }

    function checkReply() {
		var replyContent = $("#reply_content").val().trim();

		if (replyContent === "") {
			alert("답변내용을 입력하지 않았습니다.");
		} else {
			var confirm = window.confirm("답변하시겠습니까?");

			if(confirm) {
				ajax("boardVO", "${path}", "등록되었습니다");
			}
			
		}
    }  
</script>

</html>