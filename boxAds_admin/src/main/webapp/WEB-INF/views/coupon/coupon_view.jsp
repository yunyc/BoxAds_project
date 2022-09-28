<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_coupon.jsp">
			<c:param name="menuOn" value="0" />
		</c:import>	
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>쿠폰 발급관리</h3>
            </div>
            <div class="view">
				<div class="table_wrap">
					<table class="detail mt20">
						<caption>쿠폰 발급관리 리스트</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>						
						<tr>
							<th scope="row">쿠폰 명</th>
							<td>
							  ${cvo.title}
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰 혜택</th>
							<td>
								${cvo.mesg}
							</td>
						</tr>
						<tr>
							<th scope="row">할인금액</th>
							<td>
								${cvo.price}
							</td>
						</tr>
						<tr>
							<th scope="row">타겟 대상</th>
							<td>
								<input type="radio" id="new_sign" name="target" value="W" <c:if test="${cvo.target eq 'W'}"> checked="checked" </c:if>>
								<label for="new_sign">신규가입</label>
								<input type="radio" id="fst_pay" name="target" value="B" <c:if test="${cvo.target eq 'B'}"> checked="checked" </c:if>>
								<label for="fst_pay">첫 구매 고객</label>
							</td>
						</tr>
						<tr>
							<th scope="row">발행기간</th>
							<td>
								${cvo.startDate}
								<span class="mlr15">~</span>
								${cvo.endDate}
							</td>
						</tr>
						<tr>
							<th scope="row">기간설정</th>
							<td>
								<input type="radio" id="period" name="periodFlag" value="Y" <c:if test="${cvo.periodFlag eq 'Y'}"> checked="checked" </c:if>>
								<label for="period">기간설정</label>
								<input type="radio" id="period_none" name="periodFlag" value="N" <c:if test="${cvo.periodFlag eq 'N'}"> checked="checked" </c:if>>
								<label for="period_none">제한없음</label>
							</td>
						</tr>
						<tr>
							<th scope="row">유효기간</th>
							<td>
								${cvo.ableStartDate}
								<span class="mlr15">~</span>
								${cvo.ableEndDate}
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰설명</th>
							<td>
							  ${cvo.content}
							</td>
						</tr>
						<tr>
							<th scope="row">상태</th>
							<td>
								<c:choose>
									<c:when test="${cvo.state eq 'N'}">등록</c:when>
									<c:when test="${cvo.state eq 'Y'}">발행</c:when>
									<c:when test="${cvo.state eq 'E'}">종료</c:when>
								</c:choose>
								| 
								<input type="checkbox" id="chk" name="useFlag" value="Y"<c:if test="${cvo.useFlag eq 'Y'}"> checked="checked" </c:if>>사용 여부
								<label for="chk" class="blind">사용 여부</label>
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰발행 수</th>
							<td id="total">
								
							</td>
						</tr>
						<tr>
							<th scope="row">등록일자</th>
							<td>${cvo.insertDate}</td>
						</tr>
						<tr>
							<th scope="row">수정일자</th>
							<td>${cvo.updateDate}</td>
						</tr>
						</tbody>
					</table>
				</div>
				<form action="update_state" method="post">
					<input type="hidden" name="idx" value="${cvo.idx}">
					<input type="hidden" name="useFlag" value="">
				
                <div class="btn_area align_r mt20">
					<button class="btn sav" type="button">저장</button>
					<a href="list" class="btn">취소</a>    
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script>     
	const totalCnt = '${cvo.totalCnt}';
	const issueCnt = '${cvo.issueCnt}';
			
    $(function() {
    	$('#gnb ul li').eq(4).addClass('on');    	
    	$(":radio").attr("disabled", true);
		$("#total").text(addComma(issueCnt) +' / '+ addComma(totalCnt))
    	
    	$(".sav").on("click", function (){
			updateState();
		})

    });


    function updateState(){
        let useFlag = $(":checkbox").is(":checked") ? 'Y' : 'N';
        $(":hidden[name='useFlag']").val(useFlag);
        $("form").submit();
	}
	
</script>
</html>
