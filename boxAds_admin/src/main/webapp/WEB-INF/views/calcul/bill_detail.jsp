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
			<c:param name="menuOn" value="3" />
		</c:import>	
		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>증빙자료 관리</h3>
            </div>
            <div class="view">
				<div class="table_wrap">
					<div class="tit02 mt20">
						<h4>증빙자료 정보</h4>
					</div>
					<table class="detail mt20">
						<caption>증빙자료 관리</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">발행구분</th>
							<td colspan="3">
							  ${bill.subjectStr}
							</td>
						</tr>
						<tr>
							<th scope="row">증빙유형</th>
							<td colspan="3">
								${bill.typeStr}
							</td>
						</tr>
						<tr>
							<th scope="row">공급가액</th>
							<td colspan="3">
								<fmt:formatNumber value="${bill.amount}" pattern="#,###" />원
							</td>
						</tr>
						<tr>
							<th scope="row">세액</th>
							<td colspan="3">
								<fmt:formatNumber value="${bill.fee}" pattern="#,###" />원
							</td>
						</tr>
						<tr>
							<th scope="row">Total</th>
							<td colspan="3">
								<fmt:formatNumber value="${bill.total}" pattern="#,###" />원
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="table_wrap">
					<div class="tit02 mt20">
						<h4>사업자정보</h4>
					</div>
					<table class="detail mt20">
						<caption>사업자정보 리스트</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">업체명</th>
							<td colspan="3">
							  ${info.name}
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 등록번호</th>
							<td colspan="3">
								${info.companyNumber}
							</td>
						</tr>
						<tr>
							<th scope="row">업종/업태</th>
							<td colspan="3">
								${info.business}
							</td>
						</tr>
						<tr>
							<th scope="row">대표자명</th>
							<td colspan="3">
								${info.companyName}
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 주소</th>
							<td colspan="3">
								${info.address}
							</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td colspan="3">
								<%-- ${info.phone} --%>
								<c:out value="${fn:substring(info.phone, 0, 3)}-${fn:substring(info.phone, 3, 7)}-${fn:substring(info.phone, 7, fn:length(info.phone))}"/>
							</td>
						</tr>
						<tr>
							<th scope="row">Email(세금계산서 수취)</th>
							<td colspan="3">
								${info.email}
							</td>
						</tr>
						<tr>
							<th scope="row">기업형태</th>
							<td colspan="3">
								<c:choose>
									<c:when test="${info.companyType eq 'P'}">개인</c:when>
									<c:when test="${info.companyType eq 'C'}">법인</c:when>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 등록증</th>
							<td colspan="3">
							
								<a href="${path}/download?idx=${info.fIdx}">${info.realName}</a>
							</td>
						</tr>
						<c:if test="${bill.state ne 'Y'}">
							<tr>
								<th scope="row">증빙처리</th>
								<td colspan="3">
									<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
									<button class="btn" type="button" value="${bill.idx}" onclick="setDataForUpdate('Y', this)">
										<c:choose>
											<c:when test="${bill.subject eq 'A'}">
												발행 
											</c:when>
											<c:when test="${bill.subject eq 'M'}">
												수령 
											</c:when>
										</c:choose>
									</button>
								</td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				<c:if test="${bill.state eq 'Y'}">
					<div class="tit02 mt20">
						<h4>발행 내역</h4>
					</div>					
					<div class="txt_are mt20">
						${bill.typeStr} 
					<c:choose>
						<c:when test="${bill.subject eq 'A'}">
							발행 
						</c:when>
						<c:when test="${bill.subject eq 'M'}">
							수령 
						</c:when>
					</c:choose>
						<span class="fl_r">${bill.updateDate}</span>
					</div>
				</c:if>
				<!-- <div class="txt_are">세금계산서 발행 <span class="fl_r">yy.mm.dd 10:00:00</span></div> -->
                <div class="btn_area align_r mt20">
                    <a href="bill_list" class="btn">목록</a>      
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $("#gnb").find("li").eq(3).addClass("on");
		$('#lnb ul.menu > li').eq(3).find(' > a ').addClass('skin_bg');

		$('.calendar_box .date_t a').on('click',function(){
			$('.calendar_box .date_t a').removeClass('on');
			$(this).addClass('on');
		});
		$('.rental_content .rental_tab .btn').on('click',function(){
			$('.rental_content .rental_tab .btn').removeClass('on');
			$(this).addClass('on');
		});
    });
</script>
<script>

function setDataForUpdate(state, tag){
	let idx = $(tag).val();
	let date = $("#datepicker1").val();
	let alertMesg = $.trim($(tag).text());
	
	if(date == ""){
		alert("날짜를 선택해주세요."); 
	} else if(confirm(alertMesg+" 하시겠습니까?")){
		updateBillState(idx, state, date, alertMesg + " 되었습니다.");
	}
}

function updateBillState(idx, state, date, alertMesg){
	$.post("../calcul/updateBillState", { idx:idx, state:state, date:date }, function(result){
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
</html>
