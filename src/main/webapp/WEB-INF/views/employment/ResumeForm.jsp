<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="resumeForm">
	<div class="d-flex mb-4">
		<div class="flex-shrink-0">
			<img src="${pageContext.request.contextPath }/resources/assets/img/resumePro.png" style="width: 120px; height: 130px;">
		</div>
		<div class="flex-grow-1 ms-3">
			<div class="top">
				<input type="hidden" class="form-control" name="remid" value="${sessionScope.loginInfo.mid}" readonly="readonly">
				<input type="text" class="form-control" value="${sessionScope.loginInfo.mname}" style="width: 150px; font-size: large;" readonly="readonly">
			</div>
			<div class="top mt-1">
				<input type="text" class="form-control" value="${sessionScope.loginInfo.mbirth}" style="width: 200px; height: 30px;" readonly="readonly">
			</div>
			<div class="top mt-1">
				<input type="text" class="form-control resumeContent rehope" name="rehope" placeholder="#희망직무태그" value="${Resume.rehope }" style="width: 200px; height: 30px;" readonly="readonly">
			</div>
		</div>
	</div>
	<div class="first">
		<div class="row g-2">
			<div class="col-3 mt-3 mb-2 ">
				<input type="text" class="form-control" value="${sessionScope.loginInfo.memail}" style="height: 30px; font-size: small;" readonly="readonly">
			</div>
			<div class="col-3 mt-3 mb-2 ">
				<input type="text" id="phoneNum" class="form-control resumeContent" name="retell" placeholder="전화번호" style="height: 30px; font-size: small;" readonly="readonly">
			</div>
			<div class="col-6 mb-2 mt-3 ">
				<input type="text" class="form-control" value="${sessionScope.loginInfo.maddr}" style="height: 30px; font-size: small;" readonly="readonly">
			</div>
		</div>
	</div>
	<div class="mb-3">
		<h2>
			<img src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;">
			학력
		</h2>
		<div class="input-group" id="reeduData">
			<c:forEach items="${Resume.reedu }" varStatus="i" step="2">
				<div class="input-group">
					<input type="text" class="form-control resumeContent reedu" value="${Resume.reedu[i.index]}" style="height: 60px;" readonly="readonly">
					<input type="text" class="form-control resumeContent reedu" value="${Resume.reedu[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;" class="mt-2">
			<button type="button" class="btn btn-secondary d-none modifyBtn" onclick="addSearchKeyA()">
				<span class="plus">+</span>
			</button>
			<button type="button" class="btn btn-danger d-none modifyBtn" onclick="delSearchKeyA(this)">
				<span class="die">-</span>
			</button>
		</div>
	</div>
	<div>
		<h2>
			<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;">
			경력
		</h2>
		<div class="input-group" id="recarrerData">
			<c:forEach items="${Resume.recarrer }" varStatus="i" step="2">
				<div class="input-group">
					<input type="text" class="form-control resumeContent recarrer" value="${Resume.recarrer[i.index]}" style="height: 60px;" readonly="readonly">
					<input type="text" class="form-control resumeContent recarrer" value="${Resume.recarrer[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;" class="mt-2">
			<button type="button" class="btn btn-secondary d-none modifyBtn" onclick="addSearchKeyB()">
				<span class="plus">+</span>
			</button>
			<button type="button" class="btn btn-danger d-none modifyBtn" onclick="delSearchKeyB(this)">
				<span class="die">-</span>
			</button>
		</div>
	</div>
	<div class="mb-3">
		<h2>
			<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;">
			인턴/대외활동
		</h2>
		<div class="input-group" id="reactData">
			<c:forEach items="${Resume.react }" varStatus="i" step="2">
				<div class="input-group">
					<input type="text" class="form-control resumeContent react" value="${Resume.react[i.index]}" style="height: 60px;" readonly="readonly">
					<input type="text" class="form-control resumeContent react" value="${Resume.react[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;" class="mt-2">
			<button type="button" class="btn btn-secondary d-none modifyBtn" onclick="addSearchKeyC()">
				<span class="plus">+</span>
			</button>
			<button type="button" class="btn btn-danger d-none modifyBtn" onclick="delSearchKeyC(this)">
				<span class="die">-</span>
			</button>
		</div>
	</div>
	<div class="mb-5">
		<h2>
			<img alt="" src="${pageContext.request.contextPath }/resources/assets/img/resumeRd.png" style="width: 30px; height: 20px;">
			자격증
		</h2>
		<div class="input-group" id="relicenseData">
			<c:forEach items="${Resume.relicense }" varStatus="i" step="2">
				<div class="input-group">
					<input type="text" class="form-control resumeContent react" value="${Resume.relicense[i.index]}" style="height: 60px;" readonly="readonly">
					<input type="text" class="form-control resumeContent react" value="${Resume.relicense[i.index + 1]}" style="width: 300px; height: 60px;" readonly="readonly">
				</div>
			</c:forEach>
		</div>
		<div style="text-align: center;" class="mt-2">
			<button type="button" class="btn btn-secondary d-none modifyBtn" onclick="addSearchKeyD()">
				<span class="plus">+</span>
			</button>
			<button type="button" class="btn btn-danger d-none modifyBtn" onclick="delSearchKeyD(this)">
				<span class="die">-</span>
			</button>
		</div>
	</div>
</div>


<div class="d-grid gap-2 col-6 mx-auto">
	<button id="modifyBtn" class="btn btn-dark btn-lg" type="button" onclick="modifyResume()">수정</button>
	<button id="saveBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="saveResume()">저장</button>
	<c:if test="${sideX != null }">
		<c:choose>
			<c:when test="${state == 1 }">
				<button id="applyBtn" class="btn btn-dark btn-lg " type="button" onclick="applyResume('${epnum}')">지원하기</button>			
			</c:when>
			<c:otherwise>
				<button id="nextBtn" class="btn btn-dark btn-lg " type="button" onclick="callEssay('${epnum}','${epciname }')">다음</button>
			</c:otherwise>
		</c:choose>
	</c:if>
	<button id="cancleBtn" class="btn btn-dark btn-lg d-none" type="button" onclick="modifyCancle()">취소</button>
</div>


