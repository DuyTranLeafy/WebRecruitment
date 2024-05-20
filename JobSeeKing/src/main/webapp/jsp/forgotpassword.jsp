<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Forgot password - FastJobs</title>
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

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha256-NuCn4IvuZXdBaFKJOAcsU2Q3ZpwbdFisd5dux4jkQ5w="
	crossorigin="anonymous" />
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
					<div class="login-right">
						<a href="${pageContext.request.contextPath}/" class="btn btn-return">Quay lại Trang chủ</a>
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
						
						<!-- login main form -->
						<div class="col-md-10 col-sm-12 col-12 login-main-right">

							<form class="login-form" action="forgot-password?${_csrf.parameterName}=${_csrf.token}" method="POST">
								<c:if test="${not empty success }">
	                        		<h3 style="color:green">${success}</h3>
	                        	</c:if>
	                        	<c:if test="${not empty error }">
	                        		<p style="color:red">${error}</p>
	                        	</c:if>
								<div class="login-main-header">
									<h3>Quên mật khẩu</h3>
								</div>
								<div class="input-div one">
									<h4>Email khôi phục mật khẩu</h4>
									<div class="div lg-lable">
										<input type="text" name="username"
											class="input form-control-lgin" placeholder="Nhập email">
									</div>
								</div>
								<input type="submit" name="submit"
									class="btn btn-primary float-right btn-login d-block w-100"
									value="Gửi" onclick="forgot-password(event)"/>
							</form>
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
							Copyright © 2024 <a href="#"> GoJobs</a>. All Rights Reserved.
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

	<script type="text/javascript" src="resources/js/main.js"></script>
</body>

</html>