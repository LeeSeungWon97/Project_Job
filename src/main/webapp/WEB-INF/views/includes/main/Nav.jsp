<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav id="nav">
	<ul class="navigator"> 
		<li class="nav-div<c:if test="${navType == 'employment'}"> test001</c:if>"><a href="${pageContext.request.contextPath }/EmploymentPage?pageNum=1">채용정보</a></li>
		<li class="nav-div<c:if test="${navType == 'recruitment'}"> test001</c:if>"><a href="${pageContext.request.contextPath }/RecruitmentPage?pageNum=1">공채</a></li>
		<li class="nav-div<c:if test="${navType == 'cinfoList'}"> test001</c:if>"><a href="${pageContext.request.contextPath }/CinfoListPage?pageNum=1">기업정보</a></li>
		<li class="nav-div<c:if test="${navType == 'viewResume'}"> test001</c:if>"><a href="${pageContext.request.contextPath }/viewResumeInfo?pageNum=1">인재정보</a></li>
		<li class="nav-div<c:if test="${navType == 'boardList'}"> test001</c:if>" ><a href="${pageContext.request.contextPath }/BoardListPage?pageNum=1">커뮤니티</a></li>
	</ul> 
</nav>



