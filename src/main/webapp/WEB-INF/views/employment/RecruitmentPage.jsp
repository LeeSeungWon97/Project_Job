<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>채용공고</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/update/main-icon.png" />


<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />


<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp"%>
	<!-- Nav -->
	<%@ include file="/WEB-INF/views/includes/main/Nav.jsp"%>




	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">회사</th>
					<th scope="col">공고명</th>
					<th scope="col">경력</th>
					<th scope="col">마감일</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${epList }" var="employ">
					<tr>
						<td>${employ.epciname }</td>
						<td>${employ.epname }</td>
						<td>${employ.epedu }</td>
						<td>
							<button class="btn btn-secondary btn-sm" onclick="WriteResume('${employ.epnum }','${employ.epciname }','${employ.epname }')">자소서작성</button>
							<span> ${employ.epdeadline }</span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>







	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>



</body>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
	function WriteResume(epnum, epciname, epname) {
		console.log(epnum + epciname + epname);
		location.href = "${pageContext.request.contextPath }/WriteEssayPage?epnum="
				+ epnum + "&epciname=" + epciname;

	}
</script>












<!--  
	output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+WpList[i].CINAME+'</textarea>';
	output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+WpList[i].CILEADER+'</textarea>';
	output += '<textarea readonly="readonly"class="retext mb-2 border-0 font-weight-bold text-gray-800 w-100">'+WpList[i].CIADDR+'</textarea>';
	output += '<button type="button" onclick="inputcinfo('+ "'"+WpList[i].CINUM+"'"+",'"+WpList[i].CINAME+"'" +",'"+WpList[i].CILEADER+"'"+",'"+WpList[i].CIADDR+"'" +",'"+WpList[i].CITYPE+"'"+',this)">';
	output += '선택';
	output += '</button>';
	output += '<br>';
	-->








</html>