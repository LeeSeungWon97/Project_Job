<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header id="header">
    <div class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container px-4 px-lg-5">
        <a class="navbar-brand" href=""><img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" style="width:120px; height:100px;"></a>       
 			<nav class="navbar bg-light">
    			<div class="container-fluid">
    				<form class="d-flex" role="search">
      					<input class="form-control me-2" type="search" placeholder="search..." aria-label="Search">
      					<button class="btn btn-outline-dark" type="submit">search</button>
     				</form>
  				</div>
			</nav>
    	</div>
    </div>
</header>