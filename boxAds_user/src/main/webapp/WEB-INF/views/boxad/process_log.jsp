<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <%@ include file="../inc/header.jsp" %> --%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div class="ing_list_wrap">
	<h3 class="title">진행사항</h2>
		<ul>
		<c:forEach items="${logList}" var="log" varStatus="status">
			<c:set var="bool" value="${0 eq status.index}"/>
			<c:choose>
				<c:when test="${log.actionFlag eq 'Y' && bool}">
					<li class="act">
				</c:when>
				<c:otherwise>
					<li>
				</c:otherwise>
			</c:choose>
				<div class="desc_area">
					<p>
						${log.content}						
						<c:choose>
							<c:when test="${log.actionFlag eq 'Y' && log.action eq 'DV'}">
								<!-- <a href="#"> -->
									<span class="res">(${log.delivery} ${log.mesg})</span>
								<!-- </a> -->
							</c:when>
							<c:when test="${log.actionFlag eq 'Y' && log.action eq 'MV' || log.actionFlag eq 'Y' && log.action eq 'II1R' || log.actionFlag eq 'Y' && log.action eq 'II2R'}">													
								<span class="res">(사유: ${log.mesg})</span>
							</c:when>												
						</c:choose>
						
					</p>
					
					<c:if test="${log.actionFlag eq 'Y'}">
						
						<c:choose>
							<c:when test="${log.action eq 'II1' && bool || log.action eq 'II2' && bool || log.action eq 'II1R' && bool || log.action eq 'II2R' && bool}">
								<p class="txt">
									<c:choose>
										<c:when test="${log.action eq 'II1R' || log.action eq 'II2R'}">
											<%-- <span class="res">(${log.mesg})</span> --%>							
										</c:when>
										<c:otherwise>
											광고주의 홍보물을 택배상자에 동봉(부착) 후 포장 전 인증사진을 촬영해주세요. <br>등록 사진은 보정 없이 원본을 사용해주세요.	
										</c:otherwise>
									</c:choose>
								</p>
								
								<form id="file" enctype="multipart/form-data" method="post" action="file?idx=${order.idx}">
									<input type="hidden" value="${log.action eq 'II1' || log.action eq 'II1R' ? 'IV1' : 'IV2'}" name="type">
									<input type="hidden" value="${log.action eq 'II1' || log.action eq 'II1R' ? 'B14' : 'B19'}" name="logTypeArr">
									<input type="hidden" value="${log.action eq 'II1' || log.action eq 'II1R' ? 'B4' : 'B5'}" name="state">
								</form>

									<div class="img_input">
										<ul class="img_list file">
											<li id="img_save">
												<div class="imgbox">
													<input type="file" name="uploadFile" id="uploadFile">
													<label for="uploadFile"  class="file_img">
														이미지 업로드
													</label>
													<button type="button" style="display:none">삭제</button>
												</div>
												<div class="img_txt">
													이미지 등록
												</div>
											</li>
										</ul>
									</div>
							</c:when>
							<c:when test="${log.action eq 'IV1' || log.action eq 'IV2'}">
								<div class="img_list img_dps">
									<ul>
										<c:forTokens items="${log.url}" delims="," var="img">
											<li>
												<div class="imgbox" style="background-image:url(${path}${img})"></div>	
											</li>										
										</c:forTokens>										
									</ul>
								</div>										
							</c:when>							
							<c:when test="${log.action eq 'DI' && bool}">
								<div class="input_area rbtn">
									<input type="text" name="delivery" title="택배사" placeholder="택배사 입력 " class="d1"><input type="text" name="mesg" placeholder="운송장정보 입력" title="운송장정보"  class="d2"> 
									<c:choose>
										<c:when test="${!empty mkInfo.proAddress}">
											<button type="button" class="btn" onclick="validDelivery(this, '저장')" data-logType="B11">저장</button>										
										</c:when>
										<c:otherwise>
											<button type="button" class="btn" onclick="alert('홍보정보 없이 배송할 수 없습니다.')">저장</button>
										</c:otherwise>
									</c:choose>
								</div>	
								<div class="data_area">
									<dl>
										<dt>홍보 담당자명</dt>
										<dd>${mkInfo.proName}</dd>
									</dl>
									<dl>
										<dt>홍보 담당자 연락처 </dt>										
										<dd>
											<c:if test="${!empty mkInfo.proPhone}">
												<c:out value="${fn:substring(mkInfo.proPhone, 0, 3)}-${fn:substring(mkInfo.proPhone, 3, 7)}-${fn:substring(mkInfo.proPhone, 7, fn:length(mkInfo.proPhone))}"/>											
											</c:if>
										</dd>
									</dl>
									
									<dl>
										<dt>홍보물 수령주소 </dt>
										<dd>${mkInfo.proAddress} ${mkInfo.proDetail}</dd>
									</dl>
									<c:if test="${empty mkInfo.proAddress || empty mkInfo.proPhone}">
										<p class="btn_txt"><span>판매자 ${mkInfo.name}님에게 홍보정보 등록을 요청해주세요.</span> <button onclick="insertProcessLog(this, '요청')" data-logType="B10-1" class="btn btn_req">홍보정보 등록요청</button></p>									
									</c:if>
								</div>
							</c:when>
						</c:choose>
					</c:if>
					
				</div>
				<div class="act_tit">
				<c:choose>
					<c:when test="${log.actionFlag eq 'Y'}">
						<c:choose>
							<c:when test="${log.action eq 'CF' && log.type eq 'B2' && order.state eq 'B1'}">
								<button class="btn" type="button" value="B2" data-logType="B3" onclick="setDataForUpdate(this, '승인')">광고승인</button>
								<button class="btn btn_reject" type="button">광고거부</button>
							</c:when>
							<c:when test="${log.action eq 'CF' && log.type eq 'A2' && order.state eq 'A1'}">
								<button class="btn" type="button" value="A2" data-logType="A3,A4" onclick="setDataForUpdate(this, '승인')">신청승인</button>
							</c:when>	
							<c:when test="${log.action eq 'CF' && log.type eq 'B10-1' && bool}">
								<a href="../member/profile" class="btn">바로가기</a>												
							</c:when>								
							<c:when test="${log.action eq 'II1' && bool || log.action eq 'II1R' && bool || log.action eq 'II2' && bool || log.action eq 'II2R' && bool}">
								<button id="upload" class="btn" type="button" onclick="fileAndlog()">저장</button>
							</c:when>


							<c:when test="${log.action eq 'Q'}">
								<a href="${path}/board/qna_write?type=Q" class="btn" type="button">문의하기</a>
							</c:when>
							<%-- <c:when test="${log.action eq 'MV'}">													
								
							</c:when> --%>	
							<c:when test="${log.action eq 'BUY' || log.action eq 'DI'}">												
							</c:when>
							<c:otherwise>
								<span class="stdate">${log.insertDate}</span>												
							</c:otherwise>										
						</c:choose>									
					</c:when>
					<c:otherwise>
						<span class="stdate">${log.insertDate}</span>										
					</c:otherwise>
				</c:choose>
				</div>
			</li>
		</c:forEach>							
		</ul>
	</div>