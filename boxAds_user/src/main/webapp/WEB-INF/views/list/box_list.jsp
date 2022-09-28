<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:forEach items="${list}" var="vo" varStatus="status">
	<li>
		<div class="list_top">
			<div class="img_area">
				<a href="${path}/box/detail?idx=${vo.idx}&writer=${vo.writer}"><img src="${path}${vo.fileName}" onerror="this.src='${path}/images/common/boxads_no_image.png'" alt="박스(box) 리스트 이미지">
				<span></span></a>
			</div>
			<div class="info_area">
				<!-- <a href="javascript:;"> -->
					<div class="img_area">
						<img src="${path}${vo.profile}" onerror="this.src='${path}/images/main/list_profile01.png'" alt="박스(box) 등록 프로필" >
					</div>
					<p>${vo.name}</p>
				<!-- </a> -->
			</div>
			<c:if test="${type ne 'my'}">
				<div class="like_area">
					<input type="checkbox" name="favIdx" id="box_like${vo.idx}"
						value="${vo.idx}" data-type="B"
						<c:if test="${vo.favFlag eq 'Y'}">checked="checked"</c:if>>
					<label for="box_like${vo.idx}" class="chk">좋아요</label>
				</div>
			</c:if>
			<c:if test="${type eq 'my'}">
			<c:choose>
				<c:when test="${vo.state eq 'N'}">
					<div class="stat_area">
						<span>판매대기</span>
					</div>
				</c:when>
				<c:when test="${vo.state eq 'Y'}">
					<div class="stat_area">
						<span>판매중</span>
					</div>
				</c:when>
				<c:when test="${vo.state eq 'P'}">
					<div class="stat_area">
						<span>일시중지</span>
					</div>
				</c:when>
				<c:when test="${vo.state eq 'E'}">
					<div class="stat_area">
						<span>판매종료</span>
					</div>
				</c:when>
			</c:choose>
			</c:if>
		</div>
		<div class="list_content">
			<div class="goods_info">
				<p class="sort">${vo.secCtg}&gt;${vo.thrCtg}</p>
				<span <c:if test="${vo.soldOutFlag eq 'Y'}"> class="soldout" </c:if>>품절</span>
			</div>
			<div class="list_title">
				<a href="${path}/box/detail?idx=${vo.idx}&writer=${vo.writer}"><c:out
						value="${vo.title}" /></a>
			</div>
			<c:if test="${type eq 'my'}">
			<div class="item_code">${vo.boxCode}</div>
			</c:if>
			<dl>
				<dt>판매 월</dt>
				<dd>
					<strong class="roboto">${vo.sellDate}</strong>
				</dd>
			</dl>
			<dl>
				<dt>박스 수</dt>
				<dd>
					<strong class="roboto"><fmt:formatNumber value="${vo.boxCnt}" pattern="#,###" /></strong> 개
				</dd>
			</dl>
			<dl>
				<dt>광고비</dt>
				<dd>

					<strong class="roboto"><fmt:formatNumber
							value="${vo.adPrice}" pattern="#,###" /></strong>원 <span>(${vo.unit}원/개당)</span>
				</dd>
			</dl>
			<div class="list_sub_info">
				<span class="like"><i>좋아요 아이콘</i><strong class="roboto">${vo.favCnt}</strong></span>
				<span><strong class="roboto">${vo.viewCnt}</strong>개의 조회</span>
				<c:if test="${type eq 'my'}">
				<span class="sale">판매수 : <strong class="roboto">${vo.odCnt}/${vo.pdtCnt}</strong></span>
				</c:if>
			</div>
			<c:if test="${type eq 'my'}">
			<div class="btn_area">
				<c:if test="${vo.state ne 'E'}">
					<a href="${path}/box/write?idx=${vo.idx}" class="btn">수정</a>
				</c:if>
				<button
					onclick="location.href='${path}/box/copy?idx=${vo.idx}&type=copy'"
					class="btn btn_gray" type="button">복사</button>
				<c:if test="${vo.state eq 'N'}">
					<button onclick="deleteAd('${path}/box/delete?idx=${vo.idx}')"
						class="btn btn_white" type="button">삭제</button>
				</c:if>
			</div>
			</c:if>
		</div>
	</li>
</c:forEach>
<script>
	function deleteAd(path) {
		var confirm = window.confirm("삭제하시겠습니까?");

		if (confirm) {
			location.href = path;
		}
	}	
</script>