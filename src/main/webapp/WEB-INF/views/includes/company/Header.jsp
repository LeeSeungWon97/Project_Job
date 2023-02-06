<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<div class="header">
		
		<div class="logo">
			<a class="logo-link" href="">
			<img class="logo-img" src="${pageContext.request.contextPath }/resources/assets/img/company-logo.png">
			</a>
		</div>
		
		<div class="search">
			<div class="company-search-box">
			<input class="company-stext" type="text" placeholder="인재는 역시 굿잡!">
			<button class="sbtn" type="button">
			<img class="sbtn-img" src="${pageContext.request.contextPath }/resources/assets/img/icon/company_icon_search.png">
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