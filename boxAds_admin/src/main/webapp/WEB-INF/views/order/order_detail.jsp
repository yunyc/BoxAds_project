<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:choose>
	<c:when test="${param.state eq 'A'}">
		<c:set var="val" value="1" />
		<c:set var="title" value="애드 신청" />
	</c:when>
	<c:otherwise>
		<c:set var="val" value="0" />
		<c:set var="title" value="박스 판매" />
	</c:otherwise>
</c:choose>

<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<c:import url="../inc/left_order.jsp">
			<c:param name="menuOn" value="${val}" />
		</c:import>	
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>${title}</h3>
            </div>
      <div class="view">
		<div class="fl type01">
		<c:choose>
			<c:when test="${param.state eq 'B'}">
				<div class="table_wrap">
			  	<div class="tit02 mt20">
					<h4>주문 정보</h4>
				</div>
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
							<th scope="row">결제번호</th>
							<td colspan="3">
								${order.orderCode}
							</td>
						</tr>
						<tr>
							<th scope="row">결제일자</th>
							<td colspan="3">
								${order.insertDate}
							</td>
						</tr>
						<tr>
							<th scope="row">광고상태</th>
							<td colspan="3">
								${order.oState}
							</td>
						</tr>
						<tr>
							<th scope="row">인쇄상태</th>
							<td colspan="3">
								배송처리
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								${order.proType}
							</td>
						</tr>
						<tr>
							<th scope="row">판매 월</th>
							<td colspan="3">
								${order.sellDate}
							</td>
						</tr>
						<tr>
							<th scope="row">박스 수(인쇄수량)</th>
							<td colspan="3">
								${order.boxCnt}개
							</td>
						</tr>
						<tr>
							<th scope="row">광고비</th>
							<td colspan="3">
								${order.adPrice}원 (10원/개당)
							</td>
						</tr>
						<tr>
							<th scope="row">인쇄비</th>
							<td colspan="3">
								${order.printPrice}원
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰</th>
							<td colspan="3">
								${order.cpPrice}원<c:if test="${!empty order.cpTitle}">, ${order.cpTitle}</c:if>
							</td>
						</tr>
						<tr>
							<th scope="row">총 결제금액</th>
							<td colspan="3">
								${order.totalPrice}원
							</td>
						</tr>
					</tbody>
                </table>
			</div>
			</c:when>
			<c:when test="${param.state eq 'A'}">
				<div class="table_wrap">
			  	<div class="tit02 mt20">
					<h4>신청정보</h4>
				</div>
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
							<th scope="row">신청번호</th>
							<td colspan="3">
								${order.orderCode}
							</td>
						</tr>
						<tr>
							<th scope="row">신청일자</th>
							<td colspan="3">
								${order.insertDate}
							</td>
						</tr>
						<tr>
							<th scope="row">신청상태</th>
							<td colspan="3">
								${order.oState}
							</td>
						</tr>
					</tbody>
                </table>
			</div>
			</c:when>
		</c:choose>
			<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>박스정보</h4>
				</div>
				<table class="detail mt20">
                    <caption>박스정보</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row">상품코드</th>
							<td colspan="3">
								${order.boxCode}
							</td>
						</tr>
						<tr>
							<th scope="row">박스 명</th>
							<td colspan="3">
								${order.bTitle}
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td colspan="3">
								${order.cType}
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								${order.proType}
							</td>
						</tr>
						<tr>
							<th scope="row">판매자명</th>
							<td colspan="3">
								${order.bName}
							</td>
						</tr>
						<tr>
							<th scope="row">판매 상태</th>
							<td colspan="3">
								<c:choose>
									<c:when test="${order.bState eq 'N'}">
										판매대기
									</c:when>
									<c:when test="${order.bState eq 'Y'}">
										판매중
									</c:when>
									<c:when test="${order.bState eq 'P'}">
										일시중지
									</c:when>
									<c:when test="${order.bState eq 'E'}">
										판매종료
									</c:when>
								</c:choose>
								
							</td>
						</tr>
					</tbody>
                </table>
			</div>
			<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>애드정보</h4>
				</div>
				<table class="detail mt20">
                    <caption>박스정보</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row">상품코드</th>
							<td colspan="3">
								${order.adCode}
							</td>
						</tr>
						<tr>
							<th scope="row">애드 명</th>
							<td colspan="3">
								${order.aTitle}
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td colspan="3">
								${order.cNames}								
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								${order.aProType}
							</td>
						</tr>
						<tr>
							<th scope="row">홍보웹페이지</th>
							<td colspan="3">
								<a href="${order.url}" target="_blank">${order.url}</a>
							</td>
						</tr>
						<tr>
							<th scope="row">광고주명</th>
							<td colspan="3">
								${order.aName}
							</td>
						</tr>
						<tr>
							<th scope="row">광고기간</th>
							<td colspan="3">
								${order.adStartDate} ~ ${order.adEndDate}
							</td>
						</tr>
						<tr>
							<th scope="row">광고 상태</th>
							<td colspan="3">
								${order.aState}
							</td>
						</tr>
					</tbody>
                </table>
			</div>
				<c:if test="${param.state eq 'B'}">
				<div class="tit02 mt20">
						<h4>거래관리 메모</h4>
				</div>
				<div class="mt20">
					<input type="text" id="sel_mgm" name="memo" style="width:85%;height:25px;">
					<label for="sel_mgm" class="blind">거래관리메모</label>
					<button id="memo" class="btn" type="button">저장</button>
					<table class="detail">
							<caption>변경내역,등록일</caption>
							<colgroup>
								<col style="width:60%;">
								<col style="*">
							</colgroup>
							<tbody>
								<c:forEach items="${memoList}" var="memoList">
										<tr>
											<td>${memoList.content}</td>
											<td>${memoList.insertDate}</td>
										</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
				</c:if>
				<div class="tit02 mt20">
							<h4>상세소개</h4>
						</div>
						<textarea name="sel_txtarea" id="sel_txtarea" style="width:100%" rows="10" class="mt20"><c:out value="${order.content}" escapeXml="false"/></textarea>
						<label for="sel_txtarea" class="blind">상세소개</label>
        		</div>
				<div class="fl type02">
					<div class="tit02 mt20"> 
						<h4>애드 관련 이미지 <span><a href="${path}/download?parent=${order.aIdx}&type=QR" class="txt_blue">QR 다운로드</a>
						<a id="down" href="javascript:fileDown(0)" class="txt_blue ml15">이미지 다운로드</a></span></h4>
					</div>
					<div class="img_box mt20">
						<div class="img_l">
						<form></form>
							<c:forEach items="${fileList}" var="fileList">
							<div>
								<img src="${path}${fileList.url}" style="width:95px; height:85px;">
								<p></p>
								<c:if test="${fileList.type eq 'A'}">
								<span>앞면이미지</span>
								</c:if>
							</div>
							<input type="hidden" name="fileIdx" value="${fileList.idx}"/>
							</c:forEach>
								
						</div>
						<div class="img_r">
							<div>
								<img src="${path}${order.qrcode}" alt="QR코드" class="fl_r" style="width:95px; height:85px;">
							</div>
						</div>
					</div>
					<div class="mt20" style="font-size: 18px;">
						<span class="txt_blue">단축URL : </span><a href="/common/qrcode?idx=${order.qIdx}" target="_blank">/common/qrcode?idx=${order.qIdx}</a>
					</div>
					<c:if test="${param.state eq 'A'}">
					<div class="tit02 mt20">
							<h4>거래관리 메모</h4>
					</div>
					<div class="mt20">
						<input type="text" id="sel_mgm" name="memo" style="width:85%;height:25px;">
						<label for="sel_mgm" class="blind">거래관리메모</label>
						<button id="memo" class="btn" type="button">저장</button>
						<table class="detail">
								<caption>변경내역,등록일</caption>
								<colgroup>
									<col style="width:60%;">
									<col style="*">
								</colgroup>
								<tbody>
									<c:forEach items="${memoList}" var="memoList">
										<tr>
											<td>${memoList.content}</td>
											<td>${memoList.insertDate}</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
					</div>
					</c:if>
					<c:if test="${param.state eq 'B'}">
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>광고 인증</h4>
						</div>
						<table class="detail mt20">
							<caption>광고 인증</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">1차 광고인증</th>
									<td>
										<form action="file?idx=${order.idx}&path=process" method="post" enctype="multipart/form-data" onsubmit="return imgValid()">
											<input type="hidden" name="logTypeArr" value="B14"/>
											<input type="hidden" name="state" value="B4"/>
											
											<input multiple="multiple" type="file" id="one" name="uploadFile" class="blind">
											<label for="one" class="btn">사진등록</label>
											<c:if test="${!empty firstList}">
												<button type="button" class="btn" onclick="setDataForInsert(this, '승인')" value="B3" data-logType="B15-1">인증 승인</button>
												<button type="button" class="btn ml15 false">인증반려</button>
 											</c:if>
										<div class="pic84 mt20 one" >
											<c:forEach items="${firstList}" var="firstList">
												<img src="${path}${firstList.url}" alt="1차광고 이미지" style="width:95px; height:85px;"/>
											</c:forEach>
												<button id="first" class="btn ml15" type="submit" style="display: none;">저장</button>
										</div>
										</form>
									</td>
								</tr>
								<tr>
									<th scope="row">2차 광고 인증</th>
									<td>
										<form action="file?idx=${order.idx}&path=process" method="post" enctype="multipart/form-data" onsubmit="return imgValid()">
											<input type="hidden" name="logTypeArr" value="B19"/>											
											<input type="hidden" name="state" value="B5"/>
											
											<input multiple="multiple" type="file" id="two" name="uploadFile" class="blind">
											<label for="two" class="btn">사진등록</label>
											<c:if test="${!empty secondList}">
												<button type="button" class="btn" onclick="setDataForInsert(this, '승인')" value="B4" data-logType="B20-1">인증 승인</button>
												<button type="button" class="btn ml15 false">인증반려</button>
											</c:if>
										<div class="pic84 mt20 two" >
											<c:forEach items="${secondList}" var="secondList">
												<img src="${path}${secondList.url}" alt="2차광고 이미지" style="width:95px; height:85px;"/>
											</c:forEach>
												<button id="second" class="btn ml15" type="submit" style="display: none;">저장</button>
										</div>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>인증반려</h4>
						</div>
						<table class="detail mt20">
							<caption>인증 반려</caption>
							<colgroup>
								<col style="width:80%;">
								<col style="*">
							</colgroup>
							<thead class="blind">
								<th scope="col">문제사유</th>
								<th scope="col">날짜</th>
							</thead>
							<tbody>
								<tr id="confirmFalse" style="display: none;">
									<td colspan="2">
										<input type="text" id="falseContent" name="mesg" placeholder="사유입력" style="width:80%">
										<label for="con_f" class="blind">사유입력</label>
										<button onclick="setDataForUpdate(this, '저장')" 
											<c:choose>
												<c:when test="${order.state eq 'B4'}">value="B3" data-logType="B15-2" </c:when>
												<c:when test="${order.state eq 'B5'}">value="B4" data-logType="B20-2" </c:when>
											</c:choose> 										
										type="button" class="btn">저장</button>
									</td>
								</tr>
								<c:forEach items="${reasonList}" var="reason">
									<tr>
										<td>[${reason.state}]${reason.content}</td>
										<td>${reason.insertDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>		
					
					
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>인쇄 관리</h4>
						</div>
						<table class="detail mt20">
							<caption></caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
						<form action="file?idx=${order.idx}&path=print" method="post" enctype="multipart/form-data" id="printFrm">
							<tbody>
								<tr>
									<th scope="row">상태변경</th>
									<td>										
										<select id="state">											
											<option value="B4">신규발주</option>
											<option value="B5">디자인검수</option>
											<option value="B6">디자인수정</option>
											<option value="B7">홍보물 제작중</option>
											<option value="B8">홍보물 제작완료</option>
											<option value="B9">배송처리</option>
										</select>
																				
										<button class="btn" type="button" id="savBtn" onclick="setDataForInsert(this, '저장')">저장</button>
									</td>									
								</tr>
								<tr>
									<td colspan="2" id="B6" style="display: none" class="fileSpace">
										<input type="text" id="file_name1" name="file_name">
										<input type="file" id="file_up01" name="uploadFile" class="blind">
										<label for="file_up01" class="btn">파일찾기</label>
									</td>
								</tr>
								<tr>
									<td colspan="2" id="B9_B11" style="display: none" class="fileSpace">
									<div>
										<input type="text" name="delivery" placeholder="택배사">
										<input type="text" id="del_info" name="mesg" placeholder="운송장정보 입력">
									</div>
									<div>
										<input type="text" id="file_name2" name="file_name">
										<input type="file" id="file_up02" name="uploadFile" class="blind">
										<label for="file_up02" class="btn fileLabel">파일찾기</label>
									</div>
									</td>
								</tr>
							</tbody>
						</form>
							
						</table>
						<table class="detail">
							<caption>변경내역, 등록일</caption>
							<colgroup>
								<col style="width:60%;">
								<col style="*">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">변경내역</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty logList}">
										<tr>
											<td>변경이력이 없습니다</td>
											<td></td>
										</tr>																			
									</c:when>
									<c:otherwise>
										<c:forEach items="${logList}" var="vo" varStatus="status">											
											<tr>
												<td>
													<p>${vo.content}</p>
													<c:choose>
														<c:when test="${vo.state eq 'B6' && !empty vo.url}">
															<p>-첨부파일 : <a href="#" class="txt_blue" download>${vo.realName}</a></p>														
														</c:when>
														<c:when test="${vo.state eq 'B9' && !empty vo.url || vo.state eq 'B11' && !empty vo.url}">
															<p>-배송정보: ${vo.delivery} (${vo.mesg})</p>
															<p>거래명세서 : <a href="#" class="txt_blue" download>${vo.realName}</a></p>
														</c:when>
													</c:choose>													
												</td>
												<td>${vo.insertDate}</td>
											</tr>											
										</c:forEach>
									</c:otherwise>
								</c:choose>																
							</tbody>
						</table>
						

					</div>
					
								
					</c:if>
					<div class="btn_area align_r mt20">
						<a class="btn" href="${path}/order/popup?type=${param.state}&oIdx=${param.idx}" onclick="return popup_layer(this);">진행내역보기</a>
						<a href="#" class="btn" target="_blank">채팅문의 내역</a>
						<a href="${path}/order/list?state=B" class="btn">목록</a>
					</div>
		</div>
				

            </div><!-- view -->
        </div><!-- content -->
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${path}/js/util.js"></script>
<script type="text/javascript" src="${path}/js/log.js"></script>
<script>
	$("#gnb").find("li").eq(2).addClass("on");
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
		var state;

		// 인쇄관리
		$(document).on("change", ".fileSpace input[name='uploadFile']", function() {
			let index = $(".fileSpace :file[name='uploadFile']").index(this);	
			let file = $(this).get(0).files[0];
			if (file !== undefined) { $(":text[name='file_name']").eq(index).val(file.name) }	        	
        });

		// 거래 메모 등록
		$("#memo").click(function() {
			var content = $("input[name=memo]").val();

			$.post("${path}/order/memo", {oIdx: oIdx, content: content}, function() {
				alert("등록되었습니다");
			});
		});

		// 반려 사유 입력칸 노출
		$(".false").click(function() {
			$("#confirmFalse").show();
		});

		// 파일 등록
		$("input[name=uploadFile]").change(function() {
			var files = this.files;
			var id = $(this).attr("id");
			var img = '<img src="http://placehold.it/95x85?text=sample" alt="1차광고 이미지02" style="width:95px; height:85px;"/>';
			
			for (var i = 0; i < files.length; i++) {
				$("." + id).show();
				$("." + id).prepend(img);					
			}

			readFile(this, "." + id + " img:eq(0)", 0);
			//readFile(this, "." + id + " img:eq(1)", 1);
			
			if(id == "one"){
				$("#first").show();
			} else if(id == "two"){
				$("#second").show();
			} else {
				$("#first").hide();
				$("#second").hide();				
			}
		});

		$("#state").on("change", function(){
			$(".fileSpace").hide();
			
			let type =  $(this).val();			
			$("#savBtn").attr("data-logType", type);
			
			if(type == "B6" || type == "B9"){		
						
				switch(type){
					case 'B6':
						$("#"+type).show()
					    break;
					case 'B9':					    
					case 'B11':
						$("#B9_B11").show()						
					    break;					    
				}
								 
				$("form").append("<input type='hidden' name='logTypeArr' value='"+type+"'>");
				
			} 	
		})
		
		$("#first, #second").on("submit", function(){
			if(confirm("저장하시겠습니까?")){
				return true;
			}
			
			return false;
		})

/* 		$("#down").click(function() {
			var idx = $("input[name=fileIdx]").eq(0).val();
			$("form").attr("action", "${path}/download?idx=" + idx);
			$("form").submit();
			
		}); */
	});

	const oIdx = "${order.idx}";

	function fileDown(order) {
		var length = $("input[name=fileIdx]").length;
		var idx = 0;
		
		if (order < length) {
			idx = $("input[name=fileIdx]").eq(order - 1).val();
			location.href = "${path}/download?idx=" + idx;
			
			setTimeout(function() {fileDown(order + 1)}, 500);
		}
		
	}

	function imgValid(){
		if(confirm("저장하시겠습니까?")){
			return true;
		}		
		return false;
	}

	
</script>
</html>