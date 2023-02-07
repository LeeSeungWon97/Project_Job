<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Homepage</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp" %> 
    
    <!-- Nav -->
    <%@ include file="/WEB-INF/views/includes/main/Nav.jsp" %>
  	
	<!-- Banner -->
	<%@ include file="/WEB-INF/views/includes/main/Banner.jsp" %>

	<!-- Section -->
	<%@ include file="/WEB-INF/views/includes/main/Section.jsp" %>
       
	<!-- Footer-->
    <%@ include file="/WEB-INF/views/includes/main/Footer.jsp" %>
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>
</body>
</html>