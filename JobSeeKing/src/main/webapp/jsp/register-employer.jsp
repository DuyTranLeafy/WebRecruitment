<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Register - FastJob</title>
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
        position: absolute;
        top: 50%;
        right: 0;
        transform: translateY(-50%);
        width: 80%; /* Điều chỉnh kích thước form theo ý muốn */
        padding: 0px; /* Điều chỉnh padding theo ý muốn */
        border-radius: 0 5px 5px 0; /* Điều chỉnh bo góc theo ý muốn */
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
						<span class="login-breadcrumb"><em>/</em> Đăng ký nhà tuyển
							dụng</span>
					</div>
					<div class="login-right">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-return">Quay lại Trang chủ</a>
					</div>
				</div>
			</div>
			<!-- (end) login header -->

			<div class="clearfix"></div>

			<img src="resources/img/recruiment_employer.jpg" class="bg-image" alt="Banner Image">

			<!-- login main -->
			<div class="login-main">
				<div class="w-login m-auto">
					<div class="row">
						<div class="col-md-6 col-sm-11 col-11 login-main-right">

							<form:form id="form-register-employer"
								class="login-form reg-form"
								action="register-employer?${_csrf.parameterName}=${_csrf.token}"
								method="POST" modelAttribute="registrationForm"
								enctype="multipart/form-data">

								<div class="login-main-header">
									<h3>Đăng Ký Tài Khoản Nhà Tuyển Dụng</h3>
									<c:if test="${not empty error }">
										<p style="color: red">${error}</p>
									</c:if>
								</div>
								<div class="reg-info">
									<h3>Tài khoản</h3>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="text" id="email" path="username"
											class="input form-control-lgin" placeholder="Địa chỉ email *"
											onchange="changeEmailBorderColor()" />
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="password" id="password" path="password"
											class="input form-control-lgin" placeholder="Mật khẩu *"
											onchange="changePasswordBorderColor()" />
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="password" id="repeatPassword"
											path="repeatPassword" class="input form-control-lgin"
											placeholder="Nhập Lại Mật khẩu *"
											onchange="changeRepeatPasswordBorderColor()" />
									</div>
								</div>
								<div class="reg-info">
									<h3>Công ty</h3>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="text" id="contactName" path="contactName"
											class="input form-control-lgin"
											placeholder="Tên người liên hệ *"
											onchange="changeContactNameBorderColor()" />
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="text" id="phone" path="phone"
											class="input form-control-lgin"
											placeholder="Số điện thoại liên hệ *"
											onchange="changePhoneBorderColor()" />
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="text" id="companyName" path="companyName"
											class="input form-control-lgin" placeholder="Tên công ty *"
											onchange="changeCompanyNameBorderColor()" />
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="text" id="address" path="address"
											class="input form-control-lgin"
											placeholder="Địa Chỉ Công Ty *"
											onchange="changeAddressBorderColor()" />
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<form:input type="text" id="city" path="city"
											class="input form-control-lgin" placeholder="Thành phố *"
											onchange="changeCityBorderColor()" />
									</div>
								</div>
								<div>
									<h5>Logo (.png, .jpg, .jpeg):</h5>
									<input type='file' name="image" accept=".png, .jpg, .jpeg" />
								</div>
								<div class="form-group d-block frm-text">
									<a href="#" class="fg-login d-inline-block"></a> <a
										href="login?user=EMPLOYER"
										class="fg-login float-right d-inline-block">Bạn đã có tài
										khoản? Đăng Nhập</a>
								</div>
									<input type="submit"
									class="btn btn-primary float-right btn-login d-block w-100"
									value="Đăng Ký Nhà Tuyển Dụng" onclick="registerEmployer(event)">
								
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