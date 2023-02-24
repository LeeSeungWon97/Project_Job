<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<header id="header">
	<div class="header-div">
		<div class="logo">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 80%; height: auto;">
			</a>
		</div>

		<div class="search">
			<div class="search-box">
				<form class="d-flex" role="search" action="${pageContext.request.contextPath }/searchValue" onsubmit="return searchForm(this)">
					<input class="form-control me-2" type="search" placeholder="오늘도 역시, 굿잡!" aria-label="Search" name="searchValue" id="headerInput" >
					<input type="hidden" id="currentURL"  name="currentURL">
					
					<button class="search-btn">
						<img src="${pageContext.request.contextPath }/resources/assets/img/update/search-icon.png" style="width: 90%; height: auto;">
					</button>
				</form>
			</div>
		</div>

		<div class="top-menu">
			<c:choose>
				<c:when test="${sessionScope.loginInfo == null }">
					<a class="tmenu-text" href="${pageContext.request.contextPath }/login ">로그인</a>
					<a class="tmenu-text" href="${pageContext.request.contextPath }/join">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath }/myInfo">
						<c:choose>
							<c:when test="${sessionScope.loginType == 'P' }">
							${sessionScope.loginInfo.mname } 님	
						</c:when>
							<c:otherwise>
							${sessionScope.loginInfo.cmname } 님	
						</c:otherwise>
						</c:choose>
					</a>
					<a class="tmenu-text" href="${pageContext.request.contextPath }/logout ">로그아웃</a>
				</c:otherwise>
			</c:choose>
			<a class="tmenu-text" href="${pageContext.request.contextPath }/">기업회원 홈</a>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script type="text/javascript">
            var currentUrl = window.location.href;
            function searchForm(formObj){
            	formObj.currentURL.value = currentUrl;
            	var searchVal = $('#headerInput').val();	
            	if(searchVal.length < 2){
        			alert('검색어는 2글자 이상 입력해주세요');
        			return false;
        		}
            }
            </script>
	
</header>