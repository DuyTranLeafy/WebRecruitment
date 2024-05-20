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
        width: 60%; /* Điều chỉnh kích thước form theo ý muốn */
        padding: 10px; /* Điều chỉnh padding theo ý muốn */
        border-radius: 0 20px 20px 0; /* Điều chỉnh bo góc theo ý muốn */
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
								alt="TechJobs">
							</a>
						</h3>
						<span class="login-breadcrumb"><em>/</em> Đăng ký</span>
					</div>
					<div class="login-right">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-return">Quay lại Trang chủ</a>
					</div>
				</div>
			</div>
			<!-- (end) login header -->

			<div class="clearfix"></div>

            <img src="resources/img/banner-login.jpg" class="bg-image" alt="Banner Image">


			<!-- login main -->
			<div class="login-main">
				<div class="w-login m-auto">
					<div class="row">
						<!-- login main form -->
						<div class="col-md-6 col-sm-12 col-12 login-main-right">

							<form id="form-register-user" class="login-form reg-form"
								action="register-user" method="POST">

								<div class="login-main-header">
									<h3>ĐĂNG KÝ</h3>
									<c:if test="${not empty error }">
										<p style="color: red">${error}</p>
									</c:if>
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<input type="text" id="email" name="username"
											class="input form-control-lgin" placeholder="Địa Chỉ Email *"
											onchange="changeEmailBorderColor()">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<input type="password" id="password" name="password"
											class="input form-control-lgin" placeholder="Mật khẩu *"
											onchange="changePasswordBorderColor()">
									</div>
								</div>
								<div class="input-div one">
									<div class="div lg-lable">
										<input type="password" id="repeatPassword"
											name="repeatPassword" class="input form-control-lgin"
											placeholder="Nhập Lại Mật khẩu *" autocomplete="off"
											onchange="changeRepeatPasswordBorderColor()">
									</div>
								</div>
								<div class="form-group d-block frm-text">
									<a href="#" class="fg-login d-inline-block"></a> <a
										href="login?user=USER"
										class="fg-login float-right d-inline-block">Bạn đã có tài
										khoản? Đăng Nhập</a>
								</div>
								<input type="submit"
									class="btn btn-primary float-right btn-login d-block w-100"
									value="Đăng Ký" onclick="registerUser(event)">
							</form>
						</div>
					</div>
				</div>
			</div>
			<footer class="login-footer">
		<div class="w-login m-auto">
			<div class="row">
				<!-- login footer left -->
				<div class="col-md-6 col-sm-12 col-12 login-footer-left">
					<div class="login-copyright">
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
			<!-- (end) login main -->
		</div>
	</div>
	
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="resources/js/jquery-3.4.1.slim.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/form.js"></script>

	<script type="text/javascript" src="resources/js/main.js"></script>
</body>

</html>