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
<style type="text/css">
.scrap {
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
     border:none;
     background-color:transparent;
}
.scrap:hover{
    text-shadow: 0 0 0 #fdf002; /* 마우스 호버 */
    text-shadow: 0 0 0 #fdf002; /* 마우스 호버 뒤에오는 이모지들 */
    text-shadow: 0 0 0 #fdf002; /* 마우스 클릭 체크 */
}
.scrap_click{
 text-shadow: 0 0 0 #fdf002; 
}

</style>
</head>
<body>
		
	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/main/Header.jsp" %> 
     <!-- Nav -->
    <%@ include file="/WEB-INF/views/includes/main/Nav.jsp" %>
    	
	<section id="section">
		<div class="section-div">
			<div class="row">
				<div class="card mt-4 mb-4 shadow rounded-3">
				<div class="table-responsive">
					<table class="table table-striped" style="border-radius: 50px;">
						<thead>
							<tr>
								<th scope="col" style="font-size: 20px;">회사</th>
								<th scope="col" style="font-size: 20px;">공고명</th>
								<th scope="col"  style="font-size: 20px;">경력</th>
								<th scope="col"  style="font-size: 20px;">마감일</th>
								<th scope="col"  style="font-size: 20px;"></th>	
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${epList }" var="employ">
								<tr>
                                	<td>${employ.epciname }</td>
                                    <td>${employ.epname }
                                     <input type="button" class="scrap" id="${employ.epnum }" onclick="checkVal('${employ.epnum }', this)" value="⭐">
                                    </td>
                                    <td>${employ.epedu }</td>
                               	    <td><span>${employ.epdeadline }</span></td>
                               		<td>	
                               			<button class="btn btn-secondary mt-1" onclick="WriteResume('${employ.epnum }','${employ.epciname }','${employ.epname }')" style="min-width: 80px;  font-size: 20%;">자소서작성</button>      
                              		</td>
                                </tr>
                  			</c:forEach>
						</tbody>
					</table>
				</div>	
				
			</div>	
			</div>		
		</div>
	</section>
							
	
	
	
	
	
	
	
	
	
	
	<!-- Footer-->
	<%@ include file="/WEB-INF/views/includes/main/Footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script src="${pageContext.request.contextPath }/resources/assets/js/scripts.js"></script>



</body>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	selectScrapInfo();
});

	function WriteResume(epnum, epciname, epname) {
		console.log(epnum + epciname + epname);
		location.href = "${pageContext.request.contextPath }/WriteEssayPage?epnum="
				+ epnum + "&epciname=" + epciname;

	}
</script>

<script type="text/javascript">	
		function checkVal(checkedName, selBtn){
		console.log(checkedName);
		if ($(selBtn).hasClass("scrap_click")) {
			$(selBtn).removeClass("scrap_click");
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/removeScrap",
				data : {"checkedName" : checkedName},
				dataType : "json",
				success:function(result){
					console.log("성공 :" + result );
				}
			});
			
		}else{
		$(selBtn).addClass("scrap_click");
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/scrapEpname",
			data : {"checkedName" : checkedName},
			dataType : "json",
			success:function(result){
				console.log("성공 :" + result );
				
			}
		});
		}
		
		}
		
		function selectScrapInfo(){
			$.ajax( { 
				type : "get",
				url : "${pageContext.request.contextPath }/selectScrapInfo",
				async:false,
				dataType:"json",
				success : function(scrapList){
					console.log(scrapList);
						 for(var scrapinfo of scrapList){
						
						console.log(scrapinfo.spepnum);
						 $("#"+scrapinfo.spepnum).addClass("scrap_click");
						 }
					
				}
			} );			
		}
		
		
		
	</script>

















</html>