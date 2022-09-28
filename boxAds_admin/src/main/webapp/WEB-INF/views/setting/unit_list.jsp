<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<div class="sub_wrap">
	<c:import url="../inc/left_setting.jsp">
		<c:param name="menuOn" value="2" />
	</c:import>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>단가관리</h3>
				</div>
				<div class="list">
				<form:form modelAttribute="unitVO" onsubmit="return valid()">
					<ul class="s_lnb s_lnb_02">
						<c:forEach var="code" items="${nameList}" varStatus="status">
							<li <c:if test="${idx eq code.idx}">class="on"</c:if>><a href="?idx=${code.idx}" >${code.c1_name} ${code.c2_name}</a></li>							
						</c:forEach>						
					</ul>					
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20 eree">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:15%">
									<col>
									<col style="width:15%">
									<col style="width:15%">
									<col style="width:15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구간코드</th>
										<th scope="col">인쇄구간</th>
										<th scope="col">단면</th>
										<th scope="col">양면</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${!empty unitList}">
											<c:forEach items="${unitList}" var="unit" varStatus="status">
												<tr>
													<td>
														<input type="text" name="uCodeArr" class="align_c" value="${unit.uCode}">
														<input type="hidden" name="uIdx" value="${unit.idx}">												
													</td>
													<td>
														<input type="text" name="minArr" value="${unit.min}"><span>개</span>
														<i class="mlr15">~</i>
														<input type="text" name="maxArr" value="${unit.max}"><span>개</span>
													</td>
													<td>
														<input type="text" name="oneSideArr" value="${unit.oneSide}"><span>원</span>
													</td>
													<td>
														<input type="text" name="twoSideArr" value="${unit.twoSide}"><span>원</span>
													</td>
													<td class="plus_btn">
														<button class="btn del" value="${unit.idx}" type="button">삭제</button>
														<button class="btn add" type="button">추가 +</button>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td><input type="text" name="uCodeArr" class="align_c"></td>
												<td>
													<input type="text" name="minArr"><span>개</span>
													<i class="mlr15">~</i>
													<input type="text" name="maxArr"><span>개</span>
												</td>
												<td>
													<input type="text" name="oneSideArr"><span>원</span>
												</td>
												<td>
													<input type="text" name="twoSideArr"><span>원</span>
												</td>
												<td class="plus_btn">
													<button class="btn del" type="button">삭제</button>
													<button class="btn add" type="button">추가 +</button>
												</td>
											</tr>		
										</c:otherwise>
									</c:choose>																
								</tbody>
							</table>						
						</div>
					</div>				
					<input type="hidden" name="cIdx" value="${idx}">
					<input type="hidden" name="idxArr">
					<input type="hidden" name="delArr">			
					<div class="btn_area fl_r">		
						<button type="submit" class="btn">저장</button>
					</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function() {
	$('#gnb ul li').eq(7).addClass('on');
	$(document).on('click', '.add', function(){
		const idx = $(this).parent().parent("tr").index();		
		$("tbody > tr:eq("+idx+")").before(addForm());
	})	
	
	$(document).on('click', '.del', function(){
		if($("tbody > tr").length <= 1){
			alert("더이상 삭제하실 수 없습니다.");
			return false;
		}
		
		if($(this).val() != ''){ delArr.push($(this).val()); }
		$(this).parent().parent("tr").remove();
	})
})
var delArr = new Array();
function addForm(){
	let txt;
		txt = '<tr><td><input type="text" name="uCodeArr" class="align_c"></td>';
		txt += '<td><input type="text" name="minArr"><span>개</span><i class="mlr15">~</i><input type="text" name="maxArr"><span>개</span></td>';
		txt += '<td><input type="text" name="oneSideArr"><span>원</span></td>';
		txt += '<td><input type="text" name="twoSideArr"><span>원</span></td>';
		txt += '<td class="plus_btn"><button class="btn del" type="button">삭제</button><button class="btn add" type="button">추가 +</button></td>';
		txt += '</tr>';
	return txt;
}
function valid(){
	let idxArr = new Array();
	let codeArr = new Array();
	let chk = true;
	if(confirm("등록하시겠습니까?")){	
		$(":text").each(function(){
			if($(this).val() == ""){				
				alert("모든 항목을 기입해주세요.");				
				chk = false;
				return false;
			} else if($(this).attr("name") != "uCodeArr" && !$.isNumeric($(this).val())) {
				alert("숫자를 입력해주세요.");
				chk = false;
				return false;
			}
		})
		
		if(chk){
			for(let i=0; i<$("tbody > tr").length; i++ ){
				// 구간체크
				let uIdx = $(":hidden[name='uIdx']").eq(i).val();
				uIdx = typeof uIdx === 'undefined' ? 0 : uIdx;
				idxArr.push(uIdx);
		
				let minI = Number($(":text[name='minArr']").eq(i).val());
				let maxI = Number($(":text[name='maxArr']").eq(i).val());

				console.log("MIN: ", minI);
				console.log("MAX: ", maxI);
				
				if(minI > maxI){
					alert("최소값이 더 큽니다.");
					chk = false;
					return false;
				} else {
					for(let j=0; j<$("tbody > tr").length; j++ ){
						if(i != j) {
							let minJ = Number($(":text[name='minArr']").eq(j).val());
							let maxJ = Number($(":text[name='maxArr']").eq(j).val());
		
							if(maxI <= maxJ && maxI >= minJ || minI <= maxJ && minI >= minJ){
								alert("인쇄구간이 중복됩니다.");
								chk = false;
								return false;
							}
						}
					}
				}
		
				if(chk){
					// 코드 중복 확인
					let uCode = $("input[name=uCodeArr]").eq(i).val();
					if (codeArr.indexOf(uCode) === -1) {
						codeArr.push(uCode);
					} else {
						alert("구간코드가 중복됩니다.");
						chk = false;
						return false;
					}			
				}	
			}
		}
	}
	
	$(":hidden[name='idxArr']").val(idxArr);
	$(":hidden[name='delArr']").val(delArr);
	
	return chk;
}
</script>
</body>
</html>