<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<div class="header">
		
		<div class="logo">
			<a class="logo-link" href="${pageContext.request.contextPath }/">
			<img class="logo-img" src="${pageContext.request.contextPath }/resources/assets/img/main-logo.png">
			</a>
		</div>
		
		<div class="search">
			<div class="search-box">
			<input class="stext" type="text" placeholder="오늘도 역시 굿잡!">
			<button class="sbtn" type="button">
			<img class="sbtn-img" src="${pageContext.request.contextPath }/resources/assets/img/icon/icon_search.png">
			</button>
			</div>
		</div>
			
		<div class="top-menu">
			<a class="tmenu-text" href="${pageContext.request.contextPath }/login ">로그인</a>
			<a class="tmenu-text" href="${pageContext.request.contextPath }/joinMemberPage">회원가입</a>
			<a class="tmenu-text" href="${pageContext.request.contextPath }/MainCompany ">기업회원 홈</a>
		</div>
		
	</div>
	
</header>