<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:choose>
	<c:when test="${param.type eq 'S'}">
		<c:set var="title" value="이용 약관" />
		<c:set var="menuon" value="5" />
	</c:when>
	<c:when test="${param.type eq 'P'}">
		<c:set var="title" value="개인정보처리방침" />
		<c:set var="menuon" value="5" />
	</c:when>
	<c:when test="${param.type eq 'CP' || param.type eq 'CS'}">
		<c:set var="title" value="취소 / 환불정책" />
		<c:set var="menuon" value="6" />
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
            	<ul class="s_lnb">
            		<c:choose>
            			<c:when test="${menuon eq '5'}">
		            		<li <c:if test="${param.type eq 'S'}">class="on"</c:if>><a href="?type=S">이용약관</a>
		            		<li <c:if test="${param.type eq 'P'}">class="on"</c:if>><a href="?type=P">개인정보처리방침</a>            			
            			</c:when>
            			<c:otherwise>
            				<li <c:if test="${param.type eq 'CP'}">class="on"</c:if>><a href="?type=CP">전단지/스티커</a>
            				<li <c:if test="${param.type eq 'CS'}">class="on"</c:if>><a href="?type=CS">샘플</a>
            			</c:otherwise>
            		</c:choose>
            	</ul>
       		<form action="insertTerms" method="post"  onsubmit="return validate()">
                <input type="hidden" name="writer" value="1"/> <!-- value="${login.idx}" -->
                <input type="hidden" name="type" value="${param.type}"/>
                <input type="hidden" name="idx" value="${term.idx}"/>
                <input type="hidden" name="path" value="${path}" />
                <table class="detail mt20">
                    <caption>게시글 상세</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>                    
                    
                    <!-- 내용 -->
                    <tr>                       
                        <td colspan="4">
							<!-- 에디터 -->
                            <textarea name="content" id="content" cols="30" rows="10" >${term.content}</textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_area align_r mt20">
                	<c:choose>
                		<c:when test="${empty term}">
                			<button type="submit" class="btn save">등록</button>
                		</c:when>
                		<c:otherwise>
                			<button type="submit" class="btn save">수정</button>
                		</c:otherwise>
                	</c:choose>
                    
                    <!-- <button type="button" class="btn">삭제</button> -->
                    <%-- <a href="terms?type=${param.type}" class="btn">목록</a> --%>
                </div>
			</form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script src="${path}/js/editorSetting.js"></script>
<script>
    $(function() {
        $("#gnb").find("li").eq(6).addClass("on");

        $("form").submit(function() {
			var confirm = window.confirm("수정하시겠습니까?");

			if (confirm) {
				return true;
			} else {
				return false;
			}
        });
        
    });             

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
</body>
</html>
