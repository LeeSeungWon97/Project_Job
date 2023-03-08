<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 이력서</title>
<!-- Bootstrap icons-->
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/img/main-icon.png">
<link href="${pageContext.request.contextPath }/resources/assets/css/header.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nav.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/section.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/footer.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/resources/assets/css/styles.css" rel="stylesheet" />
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
	<!-- Header -->
	<header id="header">
	<div class="header-div">
		<div class="logo">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
				<img src="${pageContext.request.contextPath }/resources/assets/img/update/main-logo.png" style="width: 80%; height: auto;">
			</a>
		</div>
	</div>
	</header>
	
	<section id="section">
		<div class="section-div" style="justify-content: center;">
			<div class="col-lg-10 col-xl-8 my-4" style="width: 60%;">
					<div class="card border-0 shadow rounded-3">
						<div class="card-body p-4 p-sm-5">	
							<!-- ResumeForm -->
							<h1 style="text-align: center;">이력서</h1>
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
									<div class="first">
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
									</div>
									<div class="mb-3">
										<h2>
											 <img
												src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
												style="width: 30px; height: 20px;">
											 학력
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
										
									</div>
									<div class="mb-3">
										<h2>
											 <img alt=""
												src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
												style="width: 30px; height: 20px;">
											 경력
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
										
									</div>
									<div class="mb-3">
										<h2>
											 <img alt=""
												src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
												style="width: 30px; height: 20px;">
											 인턴/대외활동
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
										
									</div>
									<div class="mb-5">
										<h2>
										 <img alt=""
												src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png"
												style="width: 30px; height: 20px;">
										 자격증
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
						
									</div>
				
								</div>

							</div>
							<div class="d-flex justify-content-center mb-3">
								<button type="button" class="btn btn-outline-danger" onclick="history.back()">
									<i class="bi bi-file-excel"></i> 닫기
								</button>
							</div>
						</div>
					
					</div>
				</div>
		</section>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>


	<script type="text/javascript">
		
	</script>

	<script type="text/javascript">
	
	</script>
</body>
</html>