<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
	변경 사항
	코드 전체 수정 >> class명 변경 + li 삭제
-->

<nav id="nav">

	<div class="navigator">
		<div class="nav-div"><a href="${pageContext.request.contextPath }/includes/main/List">채용정보</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }">공채</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }">자료실</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }">커뮤니티</a></div>
	</div> 
	
</nav>