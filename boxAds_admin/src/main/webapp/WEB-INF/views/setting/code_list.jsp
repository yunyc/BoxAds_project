<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<style>
.blue_btn{display: inline-block; color:#8f2ace; background-color: transparent; border: none;text-align: center;margin: 0;vertical-align: middle;text-decoration: none;overflow: visible;zoom: 1;white-space: nowrap;word-wrap: normal;word-break: normal;cursor: pointer;box-sizing: border-box;font-family:inherit;}
</style>
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
					<li <c:if test="${param.type eq 'P'}">class="on"</c:if>><a href="code_list?type=P">상품유형</a></li>
					<li <c:if test="${param.type eq 'C'}">class="on"</c:if>><a href="code_list?type=C">카테고리</a></li>
					<li <c:if test="${param.type eq 'F'}">class="on"</c:if>><a href="code_list?type=F">FAQ 메뉴</a></li>
				</ul>
				<div class="code_wrap mt50">
					<div id="1">
					</div>
					<div id="2">
						<h4>2차 카테고리</h4>
						<table>
							<colgroup>
								<col style="width: 20%">
								<col style="">
								<col style="width: 20%">
								<col style="width: 18%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순서</th>
									<th scope="col">카테고리명</th>
									<th scope="col">노출여부</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr><td colspan="4">1차 카테고리를 선택해주세요.</td></tr>
							</tbody>
						</table>
					</div>
					<div id="3">
						<h4>3차 카테고리</h4>
						<table>
							<colgroup>
								<col style="width: 20%">
								<col style="">
								<col style="width: 20%">
								<col style="width: 18%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순서</th>
									<th scope="col">카테고리명</th>
									<th scope="col">노출여부</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr><td colspan="4">2차 카테고리를 선택해주세요.</td></tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<form action="code_sort" method="post">
			<input type="hidden" name="sortArr">
			<input type="hidden" name="idxArr">
		</form>
	</div>
</div>
</div>
<script>
$(function() {		
	const type = '${param.type}';
	
	$('#gnb ul li').eq(7).addClass('on');	
	addCodeList(type, '1', 0);

	 $(document).on('click', '.add', function(){
		let url;
		let parent = $(this).attr("data-parent");
		let depth = $(this).attr("data-depth")

		url = "code_write?type="+type+"&depth="+depth;
		if(!empty(parent)) url += "&parent="+parent;
		
		location.href = url;
	});

	 $(document).on('click', 'td > button', function(){
		 let depth = parseInt($(this).attr("data-depth")) + 1;
		 let idx = $(this).attr("data-idx");
		 addCodeList(type, depth, idx);
	});

	 $(document).on('click', '.sortSave', function(){
		let idxArr = new Array();
		let sortArr = new Array();
		let tb = $(this).parent().parent("div").find("table").find(":text[name='sort']")
		let bool = true;
		
		$(tb).each(function(){
			let val = $(this).val();
						
			if(val == ''){
				alert("값을 입력해주세요.");
				bool = false;
				return false;
			} else if(!$.isNumeric(val)){
				alert("숫자를 입력해주세요.");
				bool = false;
				return false;
			} else if(sortArr.indexOf(val) != -1){ 
				alert("동일한 순서가 있습니다.");
				bool = false;
				return false;
			} 
			
			sortArr.push($(this).val())
			idxArr.push($(this).attr("data-idx"))		
		})

		if(bool){
			console.log(sortArr)
			console.log(idxArr)
			
			$(":hidden[name='sortArr']").val(sortArr)
			$(":hidden[name='idxArr']").val(idxArr)
			
			$("form").submit();			
		}
	 })
});

	function addCodeList(type, depth, parent){
		tableInit(depth+1);
		ajaxCall('code_call', { type:type, depth:depth, parent:parent }, function(result){
			$("#"+depth).html(result)
		}, "코드 불러오기를 실패했습니다.");		
	}

	function tableInit(num){
		let txt;
		
		txt = '<h4>'+num+'차 카테고리</h4>';
		txt += '<table><colgroup>'
		txt += '<col style="width: 20%">'
		txt += '<col style="">'
		txt += '<col style="width: 20%">'
		txt += '<col style="width: 18%">'
		txt += '</colgroup>'
		txt += '<thead>'
		txt += '<tr>'
		txt += '<th scope="col">순서</th>'
		txt += '<th scope="col">카테고리명</th>'
		txt += '<th scope="col">노출여부</th>'
		txt += '<th scope="col"></th>'
		txt += '</tr>'
		txt += '</thead>'
		txt += '<tbody>'
		txt += '<tr><td colspan="4">'+(num-1)+'차 카테고리를 선택해주세요.</td></tr>'
		txt += '</tbody>'
		txt += '</table>';
		$("#"+num).html(txt);
	}	
</script>
</body>
</html>
