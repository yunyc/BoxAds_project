<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${empty boxList}">
		<c:set var="title" value="마이 박스 등록"/>	
	</c:when>
	<c:otherwise>
		<c:set var="title" value="마이 박스 관리"/>
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
							<li>박스(Box)</li>
							<li>${title}</li>
						</ul>
					</div>
					<!-- 마이 박스 등록 -->
					<form:form modelAttribute="boxVO" enctype="multipart/form-data">
					<input type="hidden" name="writer" value="${login.idx}"/>
					<input type="hidden" name="path" value="${path}"/>
					<h2 class="title">${title}</h2>
					<h3 class="top_tit">상품 정보 입력 <strong class="required">*</strong>
						<p class="txt"><strong class="required">*</strong> 표시는 필수 입력 정보 입니다.</p>
					</h3>
					<div class="input_area_wrap">
						<dl>
							<dt>박스 명
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 제품의 브랜드, 제품명을 넣어 입력해주새요.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area">
									<input type="text" name="title" id="box_name" value="${boxList.title}"  required placeholder="박스명을 입력해주세요." title="박스 명">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>카테고리
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 제품의 카테고리를 대분류>중분류로 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select id="big" title="대분류 선택">
								<option value="0">대분류 선택</option>
									<c:forEach items="${codeList}" var="codeList">
										<c:if test="${codeList.type eq 'C'}">
										<option value="${codeList.idx}" ><c:out value="${codeList.name}"/></option>
										</c:if>
									</c:forEach>
								</select>
								<select id="medium" title="중분류 선택">
										<option value="">중분류 선택</option>
								</select>
								
								<div class="input_tag" id="ctg">
									<c:if test="${! empty param.idx}">
									<span>
										<em>${boxList.secCtg}</em><em>${boxList.thrCtg}</em><button class="btn_del" type="button">삭제</button>
									</span>
									</c:if>
								</div>
								<input type="hidden" name="cCIdx" value="${boxList.cCIdx}"/>
								
							</dd>
						</dl>
						<dl>
							<dt>고객 연령
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품의 주 고객 연령대를 선택해주세요. 중복선택 가능합니다.
									</span>
								</span>
							</dt>
							<dd>
								<select name="ctmAge" title="고객 연령 선택" id="age1">
									<option value="">선택하세요</option>
									<option value="14세~24세">14세~24세</option>
									<option value="25세~34세">25세~34세</option>
									<option value="35세~44세">35세~44세</option>
									<option value="45세~54세">45세~54세</option>
									<option value="55세~64세">55세~64세</option>
									<option value="65세~">65세~</option>
								</select>
								
								<select name="ctmAge" title="고객 연령 선택" id="age2">
									<option value="">선택하세요</option>
									<option value="14세~24세">14세~24세</option>
									<option value="25세~34세">25세~34세</option>
									<option value="35세~44세">35세~44세</option>
									<option value="45세~54세">45세~54세</option>
									<option value="55세~64세">55세~64세</option>
									<option value="65세~">65세~</option>
								</select>
								
<%-- 								<div class="input_tag" id="age">
									<c:if test="${! empty param.idx}">
									<c:set var="list" value="${fn:split(boxList.ctmAge, ',')}" />
									<c:forEach var="idx" begin="0" end="${fn:length(list) - 1}">
										<span><em>${list[idx]}</em><button class="btn_del" type="button">삭제</button></span>
										<input type="hidden" name="ctmAge" value="${list[idx]}" />
									</c:forEach>
									</c:if>
								</div> --%>								
							</dd>
						</dl>
						<dl>
							<dt>고객 성별
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품의 주 고객 성별을 선택해주세요. 
									</span>
								</span>
							</dt>
							<dd>
								<select name="ctmGender" id="gender"  title="고객 성별 선택">
									<option value="">선택하세요</option>
									<option value="주로 여성" <c:if test="${boxList.ctmGender eq '주로 여성'}">selected</c:if>>주로 여성 </option>
									<option value="주로 남성" <c:if test="${boxList.ctmGender eq '주로 남성'}">selected</c:if>>주로 남성 </option>
									<option value="모든 성별" <c:if test="${boxList.ctmGender eq '모든 성별'}">selected</c:if>>모든 성별 </option>
								</select>
							</dd>
						</dl>
						<dl>
							<dt>고객 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품의 주 구매 고객을 개인과 기업 중 하나 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select name="ctmType" id="type01" title="주 구매 고객 선택">
									<option value="">선택하세요</option>
									<option value="개인고객" <c:if test="${boxList.ctmType eq '개인고객'}">selected</c:if>>개인고객</option>
									<option value="기업고객" <c:if test="${boxList.ctmType eq '기업고객'}">selected</c:if>>기업고객</option>
								</select>
							</dd>
						</dl>
						<dl>
							<dt>주문금액
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품 구매 고객 1명당 평균 주문 금액대를 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select name="avgPrice" id="ave_amount" title="평균주문금액 선택">
									<option value="">선택하세요</option>
									<option value="0~25,000" <c:if test="${boxList.avgPrice eq '0~25,000'}">selected</c:if>>0~25,000원</option>
									<option value="25,000~50,000" <c:if test="${boxList.avgPrice eq '25,000~50,000'}">selected</c:if>>25,000~50,000원</option>
									<option value="50,000~100,000" <c:if test="${boxList.avgPrice eq '50,000~100,000'}">selected</c:if>>50,000~100,000원</option>
									<option value="100,000~500,000" <c:if test="${boxList.avgPrice eq '100,000~500,000'}">selected</c:if>>100,000~500,000원</option>
									<option value="500,000~" <c:if test="${boxList.avgPrice eq '500,000~'}">selected</c:if>>500,000원~ </option>
								</select>
							</dd>
						</dl>
						<dl>
							<dt>상품 웹페이지 주소
								<span class="tooltip_icon">
									<span class="tooltiptext">
										실제 쇼핑몰에서 판매중인 상품의 웹페이지 주소를 입력해주세요.<br> 광고주의 박스 상품 선택 시 많은 참고가 됩니다.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area">
									<input type="text" name="url" id="site_url" value="${boxList.url}" required placeholder="https://, http://를 포함하여 입력해주세요."  title="상품 웹페이지 주소">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>판매 월(광고시작 월)
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매월은 광고주의 홍보물을 택배상자에 동봉하여 배포하는 광고 진행 월을 뜻합니다. <br>광고가 진행 될 박스상품 판매월을 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<span class="rdo date"><input type="radio" name="sellDate" id="sale_start01"><label for="sale_start01">2019년 9월</label></span>
								<span class="rdo date"><input type="radio" name="sellDate" id="sale_start02"><label for="sale_start02">2019년 10월</label></span>
								<span class="rdo date"><input type="radio" name="sellDate" id="sale_start03"><label for="sale_start03">2019년 11월</label></span>
							</dd>
						</dl>
						<dl>
							<dt>상품 소개
								<span class="tooltip_icon">
									<span class="tooltiptext">
										간단한 상품소개를 100자 이내로 입력해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area" style="width:100%;">
									<input type="text" name="intro" id="box_intro" value="${boxList.intro}" required placeholder="간단한 상품소개를 100자 이내로 입력해주세요." title="상품소개" maxlength="100">
								</div>
							</dd>
						</dl>
						<dl>
							<dt><span class="colored_txt">광고 유형</span>
								
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 제품 포장에 따라 동봉 가능한 홍보물 유형을 설정하게 됩니다. <br>광고유형별 상품 가이드 정보 확인 후 적합한 항목을 선택해주세요.
									</span>
								</span>
							</dt>
							<dd>
								<select name="pCIdx" id="pCIdx" title="광고 유형 선택">
									<option value="">선택하세요</option>
									<c:forEach items="${codeList}" var="secList">
										<c:if test="${secList.type eq 'P'}">
										<c:forEach items="${codeList}" var="thdList">
											<c:if test="${secList.idx eq thdList.parent}">
												<option class="${secList.idx}" value="${thdList.idx}" <c:if test="${boxList.pCIdx eq thdList.idx}">selected</c:if>>${secList.name} ${thdList.name}</option>
											</c:if>
										</c:forEach>
										</c:if>
									</c:forEach>
								</select>
								<a href="javascript:modal_open('guide01');" class="btn_guide"><span>광고유형 가이드</span></a>
							</dd>
						</dl>
						<dl>
							<dt><span class="colored_txt">판매상품 수량</span>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품포장 택배 1박스(봉투)당 광고주 홍보물을 몇 개까지 동봉 가능한지 선택해주세요. <br>광고 유형에 따라 표시된 최대 수량 이내에서 선택 가능합니다.
									</span>
								</span>
							</dt>
							<dd>
								<select name="pdtCnt" id="cnt" title="판매상품 수량 선택">
									<option value="">선택하세요</option>
									
								</select>
							</dd>
						</dl>
						<dl>
							<dt><span class="colored_txt">광고 단가</span>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 제품의 브랜드와 판매량을 고려해서 표시된 범위내에서 적정한 희망 광고 단가(홍보물 1장/개)를 입력해주세요. <br>등록한 박스상품 판매가 저조할 경우 단가를 낮추어 광고주의 구매를 유도할 수 있습니다.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area unit_num">
									<input type="text" name="unit" id="unit_price" value="${boxList.unit}" required class="unit_num  align_r"> 
								</div>
								<span class="unit">원 </span> <span class="txt">*범위안에서 입력해주세요</span>
								
							</dd>
						</dl>
						<dl>
							<dt><span class="colored_txt">박스 수</span>
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 월에 해당 제품 판매로 배송할 예상 택배상자(봉투)수를 입력해주세요.<br>500개~5,000,000개까지 가능하며, 500개 단위로 입력해주세요.<br>단일 제품의 박스 수가 대량일 경우 박스 수를 나누어 광고를 유치할 수도 있습니다.
									</span>
								</span>
							</dt>
							<dd>
								<div class="input_area unit_num">
									<input type="text" name="boxCnt" id="box_cnt" value="${boxList.boxCnt}" required class="align_r"  title="박스 수" placeholder="500개~5,000,000개"> 
								</div>
								<span class="unit">개</span> <span class="txt">* 박스수는 최소 500개이며, 500개 단위로  최대 500만개까지 입력 가능합니다.</span>
								
							</dd>
						</dl>
						<dl>
							<dt><span class="colored_txt">광고비</span></dt>
							<dd>
								<div class="input_area unit_num">
									<input type="text" name="adPrice" value="${boxList.adPrice}" id="cost" class="align_r" title="광고비" readonly="readonly"> 
								</div>
								<span class="unit">원 </span>
							</dd>
						</dl>
					</div>
						
					<div class="bordered_m">
						<h3 class="top_tit">상품 이미지 <strong class="required">*</strong>
						</h3>
						<div class="input_area_wrap">
							<div class="img_input_wrap">
								<div class="input_area">
									<input type="file" id="uploadFile">
									<label for="uploadFile" class="file_txt">
										<span class="input_imgbox">
											<strong>박스상품</strong>
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
												<span class="rdo"><input type="radio" class="rep" name="selImg" id="${fileList.idx}" <c:if test="${fileList.type eq 'E'}">checked</c:if>><label for="${fileList.idx}">대표 이미지</label></span>
												<input type="hidden" class="repIdx" value="${fileList.idx}"/>
												<c:if test="${param.type eq 'copy'}">
													<input type="hidden" name="fileIdx" value="${fileList.idx}"/>
												</c:if>
												</div>
												<%-- <input type="hidden" class="deleteIdx" value="${fileList.idx}"/> --%>
											</li>
											
										</c:forEach>
									</ul>
									<div class="txt_area">
										광고주가 참고할 수 있는 제품 사진과 박스 수를 신뢰할 수 있는 상품 판매 실적(최근 3개월 이내 해당 상품의 월 판매 수) 사진을 같이 등록하면 더 많은 광고주가 상품을 구매할 것입니다.
									</div>
								</div>
							</div>
						</div>
						</div>
						
					<div class="pr_detail_wrap">
						<h3 class="top_tit">상품 상세소개</h3>
						<c:choose>
							<c:when test="${boxList.state eq 'Y'}">
								<div class="editor_area">${boxList.content}</div>
								<input type="hidden" name="content" value="${boxList.content}"/>
							</c:when>
							<c:otherwise>
								<textarea id="content" name="content" class="editor_area">${boxList.content}</textarea>
							</c:otherwise>
						</c:choose>
					</div>
					
					<c:if test="${! empty param.idx and param.type ne 'copy'}">
					<h3 class="top_tit">판매 설정</h3>
					<div class="input_area_wrap setting" style="margin-top: 10px;">
						<dl>
							<dt>판매여부 </dt>
							<dd>
								<span class="rdo"><input type="radio" name="state" id="sell_check01" <c:if test="${boxList.state eq 'N'}">checked</c:if> value="N"><label for="sell_check01">판매 대기</label></span>
								<span class="rdo"><input type="radio" name="state" id="sell_check02" <c:if test="${boxList.state eq 'Y'}">checked</c:if> value="Y"><label for="sell_check02">판매중</label></span>
								<span class="rdo"><input type="radio" name="state" id="sell_check03" <c:if test="${boxList.state eq 'P'}">checked</c:if> value="P"><label for="sell_check03">일시 중지</label></span>
								<span class="rdo"><input type="radio" name="state" id="sell_check04" <c:if test="${boxList.state eq 'E'}">checked</c:if> value="E"><label for="sell_check04">판매 종료</label></span>
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
					</div>
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
									<p class="desc_txt">${reason.content}</p>
								</div>
								<div class="act_tit">
									<span class="stdate">${reason.insertDate}</span>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					</c:if>
					<div class="btn_area">
						<button id="submit" type="button" class="btn btn_finish">저장</button>
					</div>
					</form:form>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<c:import url="/WEB-INF/views/inc/product_guide.jsp"/>
	
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<c:if test="${adList.state ne 'Y'}">
		<script type="text/javascript" src="${path}/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="${path}/js/editorSetting.js"></script>
	</c:if>
	<script>
		$(function() {
			var idx = "${param.idx}" || 0;
			var state = "${boxList.state}" || "N";
			
			window.s_unit = 0;
			window.e_unit = 0;
			window.reason = false;
			
			var date = new Date();

			if (${! empty param.idx}) {
				date = new Date("${boxList.insertDate}".replace("-", "/"));
			}
			
			var day = date.getDate();

			// 테스트용
			console.log(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes());
			
			date.setDate(1);
			date.setMonth(date.getMonth() + 1);

			var lastDate = new Date(date.getYear(), date.getMonth() + 1, 0);

			if (day + 9 >= lastDate.getDate()) {
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

					if (dateText == "${fn:substring(boxList.sellDate, 7, 10)}") {
						$("input[name=sellDate]").eq(i - 1).prop("checked",true);
					}
				}
							
			}

			if (${! empty boxList.pCIdx}) {
				// 전단지
				if ("${boxList.secPro}" === "전단지") {
					append_option(1, 14, 20, 150);
					
				// 스티커
				} else if ("${boxList.secPro}" === "스티커") {
					append_option(1, 4, 40, 200);

				// 샘플
				} else if ("${boxList.secPro}" === "샘플") {
					append_option(1, 5, 70, 500);
				}
			}

			changeState(state);
			stateCheck(state);
			
			// 카테고리 리스트 가져오기
			$("#big").change(function() {
				var parent = $(this).val();

				if (parent == 0) {
					$("#medium .append").remove();

				} else {

					$.post("${path}/box/select_code", {parent: parent}, function(data) {
						$("#medium .append").remove();

						$.each(data.codeList, function(index, item) {
							var element = '<option class="append" value="' +  item.idx +  '">' + item.name + '</option>'
							$("#medium").append(element);
						});

					}); 
				} 

			});

			
			let ctmAgeArr = '${boxList.ctmAge}'.split(',');
			$("#age1 > option").each(function() {
				let idx = ctmAgeArr.indexOf($(this).val())
				if(idx != -1){
					$(this).attr("selected", true);
					ctmAgeArr.splice(idx, 1);
					return false;
				}	
			})
			$("#age2 > option").each(function() {
				let idx = ctmAgeArr.indexOf($(this).val())
				if(idx != -1){					
					$(this).attr("selected", true);
					ctmAgeArr.splice(idx, 1);
					return false;
				}	
			})
						// 광고유형 리스트 가져오기
			$("#pCIdx").change(function() {
				var idx = $("#pCIdx option:selected").attr("class");

				// 전단지
				if (idx == 18) {
					append_option(1, 14, 20, 150);
					
				// 스티커
				} else if (idx == 19) {
					append_option(1, 4, 40, 200);

				// 샘플
				} else if (idx == 20) {
					append_option(1, 5, 70, 500);
				}

			});

			// 박스 수 입력 제한
			$("#box_cnt").on("change", function(){
				let cnt = Number($(this).val());
				cnt = cnt % 500 != 0 ? Math.ceil(cnt/500) * 500 : cnt

				if(cnt > 5000000){					
					$(this).val(5000000);
				} else if($.isNumeric($("input[name='boxCnt'").val())){
					$(this).val(cnt);
				} else {
					alert('<spring:message code="box.write.boxCntRange" javaScriptEscape="true"/>');
					$(this).val("");
				}
			})
			
			// 단가 제한
			$("#unit_price").on("change", function(){
				let pr = Number($(this).val());
				
				if(e_unit >= pr && pr >= s_unit && $.isNumeric($("input[name='unit'").val())){
					$(this).val(pr);
				} else {
					alert('<spring:message code="box.write.unitRange" javaScriptEscape="true"/>');
					$(this).val("");
				}
			})
			
			// 광고비 계산
			$("input[name=boxCnt], input[name=unit]").change(function() {
				setTimeout(function() {
					var boxCnt = $("input[name=boxCnt]").val();
					var unit = $("input[name=unit]").val();
					
	
					if (boxCnt && unit) {
						var adPrice = boxCnt * unit;
						$("input[name=adPrice]").val(adPrice);
					} else {
						$("input[name=adPrice]").val("");
					}
				}, 500);				
			});

			// 이미지 등록
			$("#uploadFile").change(function() {
				var file = this.files[0];
				
				if ($(".disp_wrap li").length <= 4 && file !== undefined) {
					var element = '<li>' +
					'<div class="imgbox" style="">' +
					'<label for="img_input0" class="file_img" style="">' +
						'이미지 업로드' +
					'</label>' +
					'<button class="delete_img" type="button">삭제</button>' +
					'</div>' +
					'<div class="selbox">' +
					'<span class="rdo"><input type="radio" class="selImg" name="selImg" id="' + file.name + '"><label for="' + file.name + '">대표 이미지</label></span>' +
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
			
			// 카테고리 삭제
			$(document).on("click", "#ctg .btn_del", function() {
				var idx = $("#ctg .btn_del").index(this);
				
				$("#ctg > span").eq(idx).remove();
				$("#ctg > input").eq(idx).remove();

			});

			// 카테고리 추가
			$("#medium").change(function() {
				
				var value = $("#medium option:selected").val();
				var text = $("#medium option:selected").text();
				var big = $("#big option:selected").text();
					

				var element = '<span class="txt">' + big + ' &gt;' + text + '<button type="button" class="btn_del">삭제</button></span>' +
								  '<input type="hidden" name="cCIdx" value="' + value  + '"/>'
					
				if (value !== "") {
					$("#ctg > *").remove();
					$("#ctg").append(element);
						
				}
			});
			
			// 연령 삭제
			/* $(document).on("click", "#age .btn_del", function() {
				var idx = $("#age .btn_del").index(this);
				
				$("#age > span").eq(idx).remove();
				$("#age > input").eq(idx).remove();

			}); */

			// 연령 추가
			$("select[name='ctmAge']").change(function() {
				let chk;
				$("select[name='ctmAge']").each(function() {
					if(chk == $(this).val()){
						alert('<spring:message code="box.write.overlap" javaScriptEscape="true"/>');
						$(this).val("")
					} else {
						chk = $(this).val();
					}
				})
			});
			
			// 사유 입력칸 추가
			$("input[name=state]").click(function() {

				var state = $("input[name=state]:checked").val();
				changeState(state);
			});
			
			// 사유 전송
			$(document).on("click", "#msg", function() {
/*				var content = $("#rs").val();				
											
 						html = '<li><div class="desc_area">'
	
						if($(":radio[name='state']:checked").val() == 'P'){
							html += '<p class="tit">일시 중지</p>'
						} else {
							html += '<p class="tit">판매 중지</p>'
						}						
	
						html += '<p class="desc_txt">'+content+'</p></div><div class="act_tit"><span class="stdate"></span></div></li>';
	
						$(".ing_list_wrap > ul").append(html)	 */
						reason = true;																
						$("#submit").trigger("click");	
						
	/* 					var data = {content: content, parent: ${! empty param.idx ? param.idx : 0},
								type: "B",
								state: $("input[name=state]:checked").val()};
					
						if ($("#rs").val()) {
							$.post("${path}/ad/reason", data, function() {
								alert("저장되었습니다");
							});
							$("input[name=state]").attr("onclick", "return(false)");
						} */
					
			});
		});

		// ajax로 정보 전송
		$("#submit").click(function() {

			var state = $("input[name=state]:checked").val();

			if (!$("input[name=title]").val()) {
				alert('<spring:message code="box.write.title" javaScriptEscape="true"/>');

			} else if ($("#ctg > span").length == 0) {
				alert('<spring:message code="box.write.cCIdx" javaScriptEscape="true"/>');

			} else if (!$("select[name=ctmAge] option:selected").val() && !$(":hidden[name='ctmAge']").val()) {
				alert('<spring:message code="box.write.ctmAge" javaScriptEscape="true"/>');

			} else if (!$("select[name=ctmGender] option:selected").val()) {
				alert('<spring:message code="box.write.ctmGender" javaScriptEscape="true"/>');

			} else if (!$("select[name=ctmType] option:selected").val()) {
				alert('<spring:message code="box.write.ctmType" javaScriptEscape="true"/>');

			} else if (!$("select[name=avgPrice] option:selected").val()) {
				alert('<spring:message code="box.write.avgPrice" javaScriptEscape="true"/>');

			} else if (!$("input[name=url]").val()) {
				alert('<spring:message code="box.write.url" javaScriptEscape="true"/>');

			} else if (!$("input[name=url]").val().indexOf(("http")) < 0) {
				alert('<spring:message code="box.write.urlStartWith" javaScriptEscape="true"/>');

			} else if (!$("input[name=sellDate]").is(":checked")) {
				alert('<spring:message code="box.write.sellDate" javaScriptEscape="true"/>');

			} else if (!$("input[name=intro]").val()) {
				alert('<spring:message code="box.write.intro" javaScriptEscape="true"/>');

			} else if (!$("select[name=pCIdx] option:selected").val()) {
				alert('<spring:message code="box.write.pCIdx" javaScriptEscape="true"/>');

			} else if (!$("select[name=pdtCnt] option:selected").val()) {
				alert('<spring:message code="box.write.pdtCnt" javaScriptEscape="true"/>');

			} else if (!$("input[name=unit]").val()) {
				alert('<spring:message code="box.write.unit" javaScriptEscape="true"/>');

			} else if (!$("input[name=boxCnt]").val()) {
				alert('<spring:message code="box.write.boxCnt" javaScriptEscape="true"/>');

			} else if ($(".disp_wrap ul li").length == 0) {
				alert('<spring:message code="box.write.file" javaScriptEscape="true"/>');

			} else if (!$("input[name=selImg]").is(":checked")) {
				alert('<spring:message code="box.write.selImg" javaScriptEscape="true"/>');

			} /* else if (${boxList.state ne 'Y'} && validate() === false) {
				alert('<spring:message code="box.write.content" javaScriptEscape="true"/>');

			} */ else if ($("input[name=unit]").val() < s_unit || $("input[name=unit]").val() > e_unit) {
				alert('<spring:message code="box.write.unitRange" javaScriptEscape="true"/>');
				
			} else if ($("input[name=boxCnt]").val() < 500 || $("input[name=boxCnt]").val() > 5000000) {
				alert('<spring:message code="box.write.boxCntRange" javaScriptEscape="true"/>');
			} else if ((state == "P" || state == "E") && !reason) {
				alert("사유를 입력해주세요");
			} else {
				var confirm = window.confirm('<spring:message code="box.write.confirm" javaScriptEscape="true"/>');

				if (confirm) {
					$("select").attr("disabled", false);
					
					var idx = $(".selImg").index($(".selImg:checked"));
					var repIdx = $(".rep").index($(".rep:checked"));
					
					if (repIdx != - 1) {
						$(".repIdx").eq(repIdx).attr("name", "repIdx");
					}

					if (${param.idx != 0}) {
						if((state == "P" || state == "E") && reason){
							var data = {content: $("#rs").val(), parent: ${!empty param.idx ? param.idx : 0}, type: "B", state:state};
						
							if ($("#rs").val()) {
								$.post("${path}/ad/reason", data, function() {});								
								$("input[name=state]").attr("onclick", "return(false)");
							}
						} else if(state = 'N'){
							oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
						}
						
						ajax("boxVO", "${path}", '<spring:message code="box.write.submit" javaScriptEscape="true"/>', idx);
						$("select").attr("disabled", true);
					} else {
						ajax("boxVO", "${path}", '<spring:message code="box.write.submit" javaScriptEscape="true"/>');
					}
					
				}
			}
		});

</script>
<script>
function append_option(s_cnt, e_cnt, s_unit, e_unit) {
	window.s_unit = s_unit;
	window.e_unit = e_unit;
	var pdtCnt = "${boxList.pdtCnt}" || 0;
	$("select[name=pdtCnt] .append").remove();

	for (var i = s_cnt; i <= e_cnt; i++) {
		var element = '<option class="append" value="' + i + '">' + i + '장' + '</option>';
		
		if (pdtCnt == i) {
			element = '<option class="append" value="' + i + '" selected>' + i + '장' + '</option>';
		}
		$("select[name=pdtCnt]").append(element);
	}

	$("input[name=unit]").attr("placeholder", s_unit + "원 ~ " + e_unit + "원");

}

function stateCheck(state) {
	
	if (state == "Y" || state == "P") {
		$("input[name=sellDate]").attr("onclick", "return(false)");
		$("input").attr("readonly", true);
		$("select").attr("disabled", true);
		$("input").not("input[name=state], #submit").off();
		
		$(".btn_del").removeClass("btn_del");
		$(".delete_img").removeClass("delete_img");
		$(":radio[name='selImg']").attr("disabled", true);
		$("#uploadFile").attr("type", "hidden");
				
		$(document).off();
		$("input[name=state], #rs").removeAttr("readonly");
		$("input[name=state]:first").attr("disabled", true);

		if (state == "P") {
			$("input[name=intro]").removeAttr("readonly");
		}
	} 
	
}

function changeState(state) {

	if (state == "P" || state == "E")  {
		$(".reson").show();
	} else if (state == "Y") {
		$(".reson").hide();
	} else if (state == "N") {
		$(".reson").hide();
	}
}


</script>
</body>
</html>