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
    
    <title>기업회원 홈|굿잡</title>
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png" />
    
    <link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/resources/assets/css/joincompany.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.css" rel="stylesheet" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>

<body style="background: #E4E8EB;">
	<!-- Start Header -->
	<%@ include file="/WEB-INF/views/includes/company/Header.jsp" %>
    <!-- End Header -->  
    
    <!-- Start Nav -->
    <%@ include file="/WEB-INF/views/includes/company/Nav.jsp" %>
    <!-- End Nav -->  
  	
	<!-- Start Section -->
	<%@ include file="/WEB-INF/views/includes/company/Section.jsp" %>
   	<!-- End Section -->
       
	<!-- Start Footer-->
    <%@ include file="/WEB-INF/views/includes/company/Footer.jsp" %>
    <!-- End Footer-->
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>

</body>


</html>