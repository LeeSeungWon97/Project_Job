<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header id="header">
    <div class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container-fluid">
    		<div class="logo">
    			<a class="navbar-brand" href=""><img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" style="width:120px; height:100px;"></a> 
    		</div>
    		<div class="search">    
 				<div class="navbar bg-light">
 					<form class="d-flex" role="search">
      					<input class="form-control me-2" type="search" placeholder="search..." aria-label="Search">
      					<button class="btn btn-outline-dark" type="submit">search</button>
     				</form>
 				</div>
			</div>
    	</div>
    </div>
</header>