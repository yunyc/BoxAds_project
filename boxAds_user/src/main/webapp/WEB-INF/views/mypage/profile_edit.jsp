<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<body>

	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="sub_wrap mypage_wrap profile_edit">
				<div class="inner">
					<form:form modelAttribute="memberVO" enctype="multipart/form-data">
					<input type="hidden" name="path" value="${path}"/>
					<input type="hidden" name="idx" value="${memberVO.idx}"/>
					<input type="hidden" name="id" value="${memberVO.id}"/>
					<input id="confirm" type="hidden" value="${memberVO.confirmFlag}"/>
					<div class="path">
						<ul>
							<li>홈</li>
							<li>계정관리</li>
						</ul>
					</div>
					<h2 class="title">계정관리</h2>
					<h3 class="top_tit">기본정보</h3>
					<div class="input_area_wrap">
						<dl>
							<dt>이메일
							</dt>
							<dd>
								<c:out value="${memberVO.id}"/>
							</dd>
						</dl>
						<dl>
							<dt>비밀번호 변경 
								
							</dt>
							<dd>
								<button type="button" onclick="location.href='${path}/login/reset'" class="btn">비밀번호 변경 </button>
							</dd>
						</dl>
						<dl>
							<dt>프로필 사진</dt>
							<dd>
								<div class="profile_img img_add">
									<div class="input_area">
										<input type="file" name="uploadImage" id="uploadImage" style="width:86px; height:86px;">
										<label for="uploadImage" class="file_txt">
											이미지 등록
										</label>
										<p class="tit">이미지 등록</p>
									</div>
									<div class="img_area">
									<c:forEach items="${imgList}" var="imgList">
											<div class="imgbox" id="del_img" style="background-image: url(${path}${imgList.url});">
												<button type="button">삭제</button>
											</div>
											<p class="tit"><c:out value="${imgList.realName}" /></p>
											<c:set var="img" value="${imgList.idx}"/>
									</c:forEach>
									<input id="img_idx" name="fileIdx" type="hidden" value="${! empty img ? img : 0}" />
									<input id="img_delete" name="deleteIdx" type="hidden" value="0" />
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>수신정보 동의 여부</dt>
							<dd>
								<span class="cbox">
								<input type="checkbox" name="agree" ${memberVO.agree eq 'Y' ? 'checked=""' : ''} value="Y" id="agree1">
								<label for="agree1">동의</label>
								</span>
							</dd>
						</dl>
					</div>
					<div class="bordered_m">
						<h3 class="top_tit">상세정보</h3>
						<div class="input_area_wrap add">
							<dl>
								<dt>업체명</dt>
								<dd>
									<div class="input_area rbtn">
										<input type="text" name="name" id="company_name"  required  title="업체명" value="${memberVO.name}">
									</div>
									<c:choose>
										<c:when test="${memberVO.confirmFlag eq 'Y'}">
											<span class="btn stat_box">사업자 인증완료</span>
										</c:when>
										<c:otherwise>
											<span class="btn stat_box">사업자 미인증</span>
										</c:otherwise>
									</c:choose>
									
								</dd>
							</dl>
							<dl>
								<dt>전화번호</dt>
								<dd>
									<div class="input_area">
										<input type="text" name="phone" id="tel_num"  required  title="전화번호" value="${memberVO.phone}" >
									</div>
									
								</dd>
							</dl>
							<dl>
								<dt>사업자 주소</dt>
								<dd>
									<div class="input_area">
										<input type="text" class="daumApi" name="address" id="company_addr01"  required  title="사업자 주소" value="${memberVO.address}">
									</div>
									<div class="input_area">
										<input type="text" name="detail" id="company_addr02"  title="사업자 상세주소" value="${memberVO.detail}">
									</div>
								</dd>
							</dl>
							<dl>
								<dt>사업자 번호</dt>
								<dd>
									<div class="input_area">
										<input type="text" name="companyNumber" id="biz_num"  required  title="사업자 번호" value="${memberVO.companyNumber}" >
									</div>
									
								</dd>
							</dl>
							<dl>
								<dt>사업자등록증</dt>
								<dd>
									<div class="upload_file rbtn" style="width: fit-content;">
										<c:forEach items="${busyList}" var="busyList">
									   <span>${busyList.realName}</span>
									   <button id="del_file" type="button">삭제</button>
									   <c:set var="idx" value="${busyList.idx}"/>
									   </c:forEach>
									   <input id="file_idx" name="fileIdx" type="hidden" value="${! empty idx ? idx : 0}" />
									   <input id="file_delete" name="deleteIdx" type="hidden" value="0" />
									</div>
									<input type="file" name="uploadFile" id="uploadFile" class="file_input">
									<label for="uploadFile">파일 찾기</label>
								</dd>
							</dl>
							<dl>
								<dt>기업형태<strong class="required">*</strong></dt>
								<dd>
									<span class="rdo"><input required type="radio" name="companyType" ${memberVO.companyType eq 'P' ? 'checked=""' : ''} value="P" id="biz_type01"><label for="biz_type01">개인</label></span>
									<span class="rdo"><input required type="radio" name="companyType" ${memberVO.companyType eq 'C' ? 'checked=""' : ''} value="C" id="biz_type02"><label for="biz_type02">법인</label></span>
								</dd>
							</dl>
							<dl>
								<dt>대표자명<strong class="required">*</strong></dt>
								<dd>
									<div class="input_area">
										<input type="text" name="companyName" id="biz_name"  placeholder="대표자명을 입력해주세요." required  title="대표자명" value="${memberVO.companyName}" >
									</div>
								</dd>
							</dl>
							<dl>
								<dt>업종/업태<strong class="required">*</strong></dt>
								<dd>
									<div class="input_area">
										<input type="text" name="sector" id="work_type01"  placeholder="업종을 입력해주세요." required  title="업종" value="${memberVO.sector}" >
									</div>
									<div class="input_area">
										<input type="text" name="business" id="work_type02"  placeholder="업태를 입력해주세요." required  title="업태" value="${memberVO.business}" >
									</div>
								</dd>
							</dl>
							<dl>
								<dt>홈페이지</dt>
								<dd>
									<div class="input_area">
										<input type="text" name="siteUrl" id="site_url" value="${memberVO.siteUrl}" required placeholder="https://, http://를 포함하여 입력해주세요."  title="상품 웹페이지 주소">
									</div>
								</dd>
							</dl>
							<dl>
								<dt>소개<strong class="required">*</strong></dt>
								<dd>
									<div class="input_area" style="width:100%;">
										<input type="text" name="intro" id="mypr" maxlength="100" value="${memberVO.intro}" required placeholder="간단한 업체 소개를 100자 이내로 입력해주세요." title="소개" >
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<h3 class="top_tit">홍보 담당자</h3>
					<div class="input_area_wrap add">
						<dl>
							<dt>홍보담당자명<strong class="required">*</strong></dt>
							<dd>
								<div class="input_area">
									<input type="text" name="proName" id="pr_name"  required  title="업체명" value="${memberVO.proName}">
								</div>
								<span class="cbox"><input type="checkbox" name="same_data" ${memberVO.name eq memberVO.proName ? 'checked=""' : ''} id="same_data">
								<label for="same_data">대표자와 동일</label></span>
							</dd>
						</dl>
						<dl>
							<dt>홍보 담당자 연락처<strong class="required">*</strong></dt>
							<dd>
								<div class="input_area">
									<input type="text" name="proPhone" id="biz_te"  required  title="홍보 담당자 연락처" value="${memberVO.proPhone}" >
								</div>
								
							</dd>
						</dl>
						<dl>
							<dt>홍보물 수령주소<strong class="required">*</strong></dt>
							<dd>
								<div class="input_area">
									<input type="text" name="proAddress" class="daumApi" id="company_addr03"  required  title="사업자 주소" value="${memberVO.proAddress}">
								</div>
								<div class="input_area">
									<input type="text" name="proDetail" id="company_addr04"  title="사업자 상세주소" value="${memberVO.proDetail}">
								</div>
								<span class="cbox"><input type="checkbox" name="same_addr" ${memberVO.detail eq memberVO.proDetail and 
																							memberVO.address eq memberVO.proAddress ? 'checked=""' : ''} id="same_addr">
								<label for="same_addr">사업장 주소와 동일 </label></span>
							</dd>
						</dl>
					</div>
					<div class="info_box">
						<ul>
							<li>박스애드는 택배 배송기반 광고를 중개하는 서비스입니다.</li>
							<li>홍보 담당자 정보는 박스애드 광고 중개 업무 처리 시 필요하기에 꼭 등록해주세요.</li>
						</ul>
					</div>
					<div class="btn_area">
						<button type="submit" class="btn btn_finish">저장</button>
						<button type="button" class="btn btn_quit" onclick="location.href='${path}/member/quit'" class="btn btn_white">탈퇴하기</button>
					</div>
					</form:form>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js?a=2"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    $(function() {
			$(".daumApi").click(function() {
				var id = $(this).attr("id");
				 new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var roadAddr = data.roadAddress; // 도로명 주소 변수
			                var extraRoadAddr = ''; // 참고 항목 변수
			
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraRoadAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }

			             	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraRoadAddr !== ''){
			                    extraRoadAddr = ' (' + extraRoadAddr + ')';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById(id).value = roadAddr + " " + extraRoadAddr;
			            }
			        }).open();
			});    
		});
	</script>
	<script>
			$(function() {
				var path = $("input[name=path]").val();
				var companyName = $("input[name=companyName]").val();
				var address = $("input[name=address]").val();
				var name = $("input[name=name]").val();
				var companyNumber = $("input[name=companyNumber]").val();
				var fileName = $(".upload_file span").text();
				
				$("#memberVO").submit(function() {
					var msg = '<spring:message code="member.profile.msg" javaScriptEscape="true"/>';

					if (!$("input[name=name]").val()) {
						alert('<spring:message code="member.profile.name" javaScriptEscape="true"/>');
						return false;						
					} else if ($(".upload_file > span").length == 0) {
						alert('<spring:message code="member.profile.companyFile" javaScriptEscape="true"/>');
						return false;						
					} else if (!$("input[name=companyType]").is(":checked")) {
						alert('<spring:message code="member.profile.companyType" javaScriptEscape="true"/>');
						return false;						
					} else if (!$("input[name=sector]").val()) {
						alert('<spring:message code="member.profile.sector" javaScriptEscape="true"/>');
						return false;						
					} else if (!$("input[name=business]").val()) {
						alert('<spring:message code="member.profile.business" javaScriptEscape="true"/>');
						return false;
					} else if (!$("input[name=siteUrl]").val()) {
						alert('<spring:message code="member.profile.siteUrl" javaScriptEscape="true"/>');
						return false;
					} else if ($("input[name=siteUrl]").val().indexOf(("http")) < 0) {
						alert('<spring:message code="member.profile.urlStartWith" javaScriptEscape="true"/>');
						return false;
					} else if (!$("input[name=intro]").val()) {
						alert('<spring:message code="member.profile.intro" javaScriptEscape="true"/>');
						return false;
					} else if (!$("input[name=proName]").val()) {
						alert('<spring:message code="member.profile.proName" javaScriptEscape="true"/>');
						return false;
					} else if (!$("input[name=proPhone]").val()) {
						alert('<spring:message code="member.profile.proPhone" javaScriptEscape="true"/>');
						return false;
					} else if (!$("input[name=proAddress]").val()) {
						alert('<spring:message code="member.profile.proAddress" javaScriptEscape="true"/>');
						return false;						
					} else {

							if (companyName === $("input[name=companyName]").val() &&
								address === $("input[name=address]").val() &&
								name === $("input[name=name]").val() &&
								companyNumber === $("input[name=companyNumber]").val() &&
								fileName === $(".upload_file span").text()) {
								
							} else {
				
								var confirm = window.confirm('<spring:message code="member.profile.submit" javaScriptEscape="true"/>');

								if (confirm) {
									$("#confirm").attr("name", "confirmFlag");

									
								} else {
									return false;
								}
							}
					}
						
					
				});

				// 사업자 등록증 등록
				$("#uploadFile").change(function() {
					var file = $("#uploadFile").get(0).files[0];
					
					if (file !== undefined) {
						$(".upload_file span, .upload_file button").remove();
						$(".upload_file").append('<span>' + file.name + '</span><button id="del_file" type="button">삭제</button>');
					}
					$("#file_idx").val(0);
				});

				// 사업자 등록증 삭제
				$(document).on("click", "#del_file", function() {
					$(".upload_file span, .upload_file button").remove();
					$("#uploadFile").val("");
					$("#file_delete").val($("#file_idx").val());

				});

				// 이미지 삭제
				$(document).on("click", "#del_img", function() {

					$(".imgbox, .img_area .tit").remove();
					$("#uploadImage").val("");
					$("#img_delete").val($("#img_idx").val());
				});

				// 이미지 등록
				$("#uploadImage").change(function() {
					var file = $("#uploadImage").get(0).files[0];
					var ext = file.name.split('.').pop().toLowerCase();
					var imgExt = ['jpg', 'jpeg', 'bmp', 'gif'];

					if (file !== undefined && $.inArray(ext, imgExt) != -1) {
						$(".imgbox, .img_area .tit").remove();
						$(".profile_img > .img_area").append('<div class="imgbox" id="del_img" style=""><button type="button">삭제</button></div>' + 
											  '<p class="tit">' + file.name + '</p>');

						readURL(this, ".imgbox");
					}

					if ($(".img_area .imgbox").length == 0) {
						$("#img_idx").val(0);
					}
					
					
			    });

				
			    $("#same_data").click(function() {

					if ($("#same_data").is(":checked")) {
						var name = $("input[name=companyName]").val();
						$("input[name=proName]").val(name);
					}
				}); 

			    
			    $("#same_addr").click(function() {

					if ($("#same_addr").is(":checked")) {
						var address = $("input[name=address]").val();
						var detail = $("input[name=detail]").val();
						$("input[name=proAddress]").val(address);
						$("input[name=proDetail]").val(detail);
					}
				}); 

			});		
		</script>
</body>
</html>