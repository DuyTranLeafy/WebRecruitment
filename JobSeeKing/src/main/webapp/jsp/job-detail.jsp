<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>FastJob</title>
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
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<!-- main css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">

</head>

<body>
	<div class="container-fluid login-fluid clear-left clear-right">
		<div class="login-container">
			<!-- login header -->
			<div class="login-header">
				<div class="w-login m-auto">
					<div class="login-logo">
						<h3>
							<a href="${pageContext.request.contextPath}/loginSuccess"> <img
								src="${pageContext.request.contextPath}/resources/img/fast-logo.png" alt="FastJobs">
							</a>
						</h3>
						<span class="login-breadcrumb"><em>/Chi tiết việc làm</em>
						</span>
					</div>
					<div class="login-right">
						<a href="${pageContext.request.contextPath}/loginSuccess"
							class="btn btn-return">Quay lại Dashboard</a>
					</div>
				</div>
			</div>
			<!-- (end) login header -->

			<div class="clearfix"></div>

			<div class="padding-top-90"></div>

			<!-- Job detail header -->
			<div class="container-fluid job-detail-wrap">
				<div class="container job-detail">
					<div class="job-detail-header">
						<div class="row">
							<div class="col-md-2 col-sm-12 col-12">
    <div class="job-detail-header-logo">
        <a href="${pageContext.request.contextPath}">
            <img src="${pageContext.request.contextPath}/resources/img/${job.image}" class="job-logo-img" alt="job-logo">
        </a>
    </div>
</div>
							
							<div class="col-md-3 col-sm-12 col-12">
								<div class="jd-header-wrap-right">
									<div class="jd-center">
										<c:set var="USER" value="USER" />
										<c:set var="EMPLOYER" value="EMPLOYER" />
										<c:set var="ADMIN" value="ADMIN" />
										<c:choose>
											<c:when test="${not empty user}">
												<c:if test="${user eq USER}">
													<form action="${pageContext.request.contextPath}/apply?jobID=${job.job_id}" method="get">
														<input type="hidden" name="username" value="${username}" />
														<input class="btn btn-primary btn-apply" type="submit"
															name="apply" value="ỨNG TUYỂN" />
													</form>
												</c:if>
												<c:if test="${user eq ADMIN}">
													<form action="${pageContext.request.contextPath}/confirm?jobID=${job.job_id}" method="post">
														<input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}" /> <input
															class="btn btn-primary btn-apply" type="submit"
															name="apply" value="DUYỆT" />
													</form>
												</c:if>
											</c:when>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- (end) Job detail header -->

			<div class="clearfix"></div>

			<!-- Main Content and Sidebar -->
			<div class="container">
				<div class="row">
					<!-- Main wrapper -->
					<div class="col-md-8 col-sm-12 col-12">
						<div class="main-wrapper">
							<h2 class="widget-title">
								<span>Phúc lợi</span>
							</h2>
							<div class="jd-content box">${job.interest}</div>
							<h2 class="widget-title">
								<span>Mô tả công việc</span>
							</h2>
							<div class="jd-content box">${job.description}</div>
							<h2 class="widget-title">
								<span>Yêu cầu công việc</span>
							</h2>
							<div class="jd-content box">${job.job_require}</div>
						</div>
					</div>
					<!-- Sidebar -->
					<div class="col-md-4 col-sm-12 col-12">
						<div class="side-bar">
							<div class="home-ads">
								<a href="#"> <img src="${pageContext.request.contextPath}/resources/img/ads1.jpg"
									alt="Advertisement">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- (end) Phần thân -->
		</div>
	</div>
	<footer class="login-footer" style="margin-top: 5%">
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

	<script type="text/javascript" src="resources/js/main.js"></script>
</body>

</html>