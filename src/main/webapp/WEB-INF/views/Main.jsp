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
    <title>좋은 직장을 위한 취업플랫폼, 굿잡</title>
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />
	
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">



</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp" %> 
    
    <!-- Nav -->
    <%@ include file="/WEB-INF/views/includes/main/Nav.jsp" %>

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