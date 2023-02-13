<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section id="section">
	<div class="section-div">
		<div class="section-l">
			<div class="section-l-bottom">
				<div class="row">
					<div class="col-lg-4 mt-4">
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
						<div class="col-lg-4 mt-4">
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
						<div class="col-lg-4 mt-4">
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
				</div>
			</div>
		
		
		
			<div class="section-r">
				<div class="section-r-top">
				<div class=profile-box>
					<div class="card mb-8">
						<%-- 비로그인--%>
						<c:if test="${sessionScope.loginInfo == null }">
							<div class="card-body mx-auto">
								<div class="d-grid">
									<a href="${pageContext.request.contextPath }/login">
										<button type="button" class="btn-lg" style="background-color: #539DDB; border: solid: #539DDB;"><span style="color: white;">개인/기업 로그인</span></button>
									</a>
								</div>
							</div>
							<div class="card-footer">
								<div class="d-flex justify-content-center gap-1">
									<a href="${pageContext.request.contextPath }/join">
										<button class="btn btn-outline-secondary btn-sm" type="button">회원가입</button>
									</a>
									<a href="${pageContext.request.contextPath }/FindIdPage">
										<button class="btn btn-outline-secondary btn-sm" type="button">아이디 찾기</button>
									</a>
									<a href="${pageContext.request.contextPath }/FindPwPage">
										<button class="btn btn-outline-secondary btn-sm" type="button">비밀번호 찾기</button>
									</a>
								</div>
							</div>
						</c:if>
						<%-- 로그인 --%>
						<c:if test="${sessionScope.loginInfo != null }">
							<div class="card-body mx-auto">
								<div class="info">

									<c:choose>
										<c:when test="${sessionScope.loginType == 'P' }">
											<span>${sessionScope.loginInfo.mname}</span>
										</c:when>
										<c:otherwise>
											<span>${sessionScope.loginInfo.cmname}</span>
										</c:otherwise>
									</c:choose>

									&ensp;&ensp;&ensp;&ensp;
									<a href="${pageContext.request.contextPath }/logout">
										<button type="button" style="background-color: #539DDB; border: solid: #539DDB;"><span style="color: white;">로그아웃</span></button>
									</a>
								</div>
							</div>
							<div class="card-footer">
								<div class="d-flex justify-content-center gap-1">
										<a href="${pageContext.request.contextPath }/myInfo">
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 20%;">내정보</button>
										</a>
										<a>
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 20%;">이력서</button>
										</a>
										<a>
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 20%;">지원현황</button>
										</a>
										<a>
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 20%;">스크랩</button>
										</a>
										<a>
											<button type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 20%;">열람기업</button>
										</a>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div class="section-r-bottom">
				<div class="mt-2">
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
			</div>
		</div>
		</div>
</section>