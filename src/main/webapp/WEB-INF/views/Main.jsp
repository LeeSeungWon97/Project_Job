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

<style type="text/css">
.nav,
.nav a,
.nav ul,
.nav li,
.nav div,
.nav form,
.nav input {
    margin: 0;
    padding: 0;
    border: none;
    outline: none;
}
 
.nav a { text-decoration: none; }
 
.nav li { list-style: none; }

.nav {
    display: inline-block;
    position: relative;
    cursor: default;
    z-index: 500;
}
 
.nav > li {
    display: block;
    float: left;
}

.nav > li > a {
    position: relative;
    display: block;
    z-index: 510;
    height: 54px;
    
    padding: 0 50px;
    line-height: 54px;
 
    font-family: Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 13px;
    color: #fcfcfc;
    text-shadow: 0 0 1px rgba(0,0,0,.35);
 
    background: black;
    border-left: 1px solid #4b4441;
    border-right: 1px solid #312a27;
 
    -webkit-transition: all .3s ease;
    -moz-transition: all .3s ease;
    -o-transition: all .3s ease;
    -ms-transition: all .3s ease;
    transition: all .3s ease;
}

.nav > li:hover > a { background: #4b4441; }
 
.nav > li:first-child > a {
    border-radius: 3px 0 0 3px;
    border-left: none;
}
.nav > li.nav-search > form {
    position: relative;
    width: inherit;
    height: 54px;
    z-index: 510;
    border-left: 1px solid #4b4441;
}

.nav > li.nav-search input[type="text"] {
    display: block;
    float: left;
    width: 1px;
    height: 24px;
    padding: 15px 0;
    line-height: 24px;
 
    font-family: Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 13px;
    color: #999999;
    text-shadow: 0 0 1px rgba(0,0,0,.35);
 
    background: #372f2b;
 
    -webkit-transition: all .3s ease 1s;
    -moz-transition: all .3s ease 1s;
    -o-transition: all .3s ease 1s;
    -ms-transition: all .3s ease 1s;
    transition: all .3s ease 1s;
}
 
.nav > li.nav-search input[type="text"]:focus { color: #fcfcfc; }
 
.nav > li.nav-search input[type="text"]:focus,
.nav > li.nav-search:hover input[type="text"] {
    width: 110px;
    padding: 15px 20px;
 
    -webkit-transition: all .3s ease .1s;
    -moz-transition: all .3s ease .1s;
    -o-transition: all .3s ease .1s;
    -ms-transition: all .3s ease .1s;
    transition: all .3s ease .1s;
}

.nav > li.nav-search input[type="submit"] {
    display: block;
    float: left;
    width: 20px;
    height: 54px;
    padding: 0 25px;
    cursor: pointer;
 
    background: #372f2b url(../img/search-icon.png) no-repeat center 
    center;
 
    border-radius: 0 3px 3px 0;
 
    -webkit-transition: all .3s ease;
    -moz-transition: all .3s ease;
    -o-transition: all .3s ease;
    -ms-transition: all .3s ease;
    transition: all .3s ease;
}
 
.nav > li.nav-search input[type="submit"]:hover { background-color: 
 #4b4441; }
 
 .nav > li > div {
    position: absolute;
    display: block;
    width: 100%;
    top: 50px;
    left: 0;
 
    opacity: 0;
    visibility: hidden;
    overflow: hidden;
 
    background: #ffffff;
    border-radius: 0 0 3px 3px;
 
    -webkit-transition: all .3s ease .15s;
    -moz-transition: all .3s ease .15s;
    -o-transition: all .3s ease .15s;
    -ms-transition: all .3s ease .15s;
    transition: all .3s ease .15s;
}

.nav > li:hover > div {
    opacity: 1;
    visibility: visible;
    overflow: visible;
}

.nav .nav-column {
    float: left;
    width: 20%;
    padding: 2.5%;
}
 
.nav .nav-column h3 {
    margin: 20px 0 10px 0;
    line-height: 18px;
 
    font-family: Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 14px;
    color: #372f2b;
    text-transform: uppercase;
}
 
.nav .nav-column h3.orange { color: #ff722b; }
 
.nav .nav-column li a {
    display: block;
    line-height: 26px;
 
    font-family: Helvetica, Arial, sans-serif;
    font-weight: bold;
    font-size: 13px;
    color: #888888;
 
}
 
.nav .nav-column li a:hover { color: #666666; }

    .flex-container{
            display: flex;
        }
         
   		.flex-item{
            width: 200px;
            height: 250px;
            margin: 10px;
          
        
        }
</style>


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