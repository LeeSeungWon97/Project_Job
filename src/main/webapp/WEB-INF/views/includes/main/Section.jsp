<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="section">

	<div class="section-div">
		<div class="section-l">

			<div class="section-l-top"></div>


			<div class="section-l-bottom">
				<div class="container-fluid section-div">

					<div class="row">

						<div class="col-md-8 mt-4">
							<div class="row">
								<div class="col-lg-4">

									<div class="card mb-4">
										<a href=""> <img class="card-img-top"
											src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
											alt="..." />
										</a>
										<div class="card-body">
											<div class="small text-muted">January 1, 2022</div>
											<h2 class="card-title h4">Post Title</h2>
											<p class="card-text">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</p>
											<a class="btn btn-primary" href="#!">Read more →</a>
										</div>
									</div>


									<div class="card mb-4">
										<a href=""> <img class="card-img-top"
											src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
											alt="..." />
										</a>
										<div class="card-body">
											<div class="small text-muted">January 1, 2022</div>
											<h2 class="card-title h4">Post Title</h2>
											<p class="card-text">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</p>
											<a class="btn btn-primary" href="#!">Read more →</a>
										</div>
									</div>
								</div>
								<div class="col-lg-4">


									<div class="card mb-4">
										<a href=""> <img class="card-img-top"
											src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
											alt="..." />
										</a>
										<div class="card-body">
											<div class="small text-muted">January 1, 2022</div>
											<h2 class="card-title h4">Post Title</h2>
											<p class="card-text">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</p>
											<a class="btn btn-primary" href="#!">Read more →</a>
										</div>
									</div>

									<div class="card mb-4">
										<a href=""> <img class="card-img-top"
											src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
											alt="..." />
										</a>
										<div class="card-body">
											<div class="small text-muted">January 1, 2022</div>
											<h2 class="card-title h4">Post Title</h2>
											<p class="card-text">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</p>
											<a class="btn btn-primary" href="#!">Read more →</a>
										</div>
									</div>
								</div>


								<div class="col-lg-4">

									<div class="card mb-4">
										<a href=""> <img class="card-img-top"
											src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
											alt="..." />
										</a>
										<div class="card-body">
											<div class="small text-muted">January 1, 2022</div>
											<h2 class="card-title h4">Post Title</h2>
											<p class="card-text">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</p>
											<a class="btn btn-primary" href="#!">Read more →</a>
										</div>
									</div>


									<div class="card mb-4">
										<a href=""> <img class="card-img-top"
											src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg"
											alt="..." />
										</a>
										<div class="card-body">
											<div class="small text-muted">January 1, 2022</div>
											<h2 class="card-title h4">Post Title</h2>
											<p class="card-text">Lorem ipsum dolor sit amet,
												consectetur adipisicing elit.</p>
											<a class="btn btn-primary" href="#!">Read more →</a>
										</div>
									</div>

								</div>


							</div>

							<nav aria-label="Pagination">
								<hr class="my-0" />
								<ul class="pagination justify-content-center my-4">
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">Newer</a></li>
									<li class="page-item active" aria-current="page"><a
										class="page-link" href="#!">1</a></li>
									<li class="page-item"><a class="page-link" href="#!">2</a></li>
									<li class="page-item"><a class="page-link" href="#!">3</a></li>
									<li class="page-item disabled"><a class="page-link"
										href="#!">...</a></li>
									<li class="page-item"><a class="page-link" href="#!">15</a></li>
									<li class="page-item"><a class="page-link" href="#!">Older</a></li>
								</ul>
							</nav>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="section-r">
			<div class="section-r-top">

				<div class=profil-box>

					<div class="card mb-8">
						<%-- 비로그인--%>
						<c:if test="${sessionScope.loginInfo == null }">
							<div class="card-body mx-auto">
								<div class="d-grid">
									<a href="${pageContext.request.contextPath }/login">
										<button type="button" class="btn btn-dark btn-lg">개인/기업
											로그인</button>
									</a>
								</div>
							</div>
							<div class="card-footer">
								<div class="d-flex justify-content-center gap-1">
									<a href="${pageContext.request.contextPath }/join">
										<button class="btn btn-outline-secondary btn-sm" type="button">회원가입</button>
									</a> <a href="${pageContext.request.contextPath }/FindIdPage">
										<button class="btn btn-outline-secondary btn-sm" type="button">아이디
											찾기</button>
									</a> <a href="${pageContext.request.contextPath }/FindPwPage">
										<button class="btn btn-outline-secondary btn-sm" type="button">비밀번호
											찾기</button>
									</a>
								</div>
							</div>
						</c:if>
						<%-- 로그인 --%>
						<c:if test="${sessionScope.loginInfo != null }">
							<div class="card-body mx-auto">
								<div class="info">
									<span>${sessionScope.loginInfo.mname}지훈님</span>&ensp;&ensp;&ensp;&ensp;
									<a href="${pageContext.request.contextPath }/logout">
										<button type="button" class="btn btn-dark">로그아웃</button>
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

				</div>
			</div>
			<div class="section-r-bottom"></div>
		</div>
	</div>








</section>