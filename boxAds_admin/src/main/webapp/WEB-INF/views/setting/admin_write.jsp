<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_setting.jsp">
			<c:param name="menuOn" value="0" />
		</c:import>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>운영자관리</h3>
				</div>
				<div class="list">
					<div class="table_wrap view">
						<table class="detail mt20">
							<caption>카테고리</caption>
							<colgroup>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
							<form:form modelAttribute="avo" action="${path}/setting/admin_insert" >
								<input type="hidden" name="idx" value="${admin.idx}"/>
								<tr>
									<th scope="row">성명 <span class="txt_red">*</span> </th>
									<td>
										<input type="text" id="us_name" name="name" value="${admin.name}">
										<label for="us_name" class="blind">성명</label>
									</td>
								</tr>
								<tr>
									<th scope="row">아이디 <span class="txt_red">*</span> </th>
									<td>
										<input type="text" id="us_id" name="id" value="${admin.id}">
										<label for="us_id" class="blind">아이디</label>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <span class="txt_red">*</span> </th>
									<td>
										<input type="password" id="us_ps" name="pw" value="${admin.pw}">
										<label for="us_ps" class="blind">비밀번호</label>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일 <span class="txt_red">*</span> </th>
									<td>
										<input type="email" id="us_mal" name="email" value="${admin.email}">
										<label for="us_mal" class="blind">이메일</label>
									</td>
								</tr>
								<tr>
									<th scope="row">전화번호 <span class="txt_red">*</span> </th>
									<td>
										<input type="number" id="us_num" name="phone" value="${admin.phone}">
										<label for="us_num" class="blind">전화번호</label>
									</td>
								</tr>
								<tr>
									<th scope="row">소속</th>
									<td>
										<label for="belong" class="blind">소속</label>
										<select name="dpmt" id="belong">
											<option value="">소속부서명 선택</option>
											<option value="박스애드 운영팀">박스애드 운영팀</option>
											<option value="박스애드 개발팀">박스애드 개발팀</option>
											<option value="인쇄-이지펍">인쇄-이지펍</option>
											<option value="인쇄-TDB1">인쇄-TDB1</option>
											<option value="디자인-TDB2">디자인-TDB2</option>
											<option value="디자인-TDB3">디자인-TDB3</option>
											<option value="쇼핑몰-TDB4">쇼핑몰-TDB4</option>
											<option value="쇼핑몰-TDB5">쇼핑몰-TDB5</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">그룹</th>
									<td>
										<label for="group" class="blind">그룹</label>
										<select name="grp" id="group">
											<option value="">권한그룹명 선택</option>
											<option value="슈퍼관리자">슈퍼관리자</option>
											<option value="운영자-총괄">운영자-총괄</option>
											<option value="운영자-기획/MD">운영자-기획/MD</option>
											<option value="운영자-상품검수">운영자-상품검수</option>
											<option value="운영자-결제정산">운영자-결제정산</option>
											<option value="운영자-CS">운영자-CS</option>
											<option value="제휴-인쇄">제휴-인쇄</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">상태 <span class="txt_red">*</span></th>
									<td>
										<input type="radio" id="normal" name="useFlag" value="Y" <c:if test="${admin.useFlag eq 'Y'}">checked="checked"</c:if>>
										<label for="normal">정상</label>
										<input type="radio" id="stop" name="useFlag" value="N" <c:if test="${admin.useFlag eq 'N'}">checked="checked"</c:if>>
										<label for="stop">정지</label>
									</td>
								</tr>
								<tr>
									<th scope="row">권한</th>
									<td>									
										<input type="checkbox" id="chkAll" onchange="checkAll()">
										<label for="chkAll">전체</label>
										<input type="checkbox" id="prd_mgmt" name="pdt" value="Y" <c:if test="${admin.pdt eq 'Y'}">checked="checked"</c:if>>
										<label for="prd_mgmt">상품관리</label>
										<input type="checkbox" id="ord_mgmt" name="odr" value="Y" <c:if test="${admin.odr eq 'Y'}">checked="checked"</c:if>>
										<label for="ord_mgmt">주문관리</label>
										<input type="checkbox" id="culc_mgmt" name="cal" value="Y" <c:if test="${admin.cal eq 'Y'}">checked="checked"</c:if>>
										<label for="culc_mgmt">정산관리</label>
										<input type="checkbox" id="mrst_mgmt" name="etc" value="Y" <c:if test="${admin.etc eq 'Y'}">checked="checked"</c:if>>
										<label for="mrst_mgmt">부가기능 관리</label>
										<input type="checkbox" id="mem_mgmt" name="member" value="Y" <c:if test="${admin.member eq 'Y'}">checked="checked"</c:if>>
										<label for="mem_mgmt">회원관리</label>
										<input type="checkbox" id="site_mgmt" name="site" value="Y" <c:if test="${admin.site eq 'Y'}">checked="checked"</c:if>>
										<label for="site_mgmt">사이트관리</label>
										<input type="checkbox" id="stt" name="setting" value="Y" <c:if test="${admin.setting eq 'Y'}">checked="checked"</c:if>>
										<label for="stt">설정</label>
										<input type="checkbox" id="hf" name="stat" value="Y" <c:if test="${admin.stat eq 'Y'}">checked="checked"</c:if>>
										<label for="hf">통계</label>
										<input type="checkbox" id="cpy_mgmt" name="print" value="Y" <c:if test="${admin.print eq 'Y'}">checked="checked"</c:if>>
										<label for="cpy_mgmt">인쇄관리</label>
									</td>
								</tr>
								<c:if test="${!empty admin}">
									<tr>
										<th scope="row">가입일자</th>
										<td>${admin.insertDate}</td>
									</tr>
									<tr>
										<th scope="row">최근 방문일시</th>
										<td>${admin.loginDate}</td>
									</tr>								
								</c:if>
								</form:form>
							</tbody>
						</table>						
					</div>
					<div class="btn_area align_c">
						<a href="${path}/setting/admin_list" class="btn">목록</a>
						<button class="btn" type="button" onclick="validAdmin()">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$('#gnb ul li').eq(7).addClass('on');
	
	const dpmt = '${admin.dpmt}';
	const grp = '${admin.grp}';
	
	$("select option").each(function(){
		if($(this).val() == dpmt || $(this).val() == grp){
			$(this).attr("selected", true);
		}
	})

	$(":password[name='pw']").on("keyup", function(){
		pwChk = true;
	});
})

var chk = true;
var pwChk = false;
function validAdmin() {
	
	if ($("input[name=name]").val() === '') {
		alert("성명을 입력해주세요");
		
	} else if ($("input[name=id]").val() === '') {
		alert("아이디를 입력해주세요");

	} else if (!chk) {
		alert("아이디가 중복됩니다.");
		
	} else if ($("input[name=pw]").val() === '') {
		alert("비밀번호를 입력해주세요");
		
	} else if ($("input[name=email]").val() === '') {
		alert("이메일을 입력해주세요");
		
	} else if ($("input[name=phone]").val() === '') {
		alert("전화번호를 입력해주세요");
		
	} else if ($("input[name=useFlag]").is(":checked") === false) {
		alert("상태를 선택해주세요");
	} else {
		if(!pwChk){
			$(":password[name='pw']").attr("disabled", true);
		}
		$("#avo").submit();
	}	
}

</script>
</body>
</html>
