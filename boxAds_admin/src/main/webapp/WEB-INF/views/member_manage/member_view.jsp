<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:choose>
	<c:when test="${memberList[0].state eq 'Y' }">
		<c:set var="menuon" value="0"/>
	</c:when>
	<c:when test="${memberList[0].state eq 'H' }">
		<c:set var="menuon" value="1"/>
	</c:when>
	<c:when test="${memberList[0].state eq 'N' }">
		<c:set var="menuon" value="2"/>
	</c:when>
</c:choose>	
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_member_manage.jsp">
			<c:param name="menuOn" value="${menuon}" />
		</c:import>	
		
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>회원리스트</h3>
            </div>
            <div class="view">
			 <div class="fl type01">
			 <c:forEach items="${memberList}" var="memberList">
              <div class="table_wrap">
				<table class="detail mt20">
				
                    <caption>게시글 상세</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
					<tr>
                        <th scope="row">비밀번호</th>
                        <td colspan="3">
							*********** <button id="reset" type="button" class="btn">비밀번호 초기화</button>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">사업자 주소</th>
                        <td colspan="3">
                            <c:out value="${memberList.address}"/> <c:out value="${memberList.detail}"/>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">기업형태</th>
                        <td colspan="3">
                        <c:choose>
                        	<c:when test="${memberList.companyType eq 'P'}">
                        		개인
                        	</c:when>
                        	<c:when test="${memberList.companyType eq 'C'}">
                        		법인
                        	</c:when>
                        </c:choose>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">홈페이지</th>
                        <td colspan="3">
                            <c:out value="${memberList.siteUrl}"/>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">소개</th>
                        <td colspan="3">
                            <c:out value="${memberList.intro}"/>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">  수신여부</th>
                        <td colspan="3">
                            <input type="checkbox" id="mkting" name="mkting" <c:if test="${memberList.agree eq 'Y'}">checked="checked"</c:if>>
							<label for="mkting">수신</label>
						</td>
                    </tr>
					<tr>
                        <th scope="row">가입일자</th>
                        <td colspan="3">
                            <c:out value="${fn:substring(memberList.insertDate, 0, 10)}"/>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">최근방문일시</th>
                        <td colspan="3">
                            <c:out value="${memberList.loginDate}"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">사업자인증</th>
                        <td colspan="3">
                            <ul class="input_list">
                                <li><input type="radio" name="confirmFlag" value="Y" id="rdo01_01" <c:if test="${memberList.confirmFlag eq '인증'}">checked="checked"</c:if>><label for="rdo01_01">인증</label></li>
                                <li><input type="radio" name="confirmFlag" value="N" id="rdo01_02" <c:if test="${memberList.confirmFlag eq '미인증'}">checked="checked"</c:if>><label for="rdo01_02">미인증</label></li>
                            </ul>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">상태</th>
                        <td colspan="3">
                            <ul class="input_list" style="margin-bottom: 10px;">
                                <li><input type="radio" name="state" value="Y" id="rdo02_01" <c:if test="${memberList.state eq 'Y' or memberList.state eq 'H'}">checked="checked"</c:if>><label for="rdo02_01">정상</label></li>
                                <li><input type="radio" name="state" value="P"id="rdo02_02" <c:if test="${memberList.state eq 'P'}">checked="checked"</c:if>><label for="rdo02_02">일시정지</label></li>
                                <li><input type="radio" name="state" value="N" id="rdo02_03" <c:if test="${memberList.state eq 'N'}">checked="checked"</c:if>><label for="rdo02_03">탈퇴</label></li>
                            	<c:if test="${memberList.state eq 'H'}">
                            	<li><span>(휴면회원)</span></li>
	                            </c:if>
                            </ul>
                            <div id="text" style="display: none;">
                            	<input name="reason" type="text" style="width: 600px"/>
                            	<button id="save" type="button">입력</button>
                            	<input type="hidden" name="idx" value="${memberList.idx}"/>
                            </div>
                        </td>
                    </tr>
                    <c:if test="${memberList.state eq 'N'}">
					<tr id="hide">
                        <th scope="row">탈퇴사유</th>
                        <td colspan="3">
                        	<c:out value="${memberList.quitMsg} "/>
                        </td>
                    </tr>
                    </c:if>
                    </tbody>
                </table>
			</div>
			<c:if test="${fn:length(reasonList) ne 0}">
			<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>관리자 상태 사유 내역</h4>
						</div>
						<table class="detail mt20">
							<caption>관리자 상태 사유 내역</caption>
							<colgroup>
								<col style="width:80%;">
								<col style="*">
							</colgroup>
							<thead class="blind">
								<th scope="col">문제사유</th>
								<th scope="col">날짜</th>
							</thead>
							<tbody>
								<c:forEach items="${reasonList}" var="reasonList">
									<tr>
										<td>[
										<c:choose>
											<c:when test="${reasonList.state eq 'P'}">
												일시정지
											</c:when>
											<c:when test="${reasonList.state eq 'N'}">
												탈퇴
											</c:when>
										</c:choose>
										]
										${reasonList.content}</td>
										<td>${reasonList.insertDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</c:if>
			<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>캐시 내역 <span>보유 캐시 : <strong><fmt:formatNumber value="${myCash}" pattern="#,###" /></strong>원</span></h4>
				</div>
					<table class="detail mt20">
						<caption>게시글 상세</caption>
						<colgroup>
							<col style="width:8%;">
							<col style="width:10%;">
							<col style="width:10%;">
							<col style="*">
							<col style="width:10%;">
							<col style="*">
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>방식</th>
								<th>거래내역</th>
								<th>거래처</th>
								<th>일시</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(cashList) eq 0}">
                        			<tr><td style="text-align:center;" colspan="6">등록된 내역이 없습니다</td></tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach items="${cashList}" var="cashList">
									<tr>
										<td>${cashList.idx}</td>
										<td>${cashList.category}</td>
										<td>${cashList.type}</td>
										<td>${cashList.content}</td>
										<td>${cashList.type}</td>
										<td>${cashList.insertDate}</td>
									</tr>
									</c:forEach>
                        		</c:otherwise>
							</c:choose>		
							
						</tbody>
					</table>
					<div id="cash" class="pagination mt50">
                    	</div>
					<table class="detail mt20">
						<caption>게시글 상세</caption>
						<colgroup>
							<col style="*">
							<col style="width:10%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="*">
						</colgroup>
						<tbody>
							<tr>
								<th>쿠폰정보</th>
								<th>할인</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>사용일시</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(issueList) eq 0}">
                        			<tr><td style="text-align:center;" colspan="5">등록된 내역이 없습니다</td></tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach items="${issueList}" var="issueList">
									<tr>
										<td>
											<p>${issueList.title}</p>
											<p>${issueList.mesg}</p>
										</td>
										<td>${issueList.price}원</td>
										<td>${issueList.startDate}</td>
										<td>${issueList.endDate}</td>
										<td>${issueList.useDate}</td>
									</tr>
									</c:forEach>
                        		</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<div id="coupon" class="pagination mt50">
                    	</div>
				</div>
				</c:forEach>
              </div>
				<div class="fl type02">
				<c:forEach items="${memberList}" var="member">
					<div class="img_box">
						<div>
							<img src="${path}${member.profile}" style="width:150px;" onerror='this.src="http://placehold.it/95x85?text=sample"'>
						</div>
						<div>
							<p>${member.name}</p>
							<p class="txt_blue">${member.id}</p>
							<p>${member.phone}</p>
						</div>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>세금계산서 정보</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상호명</th>
									<td><c:out value="${member.name}"/></td>
								</tr>
								<tr>
									<th scope="row">사업자등록번호</th>
									<td><c:out value="${member.companyNumber}"/></td>
								</tr>
								<tr>
									<th scope="row">대표자</th>
									<td><c:out value="${member.companyName}"/></td>
								</tr>
								<tr>
									<th scope="row">사업장소재지</th>
									<td>${member.address} ${member.detail}</td>
								</tr>
								<tr>
									<th scope="row">업태</th>
									<td><c:out value="${member.business}"/></td>
								</tr>
								<tr>
									<th scope="row">사업자등록증</th>
									<td><a href="${path}/download?idx=${member.fIdx}" class="txt_blue">${member.companyFile}</a></td>
								</tr>
								<tr>
									<th scope="row">사업자 구분</th>
									<td><c:choose>
			                        	<c:when test="${member.companyType eq 'P'}">
			                        		개인
			                        	</c:when>
			                        	<c:when test="${member.companyType eq 'C'}">
			                        		법인
			                        	</c:when>
			                        </c:choose></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>은행정보</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">은행명</th>
									<td>${bank.bank}</td>
								</tr>
								<tr>
									<th scope="row">계좌번호</th>
									<td>${bank.acc_number}</td>
								</tr>
								<tr>
									<th scope="row">예금주</th>
									<td>${bank.depositor}</td>
								</tr>
								<tr>
									<th scope="row">통장사본</th>
									<td><a href="${path}/download?idx=${bank.fIdx}" class="txt_blue">${bank.real_name}</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>홍보담당자</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">홍보 담당자명</th>
									<td><c:out value="${member.proName}"/></td>
								</tr>
								<tr>
									<th scope="row">홍보 담당자 연락처</th>
									<td><c:out value="${member.proPhone}"/></td>
								</tr>
								<tr>
									<th scope="row">홍보물 수령주소</th>
									<td><c:out value="${member.proAddress}"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_area align_r mt20">
						<a href="activity_member.jsp" class="btn">목록</a>
					</div>
					</c:forEach>
				</div>
				<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>재 인증 내역</h4>
				</div>
					<table class="detail mt20">
						<caption>재 인증 내역</caption>
						<colgroup>
							<col style="width:30%;">
							<col style="*">
						</colgroup>
						<tbody>
							<c:forEach items="${confirmList}" var="confirmList">
							<tr>
								<th scope="row">상호명</th>
								<td>${confirmList.name}</td>
							</tr>
							<tr>
								<th scope="row">사업자주소</th>
								<td>${confirmList.address}</td>
							</tr>
							<tr>
								<th scope="row">사업자등록번호</th>
								<td>${confirmList.companyNumber}</td>
							</tr>
							<tr>
								<th scope="row">대표자명</th>
								<td>${confirmList.name}</td>
							</tr>
							<tr>
								<th scope="row">사업자등록증</th>
								<td><a href="${path}/download?idx=${confirmList.fIdx}" class="txt_blue">${confirmList.realName}</a></td>
							</tr>
							<tr>
								<th scope="row">변경일시</th>
								<td>${confirmList.insertDate}</td>
							</tr>
							</c:forEach>
						</tbody>
						
					</table>
				</div>

            </div><!-- view -->
        </div><!-- content -->
    </div>
    <form:form id="cashP">
    	<input type="hidden" name="cashP" value="${cashPvo.curPage}" />
    </form:form>
    <form:form id="coupouP">
    	<input type="hidden" name="coupouP" value="${couponPvo.curPage}" />
    </form:form>
</div>

</body>
<script>
	$("#gnb").find("li").eq(5).addClass("on");
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

		$("#cash").append(paging('${cashPvo.totalCnt}', '${cashPvo.curPage}', '${cashPvo.perPage}', 'cashP'));
		$("#coupon").append(paging('${couponPvo.totalCnt}', '${couponPvo.curPage}', '${couponPvo.perPage}', 'coupouP'));

		$("input[name=state]").click(function() {
			var state = $(this).val();

			if (state !== 'Y') {
				$("#text").show();
			} else {
				$("#text").hide();
			}

			
		});

		$("input[name=confirmFlag]").change(function() {
			var idx = ${param.idx};
			var confirmFlag = $("input[name=confirmFlag]:checked").val();

			$.post("${path}/member/confirm_change", {idx: idx, confirmFlag: confirmFlag}, function() {
				alert("인증상태가 변경되었습니다.");
				location.reload();
			});
		});

		$("input[name=state]").change(function() {
			var idx = ${param.idx};
			var state = $("input[name=state]:checked").val();

			if (state === "Y") {

				$.post("${path}/member/change", {idx: idx, state: state}, function() {
					alert("회원상태가 변경되었습니다.");
					location.reload();
				});
			}

			
		});

		$("#save").click(function() {
			var idx = ${param.idx};
			var content = $("input[name=reason]").val();
			var state = $("input[name=state]:checked").val();

			$.post("${path}/member/change", {idx: idx, content: content, state: state}, function() {
				alert("회원상태가 변경되었습니다.");
				location.reload();
			});
		});

		$("#reset").click(function() {
			var idx = ${param.idx};

			$.post("${path}/member/reset", {idx: idx}, function() {
				alert("재설정 메일이 발송되었습니다.");
			});
		});
	});
</script>
</html>
