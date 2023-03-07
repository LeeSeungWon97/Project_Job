<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav id="nav">
	<div class="navigator">
		<div class="nav-div"><a href="${pageContext.request.contextPath }/EmploymentPage?pageNum=1">채용정보</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }/RecruitmentPage?pageNum=1">공채</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }/CinfoListPage?pageNum=1">기업정보</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }/viewResumeInfo">인재정보</a></div>
		<div class="nav-div"><a href="${pageContext.request.contextPath }/BoardListPage?pageNum=1">커뮤니티</a></div>
	</div> 
</nav>


