<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
	<c:when test="${param.type eq 'A'}">
		<c:set var="val" value="1" />
		<c:set var="title" value="애드" />
		<c:set var="state1" value="광고대기" />
		<c:set var="state2" value="광고중" />
		<c:set var="state3" value="일시중지" />
		<c:set var="state4" value="광고종료" />
		<c:set var="msg" value="타겟"/>
	</c:when>
	<c:otherwise>
		<c:set var="val" value="0" />
		<c:set var="title" value="박스" />
		<c:set var="pdt" value="판매수" />
		<c:set var="state1" value="판매대기" />
		<c:set var="state2" value="판매중" />
		<c:set var="state3" value="일시중지" />
		<c:set var="state4" value="판매종료" />
		<c:set var="msg" value="고객"/>
	</c:otherwise>
</c:choose>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_product.jsp">
			<c:param name="menuOn" value="${val}" />
		</c:import>	
		<form:form modelAttribute="pvo" enctype="multipart/form-data">
		<input type="hidden" name="path" value="${path}"/>
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>${title}</h3>
            </div>
			<div class="view">
				<div class="table_wrap">
					<table class="detail mt20">
						<caption>박스 상세</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row"><c:choose><c:when test="${param.type eq 'A'}">광고 명</c:when><c:otherwise>박스 명</c:otherwise></c:choose>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										<c:choose>
											<c:when test="${param.type ne 'A'}">
												판매 제품의 브랜드, 제품명을 넣어 입력해주새요.
											</c:when>
											<c:otherwise>
												홍보하려는 브랜드, 제품, 서비스명을 넣어 입력해주세요.							
											</c:otherwise>
										</c:choose>	
									</span>
								</span>
							</th>
							<td>
							  <input type="text" id="title" name="title" style="width:90%" placeholder="" value="${productList.title}">
							  <label for="title" class="blind">제목</label>
							</td>
						</tr>
						<tr>
							<th scope="row">타겟 카테고리 선택
								<span class="tooltip_icon">
									<span class="tooltiptext">
									<c:choose>
										<c:when test="${param.type ne 'A'}">
											판매 제품의 카테고리를 대분류>중분류로 선택해주세요.										
										</c:when>
										<c:otherwise>
											쇼핑몰 구매 고객 중 희망하는 제품 카테고리를 최대 5개까지 선택가능합니다.
										</c:otherwise>
									</c:choose>
									</span>
								</span>
							</th>
							<td>
								<select class="cCIdx" title="대분류 선택">
									<option value="">대분류 선택</option>
									<c:forEach items="${codeList}" var="codeList">
										<option value="${codeList.idx}">${codeList.name}</option>
									</c:forEach>
									
								</select>
								<c:if test="${param.type ne 'A'}">
								<select id="cCIdx" title="중분류 선택">
									<option value="">중분류 선택</option>
									
								</select>
								</c:if>
								<div class="selected" id="ctg">
									<c:if test="${! empty productList.secCtg}">
										<span class="txt">${productList.secCtg}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="cCIdx" value="${productList.cCIdx}"/>
									</c:if>
									<c:if test="${! empty productList.fir}">
										<span class="txt">${productList.fir}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="cCIdx" value="${fn:substring(productList.cCIdx, 0, 1)}"/>
									</c:if>
									<c:if test="${! empty productList.sec}">
										<span class="txt">${productList.sec}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="cCIdx" value="${fn:substring(productList.cCIdx, 2, 3)}"/>
									</c:if>
									<c:if test="${! empty productList.thr}">
										<span class="txt">${productList.thr}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="cCIdx" value="${fn:substring(productList.cCIdx, 4, 5)}"/>
									</c:if>
									<c:if test="${! empty productList.fth}">
										<span class="txt">${productList.fth}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="cCIdx" value="${fn:substring(productList.cCIdx, 6, 7)}"/>
									</c:if>
									<c:if test="${! empty productList.fif}">
										<span class="txt">${productList.fif}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="cCIdx" value="${fn:substring(productList.cCIdx, 8, 9)}"/>
									</c:if>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><c:choose><c:when test="${param.type eq 'A'}">타겟 연령</c:when><c:otherwise>고객 연령</c:otherwise></c:choose>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										<c:choose>
											<c:when test="${param.type ne 'A'}">
												제품의 주 고객 연령대를 선택해주세요. 중복선택 가능합니다.										
											</c:when>
											<c:otherwise>
												홍보 타겟 고객의 연령대를 선택해주세요. 중복선택 가능합니다.
											</c:otherwise>
										</c:choose>
									</span>
								</span>
							</th>
							<td>
								<select id="ctmAge" title="고객연령">
									<option value="">선택하세요</option>
									<option value="14세~24세">14세~24세</option>
									<option value="25세~34세">25세~34세</option>
									<option value="35세~44세">35세~44세</option>
									<option value="45세~54세">45세~54세</option>
									<option value="55세~64세">55세~64세</option>
									<option value="65세~">65세~</option>
								</select>
							
								<div class="selected" id="age">
									<c:set var="list" value="${fn:split(productList.ctmAge, ',')}" />
									<c:forEach var="idx" begin="0" end="${fn:length(list) - 1}">
										<span class="txt">${list[idx]}<button type="button" class="btn_del">삭제</button></span>
										<input type="hidden" name="ctmAge" value="${list[idx]}" />
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<c:choose>
									<c:when test="${param.type eq 'A'}">타겟 성별</c:when><c:otherwise>고객 성별</c:otherwise>
								</c:choose>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										<c:choose>
											<c:when test="${param.type ne 'A'}">
												제품의 주 고객 성별을 선택해주세요. 										
											</c:when>
											<c:otherwise>
												홍보 타겟 고객의 성별을 선택해주세요.
											</c:otherwise>
										</c:choose>										
									</span>
								</span>
							</th>
							<td>
								<select id="ctmGender" name="ctmGender" title="고객 성별">
									<option value="">선택하세요</option>
									<option value="주로 여성" <c:if test="${productList.ctmGender eq '주로 여성'}">selected</c:if>>주로 여성 </option>
									<option value="주로 남성" <c:if test="${productList.ctmGender eq '주로 남성'}">selected</c:if>>주로 남성 </option>
									<option value="모든 성별" <c:if test="${productList.ctmGender eq '모든 성별'}">selected</c:if>>모든 성별 </option>
								</select>
							
								
							</td>
						</tr>
						<tr>
							<th scope="row"><c:choose><c:when test="${param.type eq 'A'}">타겟 유형</c:when><c:otherwise>고객 유형</c:otherwise></c:choose>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										<c:choose>
											<c:when test="${param.type ne 'A'}">
												제품의 주 구매 고객을 개인과 기업 중 하나 선택해주세요.
											</c:when>
											<c:otherwise>
												홍보 타겟을 개인과 기업 중 하나 선택해주세요.
											</c:otherwise>
										</c:choose>	
									</span>
								</span>
							</th>
							<td>
								<select name="ctmType" id="type01" title="주 구매 고객 선택">
									<option value="">선택하세요</option>
									<option value="개인고객" <c:if test="${productList.ctmType eq '개인고객'}">selected</c:if>>개인고객</option>
									<option value="기업고객" <c:if test="${productList.ctmType eq '기업고객'}">selected</c:if>>기업고객</option>
								</select>
							</td>
						</tr>
						<c:if test="${param.type eq 'A'}">
						<tr>
							<th scope="row">광고 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보물 유형을 선택해주세요. 희망하는 홍보물을 전국에 배포하여 신규 고객을 확보할 수 있습니다.
									</span>
								</span>
							</th>
							<td>
								<select name="pCIdx" id="cnt">
									<option value="">선택하세요</option>
									<option value="21" <c:if test="${productList.pCIdx eq 21}">selected</c:if>>전단지 A4</option>
									<option value="22" <c:if test="${productList.pCIdx eq 22}">selected</c:if>>전단지 B5</option>
									<option value="23" <c:if test="${productList.pCIdx eq 23}">selected</c:if>>전단지 쿠폰</option>
									<option value="25" <c:if test="${productList.pCIdx eq 25}">selected</c:if>>스티커 중</option>
									<option value="26" <c:if test="${productList.pCIdx eq 26}">selected</c:if>>스티커 소</option>
									<option value="27" <c:if test="${productList.pCIdx eq 27}">selected</c:if>>샘플 중</option>
									<option value="28" <c:if test="${productList.pCIdx eq 28}">selected</c:if>>샘플 소</option>
								</select>
							</td>
						</tr>
						</c:if>
						<c:if test="${param.type ne 'A'}">
						<tr>
							<th scope="row">평균주문금액
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품 구매 고객 1명당 평균 주문 금액대를 선택해주세요.
									</span>
								</span>
							</th>
							<td>
								<select name="avgPrice" id="ave_amount" title="평균주문금액 선택">
									<option value="">선택하세요</option>
									<option value="0~25,000" <c:if test="${productList.avgPrice eq '0~25,000'}">selected</c:if>>0~25,000원</option>
									<option value="25,000~50,000" <c:if test="${productList.avgPrice eq '25,000~50,000'}">selected</c:if>>25,000~50,000원</option>
									<option value="50,000~100,000" <c:if test="${productList.avgPrice eq '50,000~100,000'}">selected</c:if>>50,000~100,000원</option>
									<option value="100,000~500,000" <c:if test="${productList.avgPrice eq '100,000~500,000'}">selected</c:if>>100,000~500,000원</option>
									<option value="500,000~" <c:if test="${productList.avgPrice eq '500,000~'}">selected</c:if>>500,000~ </option>
								</select>
							</td>
						</tr>
						</c:if>
						<tr>
							<th scope="row"><c:choose><c:when test="${param.type eq 'A'}">홍보 웹페이지 주소</c:when><c:otherwise>상품 웹페이지 주소</c:otherwise></c:choose>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										<c:choose>
											<c:when test="${param.type ne 'A'}">
												실제 쇼핑몰에서 판매중인 상품의 웹페이지 주소를 입력해주세요.<br> 광고주의 박스 상품 선택 시 많은 참고가 됩니다. 										
											</c:when>
											<c:otherwise>
												홍보웹페이지 주소는 QR 코드로 변환하여 홍보물에 인쇄 후 타겟 고객에게 노출됩니다. 정확한 주소를 입력해주세요. (단, 샘플 광고는 광고주가 샘플을 직접 제작 후 배송하기에 QR코드 사용이 필수가 아닙니다)
											</c:otherwise>
										</c:choose>										
									</span>
								</span>
							</th>
							<c:choose>
								<c:when test="${param.type eq 'A'}">
									<td class="qr_wrap">
										<div class="qr_area">									
											<input type="text" id="url" name="url" style="width:90%" required value="${productList.url}" placeholder="https://, http://를 포함하여 입력해주세요.">
											<button type="button" class="btn_qrcode" style="background-image:url(${path}${productList.qrcode});">QR 보기</button>
											<div class="popup_qrcode">
												<div class="head_title">
													QR 코드
													<a href="javascript:;" class="btn_close">닫기</a>
												</div>
												<div class="qrcode_box">
													<img src="${path}${productList.qrcode}" alt="QR코드">
												</div>
												
											</div>
										</div>
									</td>								
								</c:when>
								<c:otherwise>
									<td>
										<input type="text" id="url" name="url" style="width:90%" required value="${productList.url}" placeholder="https://, http://를 포함하여 입력해주세요.">										
									</td>	
								</c:otherwise>
							</c:choose>
						</tr>
						<c:if test="${param.type ne 'A'}">
						<tr>
							<th scope="row">판매 월(광고시작 월)
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매월은 광고주의 홍보물을 택배상자에 동봉하여 배포하는 광고 진행 월을 뜻합니다. <br>광고가 진행 될 박스상품 판매월을 선택해주세요.
									</span>
								</span>
							</th>
							<td class="date">
								<input type="radio" name="sellDate" id="sale_start01"><label for="sale_start01">2019년 9월</label>
								<input type="radio" name="sellDate" id="sale_start02"><label for="sale_start02">2019년 10월</label>
								<input type="radio" name="sellDate" id="sale_start03"><label for="sale_start03">2019년 11월</label>
							</td>
						</tr>
						</c:if>
						<c:if test="${param.type eq 'A'}">
						<tr>
							<th scope="row">광고 기간
								<span class="tooltip_icon">
									<span class="tooltiptext">
										회사에서 계획한 홍보 시작일과 종료일을 선택해주세요. 박스애드 마켓에 애드 상품을 노출하는 기간과 다른 설정이니 주의하세요.
									</span>
								</span>
							</th>
							<td>
							    <c:set var="date" value="${fn:split(productList.adStartDate, '~')}"/>
								<input type="text" title="발행기간1" name="adStartDate" value="${date[0]}" placeholder="YYYY-MM-DD" class="ico_date hasDatepicker" id="datepicker1">
								<span class="mlr15">~</span>
								<input type="text" title="발행기간_1" name="adEndDate" value="${date[1]}" placeholder="YYYY-MM-DD" class="ico_date hasDatepicker" id="datepicker2">
							</td>

						</tr>
						</c:if>
						<tr>
							<th scope="row">
								<c:choose>
									<c:when test="${param.type eq 'B'}">
										상품 소개
									</c:when>
									<c:otherwise>
										광고 소개
									</c:otherwise>
								</c:choose>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										간단한 상품소개를 100자 이내로 입력해주세요.
									</span>
								</span>
							</th>
							<td>
								<input type="text" name="intro" value="${productList.intro}" title="상품소개" style="width:90%;" maxlength=100>
							</td>
						</tr>
						<c:if test="${param.type ne 'A'}">
						<tr>
							<th scope="row">광고 유형</th>
							<td>
								${productList.secPro} ${productList.thrPro}
							</td>
						</tr>
						<tr>
							<th scope="row">판매상품 수량</th>
							<td>
							 ${productList.pdtCnt}개
							</td>
						</tr>
						<tr>
							<th scope="row">광고단가</th>
							<td>
								${productList.unit}원
							</td>
						</tr>
						<tr>
							<th scope="row">박스 수</th>
							<td>
								<fmt:formatNumber value="${productList.boxCnt}" pattern="#,###" />개
							</td>
						</tr>
						<tr>
							<th scope="row">광고비</th>
							<td>
								<fmt:formatNumber value="${productList.boxCnt * productList.unit}" pattern="#,###" />원
							</td>
						</tr>
						</c:if>
						<tr>
							<th scope="row"><c:choose><c:when test="${param.type eq 'A'}">광고</c:when><c:otherwise>상품</c:otherwise></c:choose>이미지</th>
							<td>
								<div class="file_area">
									<div class="img_type03 pj2">
										<input type="file" id="file1" name="uploadFile" class="blind">
										<label for="file1" class="btn_file">파일찾기</label>
									</div>
									
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" id="append">
								<c:forEach items="${fileList}" var="fileList" varStatus="status">
								<div class="img_box_s">
									<img src="${path}${fileList.url}" alt="상품이미지" style="width:200px; height:133px;">
									<button class="delete_img" type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="selImg" id="img${status.index}" 
											<c:if test="${fileList.type eq 'A' or fileList.type eq 'E'}">checked</c:if> />
										<label for="img${status.index}">
											<c:choose><c:when test="${param.type eq 'A'}">앞면 </c:when><c:otherwise>대표 </c:otherwise></c:choose>
											<span>이미지</span></label>
										<span class="idate">${fileList.insertDate}</span>
									</div>
									<input type="hidden" class="repIdx" value="${fileList.idx}" />
									<input type="hidden" class="deleteIdx" value="${fileList.idx}" />
								</div>	
								</c:forEach>
							</td>
						</tr>
						<tr>
							<th scope="col" colspan="2"><c:choose><c:when test="${param.type eq 'A'}">광고</c:when><c:otherwise>상품</c:otherwise></c:choose> 상세소개</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="content" id="content" maxlength=100>${productList.content}</textarea>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				
				<p class="tit mt20"><c:choose><c:when test="${param.type eq 'A'}">광고</c:when><c:otherwise>판매</c:otherwise></c:choose>설정</p>
				<table class="detail mt10">
					<caption>결과</caption>
					<colgroup>
						<col style="width:15%">
						<col style="*">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row"><c:choose><c:when test="${param.type eq 'A'}">광고</c:when><c:otherwise>판매</c:otherwise></c:choose>여부</th>
						<td>
							<input type="radio" name="state" value="N" id="sell_check01" <c:if test="${productList.state eq state1}">checked</c:if>><label for="sell_check01">${state1}</label>
							<input type="radio" name="state" value="Y" id="sell_check02" <c:if test="${productList.state eq state2}">checked</c:if>><label for="sell_check02">${state2}</label>
							<input type="radio" name="state" value="P" id="sell_check03" <c:if test="${productList.state eq state3}">checked</c:if>><label for="sell_check03">${state3}</label>
							<input type="radio" name="state" value="E" id="sell_check04" <c:if test="${productList.state eq state4}">checked</c:if>><label for="sell_check04">${state4}</label>
						</td>
					</tr>
				</tbody>
			</table>
			 <div class="btn_area align_r mt20">
				<a href="${path}/product/list" class="btn">목록</a>
				<button id="submit" class="btn" type="button">저장</button>
			</div>
			<div class="ing_list_wrap end wide">
				<ul>
				<c:forEach items="${reasonList}" var="reason">
					<li>
						<div class="desc_area">
							<p class="tit">
								<c:choose>
									<c:when test="${reason.state eq 'N'}">
										${state1}
									</c:when>
									<c:when test="${reason.state eq 'Y'}">
										${state2}
									</c:when>
									<c:when test="${reason.state eq 'P'}">
										${state3}
									</c:when>
									<c:when test="${reason.state eq 'E'}">
										${state4}
									</c:when>
								</c:choose>
							</p>
							<p>${reason.content}</p>
						</div>
						<div class="act_tit">
							<span class="stdate">${reason.insertDate}</span>
						</div>
					</li>
				</c:forEach>
					
				</ul>
			</div>
               
            </div>

   
        </div><!-- content -->
    </div>
		</form:form>

</div>

</body>
<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<script type="text/javascript" src="${path}/js/common.js"></script>
	<script type="text/javascript" src="${path}/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script src="${path}/js/editorSetting.js"></script>
<script>
	$("#gnb").find("li").eq(1).addClass("on");
	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
</script>
<script>
	$(function() {
		var idx = "${param.idx}" || 0;
		var type = "${param.type}" || "";
		console.log(type);
		var date = new Date();
		
		if (idx) {
			date = new Date("${productList.insertDate}".replace("-", "/"));
		}

		date.setDate(1);
		date.setMonth(date.getMonth() + 1);
		
		var lastDate = new Date(date.getYear(), date.getMonth() + 1, 0);

		if (date.getDate() + 9 >= lastDate.getDate()) {
			date.setMonth(date.getMonth() + 1);
		}

		for (var i = 1; i < 4; i++) {

			var month = date.getMonth() + 1
			var datetime = date.getFullYear() + "년  " + month + "월"
		   	$(".date label").eq(i - 1).text(datetime);

			datetime = date.getFullYear() + "-" + month + "-01"
			$(".date input").eq(i - 1).val(datetime);
			date.setMonth(date.getMonth() + 1);

			if (${! empty param.idx}) {
				var dateText = $(".date label").eq(i - 1).text().substring(7,10);
				if (dateText == "${fn:substring(productList.sellDate, 7, 10)}") {
					$("input[name=sellDate]").eq(i - 1).prop("checked",true);
				}
			}
		}
		
		// 이미지 등록
		$("input[name=uploadFile]").change(function() {
			var date = new Date();
			var file = this.files[0];
							
			if ($("#append > .img_box_s").length <= 4 && file !== undefined) {
				let num = $("#append > div:last").index()+1;
				var element = '<div class="img_box_s">' +
									'<img style="width:200px; height:133px;" src="" alt="상품이미지">' +
								'<button class="delete_img" type="button">삭제</button>' +
								'<div class="selbox">' +
									'<input type="radio" class="selImg" name="selImg" id="img'+num+'"/><label for="img'+num+'">대표 <span>이미지</span></label>' +
									'<span class="idate">' + date.getFullYear() + '.' + (date.getMonth() + 1) + '.' + date.getDate() + '</span>' +
								'</div>' +
							'</div>';

				$("#append").append(element);
				
				readURL(this, ".img_box_s img:last");
				uploadList.push(file);
			}
			
		});
		
		// 이미지 삭제
		$(document).on("click", ".delete_img", function() {

			var confirm = window.confirm("삭제하시겠습니까?");

			if (confirm) {
				var order = $(".delete_img").index(this);
				var img = $(".img_box_s").eq(order).find(".selImg");
				var idx = $(".selImg").index(img);

				if (idx < 0) {
					idx = $(".delete_img").index(this);
					var deleteIdx = $(".deleteIdx").eq(idx).val();

				} else {
					uploadList.splice(idx, 1);
					idx = $(".delete_img").index(this);
					
				}
				
				$("#append > .img_box_s").eq(idx).remove();	
						
				if (deleteIdx !== undefined) {
					var element = '<input type="hidden" name="deleteIdx" value="' + deleteIdx + '"/>'
					$("form").append(element);
				}
			}
		});

		// 카테고리 삭제
		$(document).on("click", "#ctg .btn_del", function() {
			var idx = $("#ctg .btn_del").index(this);
			
			$("#ctg > span").eq(idx).remove();
			$("#ctg > input").eq(idx).remove();

		});

		// 카테고리 추가 (애드용)
		$(".cCIdx").change(function() {
			
			if (type == 'A') {
				var value = $(".cCIdx option:selected").val();
				var text = $(".cCIdx option:selected").text();
				var idxArr = [];
				var element = '<span class="txt">' + text + '<button type="button" class="btn_del">삭제</button></span>' +
				  '<input type="hidden" name="cCIdx" value="' + value  + '"/>';
				$("input[name=cCIdx]").each(function(i, item) {
					idxArr.push($(item).val());
				});
													
				
				if (value !== "" && $("input[name=cCIdx]").length < 5) {
					
					if (idxArr.indexOf(value) == -1) {
						$("#ctg").append(element);

					}
				}
			}

		});
		
		// 카테고리 추가 (박스용)
		$("#cCIdx").change(function() {
			var big = $(".cCIdx option:selected").text();
			var medium = $("#cCIdx option:selected").text();
			var text = $("#cCIdx option:selected").val();
			var element = '<span class="txt">' + big +  '&gt;' + medium + '<button type="button" class="btn_del">삭제</button></span>' +
							  '<input type="hidden" name="cCIdx" value="${productList.cCIdx}"/>';

			if (text !== "") {
				$("#ctg > *").remove();
				$("#ctg").append(element);
													
			}
		});	

		// 연령 삭제
		$(document).on("click", "#age .btn_del", function() {
			var idx = $("#age .btn_del").index(this);
			
			$("#age > span").eq(idx).remove();
			$("#age > input").eq(idx).remove();

		});

		// 연령 추가
		$("#ctmAge").change(function() {
			var value = $("#ctmAge option:selected").val();
			var text = $("#ctmAge option:selected").text();
			var idxArr = [];
			
			$("input[name=ctmAge]").each(function(i, item) {
				idxArr.push($(item).val());
			});

			var element = '<span class="txt">' + text + ' <button type="button" class="btn_del">삭제</button></span>' +
			  '<input type="hidden" name="ctmAge" value="' + value  + '"/>';

			if (value !== "" && $("#age > span").length < 2) {				
				if (idxArr.indexOf(value) == -1) {
					$("#age").append(element);
				}
			}

		});
		
		// 카테고리 리스트 가져오기
		$(".cCIdx").change(function() {
			var parent = $(this).val();

			if (parent == 0) {
				$("#cCIdx .append").remove();

			} else {

				$.post("${path}/product/select_code", {parent: parent}, function(data) {
					$("#cCIdx .append").remove();

					$.each(data.codeList, function(index, item) {
						var element = '<option class="append" value="' +  item.idx +  '">' + item.name + '</option>'
						$("#cCIdx").append(element);
					});

				}); 
			} 

		});

		function urlChk(){
			if($("input[name=url]").val().indexOf(("http")) < 0){
				alert("웹페이지 주소는 https:// 혹은 http://로 시작해야 합니다.");
				return false;
			} 
			return true;
		}
		// ajax 전송
		$("#submit").click(function() {
			var result = checkInputName("title", "${title} 명을")
						&& checkValid($("#ctg > span").length !== 0, "카테고리를 선택해주세요")
						&& checkValid($("#age > span").length !== 0, "${msg}연령을 선택해주세요")
						&& checkInputSelect("ctmGender", "${msg}성별을")
						&& checkInputSelect("ctmType", "${msg}유형을")
						&& checkInputName("url", "웹페이지 주소를")
						&& urlChk()							
						&& checkInputName("intro", "상품 소개를")
						&& checkValid($("#append img").length !== 0, '상품 이미지를 입력해주세요')
						&& checkValid($("input[name=selImg]").is(":checked"), '대표 이미지를 입력해주세요')
						&& checkValid($("#age > span").length !== 0, "고객연령을 입력해주세요")
						&& validate("상품상세를");
			
			
			
			if (type == "A") {				
				result = result && checkInputSelect("pCIdx", "광고유형을")
					   			&& checkInputName("adStartDate", '광고기간을')
					   			&& checkInputName("adEndDate", '광고기간을');
			
			} else {
				result = result && checkInputSelect("avgPrice", "평균주문금액을")
	   							&& checkValid($("input[name=sellDate]").is(":checked"), "판매월을 입력해주세요");
			}
			
			if (result) {
				var confirm = window.confirm("저장하시겠습니까?");

				if (confirm) {

					var idx = $(".selImg").index($(".selImg:checked"));
					var delIdx = $("input[name=selImg]").index($("input[name=selImg]:checked"));
					$(".repIdx").eq(delIdx).attr("name", "repIdx");

					ajax("pvo", "${path}", '저장되었습니다.', idx);
				}
				
			}
			
			
		});
	});
	
	
</script>

</html>