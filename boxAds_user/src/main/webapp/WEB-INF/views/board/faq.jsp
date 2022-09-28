<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap faq_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>이용안내</li>
							<li>FAQ</li>
						</ul>
					</div>
					<h2 class="title">FAQ</h2>
				
					<div class="mypage_content">
						<!-- tab -->
						<div class="tab list_tab">
							<c:forEach var="i" begin="1" end="${setListCnt}">
							<ul>
								<c:forEach items="${setList}" var="setList" begin="${(i - 1) * 5}" end="${i * 5 - 1}">
								<li <c:if test="${setList.idx eq param.category}">class='on'</c:if>><a href="?type=F&category=${setList.idx}"><c:out value="${setList.name}"/></a></li>
								<input class="idx" type="hidden" value="${setList.idx}"/>
								</c:forEach>
							</ul>
							</c:forEach>
						</div>
						<div class="list_wrap" style="display: none;">
							<dl id="pageList" class="faq_list">
							
							</dl>
						</div>
						<!-- //list_wrap -->
						<div class="btn_area fulwidth">
							<button id="moreText" type="button" class="btn btn_more">더보기 +</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="start" value="0">
		<input type="hidden" id="category" value="${empty param.category? setList[0].idx : param.category}">
		<input type="hidden" id="total" value="${boardCnt}">
		<input type="hidden" id="url" value="${path}/board/boardAjaxList?type=F">
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script>
		$(function(){
			if('${param.category}' == ""){ $(".list_tab li").eq(0).addClass('on');}
			$(".list_wrap").eq(0).show();
			
			/* faq토글 */
			$(document).on('click', '.faq_list dt a', function(){
				if ( $(this).hasClass('on') ){
					$('.faq_list dt a').removeClass('on');
					$('.faq_list dd').slideUp();
					
				} else {
					$('.faq_list dt a').removeClass('on');
					$('.faq_list dd').slideUp();
					$(this).addClass('on');
					$(this).parents('dt').next('dd').slideDown();
				}

			});

			appendTextList("pageList", 10)


			/* $(".list_tab li").click(function() {				
				var index = $(".list_tab li").index(this);
				$(".list_tab li").removeClass('on');
				$(this).addClass('on');

				$("#pageList > *").remove();
				
				var idx = $(".list_tab li").index(this);
				$("#category").val($(".idx").eq(idx).val());
				$("#start").val(0);
				
				appendTextList("pageList", 10);
			}); */
			
			//$(".list_tab li a").eq(0).trigger("click");
		});
		</script>
</body>
</html>