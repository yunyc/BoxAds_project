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
			<c:param name="menuOn" value="0" />
		</c:import>	
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>정산관리</h3>
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
										<th scope="row">정산상태</th>
										<td>
											<c:set var="stateList" value="${fn:join(paramValues.state, ',')}"/>
											<input type="checkbox" id="all" value="" name="state" onclick="checkAll('all', 'state')"<c:if test="${empty stateList}">checked</c:if>><label for="all">전체</label>
											<input type="checkbox" value="N" id="request" name="state" <c:if test="${fn:contains(stateList, 'N')}">checked</c:if>><label for="request">요청</label>
											<input type="checkbox" value="Y" id="dispose" name="state" <c:if test="${fn:contains(stateList, 'Y')}">checked</c:if>><label for="dispose">처리</label>
											<input type="checkbox" value="H" id="hold" name="state" <c:if test="${fn:contains(stateList, 'H')}">checked</c:if>><label for="hold">보류</label>
											<input type="checkbox" value="C" id="se_cens" name="state" <c:if test="${fn:contains(stateList, 'C')}">checked</c:if>><label for="se_cens">부분취소</label>
										</td>
									</tr>
									<tr>
										<th scope="row">키워드</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
											<select id="kwd01" name="searchType">
												<option value="id" <c:if test="${param.searchType eq 'id'}">selected</c:if>>아이디</option>
												<option value="code" <c:if test="${param.searchType eq 'code'}">selected</c:if>>결제번호</option>
												<option value="name" <c:if test="${param.searchType eq 'name'}">selected</c:if>>광고주</option>
											</select>
											<input type="text" id="kwd02" name="searchKeyword" value="${param.searchKeyword}">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" name="startDate" value="${param.startDate}" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행시가긴_1" name="endDate" value="${param.endDate}" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
											<button type="button" class="btn date" onclick="changeDateDay(this, 0)">오늘</button>
											<button type="button" class="btn date" onclick="changeDateDay(this, 7)">1주일</button>
											<button type="button" class="btn date" onclick="changeDateMonth(this, 1)">1달</button>
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button type="submit" class="btn">검색</button>
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
									<caption>정산관리 리스트</caption>
									<colgroup>
										<col style="width:4%">
										<col style="*">
										<col style="*">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="*">
										<col style="width:8%">
									</colgroup>
									<thead>
										<th scope="col">
											<input type="checkbox" id="all_c" name="idx" onclick="checkAll('all_c', 'idx')">
										</th>
										<th scope="col">요청일시</th>
										<th scope="col">결제번호</th>
										<th scope="col">총결제금액</th>
										<th scope="col">광고주</th>
										<th scope="col">광고비정산</th>
										<th scope="col">판매자</th>
										<th scope="col">쿠폰</th>
										<th scope="col">판매수익</th>
										<th scope="col">정산일시</th>
										<th scope="col">정산상태</th>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty calculList}">
												<tr><td colspan="11">정산 내역이 없습니다.</td></tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${calculList}" var="vo" varStatus="status">
													<tr>
														<td>
															<input type="checkbox" value="${vo.idx}" name="idx">
														</td>
														<td>${vo.insertDate}</td>
														<td>${vo.ccCode}</td>
														<td class="align_r"><fmt:formatNumber value="${vo.totalPrice}" pattern="#,###" />원</td>
														<td><a href="popup?mIdx=${vo.amIdx}&name=${vo.aName}" onclick="return popup_layer(this);">${vo.aName}</a></td>
														<td class="align_r"><fmt:formatNumber value="${vo.amount}" pattern="#,###" />원</td>
														<td><a href="popup?mIdx=${vo.bmIdx}&name=${vo.bName}" onclick="return popup_layer(this);">${vo.bName}</a></td>
														<td class="align_r"><fmt:formatNumber value="${vo.cpPrice}" pattern="#,###" />원</td>
														<td class="align_r"><fmt:formatNumber value="${vo.margin}" pattern="#,###" />원</td>
														<td>
															<c:choose>
																<c:when test="${empty vo.updateDate}">
																	-
																</c:when>
																<c:otherwise>
																	${vo.updateDate}		
																</c:otherwise>
															</c:choose>
														</td>
														<td>${vo.stateStr}</td>
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
								<button class="btn" type="button" onclick="setDataForUpdate('Y','처리')">처리</button>
								<button class="btn inner_m_btn" onclick="setDataForUpdate('H','보류')" type="button">보류</button>
								<button class="btn inner_m_btn" onclick="setDataForUpdate('C','부분취소')" type="button">부분취소</button>
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
	    	$("form").attr("action", "../excel/calcul_excel");
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
			alert("선택된 정산 건이 없습니다."); 
		} else if(confirm(alertMesg+" 하시겠습니까?")){
			
			if(state != 'Y'){
				setDataBeforeMesg(idxArr, state, alertMesg + " 되었습니다.");				
			} else {
				updateState(idxArr, state, alertMesg + " 되었습니다.");
				$("#mesg").val("");			
			}			
			
			idxArr = [];
		}
	}
	
	function updateState(idxArr, state, alertMesg){
		let mesg = $("#mesg").val();	
	
		if(state != 'Y' && mesg == ""){	alert("사유를 입력해주세요."); return false; }
	
		$.post("../calcul/updateState", { idx:idxArr.toString(), state:state, mesg:mesg }, function(result){
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
