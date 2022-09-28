<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<c:set var="path" value="${pageContext.request.contextPath}" />
	<div class="sub_wrap">
	<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>인쇄관리</h3>
            </div>
      <div class="view">
		<div class="fl type01">
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
							<th scope="row">주문번호</th>
							<td colspan="3">
								${vo.orderCode}
							</td>
						</tr>
						<tr>
							<th scope="row">발주일자</th>
							<td colspan="3">
								${vo.insertDate}
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								${vo.adPro1} ${vo.adPro2}
							</td>
						</tr>
						<tr>
							<th scope="row">인쇄수량 (박스 수)</th>
							<td colspan="3">
								${vo.boxCnt}
							</td>
						</tr>
						<tr>
							<th scope="row">양면/단면</th>
							<td colspan="3">
								${vo.side}
							</td>
						</tr>
						<tr>
							<th scope="row">판매 월</th>
							<td colspan="3">
								${vo.sellDate}
							</td>
						</tr>
					</tbody>
                </table>
			</div>
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
								${vo.boxCode}
							</td>
						</tr>
						<tr>
							<th scope="row">박스 명</th>
							<td colspan="3">
								${vo.boxTitle}
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td colspan="3">
								${vo.boxCate}
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								${vo.boxPro}
							</td>
						</tr>
						<tr>
							<th scope="row">판매자명</th>
							<td colspan="3">
								${vo.boxName}
							</td>
						</tr>
						<tr>
							<th scope="row">홍보 담당자명</th>
							<td colspan="3">
								${vo.mkName}
							</td>
						</tr>
						<tr>
							<th scope="row">홍보 담당자 연락처</th>
							<td colspan="3">
								${vo.mkphone}
							</td>
						</tr>
						<tr>
							<th scope="row">홍보물 수령주소</th>
							<td colspan="3">
								${vo.mkAddress}
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
								${vo.adCode}
							</td>
						</tr>
						<tr>
							<th scope="row">애드 명</th>
							<td colspan="3">
								${vo.adTitle}
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td colspan="3">								
								${vo.cate}
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								${vo.adPro}
							</td>
						</tr>
						<tr>
							<th scope="row">홍보웹페이지</th>
							<td colspan="3">
								${vo.url}
							</td>
						</tr>
						<tr>
							<th scope="row">광고주 정보</th>
							<td colspan="3">
								${vo.adName}
							</td>
						</tr>
					</tbody>
                </table>
			</div>

        </div>
		<div class="fl type02">
					<div class="tit02 mt20"> 
						<h4>애드 관련 이미지</h4>
					</div>
					<div class="img_box mt20">
						<div class="img_l">
							<c:forEach items="${imgList}" var="img" varStatus="status">
								<div>
									<img src="${path}${img.url}" onerror='this.src="http://placehold.it/95x85?text=sample"'>
									<p>${img.insertDate}</p>
									<c:if test="${img.type eq 'A'}">
										<span>앞면이미지</span>
									</c:if>
								</div>
								<input type="hidden" name="fileIdx" value="${img.idx}"/>
							</c:forEach>
							<!-- <div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span>앞면이미지</span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span>앞면이미지</span>		
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div> -->
						</div>
						<div class="img_r">
							<div>
								<img src="${path}${qrcode.url}" alt="QR코드" onerror='this.src="http://placehold.it/85x85?text=QR코드"'>
								<!-- <img src="http://placehold.it/85x85?text=QR코드" alt="QR코드"> -->
								<p><a href="${path}/download?parent=${vo.aIdx}&type=QR"  class="txt_blue">QR 다운로드</a></p>
								<p><a href="javascript:fileDown(0)"  class="txt_blue">이미지 다운로드</a></p>
							</div>
						</div>
					</div>
					<div class="mt20" style="font-size: 18px;">
						<span class="txt_blue">단축URL : </span><a href="${vo.url}">${vo.url}</a>
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
						<form action="file?idx=${vo.idx}&path=print" method="post" enctype="multipart/form-data">
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
										<input type="text" id="file_name" name="file_name">
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
										<input type="text" name="file_name">
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
															<p>-첨부파일 : <a href="${path}/download?idx=${vo.fIdx}&type=B6" class="txt_blue">${vo.realName}</a></p>														
														</c:when>
														<c:when test="${vo.state eq 'B9' && !empty vo.url || vo.state eq 'B11' && !empty vo.url}">
															<p>-배송정보: ${vo.delivery} (${vo.mesg})</p>
															<p>거래명세서 : <a href="${path}/download?idx=${vo.fIdx}&type=B9" class="txt_blue">${vo.realName}</a></p>
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
					<div class="btn_area align_r mt20">
						<a href="#" onclick="pageMove('/admin/admin_order_detail?idx=${vo.idx}')" class="btn" >박스애드 바로가기</a>
						<a href="print_list" class="btn">목록</a>
					</div>
				</div>
				

            </div><!-- view -->
        </div><!-- content -->
    </div>
</div>
</body>
<script type="text/javascript" src="${path}/js/logPrint.js"></script>
<script>
	$(function(){
		$('#gnb ul li').eq(9).addClass('on');

		$(document).on("change", "input[name='uploadFile']", function() {
			let index = $(":file").index(this);	
			let file = $(this).get(0).files[0];
			if (file !== undefined) { $(":text[name='file_name']").eq(index).val(file.name) }	        	
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

	})

	const oIdx = "${vo.idx}";

	function fileDown(order) {
		var length = $("input[name=fileIdx]").length;
		var idx = 0;
		
		if (order < length) {
			idx = $("input[name=fileIdx]").eq(order - 1).val();
			location.href = "${path}/download?idx=" + idx;
			
			setTimeout(function() {fileDown(order + 1)}, 500);
		}
		
	}
</script>
</html>
