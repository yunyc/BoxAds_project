<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:useBean id="now" class="java.util.Date" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd (E)" /></c:set> 

<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<div class="container clearfix">
			<div class="dash_content clearfix">
				<!-- <a href="#" class="btn_refresh">새로고침</a> -->
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>DASHBOARD</li>
					</ul>
				</div>
				<div class="dashboard_wrap">
					<h2 class="tit">박스애드에 오신 것을 환영합니다.</h2>
					<div class="date">
						<div class="cnt_time">${sysYear}</div>
						<div class="last_login">
							<span>최근접속일시 : </span>
							<span>${adminVO.loginDate}</span>
						</div>
					</div>
					<ul class="dashboard_area">
						<li>
							<div class="sub_tit">주문관리</div>
							<a href="${path}/print/print_list?state=B4">
								<p>인쇄 <br>신규 발주</p>
								<span>${dash.pCnt}</span>
							</a>
						</li>
						<li>
							<a href="${path}/order/list?state=B&oState=B4&dash=1">
								<p>1차<br>인증 요청</p>
								<span>${dash.o1Cnt}</span>
							</a>
						</li>
						<li>
							<a href="${path}/order/list?state=B&oState=B5&dash=2">
								<p>2차<br>인증 요청</p>
								<span>${dash.o2Cnt}</span>
							</a>
						</li>
						<li>
							<div class="sub_tit">문의관리</div>
							<a href="${path}/board/list?type=Q&replyFlag=N">
								<p>1:1 문의</p>
								<span>${dash.bCnt}</span>
							</a>
						</li>
						<li>
							<div class="sub_tit">회원관리</div>
							<a href="${path}/member/list?state=Y&confirmFlag=N">
								<p>사업자<br>인증 요청</p>
								<span>${dash.mCnt}</span>
							</a>
						</li>
						<li>
							<div class="sub_tit">정산관리</div>
							<a href="${path}/calcul/calcul_list?state=N">
								<p>정산<br>승인 요청</p>
								<span>${dash.cCnt}</span>
							</a>
						</li>
						<li>
							<a href="${path}/calcul/withdraw_list?state=N">
								<p>캐시<br>출금 신청</p>
								<span>${dash.wCnt}</span>
							</a>
						</li>
						<li>
							<a href="${path}/calcul/bill_list?state=N">
								<p>증빙 자료<br>발행 요청</p>
								<span>${dash.iCnt}</span>
							</a>
						</li>
					</ul>
					<div class="dash_notice">
						<div class="sub_tit">공지사항 <a href="${path}/board/list?type=N">더보기 +</a></div>
							<div class="notice_wrap">
							<c:forEach items="${boardList}" var="boardList">
								<div>
									<a href="${path}/board/detail?idx=${boardList.idx}&type=N">${boardList.title}
										<span><c:out value="${fn:substring(boardList.insertDate, 0, 10)}"/></span>
									</a>
								</div>
							</c:forEach>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script>
$("#gnb").find("li").eq(0).addClass("on");
</script>
</html>