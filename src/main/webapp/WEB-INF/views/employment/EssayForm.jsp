<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="EssayForm">
	<div class="input-group input-group-lg mb-1">
		<input type="hidden" class="form-control" name="esmid" value="${sessionScope.loginInfo.mid}">
		<input type="hidden" class="form-control" name="esepnum" value="${epnum}">
		<input type="hidden" class="form-control" name="escontents" id="escontents">
	</div>


	<div class="top">
		<input type="text" readonly class="form-control-plaintext esciname" name="esciname" value="${epciname}">
		<input type="text" readonly class="form-control-plaintext epname" value="${epname}" readonly="readonly">
	</div>

	<div>
		<h1>자기소개서</h1>
	</div>

	<div class="myInfo">
		<div class="row g-2">
			<div class="col-3 mt-3 mb-2 ">
				<input type="text" readonly class="form-control-plaintext" value="${sessionScope.loginInfo.mname}" style="height: 30px; font-size: small; text-align: center;">
			</div>
			<div class="col-3 mt-3 mb-2 ">
				<input type="text" readonly class="form-control-plaintext" value="${sessionScope.loginInfo.memail}" style="height: 30px; font-size: small; text-align: center;">
			</div>
			<div class="col-6 mb-2 mt-3 ">
				<input type="text" readonly class="form-control-plaintext" value="${sessionScope.loginInfo.maddr}" style="height: 30px; font-size: small; text-align: center;">
			</div>
		</div>
	</div>

	<div class="box">
		<input type="text" readonly class="form-control-plaintext" name="retell" value="1. 우리회사에 지원한 동기에 대해 적어주세요.">
		<div class="form-floating">
			<textarea readonly class="form-control EssayContent area1" id="area1" style="height: 100px"></textarea>
		</div>
	</div>
	<div class="box">
		<input type="text" readonly class="form-control-plaintext" value="2. 성격의 장단점을 적어주세요.">
		<div class="form-floating">
			<textarea readonly class="form-control EssayContent area2" id="area2" style="height: 100px"></textarea>
		</div>
	</div>
	<div class=" box mb-5">
		<input type="text" readonly class="form-control-plaintext" readonly="readonly" value="3. 입사 후 포부를 적어주세요.">
		<div class="form-floating">
			<textarea readonly class="form-control EssayContent area3" id="area3" style="height: 100px"></textarea>
		</div>
	</div>
</div>



