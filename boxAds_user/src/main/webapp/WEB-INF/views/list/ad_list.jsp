<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:forEach items="${list}" var="vo" varStatus="status">
	<li>
		<div class="list_top">
			<div class="img_area">
				<a href="${path}/ad/detail?idx=${vo.idx}&writer=${vo.writer}"><img src="${path}${vo.fileName}" onerror="this.src='${path}/images/common/boxads_no_image.png'" alt="애드(ads) 리스트 이미지">
				<span></span></a>
			</div>
			<div class="info_area">
				<!-- <a href="javascript:;"> -->
					<div class="img_area">
						<img src="${path}${vo.profile}" onerror="this.src='${path}/images/main/list_profile01.png'" alt="애드(ads) 등록 프로필">
					</div>
					<p>${vo.name}</p>
				<!-- </a> -->
			</div>
			<c:if test="${type ne 'my'}">
				<div class="like_area">
					<input type="checkbox" name="favIdx" id="ad_like${vo.idx}"
						value="${vo.idx}" data-type="A"
						<c:if test="${vo.favFlag eq 'Y'}">checked="checked"</c:if>>
					<label for="ad_like${vo.idx}" class="chk">좋아요</label>
				</div>
			</c:if>
			<c:if test="${type eq 'my'}">
				<div class="stat_area">
					<c:choose>
						<c:when test="${vo.state eq 'N'}">
							<span>광고대기</span>
						</c:when>
						<c:when test="${vo.state eq 'Y'}">
							<span>광고중</span>
						</c:when>
						<c:when test="${vo.state eq 'P'}">
							<span>일시중지</span>
						</c:when>
						<c:when test="${vo.state eq 'E'}">
							<span>광고종료</span>
						</c:when>
					</c:choose>
				</div>
			</c:if>
		</div>
		<div class="list_content">
			<div class="goods_info">
				<p class="sort">${vo.secPro} ${vo.thrPro}</p>
				<!-- <span class="soldout">품절</span>품절시 soldout class추가 -->
			</div>
			<div class="list_title">
				<a href="${path}/ad/detail?idx=${vo.idx}&writer=${vo.writer}"><c:out
						value="${vo.title}" /></a>
			</div>
			<c:if test="${type eq 'my'}">
				<div class="item_code">${vo.adCode}</div>
			</c:if>
			<dl>
				<dt>카테고리</dt>
				<dd>${vo.fir}</dd>
			</dl>
			<dl>
				<dt>광고기간</dt>
				<dd>
					<strong class="roboto">${vo.adStartDate} ~ ${vo.adEndDate}</strong>
				</dd>
			</dl>
			<div class="list_sub_info">
				<span class="like"><i>좋아요 아이콘</i><strong class="roboto">${vo.favCnt}</strong></span>
				<span><strong class="roboto">${vo.viewCnt}</strong>개의 조회</span> 
				<c:if test="${type eq 'my'}">
				<span class="sale">신청수 <strong class="roboto">${vo.odCnt}</strong></span>
				</c:if>
			</div>
			<c:if test="${type eq 'my'}">
			<div class="btn_area">
				<c:if test="${vo.state ne 'E'}">
					<a href="${path}/ad/write?idx=${vo.idx}" class="btn">수정</a>
				</c:if>
				<button
					onclick="location.href='${path}/ad/copy?idx=${vo.idx}&type=copy'"
					class="btn btn_gray" type="button">복사</button>
				<c:if test="${vo.state eq 'N'}">
					<button onclick="deleteAd('${path}/ad/delete?idx=${vo.idx}')"
						class="btn btn_white" type="button">삭제</button>
				</c:if>

			</div>
			</c:if>
		</div>
	</li>
</c:forEach>
<script>
let listChk = '${empty list}';
if(listChk == 'true'){	
	$(".nodata").show();
} else {
	$(".nodata").hide();
}
	function deleteAd(path) {
		var confirm = window.confirm("삭제하시겠습니까?");

		if (confirm) {
			location.href = path;
		}
	}	
</script>
