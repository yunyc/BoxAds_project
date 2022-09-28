<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_calcul.jsp">
			<c:param name="menuOn" value="2" />
		</c:import>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>출금관리</h3>
				</div>
				<div class="list">
					<div class="view">						
						<form:form method="get">
							<input type="hidden" name="curPage" value="${page.curPage}">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">출금상태</th>
										<td>
											<c:set var="stateList" value="${fn:join(paramValues.state, ',')}"/>
											<input type="checkbox" value="" id="all" onchange="checkAll('all', 'state')" name="state" <c:if test="${empty stateList}">checked</c:if>><label for="all">전체</label>
											<input type="checkbox" value="N" id="add" name="state" <c:if test="${fn:contains(stateList, 'N')}">checked</c:if>><label for="add">신청</label>
											<input type="checkbox" value="Y" id="dispose" name="state" <c:if test="${fn:contains(stateList, 'Y')}">checked</c:if>><label for="dispose">처리</label>
											<input type="checkbox" value="H" id="hold" name="state" <c:if test="${fn:contains(stateList, 'H')}">checked</c:if>><label for="hold">보류</label>
										</td>
									</tr>
									<tr>
										<th scope="row">검색</th>
										<td>
											<label for="kwd01" class="blind">검색 선택</label>
											<select id="kwd01" name="searchType">
												<option value="id" <c:if test="${param.searchType eq 'id'}">selected</c:if>>아이디</option>
												<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>업체명</option>
											</select>
											<input type="text" id="kwd02" name="searchKeyword" value="${param.searchKeyword}">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" value="${param.startDate}" name="startDate" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행사기간_1" value="${param.endDate}" name="endDate" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button class="btn" type="submit">검색</button>
					</div>
					</form:form>
					<div class="btn_area excel fl_r">		
						<button type="button" class="btn">엑셀다운로드</button>
					</div>
						<div class="mt20">
							<h4>총 : <span class="txt_red">${page.totalCnt}</span>건</h4>
						</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>출금 리스트</caption>
									<colgroup>
										<col style="width:4%">
										<col style="width:5%">
										<col>
										<col>
										<col style="width:15%">
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<th scope="col">
											<input type="checkbox" id="all_c" name="idx" onclick="checkAll('all_c', 'idx')">
										</th>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">업체명</th>
										<th scope="col">계좌정보</th>
										<th scope="col">출금 신청 캐시</th>
										<th scope="col">세엑</th>
										<th scope="col">출금 합계액</th>
										<th scope="col">출금신청일</th>
										<th scope="col">출금처리일</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty wdwList}">
												<tr><td colspan="10">증빙 내역이 없습니다.</td></tr>
											</c:when>
											<c:otherwise>											
												<c:forEach items="${wdwList}" var="vo" varStatus="status">
													<tr>
														<td>
															<input type="checkbox" value="${vo.idx}" name="idx">
														</td>
														<td>${(page.totalCnt - ((page.curPage - 1) * page.perPage)) - status.index}</td>
														<td>${vo.id}</td>
														<td>${vo.name}</td>
														<td>${vo.bank}</td>
														<td class="align_r"><fmt:formatNumber value="${vo.amount}" pattern="#,###" />원</td>
														<td class="align_r"><fmt:formatNumber value="${vo.fee}" pattern="#,###" />원</td>
														<td class="align_r"><fmt:formatNumber value="${vo.total}" pattern="#,###" />원</td>
														<td>${vo.insertDate}</td>
														<td>${vo.updateDate}</td>
														<td>${vo.state}</td>
													</tr>																											
												</c:forEach>
											</c:otherwise>
										</c:choose>										
									</tbody>
								</table>
								<div class="pagination mt50">								
								</div>
							</div>
							<div class="btn_area align_r">
								<button class="btn" onclick="setDataForUpdate('Y','출금 처리')" type="button">출금 처리</button>
								<button class="btn" onclick="setDataForUpdate('H','출금 보류')" type="button">출금 보류</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal_wrap inner_modal">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:500px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">사유입력</h3>
					<button class="popup_close pop_clo" type="button">×</button>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write view">
							<div class="t_area">
								<textarea name="mesg" id="mesg"  style="width:90%; height:300px;"></textarea>
							</div>
							<div class="btn_area align_c">
								<button class="btn" type="button" id="mesgConfirm">입력</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$('#gnb ul li').eq(3).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
	$(".pop_clo").on("click",function(){
		$("#mesg").val("");	
		$(".inner_modal").css({"display":"none"});
	});
</script>
<script>
	$(function() {
		$(".pagination").append(paging('${page.totalCnt}', '${page.curPage}', '${page.perPage}'));

		$(".excel").on("click", function (){
	    	let defAction = $("form").attr("action");
	    	$("form").attr("action", "../excel/calcul_withdraw_excel");
	    	$("form").submit();
	    	$("form").attr("action", defAction);
	    })
	})
	
	function setDataBeforeMesg(idxArr, state, alertMesg){
		$(".inner_modal").css({"display":"table"});
		$("#mesgConfirm").attr("onclick", "updateState("+idxArr+", '"+state+"', '"+alertMesg+"')");
	}
	
	function setDataForUpdate(state, alertMesg){
		var idxArr = [];
		
		$("input[name='idx']:checkbox:not(#all_c):checked").each(function(i, item) {
			idxArr.push($(item).val());				
		});
		
		if(idxArr.length <= 0){
			alert("선택된 출금 건이 없습니다."); 
		} else if(confirm(alertMesg+" 하시겠습니까?")){
			if(state != 'Y'){
				setDataBeforeMesg(idxArr, state, alertMesg + " 되었습니다.");				
			} else {
				updateState(idxArr, state, alertMesg + " 되었습니다.");
				$("#mesg").val("");			
			}							
		}	

		idxArr = [];
	}
		
	function updateState(idxArr, state, alertMesg){	
		let mesg = $("#mesg").val();	

		if(state != 'Y' && mesg == ""){	alert("사유를 입력해주세요."); return false; }

		$.post("../calcul/updateStateWithdraw", { idx:idxArr.toString(), state:state, mesg:mesg }, function(result){
			if(result > 0){
				if(alertMesg != null){
					alert(alertMesg);
					location.reload();
				}
			} else {
				alert("실패했습니다.");
			}				
		})
	}
	
</script>
</body>
</html>
