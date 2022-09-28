<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/header.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="${path}/js/order.js"></script>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/inc/gnb.jsp"/>	
			<div id="container" class="sub_content">
				<div class="sub_wrap mypage_wrap order_wrap order_finish_wrap">
					<div class="path">
						<c:choose>
							<c:when test="${param.type eq 'A' }">
							<c:set value="애드 신청" var="title"/>
							<c:set value="신청번호" var="odCodeText"/>
							<c:set value="신청일시" var="insertDate"/>
							<c:set value="ad/ad_apply" var="goList"/>
								<ul>
									<li>홈</li>
									<li>애드(Ads)</li>
									<li>애드 신청</li>
									<li>진행 상세</li>
								</ul>	
							</c:when>
							<c:when test="${param.type eq 'B' }">
							<c:set value="마이 박스 판매" var="title"/>
							<c:set value="결제번호" var="odCodeText"/>
							<c:set value="거래일시" var="insertDate"/>
							<c:set value="box/box_sell" var="goList"/>
								<ul>
									<li>홈</li>
									<li>박스(Box)</li>
									<li>마이 박스 판매</li>
									<li>거래 상세</li>
								</ul>
							</c:when>
						</c:choose>
						
					</div>
					<h2 class="title">${title}</h2>
					<div class="left_cnt">
						<div class="box_wrap box_box pos_top">
							<div class="box_area02">
								<a href="#">
									<div class="img_box" style="background-image: url(${path}${box.fileName});">
										
									</div>
								</a>
								<div class="text_box">
									<span class="small_tit"><em>${box.boxCode}</em></span>
									<p><c:out value="${box.title}"></c:out></p>
									
									<div class="goods_info">
										<div class="data">
											<span>${box.secCtg}&gt;${box.thrCtg}</span>
										</div>
									<a href="${box.url}" class="link" target="_blank">${box.url}</a>
									</div>
									<div class="good_info m_on">
										<dl>
											<dt>카테고리</dt>
											<dd class="data">
												<p><span>${box.secCtg}&gt;${box.thrCtg}</span></p>
											</dd>
										</dl>
									</div>	
									<a href="../box/detail?idx=${box.idx}&writer=${box.writer}" class="more">더보기 +</a>
								</div>
							</div>
						</div>
						<div class="box_wrap ads_box">
							<div class="box_area02">
								<a href="#">
									<div class="img_box" style="background-image: url(${path}${ad.fileName});">
										<div class="img_area"><img src="${path}${ad.profile}" alt="박스(box) 등록 프로필"></div>
										<div class="com_name">${ad.name}</div>
									</div>
								</a>
								<div class="text_box">
									<span class="small_tit"><em>${ad.adCode}</em><em>${ad.secPro} ${ad.thrPro}</em></span>
									<p><c:out value="${ad.title}"></c:out></p>
									<div class="goods_info">
										<div class="data">
											<c:forTokens items="${ad.fir}" delims="," var="item">
												<span>${item}</span>									
											</c:forTokens>
										</div>
									<p class="term"><span>광고기간 : </span>${ad.adStartDate} ~ ${ad.adEndDate}</p>
								</div>
								<div class="good_info m_on">
									<dl>
										<dt>카테고리</dt>
										<dd class="data">
											<c:forTokens items="${ad.fir}" delims="," var="item">
												<span>${item}</span>									
											</c:forTokens>	
										</dd>
									</dl>
								</div>								
									<a href="../ad/detail?idx=${ad.idx}&writer=${ad.writer}" class="more">더보기 +</a>									
								</div>
							</div>
							<div class="table_wrap_dl">
								<div class="row-2">									
									<dl>
										<dt>타겟 연령</dt>
										<dd>
											<p>${ad.ctmAge}</p>
										</dd>
									</dl>
									<dl>
										<dt>타켓 성별</dt>
										<dd>
											<p>${ad.ctmGender}</p>
										</dd>
									</dl>
								</div>
								<div class="row-2 m_border">
									<dl>
										<dt>타켓 유형</dt>
										<dd>
											<p>${ad.ctmType}</p>
										</dd>
									</dl>
									<dl>
										<dt>광고신청건수</dt>
										<dd>
											<p><fmt:formatNumber value="${adCnt}" pattern="#,###" /> 건</p>
										</dd>
									</dl>
									
								</div>
							</div>								
						</div>
					</div>
					<div class="right_cnt">
						<div class="payment_wrap">
							<div class="order_sum_wrap">
								<p class="tit">
									<span>
										<c:choose>
											<c:when test="${order.state eq 'A1'}">광고신청</c:when>
											<c:when test="${order.state eq 'A2'}">신청승인</c:when>
											<c:when test="${order.state eq 'A3'}">광고집행</c:when>
											<c:when test="${order.state eq 'A4'}">신청취소</c:when>
											<c:when test="${order.state eq 'B1'}">광고구매</c:when>
											<c:when test="${order.state eq 'B2'}">광고승인</c:when>
											<c:when test="${order.state eq 'B3'}">광고진행</c:when>
											<c:when test="${order.state eq 'B4'}">1차광고인증</c:when>
											<c:when test="${order.state eq 'B5'}">2차광고인증</c:when>
											<c:when test="${order.state eq 'B6'}">광고완료</c:when>
											<c:when test="${order.state eq 'B7'}">구매취소</c:when>
											<c:when test="${order.state eq 'B8'}">판매종료</c:when>
										</c:choose>	
									</span>
								</p>
								
								<p class="order_txt">${odCodeText} : <strong>${order.orderCode}</strong></p>
								<p class="order_txt">${insertDate} : 
									<strong>
										<fmt:parseDate var="dateString" value="${order.insertDate}" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${dateString}" pattern="yy.MM.dd HH:mm:ss"/>
									</strong>
								</p>
							</div>
							<div class="num_wrap">
								<div class="num_list">									
									<dl>
										<dt>광고비</dt>
										<dd>
											<em><fmt:formatNumber value="${order.pdtUnit * order.boxCnt}" pattern="#,###" /></em> 원
											<%-- <p class="btm_txt">(${order.pdtUnit}원/개당)</p> --%>
										</dd>
									</dl>
									<dl>
										<dt>수수료</dt>
										<dd>
											<em><fmt:formatNumber value="${cashInfo.fee}" pattern="#,###"/></em> 원
											
										</dd>
									</dl>
									<dl>
										<dt>예상수입액</dt>
										<dd><em><fmt:formatNumber value="${cashInfo.income}" pattern="#,###"/></em> 원</dd>
									</dl>
									<dl>
										<dt>예상 캐시 잔액 </dt>
										<dd><em><fmt:formatNumber value="${cashInfo.incomeCash}" pattern="#,###"/></em>원</dd>
									</dl>							
									
								</div>								
							</div>													
							
							<div class="info_result">
								<div class="stat">도착메세지 <span><strong>${messageCnt.yet}</strong> / ${messageCnt.total}</span></div>
								<div class="btn_area">
									<c:set var="receiver" value="${login.idx eq ad.writer ? box.writer : ad.writer }"/>
									<a href="../member/message_detail?writer=${login.idx}&receiver=${receiver}" class="btn btn_chat"><span>채팅문의</span></a>
									<a href="../${goList}" class="btn btn_list">목록보기</a>
								</div>
							</div>
							
						</div>
					</div>					
					<c:import url="/WEB-INF/views/boxad/process_log.jsp"/>
				</div>
			</div>
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
	<!-- 사유 -->
	<div id="reason" class="layerpop-box resonbox">
		<div class="modal-bg"></div>
		<div class="layerpopup">
			<div class="inner">
				<div class="msgbox prompt">
					<div class="head_title" >사유입력<a href="javascript:;" class="btn_close">닫기</a></div>
					<div class="body">
						<div class="conts">
							<div class="input_area">
							  <textarea name="reason" ></textarea>
							</div>
							<div class="btn_area">
								<button class="btn" value="B7" data-logType="B24" onclick="rejectAd(this, '거부')">확인</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!-- //사유 -->
	<script type="text/javascript" src="${path}/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="${path}/js/util.js"></script>
	<script>	
	const oIdx = "${order.idx}";
	const adIdx = "${ad.idx}";		
	const boxIdx = "${box.idx}";
	
	$(function(){
		$(".btn_reject").on("click", function(){
			if(confirm("거부 하시겠습니까?")){
				 modal_open('reason');
			}
		})
	})
	
	function rejectAd(tag, alertMesg){
		updateState(oIdx, $(tag).val(), $(tag).attr("data-logType"), $("textarea[name='reason']").val(), alertMesg + "되었습니다.");				
	}

	</script>
	<script>
		$(function() {

			// 이미지 등록
			$("#uploadFile").change(function() {
				var file = this.files[0];

				if($(".file > li").length > 2){
					alert("이미지는 최대 2장까지 가능합니다."); return false;
				}
				
				if ($(".file > li").length <= 2 && file !== undefined) {
					var element = '<li>' + 
									'<div class="imgbox confirm" style="background-image:url(../images/main/main_list02.jpg)">' +
										'<button class="delete_img" type="button">삭제</button>' +
									'</div>' +
									'<div class="img_txt">' +
									file.name +
									'</div>' +
								  '</li>';

					$("#img_save").before(element);
					
					readURL(this, ".confirm:last");
					uploadList.push(file);
					$("#uploadFile").val("");
				}
				
			});
			
			// 이미지 삭제
			$(document).on("click", ".delete_img", function() {
				var confirm = window.confirm("삭제하시겠습니까?");
				var idx = $(".delete_img").index(this);
				
				if (confirm) {
					$(".file li").eq(idx).remove();
					uploadList.splice(idx, 1);
					
				}
			});			
		});

	// 파일 전송
	function fileAndlog(tag){
		if(confirm("저장하시겠습니까?")){
			if(uploadList.length > 0) {
				ajax("file", "${path}", "등록되었습니다.");
			} else {
				alert("파일을 등록해주세요");
			}		
		}
	}

	</script>
</body>