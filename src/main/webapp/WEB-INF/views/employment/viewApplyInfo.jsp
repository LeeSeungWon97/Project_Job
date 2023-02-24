<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 이력서</title>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/styles.css"
	rel="stylesheet" />
<style type="text/css">
.mainbox {
	width: 710px;
	padding: 30px;
	margin: 30px;
	margin-right: auto;
	margin-left: auto;
	border: 1px solid #ebebeb;
	box-shadow: 0 1px 20px 0 rgba(75, 0, 206, 0.15);
}

h1 {
	font-size: 26px;
	margin-bottom: 35px;
}

.first {
	border-bottom: 2px solid #ebebeb;
	border-top: 2px solid #ebebeb;
	margin-bottom: 20px;
}

h3 {
	font-size: 13px;
	color: #282828;
	font-weight: lighter;
	margin-bottom: 16px;
	padding-bottom: 5px;
}

h2 {
	font-size: 20px;
	color: #282828;
	font-weight: lighter;
	margin-bottom: 16px;
	border-bottom: 2px solid black;
	padding-bottom: 5px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="d-flex justify-content-center">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img
				src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png"
				style="width: 200px; height: 100px;">
			</a>
		</div>
		<div class="row">


			<div class="mainbox">
				<h1 style="text-align: center;">이력서</h1>

				<!--  -->

				<div id="resumeForm">
					<div class="d-flex mb-4">
						<div class="flex-shrink-0">
							<img
								src="${pageContext.request.contextPath }/resources/assets/img/resumePro.png"
								style="width: 120px; height: 130px;">
						</div>
						<div class="flex-grow-1 ms-3">
							<div class="top">
								<input type="hidden" class="form-control" name="remid"
									value="${member.mid}" readonly="readonly">
								<input type="text" class="form-control"
									value="${member.mname}"
									style="width: 150px; font-size: large;" readonly="readonly">
							</div>
							<div class="top mt-1">
								<input type="text" class="form-control"
									value="${member.mbirth}"
									style="width: 200px; height: 30px;" readonly="readonly">
							</div>
							<div class="top mt-1">
								<input type="text" class="form-control resumeContent rehope"
									name="rehope" placeholder="#희망직무태그" value="${Resume.rehope }"
									style="width: 200px; height: 30px;" readonly="readonly">
							</div>
						</div>
					</div>
					<section class="first">
						<div class="row g-2">
							<div class="col-3 mt-3 mb-2 ">
								<input type="text" class="form-control"
									value="${member.memail}"
									style="height: 30px; font-size: small;" readonly="readonly">
							</div>
							<div class="col-3 mt-3 mb-2 ">
								<input type="text" id="phoneNum"
									class="form-control resumeContent" name="retell"
									placeholder="전화번호" style="height: 30px; font-size: small;"
									readonly="readonly">
							</div>
							<div class="col-6 mb-2 mt-3 ">
								<input type="text" class="form-control"
									value="${member.maddr}"
									style="height: 30px; font-size: small;" readonly="readonly">
							</div>
						</div>
					</section>
					<section class="mb-3">
						<h2>
							<a> <img
								src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
								style="width: 30px; height: 20px;">
							</a> 학력
						</h2>
						<div class="input-group" id="reeduData">
							<c:forEach items="${Resume.reedu }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent reedu"
										value="${Resume.reedu[i.index]}" style="height: 60px;"
										readonly="readonly"> <input type="text"
										class="form-control resumeContent reedu"
										value="${Resume.reedu[i.index + 1]}"
										style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>
						
					</section>
					<section>
						<h2>
							<a> <img alt=""
								src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
								style="width: 30px; height: 20px;">
							</a> 경력
						</h2>
						<div class="input-group" id="recarrerData">
							<c:forEach items="${Resume.recarrer }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent recarrer"
										value="${Resume.recarrer[i.index]}" style="height: 60px;"
										readonly="readonly"> <input type="text"
										class="form-control resumeContent recarrer"
										value="${Resume.recarrer[i.index + 1]}"
										style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>
						
					</section>
					<section class="mb-3">
						<h2>
							<a> <img alt=""
								src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
								style="width: 30px; height: 20px;">
							</a> 인턴/대외활동
						</h2>
						<div class="input-group" id="reactData">
							<c:forEach items="${Resume.react }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent react"
										value="${Resume.react[i.index]}" style="height: 60px;"
										readonly="readonly"> <input type="text"
										class="form-control resumeContent react"
										value="${Resume.react[i.index + 1]}"
										style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>
						
					</section>
					<section class="mb-5">
						<h2>
							<a> <img alt=""
								src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
								style="width: 30px; height: 20px;">
							</a> 자격증
						</h2>
						<div class="input-group" id="relicenseData">
							<c:forEach items="${Resume.relicense }" varStatus="i" step="2">
								<div class="input-group">
									<input type="text" class="form-control resumeContent react"
										value="${Resume.relicense[i.index]}" style="height: 60px;"
										readonly="readonly"> <input type="text"
										class="form-control resumeContent react"
										value="${Resume.relicense[i.index + 1]}"
										style="width: 300px; height: 60px;" readonly="readonly">
								</div>
							</c:forEach>
						</div>
						
					</section>
				</div>
				<!--  -->

				
			</div>

		</div>
	</div>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
	
	</script>
</body>
</html>