<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 100%; display: flex;">
	<c:choose>
		<c:when test="${sessionScope.loginType == 'P' }">
			<span>${sessionScope.loginInfo.mname}</span>
		</c:when>
		<c:otherwise>
			<span>${sessionScope.loginInfo.cmname}</span>
		</c:otherwise>
	</c:choose>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto">
		<c:choose>
			<c:when test="${sessionScope.loginType == 'P' }">
				<li class="nav-item"><a href="${pageContext.request.contextPath }/myInfo" class="nav-link link-dark"> 내정보 </a></li>
				<li><a href="${pageContext.request.contextPath }/myResume" class="nav-link link-dark"> 이력서 </a></li>
				<li><a href="${pageContext.request.contextPath }/viewApply" class="nav-link link-dark"> 지원현황 </a></li>
				<li><a href="${pageContext.request.contextPath }/myScrap" class="nav-link link-dark"> 스크랩 </a></li>
				<li><a href="${pageContext.request.contextPath }/RecinameList" class="nav-link link-dark"> 열람기업 </a></li>
			</c:when>
			<c:otherwise>
				<li class="nav-item"><a href="${pageContext.request.contextPath }/myInfo" class="nav-link link-dark"> 내정보 </a></li>
				<li><a href="${pageContext.request.contextPath }/viewApply" class="nav-link link-dark"> 지원현황 </a></li>
			</c:otherwise>
		</c:choose>

	</ul>
</div>
