<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!--
	변경 사항
	class명 변경
	top-menu 추가
-->

<header id="header">
    
    <div class="header-div">
    	
    	<div class="logo">
    		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
    		<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width:80%; height:auto;">
    		</a> 
    	</div>
    	
    	<div class="search">    
 			<div class="search-box">
 					<form class="d-flex" role="search">
      				<input class="form-control me-2" type="search" placeholder="오늘도 역시, 굿잡!" aria-label="Search">
      				<button class="search-btn" type="submit">
					<img src="${pageContext.request.contextPath }/resources/assets/img/update/search-icon.png">
					</button>
     				</form>
 			</div>
		</div>
		
		<div class="top-menu">
			<a class="tmenu-text" href="${pageContext.request.contextPath }/login ">로그인</a>
			<a class="tmenu-text" href="${pageContext.request.contextPath }/joinMemberPage">회원가입</a>
			<a class="tmenu-text" href="${pageContext.request.contextPath }/MainCompany ">기업회원 홈</a>
		</div>
		
    </div>
    
</header>