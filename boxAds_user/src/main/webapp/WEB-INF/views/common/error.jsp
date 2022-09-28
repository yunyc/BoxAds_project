<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<style>
	.sub_container .inner.error_inner{margin-top: 161px;}
	.error_wrap{text-align: center;padding: 117px 0 124px;}
	.error_wrap .ico_error{display: block;height: 124px;background-repeat: no-repeat;background-position: center; background-image: url(../images/common/error_bg.png);text-indent: -9999em;}
	.error_wrap .error_tit{position: relative;font-size: 26px;font-weight: 500; line-height: 32px;padding-bottom: 18px; margin-top: 50px;}
	.error_wrap .error_tit:after{content: '';width: 22px;height: 1px;background-color: #9e9e9e; position: absolute;left: 50%;bottom: 0;margin-left: -11px;}
	.error_wrap .error_txt{margin-top: 15px;font-size: 16px;line-height: 24px;}
	.error_wrap .btn{margin-top: 120px; width: 250px;height: 54px;line-height: 54px; border-radius: 5px; font-size: 16px;font-weight: 400;color: #fff; background-color: #5a217e;}
</style>

<body>
	<div id="wrap">
	<c:import url="/WEB-INF/views/inc/gnb.jsp"/>
		<div id="container">
			<div class="inner error_inner">
				<!-- error_wrap -->
				<div class="error_wrap">
					<i class="ico_error">오류 아이콘</i>
					<p class="error_tit">일시적인 오류가 발생했습니다.</p>
					<p class="error_txt">
						서비스 이용에 불편을 드려 죄송합니다. <br>
						잠시후에 다시 시도해주세요
					</p>
					<a href="javascript:history.back();" class="btn">이전페이지로 돌아가기</a>
				</div>
			</div>
			<!-- error_wrap -->
		</div>
		<hr>		
		<c:import url="/WEB-INF/views/inc/footer.jsp"/>
	</div>
</body>
