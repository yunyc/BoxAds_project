<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<div class="sub_wrap">
	<c:import url="../inc/left_setting.jsp">
		<c:param name="menuOn" value="1" />
	</c:import>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>코드 관리</h3>
				</div>
				<div class="list">
					<ul class="s_lnb">
						<li <c:if test="${param.type eq 'P' || code.type eq 'P'}">class="on"</c:if>><a href="code_list?type=P">상품유형</a></li>
						<li <c:if test="${param.type eq 'C' || code.type eq 'C'}">class="on"</c:if>><a href="code_list?type=C">카테고리</a></li>
						<li <c:if test="${param.type eq 'F' || code.type eq 'F'}">class="on"</c:if>><a href="code_list?type=F">FAQ 메뉴</a></li>
					</ul>
				<form action="code_write" method="post" onsubmit="return validationForm()">
					<div class="table_wrap view">
						<table class="detail mt20">
							<caption>카테고리</caption>
							<colgroup>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출상태</th>
									<td>
										<input type="radio" id="open_y" name="useFlag" value="Y" checked="checked" <c:if test="${code.useFlag eq 'Y'}">checked='checked'</c:if>>
										<label for="open_y">노출</label>
										<input type="radio" id="open_n" name="useFlag" value="N" <c:if test="${code.useFlag eq 'N'}">checked='checked'</c:if>>
										<label for="open_n">비노출</label>
									</td>
								</tr>
								<c:if test="${!empty codeName && !empty codeName.c1_name}">
									<tr>
										<th scope="row">1차 카테고리명</th>
										<td>
											${codeName.c1_name}
										</td>
									</tr>
								</c:if>
								<c:if test="${!empty codeName && !empty codeName.c2_name}">
									<tr>
										<th scope="row">2차 카테고리명</th>
										<td>
											${codeName.c2_name}
										</td>
									</tr>
								</c:if>								
									<tr>
										<th scope="row">${empty code ? param.depth : code.depth}차 카테고리명</th>
										<td>
											<input type="text" id="name${param.depth}" name="name" value="${code.name}">
											<label for="name${param.depth}" class="blind">${param.depth}차 카테고리명</label>
										</td>
									</tr>
							</tbody>
						</table>	
					</div>
					<div class="btn_area align_c">
						<a href="code_list?type=${param.type}" class="btn">목록</a>
						<button class="btn" type="submit">등록</button>
					</div>
					<input type="hidden" name="depth" value="${empty code ? param.depth : code.depth}">
					<input type="hidden" name="parent" value="${empty code ? param.parent : code.parent}">
					<input type="hidden" name="type" value="${empty code ? param.type : code.type}">
					<input type="hidden" name="idx" value="${empty code.idx || code.idx eq '' ? 0 : code.idx}">
				</form>					
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#gnb ul li').eq(7).addClass('on');
	function validationForm(){
		if(!checkInputName('name', '이름을')) return false;
		
		return true;
	}
</script>
</body>
</html>
