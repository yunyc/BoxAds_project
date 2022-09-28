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
					<form:form modelAttribute="cvo">
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
								  <input type="text" id="cou_name" name="title" style="width:90%" value="${cvo.title}">
								  <label for="cou_name" class="blind">쿠폰명</label>
								</td>
							</tr>
							<tr>
								<th scope="row">쿠폰 혜택</th>
								<td>
									<input type="text" id="cou_bl" name="mesg" style="width:90%" value="${cvo.mesg}">
								  <label for="cou_bl" class="blind">쿠폰 혜택</label>
								</td>
							</tr>
							<tr>
								<th scope="row">할인금액</th>
								<td>
									<input type="text" id="disc" name="price" value="${cvo.price}">
									 <label for="disc" class="blind">할인금액</label>
								</td>
							</tr>
							<tr>
								<th scope="row">타겟 대상</th>
								<td>
									<input type="radio" id="new_sign" name="target" value="W" checked="checked">
									<label for="new_sign">신규가입</label>
									<input type="radio" id="fst_pay" name="target" value="B">
									<label for="fst_pay">첫 구매 고객</label>
								</td>
							</tr>
							<tr>
								<th scope="row">발행기간</th>
								<td>
									<input type="text" title="발행기간1" name="startDate" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1" value="${cvo.startDate}">
									<span class="mlr15">~</span>
									<input type="text" title="발행기간_1" name="endDate" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2" value="${cvo.endDate}">
								</td>
							</tr>
							<tr>
								<th scope="row">기간설정</th>
								<td>
									<input type="radio" id="period" name="periodFlag" value="Y" checked="checked">
									<label for="period">기간설정</label>
									<input type="radio" id="period_none" name="periodFlag" value="N">
									<label for="period_none">제한없음</label>
								</td>
							</tr>
							<tr>
								<th scope="row">유효기간</th>
								<td>
									<input type="text" title="유효기간1" placeholder="YYYY-MM-DD" class="ico_date able" id="datepicker3" name="ableStartDate" value="${cvo.ableStartDate}">
									<span class="mlr15">~</span>
									<input type="text" title="유효기간_1" placeholder="YYYY-MM-DD" class="ico_date able" id="datepicker4" name="ableEndDate" value="${cvo.ableEndDate}">
								</td>
							</tr>							
							<tr>
								<th scope="row">쿠폰설명</th>
								<td>
								  <input type="text" id="cou_name" name="content" style="width:90%" value="${cvo.content}">
								  <label for="cou_name" class="blind">쿠폰설명</label>
								</td>
							</tr>
							<c:if test="${!empty cvo}">
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
							</c:if>
							<tr>
								<th scope="row">쿠폰발행 수</th>
								<td>
									<input type="text" id="disc" name="totalCnt" value="${cvo.totalCnt}">
								 	<label for="disc" class="blind">쿠폰발행</label>
								</td>
							</tr>
							<c:if test="${!empty cvo}">
								<tr>
									<th scope="row">등록일자</th>
									<td>${cvo.insertDate}</td>
								</tr>
								<tr>
									<th scope="row">수정일자</th>
									<td>${cvo.updateDate}</td>
								</tr>							
							</c:if>							
							</tbody>
						</table>
					</form:form>
				</div>
                <div class="btn_area align_r mt20">
					<button class="btn sav" type="button">저장</button>
					<a href="list" class="btn">취소</a>    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
   	const state = '${cvo.state}';
   	const target = '${cvo.target}';
   	const period = '${cvo.periodFlag}';

    $(function() {
    	$('#gnb ul li').eq(4).addClass('on');

    	$(":radio").each(function(){
	       	if($(this).attr("name") == "target" && $(this).val() == target){ $(this).attr("checked", true); }
	       	if($(this).attr("name") == "periodFlag" && $(this).val() == period){ 
		       	$(this).attr("checked", true);
		       	dateChk();
		    }
   		})

    	$(":radio[name='periodFlag']").on("change", function(){
			dateChk();
		})	

		$(".sav").on("click", function (){
			validForm();
		})
    });

    function dateChk(){
        let flag = $(":radio[name='periodFlag']:checked").val();
		if(flag == 'N'){
			$(".able").attr("disabled", true);
		} else {
			$(".able").attr("disabled", false);
		}
    }

    function validForm(){
        if(confirm("저장하시겠습니까?")){
			if(!checkInputName("title", "쿠폰명을")) return false;
			if(!checkInputName("mesg", "쿠폰 혜택을")) return false;
			if(!checkInputName("price", "할인금액을")) return false;
			if(!checkNumber("price")) return false;		
			if(!checkInputName("target", "대상을")) return false;
			if(!checkInputName("startDate", "발행 시작일을")) return false;
			if(!checkInputName("endDate", "발행 종료일을")) return false;
			if(!datepickerChk("datepicker1", "datepicker2")) return false;		
			if(!checkInputName("periodFlag", "유효기간을")) return false;
			if($("input[name='periodFlag']:checked").val() == 'Y'){
				if(!checkInputName("ableStartDate", "유효 시작일을")) return false;
				if(!checkInputName("ableEndDate", "유효 종료일을")) return false;
				if(!datepickerChk("datepicker3", "datepicker4")) return false;
			}
			if(!empty($(":text[name='totalCnt']").val()) && !checkNumber("totalCnt")) return false;
					
			$("#cvo").submit();
		}
    }
</script>
</html>