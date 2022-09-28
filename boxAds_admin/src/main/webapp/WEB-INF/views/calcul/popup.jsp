<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:60%;height:460px;">
				<div class="list_tit">
					<h3 class="tit">${name}님 지급 이력</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="height:500px;overflow-y:auto;">
					<div class="write view">
						<table class="detail mt15 mb10 eree">
							<caption>지급이력 팝업</caption>
							<colgroup>
								<col style="width:8%">
								<col style="width:15%">
								<col>
								<col>
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">결제번호</th>
									<th scope="col">결제일시</th>
									<th scope="col">박스(Box)</th>
									<th scope="col">애드(Ads)</th>
									<th scope="col">판매월</th>
									<th scope="col">박스수</th>
									<th scope="col">광고수수료</th>
									<th scope="col">인쇄비</th>
									<th scope="col">쿠폰비</th>
									<th scope="col">판매수익</th>
								</tr>
							</thead>
							<c:if test="${empty hList}">
								<tr><td colspan="10">지급 이력이 없습니다.</td></tr>
							</c:if>
							<tbody id="pageList">		
							</tbody>
						</table>
						 <div class="pagination mt50">
						</div>
						<form action="${path}/calcul/popup">
							<input type="hidden" name="curPage" value="${page.curPage}"/>
							<input type="hidden" name="mIdx" value="${mIdx}"/>
							<input type="hidden" name="name" value="${name}"/>
							<input type="hidden" name="url" value="${path}/calcul/popupAjax"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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
			console.log(pageNo)
			var url = $("input[name=url]").val();
			var curPage = $("input[name=curPage]").val();
			var name = $("input[name=name]").val();
			var mIdx = $("input[name=mIdx]").val();
			
			$.post(url, {curPage:curPage, name:name, mIdx: mIdx}, function(data) {
				$("#pageList > *").remove();
				$("#pageList").append(data);
			});
		}
	 });
</script>
 </body>
</html>