<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${empty adList}">
		<c:set var="title" value="마이 애드 등록"/>	
	</c:when>
	<c:otherwise>
		<c:set var="title" value="마이 애드 관리"/>
	</c:otherwise>
</c:choose>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
		<div id="container">
			<div class="sub_wrap mypage_wrap">
				<div class="inner">
					<div class="path">
						<ul>
							<li>홈</li>
							<li>애드 (Ads)</li>
							<li>${title}</li>
						</ul>
					</div>
					<h2 class="title">${title}</h2>
					<h3 class="top_tit">광고 정보 입력 <strong class="required">*</strong>
						<p class="txt"><strong class="required">*</strong> 표시는 필수 입력 정보 입니다.</p>
					</h3>
					<form:form modelAttribute="adVO" enctype="multipart/form-data">
					<input type="hidden" name="path" value="${path}"/>
					<input type="hidden" name="writer" value="${login.idx}" />
					<div class="input_area_wrap">
					
						<dl>
							<dt>광고 명
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보하려는 브랜드, 제품, 서비스명을 넣어 입력해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area">
									<input type="text" name="title" id="box_name" value="${adList.title}" placeholder="광고 명을 입력해주세요." title="광고 명">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>타겟 카테고리 선택
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟과 고객이 유사할 것 같은 쇼핑몰 제품 카테고리를 최대 5개까지 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select id="cCIdx"  title="대분류 선택">
									<option value="">대분류 선택</option>
									<c:forEach items="${codeList}" var="codeList">
										<c:if test="${codeList.type eq 'C'}">
										<option value="${codeList.idx}">${codeList.name}</option>
										</c:if>
									</c:forEach>
									
								</select>
								
								<span class="txt">*대분류 5개 선택, 최소 2개 이상</span>
								<div class="input_tag" id="ctg" >
								<c:set var="list" value="${fn:split(adList.fir, ',')}"/>
								<c:set var="idxList" value="${fn:split(adList.cCIdx, ',')}"/>
								<c:set var="length" value="${fn:length(list)}"/>
								<c:if test="${! empty adList.fir}">
									<c:forEach var="i" begin="1" end="${length}">
									<span>
										<em>${list[length - i]}</em><button class="del" type="button">삭제</button>
									</span>
									</c:forEach>
									<c:forEach var="i" begin="0" end="${fn:length(list) - 1}">
									<input type="hidden" name="cCIdx" value="${idxList[i]}"/>
									</c:forEach>
								</c:if>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>타겟 연령
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟 고객의 연령대를 선택해주세요. 중복선택 가능합니다.
									</span>
								</span>
							</dt>
							<dd>
								<select id="ctmAge" title="홍보 타겟 고객의 연령대 선택">
									<option value="">선택하세요</option>
									<option value="14세~24세">14세~24세</option>
									<option value="25세~34세">25세~34세</option>
									<option value="35세~44세">35세~44세</option>
									<option value="45세~54세">45세~54세</option>
									<option value="55세~64세">55세~64세</option>
									<option value="65세~">65세~</option>
								</select>
								<span class="txt">*중복선택</span>
								<div class="input_tag" id="age">
									<c:set var="list" value="${fn:split(adList.ctmAge, ',')}" />
									<c:forEach var="idx" begin="0" end="${fn:length(list) - 1}">
										<c:if test="${! empty param.idx}">
										<span><em>${list[idx]}</em><button class="btn_del" type="button">삭제</button></span>
										<input type="hidden" name="ctmAge" value="${list[idx]}" />
										</c:if>
									</c:forEach>
									
								</div>
								
							</dd>
						</dl>
						<dl>
							<dt>타겟 성별
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟 고객의 성별을 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select name="ctmGender" id="gender" title="홍보 타겟 고객 성별 선택">
									<option value="">선택하세요</option>
									<option value="주로 여성" <c:if test="${adList.ctmGender eq '주로 여성'}">selected</c:if>>주로 여성 </option>
									<option value="주로 남성" <c:if test="${adList.ctmGender eq '주로 남성'}">selected</c:if>>주로 남성 </option>
									<option value="모든 성별" <c:if test="${adList.ctmGender eq '모든 성별'}">selected</c:if>>모든 성별 </option>
								</select>
								
							</dd>
						</dl>
						<dl>
							<dt>타겟 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟을 개인과 기업 중 하나 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select name="ctmType" id="type01" title="타겟 유형 선택">
									<option value="">선택하세요</option>
									<option value="개인고객" <c:if test="${adList.ctmType eq '개인고객'}">selected</c:if>>개인고객</option>
									<option value="기업고객" <c:if test="${adList.ctmType eq '기업고객'}">selected</c:if>>기업고객</option>
								</select>
							</dd>
						</dl>
						<dl>
							<dt>광고 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보물 유형을 선택해주세요. 희망하는 홍보물을 전국에 배포하여 신규 고객을 확보할 수 있습니다.
									</span>
								</span>
							</dt>
							<dd>
								<select name="pCIdx" id="cnt">
									<option value="">선택하세요</option>
									<c:forEach items="${codeList}" var="secList">
										<c:if test="${secList.type eq 'P'}">
											<c:forEach items="${codeList}" var="thdList">
												<c:if test="${secList.idx eq thdList.parent}">
													<option class="${secList.idx}" value="${thdList.idx}" <c:if test="${adList.pCIdx eq thdList.idx}">selected</c:if>>${secList.name} ${thdList.name}</option>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</select>
								<a href="javascript:modal_open('guide01');" class="btn_guide"><span>광고유형 가이드</span></a>
							</dd>
						</dl>
						<dl>
							<dt>홍보 웹페이지 주소
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보웹페이지 주소는 QR 코드로 변환하여 홍보물에 인쇄 후 타겟 고객에게 노출됩니다. 정확한 주소를 입력해주세요. (단, 샘플 광고는 광고주가 샘플을 직접 제작 후 배송하기에 QR코드 사용이 필수가 아닙니다
									</span>
								</span>
							</dt>
							<dd class="qr_wrap">
								<div class="qr_area">
									<div class="input_area">
										<input type="text" name="url" id="site_url" value="${adList.url}" placeholder="https://, http://를 포함하여 입력해주세요." title="홍보 웹페이지 주소">
									</div>
									<span class="txt">*등록 인터넷주소는 QR 코드로 만들어진 후, 전단지, 스티커에 같이 인쇄되어 소비자에게 배포합니다. (샘플 광고 제외)</span>
											<c:if test="${! empty param.idx and param.type ne 'copy'}">
												<button type="button" class="btn_qrcode" style="background-image:url(${path}${qrcode.url});">QR 보기</button>
											</c:if>
										<div class="popup_qrcode">
											<div class="head_title">
												QR 코드
												<a href="javascript:;" class="btn_close">닫기</a>
											</div>
											<div class="qrcode_box">
												<img src="${path}${qrcode.url}" alt="">
											</div>
											
										</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>광고 기간
								<span class="tooltip_icon">
									<span class="tooltiptext">
										회사에서 계획한 홍보 시작일과 종료일을 선택해주세요. 박스애드 마켓에 애드 상품을 노출하는 기간과 다른 설정이니 주의하세요.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area input_date">
									<input type="text" name="adStartDate" title="광고 시작일" value="${adList.adStartDate}" placeholder="시작일" id="datepicker1">
								</div>
								<span class="hypen">~</span>
								<div class="input_area input_date">
									<input type="text" name="adEndDate" title="광고 종료일" value="${adList.adEndDate}" placeholder="종료일" id="datepicker2">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>광고 소개
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 브랜드, 제품, 서비스의 간단한 소개를 100자 이내로 입력해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area" style="width:100%;">
									<input type="text" name="intro" id="box_name"  value="${adList.intro}" placeholder="간단한 광고 브랜드, 제품, 서비스 소개를 100자 이내로 입력해주세요." maxlength="100">
								</div>
							</dd>
						</dl>
						
					
					</div>
					
					<div class="bordered_m">
						<h3 class="top_tit">광고 이미지 <strong class="required">*</strong>  (2개까지 입력) 
						</h3>
						<div class="input_area_wrap">
							<div class="img_input_wrap">
								<div class="input_area">
									<input type="file" name="join_co08" id="uploadFile">
									<label for="uploadFile" class="file_txt">
										<span class="input_imgbox">
											<strong>홍보물 </strong>
											<span>이미지 업로드 <em>(필수)</em></span>
										</span>
									</label>
								</div>
								<div class="disp_wrap">
									<ul>
										<c:forEach items="${fileList}" var="fileList">
											<li>
												<div class="imgbox" style="background-image:url(${path}${fileList.url});">
												<label for="img_input0" class="file_img" style="">
													이미지 업로드
												</label>
												<button class="delete_img" type="button" value="${fileList.idx}">삭제</button>
												</div>
												<div class="selbox">
												<span class="rdo"><input type="radio" class="rep" name="selImg" id="${fileList.idx}" <c:if test="${fileList.type eq 'A'}">checked</c:if>><label for="${fileList.idx}">대표 이미지</label></span>
												<input type="hidden" class="repIdx" value="${fileList.idx}"/>
												<input type="hidden" name="fileIdx" value="${fileList.idx}"/>
												</div>
											</li>
											<%-- <input type="hidden" class="deleteIdx" value="${fileList.idx}"/> --%>
										</c:forEach>
										
									</ul>
									
								</div>
								<div class="txt_wrap">
									<p >
										광고 유형이 전단지, 스티커인 애드(Ads)는 등록한 광고 이미지로 인쇄 제작 후 홍보물을 판매자가 
										택배상자에 동봉하여 소비자에게 배포합니다. “이미지 가이드”를 참고하여 유형별 인쇄에 적합한 
										이미지를 등록해주세요. 등록 이미지가 1장이면 단면, 2장이면 양면으로 자동 인쇄 발주가 진행됩니다. 
									</p>
									<p class="g_txt">샘플인 경우 샘플 사진을 등록해주세요.</p>
									<a href="javascript:modal_open('guide02');" class="linkbox">이미지 가이드 보기</a>
								</div>
							</div>
						</div>
					</div>
					<div class="pr_detail_wrap">
						<h3 class="top_tit">광고 상세소개</h3>
						<c:choose>
							<c:when test="${adList.state eq 'Y'}">
								<div class="editor_area">${adList.content}</div>
								<input type="hidden" name="content" value="${adList.content}"/>
							</c:when>
							<c:otherwise>
								<textarea id="content" name="content" class="editor_area">${adList.content}</textarea>
							</c:otherwise>
						</c:choose>
					</div>
					
					
					<c:if test="${! empty param.idx and param.type ne 'copy'}">
					<h3 class="top_tit">광고 설정</h3>
					<div class="input_area_wrap setting">
						<dl>
							<dt>광고여부 
							</dt>
							<dd>
								<span class="rdo"><input type="radio" name="state" id="sell_check01" <c:if test="${adList.state eq 'N'}">checked</c:if> value="N"><label for="sell_check01">광고 대기</label></span>
								<span class="rdo"><input type="radio" name="state" id="sell_check02" <c:if test="${adList.state eq 'Y'}">checked</c:if> value="Y"><label for="sell_check02">광고 중</label></span>
								<span class="rdo"><input type="radio" name="state" id="sell_check03" <c:if test="${adList.state eq 'P'}">checked</c:if> value="P"><label for="sell_check03">일시 중지</label></span>
								<span class="rdo"><input type="radio" name="state" id="sell_check04" <c:if test="${adList.state eq 'E'}">checked</c:if> value="E"><label for="sell_check04">광고 종료</label></span>
							</dd>
						</dl>
						<dl class="reson" style="display: none;">
							<dt>
								</dt>
								<dd>
									<div class="input_area">
									<input type="text" id="rs" placeholder="200자 이내로 사유를 입력해주세요." title="박스 명" maxlength="200"/><button id="msg" class="btn" type="button">입력</button>
								</div>
							</dd>
						</dl>
						<dl class="term" style="display: none;">
							<dt>
								상품노출기간
							</dt>
							<dd>
								<div class="input_area input_date">
									<input type="text" name="viewStartDate" title="상품노출기간"  placeholder="시작일" id="datepicker3" value="${adList.viewStartDate}">
								</div>
								<span class="hypen">~</span>
								<div class="input_area input_date">
									<input type="text" name="viewEndDate" title="광고 종료일" placeholder="종료일" id="datepicker4" value="${adList.viewEndDate}">
									
								</div>
							</dd>
						</dl>
					</div>
					</c:if>
					<c:if test="${param.type ne 'copy'}">
						<div class="ing_list_wrap end wide">
							<ul>
								<c:forEach items="${reasonList}" var="reason">
								<li>
									<div class="desc_area">
									<c:choose>
										<c:when test="${reason.state eq 'P'}">
											<p class="tit">일시 중지</p>
										</c:when>
										<c:when test="${reason.state eq 'E'}">
											<p class="tit">판매 종료</p>
										</c:when>
									</c:choose>
										<p>${reason.content}</p>
									</div>
									<div class="act_tit">
										<span class="stdate">${reason.insertDate}</span>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>					
					</c:if>
					
					<input type="hidden" name="imgCnt" />
					<c:if test="${! empty param.idx}">
					<input type="hidden" name="qIdx" value="${qrcode.idx}"/>
					</c:if>
					</form:form>
					<div class="btn_area">
						<button id="submit" type="button" class="btn btn_finish">저장</button>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<c:import url="/WEB-INF/views/inc/product_guide.jsp"/>
	<c:import url="/WEB-INF/views/inc/img_guide.jsp"/>
	
	<!-- 이미지 팝업 -->
	<div id="guide03" class="layerpop-box">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<a href="javascript:;" class="btn_close">닫기</a>
			<img src="../../../images/sub/ads_paper_1.png" alt="">
		</div>
	</div>
	<!-- 이미지 팝업 -->
	
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<c:if test="${adList.state ne 'Y'}">
		<script type="text/javascript" src="${path}/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="${path}/js/editorSetting.js"></script>
	</c:if>
</body>
<script type="text/javascript">

	/*qr code  오픈 */
	$('.qr_area  .btn_qrcode').on('click',function(){
		$('.qr_area  .popup_qrcode').addClass('open');
	});
	/*qr code  닫기 */
	$('.popup_qrcode  .btn_close').on('click',function(){
		$('.qr_area  .popup_qrcode').removeClass('open');
	});
</script>
<script>
	$(function() {
		window.reason = false;
		var state = "${adList.state}" || "N";

		changeState(state);
		stateCheck(state);

		// 이미지 등록
		$("#uploadFile").change(function() {
			var file = this.files[0];
			
			if ($(".disp_wrap li").length < 2 && file !== undefined) {
				var element = '<li>' +
				'<div class="imgbox" style="">' +
				'<label for="img_input0" class="file_img" style="">' +
					'이미지 업로드' +
				'</label>' +
				'<button class="delete_img" type="button">삭제</button>' +
				'</div>' +
				'<div class="selbox">' +
				'<span class="rdo"><input type="radio" class="selImg" name="selImg" id="' + file.name + '"><label for="' + file.name + '">앞면 이미지</label></span>' +
				'</div>' +
			'</li>';

				$(".disp_wrap ul").append(element);
				
				readURL(this, ".imgbox:last");
				uploadList.push(file);
				$("#uploadFile").val("");
			}
			
		});
		
		// 이미지 삭제
		$(document).on("click", ".delete_img", function() {
			var confirm = window.confirm("삭제하시겠습니까?");
			
			if (confirm) {
				var idx = $(".delete_img").index(this);
				var selIdx = $(".selImg").index($(".selbox").eq(idx).find(".selImg"));
				
				if (selIdx == -1) {
					/* var deleteIdx = $(".deleteIdx").eq(idx).val(); */
					var deleteIdx = $(this).val();
					var element = "<input type='hidden' name='deleteIdx' value='" + deleteIdx + "'/>";
					$("form").append(element);
					
				} else {
					uploadList.splice(selIdx, 1);
				}
				$(".disp_wrap li").eq(idx).remove();
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

			var element = '<span class="txt">' + text + '<button type="button" class="btn_del">삭제</button></span>' +
			  '<input type="hidden" name="ctmAge" value="' + value  + '"/>';

			  if (value !== "" && idxArr.length < 2) {
					
				if (idxArr.indexOf(value) == -1) {
					$("#age").append(element);
				}
			}

		});

		
		// 카테고리 추가
		$("#cCIdx").change(function() {
			var name = $("#cCIdx option:selected").text();
			var value = $("#cCIdx option:selected").val();
			var element = '<span><em>' + name + '</em><button class="del" type="button">삭제</button></span>' +
												'<input type="hidden" name="cCIdx" value="' + value + '" />';
			var idxArr = [];
												
			$("input[name=cCIdx]").each(function(i, item) {
				idxArr.push($(item).val());
			});
												
			
			if (value !== "" && $("input[name=cCIdx]").length < 5) {
				console.log(value, $("input[name=cCIdx]").length)
				if (idxArr.indexOf(value) == -1) {
					$(".input_tag").eq(0).append(element);

				}
			}
			
		});
		
		//  삭제
		$(document).on("click", ".del", function() {
			var idx = $(".del").index(this);
			$(".input_tag span").eq(idx).remove();
			$(".input_tag input[name=cCIdx]").eq(idx).remove();
		});

		// 사유 입력칸 추가
		$("input[name=state]").click(function() {

			var state = $("input[name=state]:checked").val();
			changeState(state);
		});

 		$(document).on("click", "#msg", function() {
 			reason = true;																
			$("#submit").trigger("click");
			/* var content = $("#rs").val();

			if (content !== "") {
				var data = {content: content,
						parent: ${! empty param.idx ? param.idx : 0},
						type: "A",
						state: $("input[name=state]:checked").val()};
			
				if ($("#rs").val()) {
					$.post("${path}/ad/reason", data, function() {
						alert("저장되었습니다");
					});
					reason = true;
					$("input[name=state]").attr("onclick", "return(false)");
				}

			} else {
				alert("사유를 입력해주세요");
			} */
			
		}); 
		
		// ajax로 정보 전송
		$("#submit").click(function() {
			var state = $("input[name=state]:checked").val();
			
			if (!$("input[name=title]").val()) {
				alert('<spring:message code="ad.write.title" javaScriptEscape="true"/>');

			} else if ($(".input_tag:eq(0) span").length < 2) {
				alert('<spring:message code="ad.write.category" javaScriptEscape="true"/>');

			} else if ($("#age span").length == 0) {
				alert('<spring:message code="ad.write.ctmAge" javaScriptEscape="true"/>');

			} else if (!$("select[name=ctmGender] option:selected").val()) {
				alert('<spring:message code="ad.write.ctmGender" javaScriptEscape="true"/>');

			} else if (!$("select[name=ctmType] option:selected").val()) {
				alert('<spring:message code="ad.write.ctmType" javaScriptEscape="true"/>');

			} else if (!$("select[name=pCIdx] option:selected").val()) {
				alert('<spring:message code="ad.write.pCIdx" javaScriptEscape="true"/>');

			} else if (!$("input[name=url]").val()) {
				alert('<spring:message code="ad.write.url" javaScriptEscape="true"/>');

			} else if (!$("input[name=url]").val().indexOf(("http")) < 0) {
				alert('<spring:message code="ad.write.urlStartWith" javaScriptEscape="true"/>');

			} else if (!($("input[name=adStartDate]").val() || $("input[name=adEndDate]").val())) {
				alert('<spring:message code="ad.write.adDate" javaScriptEscape="true"/>');

			} else if (!$("input[name=intro]").val()) {
				alert('<spring:message code="ad.write.intro" javaScriptEscape="true"/>');

			} else if ($(".disp_wrap ul li").length == 0) {
				alert('<spring:message code="ad.write.file" javaScriptEscape="true"/>');

			} else if (!$("input[name=selImg]").is(":checked")) {
				alert('<spring:message code="ad.write.selImg" javaScriptEscape="true"/>');

			}  else if (${adList.state ne 'Y'} && validate() === false) {
				alert('<spring:message code="ad.write.content" javaScriptEscape="true"/>');

			}  else if ((state == "P" || state == "E") && !reason) {
				alert("사유를 입력해주세요");
			} else {
				var confirm = window.confirm('<spring:message code="ad.write.confirm" javaScriptEscape="true"/>');

				if (confirm) {
					$("select").attr("disabled", false);
					
					var idx = $(".selImg").index($(".selImg:checked"));
					var repIdx = $(".rep").index($(".rep:checked"));
					
					if (repIdx != -1) {
						$(".repIdx").eq(repIdx).attr("name", "repIdx");
					}
					var imgCnt = $(".imgbox").length;
					$("input[name=imgCnt]").val(imgCnt);
					
					if (${param.idx != 0}) {
						if((state == "P" || state == "E") && reason){
							var data = {content: $("#rs").val(), parent: ${!empty param.idx ? param.idx : 0}, type: "A", state:state};
						
							if ($("#rs").val()) {
								$.post("${path}/ad/reason", data, function() {});								
								$("input[name=state]").attr("onclick", "return(false)");
							}
						} 

						if(state == 'N' || state == 'P'){
							oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
						}
						
						ajax("adVO", "${path}", '<spring:message code="ad.write.submit" javaScriptEscape="true"/>', idx);
						$("select").attr("disabled", true);
					} else {
						ajax("adVO", "${path}", '<spring:message code="ad.write.submit" javaScriptEscape="true"/>');
					}
					
				}
			}
			
		});
		
	});

function changeState(state) {	
	if (state == "P" || state == "E")  {
		$(".term").hide();
		$(".reson").show();
	} else if (state == "Y") {
		$(".reson").hide();
		$(".term").show();
		$("input[name=viewStartDate]").attr('disabled', false);
		$("input[name=viewEndDate]").attr('disabled', false);
	} else if (state == "N") {
		$(".reson").hide();
		$(".term").hide();
		$("input[name=viewStartDate]").attr('disabled', true);
		$("input[name=viewEndDate]").attr('disabled', true);
	}
}
		
function stateCheck(state) {	
	console.log(state)
	if (state == "Y" || state == "P") {
		$("input[name=sellDate]").attr("onclick", "return(false)");
		$("input").attr("readonly", true);
		$("select").attr("disabled", true);
						
		$(".btn_del").removeClass("btn_del");
		$(".del").removeClass("del");
		$(".delete_img").removeClass("delete_img");
		$(":radio[name='selImg']").attr("disabled", true);
		$("#uploadFile").attr("type", "hidden");
		
		//$(document).off();
		$("input[name=state], #rs").removeAttr("readonly");
		$("input[name=state]:first").attr("disabled", true);
		
		$("input").not("input[name=viewStartDate], input[name=viewEndDate]").off();
		/* if (state == "P") { 
			$("input").not("input[name=state], #submit").off();
		} */

		if (state == "P") { $("input[name=intro]").removeAttr("readonly"); }
	} 
}
</script>
</html>