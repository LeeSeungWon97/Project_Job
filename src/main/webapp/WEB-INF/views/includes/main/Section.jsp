<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="section">
	<div class="container-fluid">
		<div class="row">
			<!-- Post entries-->
			<div class="col-md-8 mt-4">
				<div class="row">
					<div class="col-lg-6">
						<!-- Blog post-->
						<div class="card mb-4">
							<a href="">
								<img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
							</a>
							<div class="card-body">
								<div class="small text-muted">January 1, 2022</div>
								<h2 class="card-title h4">Post Title</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
						<!-- Blog post-->
						<div class="card mb-4">
							<a href="">
								<img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
							</a>
							<div class="card-body">
								<div class="small text-muted">January 1, 2022</div>
								<h2 class="card-title h4">Post Title</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<!-- Blog post-->
						<div class="card mb-4">
							<a href="">
								<img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
							</a>
							<div class="card-body">
								<div class="small text-muted">January 1, 2022</div>
								<h2 class="card-title h4">Post Title</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
						<!-- Blog post-->
						<div class="card mb-4">
							<a href="">
								<img class="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." />
							</a>
							<div class="card-body">
								<div class="small text-muted">January 1, 2022</div>
								<h2 class="card-title h4">Post Title</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Pagination-->
				<nav aria-label="Pagination">
					<hr class="my-0" />
					<ul class="pagination justify-content-center my-4">
						<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
						<li class="page-item active" aria-current="page"><a class="page-link" href="#!">1</a></li>
						<li class="page-item"><a class="page-link" href="#!">2</a></li>
						<li class="page-item"><a class="page-link" href="#!">3</a></li>
						<li class="page-item disabled"><a class="page-link" href="#!">...</a></li>
						<li class="page-item"><a class="page-link" href="#!">15</a></li>
						<li class="page-item"><a class="page-link" href="#!">Older</a></li>
					</ul>
				</nav>
			</div>
			<!-- Side widgets-->
			<div class="col-md-4 mt-4">
				<div class="card mb-8">
					<%-- 비로그인--%>
					<c:if test="${sessionScope.loginInfo == null }">
						<div class="card-body mx-auto">
							<div class="btn-group btn-group-lg">
								<button type="button" class="btn btn-outline-dark">개인회원 로그인</button>
								<button type="button" class="btn btn-outline-dark">기업회원 로그인</button>
							</div>
						</div>
						<div class="card-footer">
							<div class="d-grid gap-1 d-md-block">
								<a href="${pageContext.request.contextPath }/join">
									<button class="btn btn-outline-secondary btn-sm" type="button">회원가입</button>
								</a>
								<button class="btn btn-outline-secondary btn-sm" type="button">ID/PW 찾기</button>			
							</div>
						</div>
					</c:if>
					<%-- 로그인 --%>
					<c:if test="${sessionScope.loginInfo != null }">
						<div class="card-body mx-auto">
							<div class="info">
								<span class="">${sessionScope.loginInfo.mname}지훈님</span>&ensp;&ensp;&ensp;
								<a href="${pageContext.request.contextPath }/">
									<button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
								</a>
							</div>
						</div>
						<div class="card-footer">
							<div class="d-flex justify-content-center">
								<div class="btn-group btn-group-sm gap-1">
									<button type="button" class="btn btn-outline-secondary">내정보</button>
									<button type="button" class="btn btn-outline-secondary">이력서</button>
									<button type="button" class="btn btn-outline-secondary">지원현황</button>
									<button type="button" class="btn btn-outline-secondary">스크랩</button>
									<button type="button" class="btn btn-outline-secondary">열람기업</button>
								</div>
							</div>
						</div>
					</c:if>	
				</div>
				<!-- Categories widget-->
				<div class="card mt-2">
					<div class="card-body">
						<div class="container text-center">
							<table class="table table-bordered">
								<tr>
									<th scope="col"><a href="">100대기업</a></th>
									<th scope="col"><a href="">공채달력</a></th>
									<th scope="col"><a href="">TOP100</a></th>
								</tr>
								<tr>
									<th scope="row"><a href="">인턴채용</a></th>
									<th scope="row"><a href="">합격자소서</a></th>
									<th scope="row"><a href="">취업후기</a></th>
								</tr>
								<tr>
									<th scope="row"><a href="">합격스펙</a></th>
									<th scope="row"><a href="">직무인터뷰</a></th>
									<th scope="row"><a href="">채용설명회</a></th>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<button type="button" class="btn btn-warning btn-sm">공지사항</button>
				</div>
			</div>
		</div>
	</div>
</section>