<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav id="nav">
	<div class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>           
        	<div class="collapse navbar-collapse" id="navbarSupportedContent">
            	<ul class="navbar-nav">
                	<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }">채용정보</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }">공채</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }">헤드헌팅</a></li>
                    <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }">인재정보</a></li>
                </ul>
			</div>
			<div class="sub">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active" href="">MY</a></li>
					<li class="nav-item"><a class="nav-link active" href="">기업회원 홈</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>