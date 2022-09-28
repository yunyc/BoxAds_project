<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_member_manage.jsp">
			<c:param name="menuOn" value="3" />
		</c:import>	
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>메세지 관리</h3>				
            </div>
            <div class="list">
            <form:form>
            	<input type="hidden" name="curPage" value="${page.curPage}">
                <table class="search">
                    <caption>검색</caption>
                    <colgroup>
                        <col style="width:14%;">
                        <col>
                        <col style="width:14%;">
                        <col>
                    </colgroup>
                    <tbody><tr>
                        <th scope="row">키워드</th>
                        <td>
                            <select style="width:100px;" name="searchType">
                                <option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>업체명</option>
                                <option value="id" <c:if test="${param.searchType eq 'id'}">selected</c:if>>이메일</option>
								<option value="phone" <c:if test="${param.searchType eq 'phone'}">selected</c:if>>전화번호</option>
                            </select>
							<input type="text" id="keywd" name="keyword" value="${param.keyword}">
							<label for="keywd" class="blind">키워드</label>
                        </td>
						<th scope="row">기간</th>
						<td>
						<input type="text" title="시작일" name="startDate" value="${param.startDate}" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date">
						<span class="hypen">~</span>
						<input type="text" title="종료일" name="endDate" value="${param.endDate}" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date">
						</td>					
                    </tr>
                    </tbody>
                </table>
                 <div class="btn_area align_c mt20">
                    <button type="submit" class="btn btn_search">검색</button>
					
                </div>
                </form:form>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">총 <span class="txt_red"><c:out value="${page.totalCnt}"/></span>건</p>
						
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:10%">
                            <col style="width:10%;">
                            <col style="*">
                            <col style="width:15%;">
                            <col style="width:15%;">

                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">문의자</th>
                            <th scope="col">문의 대상</th>
                            <th scope="col">메세지</th>
                            <th scope="col">등록일시</th>
                            <th scope="col">변경일시</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                        	<c:when test="${empty list}">
                        		<tr><td colspan="6">등록된 메세지가 없습니다</td></tr>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach items="${list}" var="vo" varStatus="status">
		                            <tr>
		                                <td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
		                                <td>${vo.wName}</td>
		                                <td>${vo.rName}</td>
		                                <td class="ewwe"><a href="#" onclick="pageMove('/admin/message_detail?writer=${vo.writer}&receiver=${vo.receiver}')"><c:out value="${vo.content}"/></a></td>
		                                <td>${vo.insert_date}</td>
		                                <td>${vo.confirm_date}</td>
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
    dateFormat: 'yy-mm',
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
	$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));
    $("#datepicker1, #datepicker2").datepicker();
  });

		$('#lnb ul.menu > li').eq(3).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
		$('#gnb ul li').eq(5).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});

</script>
</body>
</html>
