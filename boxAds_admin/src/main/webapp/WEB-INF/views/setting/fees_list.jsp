<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_setting.jsp">
			<c:param name="menuOn" value="3" />
		</c:import>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>수수료 관리</h3>
				</div>
				<div class="list">
					<ul class="s_lnb s_lnb_02">
						<li <c:if test="${param.type eq 'B'}">class="on"</c:if>><a href="?type=B" >박스애드</a></li>
					</ul>
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
								<c:choose>
									<c:when test="${param.type eq 'B'}">
										<c:forEach var="fees" items="${feesList}" varStatus="status">
											<c:choose>
												<c:when test="${fees.category eq 'A'}">
													<tr>
														<th>광고</th>
														<td><input type="text" name="per" class="align_r" value="${fees.per}" data-idx="${fees.idx}" data-cate="A"><span class="ml15">%</span></td>													</tr>												
												</c:when>
												<c:when test="${fees.category eq 'P'}">
													<tr>
														<th>인쇄</th>
														<td><input type="text" name="per" class="align_r" value="${fees.per}" data-idx="${fees.idx}" data-cate="P"><span class="ml15">%</span></td>													</tr>													
												</c:when>
											</c:choose>
											
										</c:forEach>								
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>						
						</div>
					</div>
					<form id="form" action="fees_insert" method="post" onsubmit="return validFees()">
						<input type="hidden" name="perArr">
						<input type="hidden" name="idxArr">
						<input type="hidden" name="cateArr">
						<div class="btn_area fl_r">		
							<button type="submit" class="btn">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function() {	
	$('#gnb ul li').eq(7).addClass('on');
})

function validFees(){
	let idxArr = new Array();
	let perArr = new Array();
	let cateArr = new Array();
	let flag = true;
	
	$(":text").each(function(){
		console.log($(this).val());
		
		if($(this).val() == ''){
			alert("입력창 채워달라는 멘트"); 
			flag = false;
			return false;
		}
		
		if(flag){
			perArr.push($(this).val());
			idxArr.push($(this).attr("data-idx"));	
			cateArr.push($(this).attr("data-cate"));	
		}
	})
	
	$(":hidden[name='perArr']").val(perArr);
	$(":hidden[name='idxArr']").val(idxArr);
	$(":hidden[name='cateArr']").val(cateArr);
	
	return flag;
}
</script>
</body>
</html>
