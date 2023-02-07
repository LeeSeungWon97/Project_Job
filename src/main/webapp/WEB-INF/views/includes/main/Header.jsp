<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header id="header">
    <div class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
    		<h1 class="logo">
    			<a class="navbar-brand" href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath }/resources/assets/img/company-logo.png" style="width:120px; height:100px;"></a> 
    		</h1>
    		<div class="search">    
 				<div class="navbar bg-light">
 					<form class="d-flex" role="search">
      					<input class="form-control me-2" type="search" placeholder="search for..." aria-label="Search">
      					<button class="btn btn-outline-dark" type="submit">Search</button>
     				</form>
 				</div>
			</div>
    	</div>
    </div>
</header>