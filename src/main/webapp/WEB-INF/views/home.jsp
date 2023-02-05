<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href ="${pageContext.request.contextPath }/jobInsert1">insert 공고 정보</a>
<a href ="${pageContext.request.contextPath }/jobInsert2">insert 회사 상세정보</a>
</body>
</html>
