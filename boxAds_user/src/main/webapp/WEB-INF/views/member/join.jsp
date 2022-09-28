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
			<div class="member_wrap">
				<h2 class="member_tit">이메일 회원가입</h2>
				<div class="join_wrap">
					<form:form modelAttribute="memberVO" enctype="multipart/form-data">
						<fieldset>
							<legend>회원가입</legend>
							<div class="join_con01">
								<div class="input_wrap">
									<div class="input_area">
										<input type="text" name="name" id="join_co01"  
										onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
										required />
										<label for="join_co01">
											업체명 <strong class="required">*</strong> <span>(사업자등록증과 동일한 업체명을 입력해주세요)</span>
										</label>
									</div>
									<div class="input_area">
										<input type="email" name="id" id="join_co02"  
										onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
										required />
										<label for="join_co02">
											이메일 <strong class="required">*</strong>
										</label>
									</div>
									<div class="input_area">
										<input type="password" name="pw" id="join_co03" 
										onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
										required />
										<label for="join_co03">
											비밀번호 <strong class="required">*</strong> <span>(영문, 숫자 특수문자포함 8-12자)</span>
										</label>
									</div>
									<div class="input_area">
										<input type="password" name="pwConfirm" id="join_co04" 
										onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
										required />
										<label for="join_co04">
											비밀번호 확인 <strong class="required">*</strong>
										</label>
									</div>
									<div class="sub_wrap">
										<div class="input_area">
											<input type="tel" name="phone" id="join_co05" pattern="\d*"
											onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
											required />
											<label for="join_co05">
												전화번호 <strong class="required">*</strong>
											</label>
										</div>
										<div class="input_area">
											<input type="text" id="address" name="address" id="join_co06" 
											onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
											onfocus="daumApi()"
											required />
											<label for="join_co06">
												주소 <strong class="required">*</strong>
											</label>
										</div>
										<div class="input_area">
											<input type="text" id="detail" name="detail" id="join_co06" 
											onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
											 />
											<label for="join_co06">
												상세 주소
											</label>
										</div>
										<div class="input_area">
											<input type="tel" name="companyNumber" id="join_co07" pattern="\d*"
											onchange="this.className = this.value ? this.className + 'not-empty' : this.className.replace(/\bnot-empty\b/, '')" 
											required />
											<label for="join_co07">
												사업자번호 <strong class="required">*</strong> <span>(-빼고 입력)</span>
											</label>
										</div>
										<div class="input_area">
											<div class="upload_file rbtn">
												<label>
												사업자등록증 <strong class="required">*</strong>
												</label>
											</div>
											<input type="file" name="companyFile" id="companyFile" class="file_input">
											<label for="companyFile">파일 찾기</label>
										</div>
									</div>
								</div>
							</div>
							<div class="join_con02">
								<div class="select_box">
									<div class="chk_tit">
										<div class="chk_area">
											<input type="checkbox" name="terms_all" id="terms_all">
											<label for="terms_all" class="chk">
												<i class="ico_chk"></i>
												전체동의
											</label>
										</div>
									</div>
									<div class="chk_content">
										<div class="chk_area">
											<input type="checkbox" name="terms01_1" id="terms01_1">
											<label for="terms01_1" class="chk">
												<i class="ico_chk"></i>
												서비스 이용약관동의(필수)
											</label>
											<a href="${path}/board/terms?type=S" target="_blank" class="btn btn_pop">내용보기</a>
										</div>
										<div class="chk_area">
											<input type="checkbox" name="terms01_2" id="terms01_2">
											<label for="terms01_2" class="chk">
												<i class="ico_chk"></i>
												개인정보 취급방침(필수)
											</label>
											<a href="${path}/board/terms?type=P" target="_blank" class="btn btn_pop">내용보기</a>
										</div>
										<div class="chk_area">
											<input type="checkbox" name="agree" id="terms01_3" value="Y">
											<label for="terms01_3" class="chk">
												<i class="ico_chk"></i>
												마케팅정보 이메일, SMS 수신 동의(선택)
											</label>
											<%-- <a href="${path}/board/marketing" target="_blank" class="btn btn_pop">내용보기</a> --%>
										</div>
									</div>
								</div>
								<button id="join" type="submit" class="btn btn_join">회원가입</button>
							</div>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function daumApi() {
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
	                document.getElementById('address').value = roadAddr + " " + extraRoadAddr;
	            }
	        }).open();

	        $("input[name=detail]").focus();
	    }
	</script>
	<script>
		$(function() {
			 $("#terms_all").click(function() {
				 
				if($("#terms_all").is(":checked")){
				  $("input:checkbox").prop("checked",true);

				} else {
				  $("input:checkbox").prop("checked",false);
				}
			 });

			 $("input[name=companyFile]").change(function() {
				var file = $("input[name=companyFile]").get(0).files[0];
				var name = file.name;
				
				if (name.length > 20) {
					name = name.substring(0, 20) + '...';
				}
				var element = '<span>' + name + '</span><button id="delete" type="button">삭제</button>';

				if (file !== undefined) {
					$(".upload_file *").remove();
					$(".upload_file").append(element);
				}
			 });

			 $(document).on("click", "#delete", function() {
				 var element = '<label>사업자등록증 <strong class="required">*</strong></label>';
				 $("input[name=companyFile]").val("");
				 $(".upload_file *").remove();
				 $(".upload_file").append(element);
			 });

			 $("#memberVO").submit(function() {


				 if(!$("input[name=name]").val()) {
						alert('<spring:message code="login.join.name" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=id]").val()) {
						alert('<spring:message code="login.join.id" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=pw]").val()) {
						alert('<spring:message code="login.join.pw" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=pwConfirm]").val()) {
						alert('<spring:message code="login.join.pwConfirm" javaScriptEscape="true"/>');
						return false;

					} else if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,12}$/.test($("input[name=pw]").val())) {
						alert('<spring:message code="login.join.pattern" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=phone]").val()) {
						alert('<spring:message code="login.join.phone" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=companyNumber]").val()) {
						alert('<spring:message code="login.join.companyNumber" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=companyFile]").val()) {
						alert('<spring:message code="login.join.companyFile" javaScriptEscape="true"/>');
						return false;

					} else if (!$("input[name=address]").val()) {
						alert('<spring:message code="login.join.address" javaScriptEscape="true"/>');
						return false;

					} else if (!$("#terms01_1").is(":checked")) {
						alert('<spring:message code="login.join.service" javaScriptEscape="true"/>');
						return false;

					} else if (!$("#terms01_2").is(":checked")) {
						alert('<spring:message code="login.join.term" javaScriptEscape="true"/>');
						return false;

					} else if ($("input[name=pw]").val() !== $("input[name=pwConfirm]").val()) {
						alert('<spring:message code="login.join.equal" javaScriptEscape="true"/>');
						return false;

					} else {
						ajaxSubmit("${path}", '<spring:message code="login.join.submit" javaScriptEscape="true"/>');
						
					}
			 });
		});

		
	</script>
</body>
</html>