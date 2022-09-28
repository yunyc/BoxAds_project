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
	</c:when>
	<c:when test="${param.type eq 'A'}">
		<c:set var="title" value="알림 관리" />
		<c:set var="menuon" value="4" />
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
            <div class="list">
                <table class="search">
                    <caption>검색</caption>
                    <colgroup>
                        <col style="width:14%;">
                        <col>
                        <col style="width:14%;">
                        <col>
                    </colgroup>
                    <tbody>
                    <form:form modelAttribute="boardVO">
                    <input type="hidden" name="curPage" value="${page.curPage}">
                    <c:choose>	
                    	<c:when test="${param.type eq 'Q'}">
                    		<tr>
                        <th scope="row">답변여부</th>
                        <td>
                            <select name="replyFlag" style="width:100px;">
                                <option value="">전체</option>
                                <option value="N" <c:if test="${param.replyFlag eq 'N'}">selected</c:if>>미답변</option>
								<option value="Y" <c:if test="${param.replyFlag eq 'Y'}">selected</c:if>>답변완료</option>
                            </select>
                        </td>
						<th scope="row">등록일자</th>
                        <td >
								<input type="text" title="시작일" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date" name="insertDate" value="${param.insertDate}">
								<span class="hypen">~</span>
								<input type="text" title="종료일" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date" name="endDate" value="${param.endDate}">
								<!--<button class="month on">1개월</button>
								<button class="month">3개월</button>
								<button class="month">6개월</button>-->
							</td>
                    </tr>
                    <tr>
                        <th scope="row">키워드</th>
                        <td colspan="3">
                            <select name="searchType" style="width:100px;">
                                <option value="title" <c:if test="${param.searchType eq 'title'}">selected</c:if>>제목</option>
                                <c:if test="${param.type eq 'N' or param.type eq 'F' or param.type eq 'Q'}">
                                <option value="content" <c:if test="${param.content eq 'content'}">selected</c:if>>내용</option>
                                </c:if>
								<option value="name" <c:if test="${param.name eq 'name'}">selected</c:if>>등록자</option>
                            </select>
							<input id="search" type="text" name="keyword" value="${param.keyword}"/>
                        </td>
                        </tr>
                    	</c:when>
                    	<c:otherwise>
                    		<tr>
                        <th scope="row">노출상태</th>
                        <td>
                            <select name="state" style="width:100px;">
                                <option value="">전체</option>
                                <option value="Y" <c:if test="${param.state eq 'Y'}">selected</c:if>>노출</option>
								<option value="N" <c:if test="${param.state eq 'N'}">selected</c:if>>미노출</option>
                            </select>
                        </td>
						<th scope="row">등록일자</th>
                        <td >
								<input type="text" title="시작일" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date" name="insertDate" value="${param.insertDate}">
								<span class="hypen">~</span>
								<input type="text" title="종료일" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date" name="endDate" value="${param.endDate}">
								<!--<button class="month on">1개월</button>
								<button class="month">3개월</button>
								<button class="month">6개월</button>-->
							</td>
                    </tr>
                    <tr>
                        <th scope="row">키워드</th>
                        <td ${param.type eq 'B' or param.type eq 'A' ? "colspan='3'" : ""}>
                            <select name="searchType" style="width:100px;">
                                <option value="title" <c:if test="${param.searchType eq 'title'}">selected</c:if>>제목</option>
                                <c:if test="${param.type eq 'N' or param.type eq 'F' or param.type eq 'Q'}">
                                	<option value="content" <c:if test="${param.searchType eq 'content'}">selected</c:if>>내용</option>
                                </c:if>
								<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>등록자</option>
                            </select>
							<input id="search" ${param.type eq 'B' or param.type eq 'A' or param.type eq 'Q' ? "style='width:60%;'" : ""} type="text" name="keyword" value="${param.keyword}"/>
                        </td>
                        <c:if test="${param.type eq 'N'}">
                        	<th scope="row">구분</th>
                        <td>
                            <ul class="input_list">
                                <li><input type="radio" name="adGroup" id="rdo01_01" checked="" value=""><label for="rdo01_01">전체</label></li>
                                <li><input type="radio" name="adGroup" id="rdo01_02" value="C" <c:if test="${param.adGroup eq 'C'}">checked</c:if>><label for="rdo01_02">공통</label></li>
                                <li><input type="radio" name="adGroup" id="rdo01_03" value="O" <c:if test="${param.adGroup eq 'O'}">checked</c:if>><label for="rdo01_03">운영자</label></li>
                                <li><input type="radio" name="adGroup" id="rdo01_04" value="A" <c:if test="${param.adGroup eq 'A'}">checked</c:if>><label for="rdo01_04">제휴사</label></li>
                            </ul>
                        </td>
                        </c:if>
               
                        <c:if test="${param.type eq 'F'}">
                        	<th scope="row">구분</th>
                        <td>
                            <select name="category" style="width:200px;">
                            	<option value="0">선택하세요</option>
                            	<c:forEach items="${setList}" var="setList">
                            		<option value="${setList.idx}" <c:if test="${param.category eq setList.idx}">selected</c:if>><c:out value="${setList.name}"/></option>
                            	</c:forEach>
                            </select>
                        </td>
                        </c:if>
                    </tr>
                    	</c:otherwise>
                    </c:choose>
                    
                    </form:form>
                    </tbody>
                </table>
                 <div class="btn_area align_r mt20">
                    <button type="button" onclick="checkKeyword()" class="btn btn_search">검색</button>
					<button type="button" class="btn btn_search excel">엑셀다운로드</button>
                </div>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">검색결과 총 <span>${page.totalCnt}</span>건</p>
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        
                        <thead>
                        <tr>
                        	<c:choose>
                        		<c:when test="${param.type eq 'N'}">
                        			<th scope="col" style="width:3%;">번호</th>
                        			<th scope="col" style="width:5%;">구분</th>
                        			<th scope="col" style="width:20%;">제목</th>
                        			<th scope="col" style="width:5%;">등록자</th>
                        			<th scope="col" style="width:5%;">등록일</th>
                        			<th scope="col" style="width:5%;">첨부파일</th>
                        			<th scope="col" style="width:5%;">조회수</th>
                        			<th scope="col" style="width:5%;">노출상태</th>
                        		</c:when>
                        		<c:when test="${param.type eq 'F'}">
                        			<th scope="col" style="width:3%;">번호</th>
                        			<th scope="col" style="width:5%;">구분</th>
                        			<th scope="col" style="width:20%;">제목</th>
                        			<th scope="col" style="width:5%;">등록일</th>
                        			<th scope="col" style="width:5%;">조회수</th>
                        			<th scope="col" style="width:5%;">노출상태</th>
                        		</c:when>
                        		<c:when test="${param.type eq 'Q'}">
                        			<th scope="col" style="width:3%;">번호</th>
                        			<th scope="col" style="width:20%;">제목</th>
                        			<th scope="col" style="width:5%;">등록자</th>
                        			<th scope="col" style="width:5%;">등록일</th>
                        			<th scope="col" style="width:5%;">답변일</th>
                        			<th scope="col" style="width:5%;">첨부파일</th>
                        			<th scope="col" style="width:5%;">답변여부</th>
                        		</c:when>
                        		<c:when test="${param.type eq 'B' or param.type eq 'A'}">
                        			<th scope="col" style="width:3%;">선택</th>
                        			<th scope="col" style="width:20%;">제목</th>
                        			<th scope="col" style="width:5%;">등록자</th>
                        			<th scope="col" style="width:5%;">등록일</th>
                        			<th scope="col" style="width:10%;">노출기간</th>
                        			<th scope="col" style="width:5%;">노출상태</th>
                        		</c:when>
                        	</c:choose>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                        	<c:when test="${empty boardList}">
                        		<c:choose>
		                        		<c:when test="${param.type eq 'N'}">
		                        			<tr><td colspan="8">등록된 공지사항이 없습니다.</td></tr>			                              
		                        		</c:when>
		                        		<c:when test="${param.type eq 'F'}">
		                        			<tr><td colspan="6">등록된 FAQ가 없습니다.</td></tr>
		                        		</c:when>
		                        		<c:when test="${param.type eq 'Q'}">		                        			
			                                <tr><td colspan="7">등록된 문의글이 없습니다.</td></tr>
		                        		</c:when>
		                        		<c:when test="${param.type eq 'B' or param.type eq 'A'}">
		                        			<tr><td colspan="6">등록된 내용이 없습니다.</td></tr>		                        			
		                        		</c:when>
		                        	</c:choose>
                        	</c:when>
                        	<c:otherwise>
		                        <c:forEach items="${boardList}" var="boardList" begin="0" end="9" varStatus="status">
		                        	<tr>
		                        	<c:choose>
		                        		<c:when test="${param.type eq 'N'}">
		                        			<!-- 번호 -->
		                        			<td>
		                        				<c:choose>
		                        					<c:when test="${boardList.noticeFlag eq 'N'}">		                        						
		                        						${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}
		                        					</c:when>
		                        					<c:when test="${boardList.noticeFlag eq 'Y'}">
		                        						공지
		                        					</c:when>
		                        				</c:choose>
		                        				</td>
		                        			<td>
			                        			${boardList.adGroup}
			                               </td>
			                               <!-- 제목 -->
			                                <td>
				                                <a href="${path}/board${url}/detail?idx=${boardList.idx}&type=${param.type}">
				                                	<c:out value='${boardList.title}'/>
				                                </a>
			                                </td>
			                                <td><c:out value='${boardList.name}'/></td>
			                                <td>
			                                	<c:out value='${fn:substring(boardList.insertDate, 0, 10)}'/>
			                                <td>
			                                	<c:if test="${boardList.parent ne 0}">
			                                		<img src="../images/sub/file_ico.png" alt="첨부파일">
			                                	</c:if>
			                                </td>
			                                <td><c:out value='${boardList.viewCnt}'/></td>
			                                <td>
			                                	${boardList.state}
			                                </td>
		                        		</c:when>
		                        		<c:when test="${param.type eq 'F'}">
		                        			<!-- 번호 -->
		                        			<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
		                        			<!-- 구분 -->
			                                <td>
			                                	<c:out value="${boardList.categoryName}"/>
			                                </td>
			                                <!-- 제목 -->
			                                <td>
				                                <a href="${path}/board${url}/detail?idx=${boardList.idx}&type=${param.type}">
				                                	<c:out value='${boardList.title}'/>
				                                </a>
			                                </td>
			                                <td><c:out value='${fn:substring(boardList.insertDate, 0, 10)}'/></td>
			                                <td><c:out value='${boardList.viewCnt}'/></td>
			                                <td>
			                                	${boardList.state}
			                                </td>
		                        		</c:when>
		                        		<c:when test="${param.type eq 'Q'}">
		                        			<!-- 번호 -->
		                        			<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
			                               <!-- 제목 -->
			                                <td>
				                                <a href="${path}/board${url}/detail?idx=${boardList.idx}&type=${param.type}">
				                                	<c:out value='${boardList.title}'/>
				                                </a>
			                                </td>
			                                <td><c:out value='${boardList.name}'/></td>
			                                <td><c:out value='${fn:substring(boardList.insertDate, 0, 10)}'/></td>
			                                <td><c:out value='${fn:substring(boardList.replyDate, 0, 10)}'/></td>
			                                <td><c:if test="${boardList.parent ne 0}">
			                                		<img src="../images/sub/file_ico.png" alt="첨부파일">
			                                	</c:if></td>
			                                <td>
			                                 	${boardList.replyFlag}
			                                </td>
		                        		</c:when>
		                        		<c:when test="${param.type eq 'B' or param.type eq 'A'}">
		                        			<td><input type="checkbox"/></td>
		                        			<!-- 제목 -->
			                                <td>
				                                <a href="${path}/board/banner_detail?idx=${boardList.idx}&type=${param.type}">
				                                	<c:out value='${boardList.title}'/>
				                                </a>
			                                </td>
			                                <td><c:out value='${boardList.name}'/></td>
			                                <td><c:out value='${fn:substring(boardList.insertDate, 0, 10)}'/></td>
			                                <td>${boardList.startDate}</td>
			                                <td>
			                                	${boardList.state}
			                                </td>
		                        		</c:when>
		                        	</c:choose>
		                        	</tr>
		                        	</c:forEach>
                        	
                        	</c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    
                    <div class="pagination mt50">
                        
                    </div>
                    <div class="btn_area align_r">
                        <c:choose>
		                	<c:when test="${param.type eq 'B' or param.type eq 'A'}">
		                		<a href="${path}/board/banner_register?type=${param.type}" class="btn btn_search"><span>등록</span></a>
		                	</c:when>
		                	<c:otherwise>
		                		<a href="${path}/board/register?type=${param.type}" class="btn btn_search"><span>등록</span></a>
		                	</c:otherwise>
		                </c:choose> 
					</div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
	</div>
</div>
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
  
  $(function() {
    $("#datepicker1, #datepicker2").datepicker();
    $("#gnb").find("li").eq(6).addClass("on");

    $(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));

    $(".excel").on("click", function (){
    	let defAction = $("#boardVO").attr("action");
    	$("#boardVO").attr("action", "../excel/board_excel?type=${param.type}");
    	$("#boardVO").submit();
    	$("#boardVO").attr("action", defAction);
    })
  });

  function checkKeyword() {
		var searchKeyword = $("#search").val();

		if (!searchKeyword) {
			alert("검색어를 입력해주세요.");
		} else {
			$("#boardVO").submit();
		}
	  }
</script>
</body>
</html>
