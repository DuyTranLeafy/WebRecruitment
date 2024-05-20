<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Apply - FastJob</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Roboto Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i&display=swap"
	rel="stylesheet">

<!-- bootstrap css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css">

<!-- main css -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<style>
    .login-main-right {
        top: 100%;
        right: 0;
        transform: translateY(-5%);
        height: 150px;
        width: 70%; /* Giảm chiều rộng của form */
        padding: 0px; /* Điều chỉnh padding theo ý muốn */
        border-radius: 0 10px 10px 0; /* Điều chỉnh bo góc theo ý muốn */
    }
</style>
</head>

<body>
	<div class="container-fluid login-fluid clear-left clear-right">
		<div class="login-container">
			<!-- login header -->
			<div class="login-header">
				<div class="w-login m-auto">
					<div class="login-logo">
						<h3>
							<!-- <a href="#">Tech<span class="txb-logo">Jobs.</span></a> -->
							<a href="#"> <img src="resources/img/fast-logo.png"
								alt="FastJobs">
							</a>
						</h3>
						<span class="login-breadcrumb"><em>/</em> Apply</span>
					</div>
					<div class="login-right">
						<a href="${pageContext.request.contextPath}/loginSuccess" class="btn btn-return">Quay lại Dashboard</a>
					</div>
				</div>
			</div>
			<!-- (end) login header -->

			<div class="clearfix"></div>

			<div class="padding-top-90"></div>

			<!-- login main -->
			<div class="login-main">
				<div class="w-login m-auto">
					<div class="row">
						<!-- login main descriptions -->
						<div class="col-md-5 col-sm-12 col-12 login-main-left">
							<img src="resources/img/profile-01.png">
						</div>
						<!-- login main form -->
						<div class="col-md-7 col-sm-12 col-12 login-main-right">

							<form:form class="login-form reg-form" id="form-apply"
								action="apply?${_csrf.parameterName}=${_csrf.token}"
								method="POST" modelAttribute="applyForm"
								enctype="multipart/form-data">
								<input type="hidden" name="username"
								value="${username }" />
								<input type="hidden" name="jobID"
								value="${jobID }" />
								<c:if test="${not empty success }">
	                        		<h3 style="color:green">${success}</h3>
	                        	</c:if>
								<c:if test="${not empty error }">
									<p style="color: red">${error}</p>
								</c:if>
								<div class="login-main-header">
									<h3>Nộp CV ứng tuyển</h3>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Họ
										và tên <span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="text" id="name" path="name" value="${profile.name }" class="form-control"
											placeholder="Nhập họ và tên" onchange="changeNameBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Số
										điện thoại <span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="text" id="phone" path="phone" value="${profile.phone }" class="form-control"
											placeholder="Nhập số điện thoại" onchange="changePhoneBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Địa
										chỉ <span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="text" id="address" path="address" value="${profile.address }" class="form-control"
											placeholder="Nhập địa chỉ" onchange="changeAddressBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Giới
										tính <span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:select id="sex" path="sex" value="${profile.sex }" class="form-control" onchange="changeSexBorderColor()">
											<option value="">Chọn giới tính</option>
											<option value="Nam">Nam</option>
											<option value="Nữ">Nữ</option>
										</form:select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Ngày
										sinh <span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="date" id="dob" path="dob" value="${profile.dob }" class="form-control" onchange="changeDobBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Tệp
										CV (.doc, .docx, .pdf):<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<input type='file' name="fileCV" accept=".doc, .docx, .pdf" />
									</div>
								</div>
								<br />
								<input type="submit"
									class="btn btn-primary float-right btn-login d-block w-100" onclick="apply(event)"
									value="Ứng tuyển">
								
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<!-- (end) login main -->
		</div>
	</div>
	<footer class="login-footer">
		<div class="w-login m-auto">
			<div class="row">
				<!-- login footer left -->
				<div class="col-md-6 col-sm-12 col-12 login-footer-left">
					<div class="login-copyright">
						<p>
						<p style="color: white;">
							Copyright © 2024 <a href="#"> GoJob</a>. All Rights Reserved.
						</p>
					</div>
				</div>
				<!-- login footer right -->
				<div class="col-md-6 col-sm-12 col-12 login-footer-right">
					<ul>
						<li><a href="#">Terms & Conditions</a></li>
						<li><a href="#">Privacy Policy</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="resources/js/jquery-3.4.1.slim.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/form.js"></script>

	<script type="text/javascript" src="resources/js/main.js"></script>
</body>

</html>