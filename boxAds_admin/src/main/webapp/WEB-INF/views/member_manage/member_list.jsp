<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${param.state eq 'Y' }">
		<c:set var="menu" value="0"/>
	</c:when>
	<c:when test="${param.state eq 'H' }">
		<c:set var="menu" value="1"/>
	</c:when>
	<c:when test="${param.state eq 'N' }">
		<c:set var="menu" value="2"/>
	</c:when>
</c:choose>	
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_member_manage.jsp">
					<c:param name="menuOn" value="${menu}" />
		</c:import>	
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>활동 회원</h3>
				<!-- <a href="#" class="btn btn_add"><span>등록</span></a> -->
            </div>
            <div class="list">
            <form:form modelAttribute="memberVO" action="${path}/member/list">
            	<input type="hidden" name="state" value="${param.state}">
            	<input type="hidden" name="curPage" value="${page.curPage}">
                <table class="search">
                
                    <caption>검색</caption>
                    <colgroup>
                        <col style="width:14%;">
                        <col>
                        <col style="width:14%;">
                        <col>
                    </colgroup>
                    <tbody>
                    
                    <tr>
                        <th scope="row">키워드</th>
                        <td colspan="3">
                            <select name="searchType" style="width:100px;">
                                <option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>업체명</option>
                                <option value="id" <c:if test="${param.searchType eq 'id'}">selected</c:if>>이메일</option>
								<option value="phone" <c:if test="${param.searchType eq 'phone'}">selected</c:if>>전화번호</option>
                            </select>
							<input type="text" id="keywd" name="keyword" value="${param.keyword}">
							<label for="keywd" class="blind">키워드</label>
                        </td>
						<!-- <th scope="row">이메일</th>
                        <td></td>				 -->		
                    </tr>
                    <tr>
						<th scope="row">기간</th>
                    <td>
						<input type="text" title="시작일" name="insertDate" value="${param.insertDate}" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date">
						<span class="hypen">~</span>
						<input type="text" title="종료일" name="endDate" value="${param.endDate}" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date">
					</td>
					<c:choose>
						<c:when test="${param.state eq 'Y'}">
		                    <th scope="row">인증여부</th>
							<td>
								
								<input type="radio" id="all_fi" name="confirmFlag" value="" checked>
								<label for="all_fi">전체</label>
								<input type="radio" id="ye_fi" name="confirmFlag" value="Y" <c:if test="${param.confirmFlag eq 'Y'}">checked</c:if>>
								<label for="ye_fi">인증</label>
								<input type="radio" id="no_fi" name="confirmFlag" value="N" <c:if test="${param.confirmFlag eq 'N'}">checked</c:if>>
								<label for="no_fi">미인증</label>
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="2"></td>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${param.state eq 'Y'}">
					</c:if> --%>
                    </tr>
                    
                    </tbody>
                </table>
                 <div class="btn_area align_c mt20">
                    <button type="submit" class="btn btn_search">검색</button>
					
                </div>
                </form:form>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">총 <span class="txt_red"><c:out value="${page.totalCnt}"/></span>건 <button type="button" class="btn btn_excel excel">엑셀다운로드</button></p>
						
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        <colgroup>
                            <col style="width:7%">
                            <col style="width:15%">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="*">
                            <c:if test="${param.state eq 'Y' }">
                            <col style="width:10%;">
                            </c:if>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">업체명</th>
                            <th scope="col">이메일</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">가입일자</th>
                            <c:if test="${param.state eq 'Y' }">
                            <th scope="col">최근방문일시</th>
                            <th scope="col">인증여부</th>
                            </c:if>
                            <c:if test="${param.state eq 'H' }">
                            <th scope="col">휴면처리일시</th>
                            </c:if>
                             <c:if test="${param.state eq 'N' }">
                             <th scope="col">탈퇴처리일시</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                        	<c:when test="${empty memberList}">
                        		<tr><td colspan="6">등록된 회원이 없습니다</td></tr>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach items="${memberList}" var="memberList" varStatus="status">
		                            <tr>
		                                <td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
		                                <td><a href="${path}/member/detail?idx=${memberList.idx}"><c:out value="${memberList.name}"/></a></td>
		                                <td><a href="${path}/member/detail?idx=${memberList.idx}"><c:out value="${memberList.id}"/></a></td>
		                                <td><c:out value="${fn:substring(memberList.phone, 0, 3)}-${fn:substring(memberList.phone, 3, 7)}-${fn:substring(memberList.phone, 7, 12)}"/></td>
		                                <td><c:out value="${fn:substring(memberList.insertDate, 0, 10)}"/></td>
										<c:if test="${param.state eq 'Y' }">
										<td><c:out value="${fn:substring(memberList.loginDate, 0, 19)}"/></td>
										<td>
											<select name="confirm">
												<c:choose>
													<c:when test="${memberList.confirmFlag eq '인증'}">
														<option value="Y">인증</option>
													</c:when>
													<c:when test="${memberList.confirmFlag eq '미인증'}">
														<option value="N">미인증</option>
														<option value="Y">인증</option>
													</c:when>
												</c:choose>
											</select>
											<input type="hidden" name="idx" value="${memberList.idx}"/>
										</td>
										</c:if>
										<c:if test="${param.state eq 'H' }">
										<td><c:out value="${fn:substring(memberList.loginDate, 0, 19)}"/></td>
										</c:if>
										<c:if test="${param.state eq 'N' }">
										<td><c:out value="${fn:substring(memberList.deleteDate, 0, 19)}"/></td>
										</c:if>
		                            </tr>
		                            </c:forEach>
                        	</c:otherwise>
                        </c:choose>
                        
                        </tbody>
                    </table>
                    
                    <div class="pagination mt50">                        
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
	$('#gnb ul li').eq(5).addClass('on');
    $("#datepicker1, #datepicker2").datepicker();

    $(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));
    
    $("select[name=confirm]").change(function() {
    	var index = $("select[name=confirm]").index(this);
		var idx = $("input[name=idx]").eq(index).val();

		$.post("${path}/member/confirm_change", {idx: idx, confirmFlag: "Y"}, function() {
			alert("사업자 인증되었습니다.");
			location.reload();
		});
	});

    $(".excel").on("click", function (){
        let defAction = $("#memberVO").attr("action");
        $("#memberVO").attr("action", "../excel/member_excel");
    	$("#memberVO").submit();
    	$("#memberVO").attr("action", defAction);
    })
  

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});

  });

</script>

</body>
</html>
