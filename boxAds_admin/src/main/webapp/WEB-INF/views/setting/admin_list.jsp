<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_setting.jsp">
			<c:param name="menuOn" value="0" />
		</c:import>	
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>운영자관리</h3>
				<!-- <a href="#" class="btn btn_add"><span>등록</span></a> -->
            </div>
            <div class="list">
			<!-- <div class="tit02"><h4>운영자 관리</h4></div> -->
				<form action="${path}/setting/admin_list" method="get" >
	                <table class="search mt20">
	                    <caption>검색</caption>
	                    <colgroup>
	                        <col style="width:14%;">
	                        <col>
	                        <col style="width:14%;">
	                        <col>
	                    </colgroup>
	                    <tbody>
	                    
						<tr>
	                        <th scope="row">담당자 명</th>
	                        <td>
								<input type="text" id="d_name" name="name" value="${param.name}">
								<label for="d_name" class="blind">담당자 명</label>
	                        </td>
							<th scope="row">아이디</th>
	                        <td>
								<input type="text" id="u_id" name="id" value="${param.id}">
								<label for="u_id" class="blind">아이디</label>
	                        </td>						
	                    </tr>
	                    </tbody>
	                </table>
                 <div class="btn_area align_c mt20">
                    <button onclick="search()" type="button" class="btn btn_search">검색</button>
                </div>
                </form>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">총 <span class="txt_red"><c:out value="${page.totalCnt}"/></span>건</p>
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        <colgroup>
                            <col style="width:5%">
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col style="width:5%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">아이디</th>
                            <th scope="col">소속</th>
                            <th scope="col">성명</th>
                            <th scope="col">그룹</th>
                            <th scope="col">가입일자</th>
                            <th scope="col">최근방문일시</th>
                            <th scope="col">상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="admin" items="${adminList}" varStatus="status">
	                            <tr>
	                                <td>${status.count}</td>
	                                <td><a href="admin_write?idx=${admin.idx}">${admin.id}</a></td>
	                                <td><a href="admin_write?idx=${admin.idx}">${admin.dpmt}</a></td>
	                                <td><a href="admin_write?idx=${admin.idx}">${admin.name}</a></td>
	                                <td>${admin.grp}</td>
									<td>${fn:substring(admin.insertDate, 0, 10)}</td>
									<td>${admin.loginDate}</td>
									<td>
										<c:choose>
											<c:when test="${admin.useFlag eq 'Y'}">
												정상
											</c:when>
											<c:otherwise>
												정지
											</c:otherwise>
										</c:choose>
									</td>
	                            </tr>
                           </c:forEach>							
						</tbody>
                    </table>
                    
                    <div class="pagination mt50">                        
                    </div>
					<div class="btn_area align_r">
						 <a href="admin_write" class="btn btn_search">등록</a>
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
	$('#gnb ul li').eq(7).addClass('on');

	$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));
	
	function search() {
		if ($("input[name=name]").val() === "" && $("input[name=id]").val() === "") {
			alert("검색어를 입력해주세요");
			return false;
		} 

		$("form").submit();		
	}
</script>
</body>
</html>
