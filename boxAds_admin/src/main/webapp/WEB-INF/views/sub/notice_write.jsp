<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 

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
	</c:when>
	<c:when test="${param.type eq 'A'}">
		<c:set var="title" value="알림 관리" />
		<c:set var="menuon" value="4" />
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${param.idx eq 0}">
		<c:set var="msg" value="수정" />
	</c:when>
	<c:otherwise>
		<c:set var="msg" value="등록" />
	</c:otherwise>
	
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
                    <input type="hidden" name="type" value="${param.type}"/>
                    <input type="hidden" name="idx" value="${param.idx}"/>
					<input type="hidden" name="path" value="${path}"/>
             		<form:form modelAttribute="boardVO" enctype="multipart/form-data">
                    <input type="hidden" name="writer" value="${login.idx}"/>
                    <c:choose>
                    	<c:when test="${param.type eq 'N'}">
                    		<!-- 등록자 -->
							<tr>
		                        <th scope="row">등록자 </th>
		                        <td colspan="3">
		                           ${login.name}
		                        </td>
		                    </tr>
		                    <!-- 등록일 -->
							<tr>
		                        <th scope="row">등록일</th>
		                        <td colspan="3">
		                        	${!empty boardList.insertDate ? fn:substring(boardList.insertDate, 0, 19) : sysYear}
		                        </td>
		                    </tr>
		                    <!-- 노출상태 -->
		                    <tr>
		                        <th scope="row">노출상태</th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                                <li><input type="radio" name="state" id="rdo01_01" ${boardList.state eq '노출' ? 'checked=""' : ''} 
		                                												   ${empty boardList.state ? 'checked=""' : ''} value="Y"><label for="rdo01_01">노출</label></li>
		                                <li><input type="radio" name="state" id="rdo01_02" ${boardList.state eq '미노출' ? 'checked=""' : ''} value="N"><label for="rdo01_02">비노출</label></li>
		                            </ul>
		                        </td>
		                    </tr>
		                    <!-- 글 제목 -->
							<tr>
		                        <th scope="row">제목<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <input type="text" name="title" value="${boardList.title}"placeholder="제목 입력" style="width:90%">
		                        </td>
		                    </tr>
		                    <!-- 내용 -->
		                    <tr>
		                        <th scope="row">내용<span class="txt_red"> * </span></th>
		                        <td colspan="3">
									<!-- 에디터 -->
		                            <textarea name="content" id="content" style="width: inherit;" cols="30" rows="10" >${boardList.content}</textarea>
		                        </td>
		                    </tr>
		                    <!-- 첨부파일 -->
	                    	<tr>
	                        <th scope="row">첨부파일</th>
	                        <td colspan="3">
	                            <input type="text" id="file_name01" name="file_name01">
											<input multiple="multiple" type="file" id="uploadFile" name="uploadFile" class="blind">
											<label for="uploadFile" class="btn v_ab">찾아보기</label>
											<span>(파일형식 : ppt, pptx, xls, xlsx, doc, docx, jpg, jpge, bmp, gif)</span>
	                            <ul class="mt10">
	                            	<c:forEach items="${fileList}" var="fileList">
	                            		<li style="float:none;">
	                                    	<span class="file_name"><c:out value="${fileList.realName}" /></span>
	                                    	<button type="button" class='btn_download del'>삭제</button>
	                                    	<input type="hidden" class="fileIdx" value="${fileList.idx}"/>
	                                	</li>
	                            	</c:forEach>
	                                
	                            </ul>
	                        </td>
	                    </tr>
	                     <!-- 공지글 설정 -->
	                    	<tr>
	                        <th scope="row">공지 설정</th>
	                        <td colspan="3">
	                            <ul class="input_list">
	                                <li><input type="checkbox" name="noticeFlag" id="noticeFlag" ${boardList.noticeFlag eq 'Y' ? 'checked=""' : ''}  value="Y">
	                                <label for="noticeFlag">공지 글 설정</label></li>
	                            </ul>
	                        </td>
	                    </tr>
	                     <!-- 대상 소속 그룹 -->
						<tr>
	                        <th scope="row">대상 소속 그룹<span class="txt_red"> * </span></th>
	                        <td colspan="3">
	                            <ul class="input_list">
	                                <li><input type="radio" name="adGroup" id="adGroup01" ${boardList.adGroup eq '공통' ? 'checked=""' : ''} 
	                                													 ${empty boardList.adGroup ? 'checked=""' : ''} value="C">
	                                	<label for="adGroup01">공통</label>
	                                </li>
	                                <li><input type="radio" name="adGroup" id="adGroup02" ${boardList.adGroup eq '운영자' ? 'checked=""' : ''} value="O">
	                                	<label for="adGroup02">운영자</label>
	                                </li>
	                                <li><input type="radio" name="adGroup" id="adGroup03" ${boardList.adGroup eq '제휴사' ? 'checked=""' : ''} value="A">
	                                	<label for="adGroup03">제휴사</label>
	                                </li>
	                            </ul>
	                        </td>
	                    </tr>
                    	</c:when>
                    	<c:when test="${param.type eq 'F'}">
                    		<c:if test="${! empty param.idx}">
                    			<tr>
		                        <th scope="row">등록일</th>
		                        <td colspan="3">
		                            <c:out value='${fn:substring(boardList.insertDate, 0, 19)}'/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">노출상태<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                                <li><input type="radio" name="state" id="rdo01_01" ${boardList.state eq '노출' ? 'checked=""' : ''} 
		                                												   ${empty boardList.state ? 'checked=""' : ''} value="Y"><label for="rdo01_01">노출</label></li>
		                                <li><input type="radio" name="state" id="rdo01_02" ${boardList.state eq '미노출' ? 'checked=""' : ''} value="N"><label for="rdo01_02">비노출</label></li>
		                            </ul>
		                        </td>
		                    </tr>
		                    </c:if>
                    		<!-- 글 제목 -->
							<tr>
		                        <th scope="row">제목<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <input type="text" name="title" value="${boardList.title}"placeholder="제목 입력" style="width:90%">
		                        </td>
		                    </tr>
		                    <!-- FAQ 종류선택 -->
		                    	<tr>
		                        <th scope="row">구분선택<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                            	<c:forEach items="${setList}" var="setList">
		                            		<li><input type="radio" name="category" id="category_${setList.idx}" ${boardList.category eq setList.idx ? 'checked=""' : ''} value="${setList.idx}">
		                                	<label for="category_${setList.idx}">${setList.name}</label>
		                                </li>
		                            	</c:forEach>
		                            </ul>
		                        </td>
		                    </tr>
		                    <!-- 내용 -->
		                    <tr>
		                        <th scope="row">내용<span class="txt_red"> * </span></th>
		                        <td colspan="3">
									<!-- 에디터 -->
		                            <textarea name="content" id="content"  cols="30" rows="10" >${boardList.content}</textarea>		                            
		                        </td>
		                    </tr>
                    	</c:when>
                    	<c:when test="${param.type eq 'Q'}">
                    	<!-- 글 제목 -->
							<tr>
		                        <th scope="row">제목</th>
		                        <td colspan="3">
		                            <input type="text" name="title" value="${boardList.title}"placeholder="제목 입력" style="width:90%">
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
		                     <!-- 답변여부 -->
							<tr>
		                        <th scope="row">답변여부</th>
		                        <td colspan="3">
	                                 	${boardList.replyFlag}
	                                </td>
		                    </tr>
		                    <!-- 내용 -->
		                    <tr>
		                        <th scope="row">내용</th>
		                        <td colspan="3">
									<!-- 에디터 -->
		                            <textarea name="content" id="content"  cols="30" rows="10" >${boardList.content}</textarea>
		                        </td>
		                    </tr>
                    	</c:when>
                    	<c:when test="${param.type eq 'B' or param.type eq 'A'}">
                    		<!-- 글 제목 -->
							<tr>
		                        <th scope="row">제목<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <input type="text" name="title" value="${boardList.title}"placeholder="제목 입력" style="width:90%">
		                        </td>
		                    </tr>
		                    <!-- 노출상태 -->
		                    <tr>
		                        <th scope="row">노출상태<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <ul class="input_list">
		                                <li><input type="radio" name="state" id="rdo01_01" ${boardList.state eq '노출' ? 'checked=""' : ''} value="Y"><label for="rdo01_01">노출</label></li>
		                                <li><input type="radio" name="state" id="rdo01_02" ${boardList.state ne '노출 ' ? 'checked=""' : ''} value="N"><label for="rdo01_02">비노출</label></li>
		                            </ul>
		                        </td>
		                    </tr>
		                    <!-- 등록자 -->
		                    <c:if test="${!empty param.idx}">
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
		                    </c:if>
		                    <!-- 노출기간 -->
		                     <tr>
		                    <th scope="row">노출기간<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                                <c:set var="date" value="${fn:split(boardList.startDate, '~')}"/>
										<input type="text" title="시작일" value="${date[0]}" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date" name="startDate">
										<select name="startTime">
										<c:forEach var="count" begin="1" end="24">
										<option value="${count}" ${boardList.startTime eq count ? "selected" : ""}>${count}시</option>
										</c:forEach>
		                            </select>
										<span class="hypen">~</span>
										<input type="text" title="종료일" value="${date[1]}" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date" name="endDate">
										<select name="endTime">
		                            	<c:forEach var="count" begin="1" end="24">
										<option value="${count}" ${boardList.endTime eq count ? "selected" : ""}>${count}시</option>
										</c:forEach>
		                            	</select>
									</td>
							</tr>
							<!-- pc이미지 -->
							
								<c:if test="${param.type eq 'B'}">
									<tr>
				                        <th scope="row">PC이미지<span class="txt_red"> * </span></th>
				                        <td id="pcrow" colspan="3">
				                        <div>
				                            <input type="text" id="file_name01" name="file_name01">
											<input type="file" id="pc" name="pcFile" class="blind">
											<label for="pc" class="btn v_ab">찾아보기</label>
											<span>(파일형식 : jpg,jpge, bmp, gif / 사이즈 : 000*0000 / 파일용량 : 5mb 이하)</span>
			                            	</div>
					                            <c:if test="${! empty param.idx}">
					                            <c:forEach items="${fileList}" var="pcFile">
					                            	<c:if test="${pcFile.type eq 'B' or pcFile.type eq 'AL'}">
					                            		<img src="${path}${pcFile.url}" style="max-width: 500px; max-height: 500px; margin-top: 10px;"/>
					                            		<input type="hidden" name="pcIdx" value="${pcFile.idx}"/>
					                            	</c:if>
					                            </c:forEach>
					                            </c:if>				                            
				                        </td>
				                    </tr>
				                    <!-- 모바일 이미지 -->
				                    <tr>
				                        <th scope="row">모바일 이미지<span class="txt_red"> * </span></th>
				                        <td id="mobilerow" colspan="3">
				                        <div>
			                            	<input type="text" id="file_name01" name="file_name01">
											<input type="file" id="mobile" name="mobileFile" class="blind">
											<label for="mobile" class="btn v_ab">찾아보기</label>
											<span>(파일형식 : jpg,jpge, bmp, gif / 사이즈 : 000*0000 / 파일용량 : 5mb 이하)</span>
											</div>
				                            	<c:if test="${! empty param.idx}">
				                            		<c:forEach items="${fileList}" var="mobileFile">
				                            		<c:if test="${mobileFile.type eq 'MB' or mobileFile.type eq 'MAL'}">
				                            			<img src="${path}${mobileFile.url}" style="max-width: 500px; max-height: 500px; margin-top: 10px;"/>
				                            			<input type="hidden" name="mobileIdx" value="${mobileFile.idx}"/>
				                            		</c:if>
				                            		</c:forEach>
				                            	</c:if>
				                        </td>
				                    </tr>
								</c:if>
		                    <!-- 링크 url -->
		                    <tr>
		                        <th scope="row">링크URL<span class="txt_red"> * </span></th>
		                        <td colspan="3">
		                            <input id="url" type="text" name="url" value="${boardList.url}" style="width:80%">
		                            <select onchange="disable()" id="window" name="window" style="width:10%">
		                            	<option ${boardList.window eq 'H' ? "selected" : ""} value="H">현재창</option>
		                            	<option ${boardList.window eq 'W' ? "selected" : ""} value="W">새창</option>
		                            	<option ${boardList.window eq 'N' ? "selected" : ""} value="N">링크없음</option>
		                            </select>
		                        </td>
		                    </tr>
                    	</c:when>
                    </c:choose>
                    </form:form>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="btn_area align_r mt20">
                	<button type="button" class="btn save">${msg}</button>
                    <!-- <button type="button" class="btn">삭제</button> -->
                    <c:choose>
                		<c:when test="${param.type eq 'B' or param.type eq 'A'}">
                			<a href="${path}/board/banner?type=${param.type}" style="float:left;" class="btn">목록</a>
                		</c:when>
                		<c:otherwise>
                			<a href="${path}/board/list?type=${param.type}" style="float:left;" class="btn">목록</a>
                		</c:otherwise>
                	</c:choose>
                    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/js/common.js"></script>
<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${path}/js/util.js"></script>
<script type="text/javascript" src="${path}/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="${path}/js/editorSetting.js"></script>
<script>
    $(function() {
        $("#gnb").find("li").eq(6).addClass("on");
        
        var idx = "${param.idx}" || 0;
        var type = "${param.type}" || "";
        
        if (type == "B" || type == "A") {
        	disable();
        }

        $("#pc, #mobile").change(function() {
            var id = $(this).attr("id");

            $("#" + id + "row > img").remove();
    		$("#" + id + "row").append("<img style='max-width: 500px; max-height: 500px; margin-top: 10px;'></img>");
    		readURL(this, "#" + id + "row > img");
        });

 	   // 유효성 검사후 ajax 전송
       $(".save").click(function() {
    	   var state = $('select[name=window] option:selected').val();
			var result = checkInputName("title", "제목을");
        	
        	if (type == "N" || type == "F") {
        		result = result && validate("내용을");
        		
        		if (type == "F") {
        			result = result && checkValid($("input[name=category]:checked").val(), "카테고리를 선택해주세요");
        		}
        	
        	} else if (type == "B") {
        		result = result && checkInputName("startDate", "노출기간을")
        						&& checkInputName("endDate", "노출기간을")
        						&& checkValid($("#pcrow > img").length != 0, "pc이미지를 입력해주세요.")
        						&& checkValid($("#mobilerow > img").length != 0, "모바일 이미지를 입력해주세요.");

				if (state !== "N") {
					result = result && checkInputName("url", "링크URL을");
				}
        	} else if (type == "A") {
        		result = result && checkInputName("startDate", "노출기간을")
								&& checkInputName("endDate", "노출기간을")
				
				if (state !== "N") {
					result = result && checkInputName("url", "링크URL을");
				}
			}
        	
        	if (result) {
        		var confirm = window.confirm("${msg}하시겠습니까?");
        		
        		if (confirm) {
        			
        			if (type == "B" || type == "A") {
        				$("form").submit();
        			} else {
        				ajax("boardVO", "${path}", "${msg}되었습니다.");
        			}
        			
        		}
        		
        	}
        });
    });
</script>
<script>

function disable() {
	
	var window = $('select[name=window] option:selected').val();

	if (window === "N") {
		$("#url").attr("disabled", "true");
	} else {
		$("#url").removeAttr("disabled");
	}
}
</script>

<script>
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });
  
</script>		
</html>
