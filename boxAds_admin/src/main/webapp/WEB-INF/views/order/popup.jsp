<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:choose>
	<c:when test="${param.type eq 'B'}">
		<c:set var="title" value="광고 진행내역" />
	</c:when>
	<c:when test="${param.type eq 'A'}">
		<c:set var="title" value="신청 진행내역" />
	</c:when>
</c:choose>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:60%;height:460px;">
				<div class="list_tit">
					<h3 class="tit">${title}</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="height:500px;overflow-y:auto;">
					<div class="write">
						<table class="detail mt15 mb10">
							<caption>팝업</caption>
							<colgroup>
								<col style="width:80%;">
								<col style="width:auto;">
							</colgroup>
							<thead>
								<tr>
									<th>내역</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody id="pageList">		
								
							</tbody>
						</table>
						 <div class="pagination mt50">
						</div>
						<form action="${path}/order/popup">
							<input type="hidden" name="curPage" value="${page.curPage}"/>
							<input type="hidden" name="type" value="${state}"/>
							<input type="hidden" name="oIdx" value="${oIdx}"/>
							<input type="hidden" name="url" value="${path}/order/popupAjax"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
 <script>
 $(function() {
	$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}', 'ajax'));

	var page = $(".pagination > a").not(".prev, .next");
	var curPage = '${page.curPage}';

	$(".pagination > a").removeClass("on");

	page.each(function(i, item) {
		var pageNum = $(item).text();

		if (pageNum == curPage) {
			$(item).addClass("on");
		}
	});

	ajaxPage(page.eq(curPage - 1).text());

	page.click(function() {

		var pageNo = $(this).text();
		$("input[name=curPage]").val(pageNo);
		$(".pagination > a").removeClass("on");
		$(this).addClass("on");

		ajaxPage(pageNo);
	});

	function ajaxPage(pageNo) {
		
		var url = $("input[name=url]").val();
		var curPage = $("input[name=curPage]").val();
		var state = $("input[name=state]").val();
		var oIdx = $("input[name=oIdx]").val();
		
		$.post(url, {curPage:curPage, state:state, oIdx: oIdx}, function(data) {
			$("#pageList > *").remove();
			$("#pageList").append(data);
		});
	}
 });
 </script>
 
</html>