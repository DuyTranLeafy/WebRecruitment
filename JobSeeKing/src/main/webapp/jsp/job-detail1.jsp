<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	href="resources/css/bootstrap.min.css">

<!-- main css -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

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
							<a href="${pageContext.request.contextPath}/loginSuccess"> <img
								src="resources/img/fast-logo.png" alt="FastJobs">
							</a>
						</h3>
						<span class="login-breadcrumb"><em>/Chi tiết việc làm</em>
						</span>
					</div>
					<div class="login-right">
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-return">Quay lại Trang chủ</a>
					</div>
				</div>
			</div>
			<!-- (end) login header -->

			<div class="clearfix"></div>

			<div class="padding-top-90"></div>

			<!-- job detail header -->
			<div class="container-fluid job-detail-wrap">
				<div class="container job-detail">
					<div class="job-detail-header">
						<div class="row">
							<div class="col-md-2 col-sm-12 col-12">
								<div class="job-detail-header-logo">
									<a> <img src="resources/img/${job.image }"
										class="job-logo-ima" alt="job-logo">
									</a>
								</div>
							</div>
							<div class="col-md-8 col-sm-12 col-12">
								<div class="job-detail-header-desc">
									<div class="job-detail-header-title">
										<div class="job-title">
											<a>${job.title}</a>
										</div>
									</div>
									<div class="job-detail-header-company">
										<a>${job.company_name }</a>
									</div>
									<div class="job-detail-header-de">
										<ul>
											<li><i class="fa fa-map-marker icn-jd"></i><span>
													${job.city}</span></li>
											<li><i class="fa fa-usd icn-jd"></i><span><fmt:formatNumber
														value="${job.min_salary}" pattern="#,###"></fmt:formatNumber>
													- <fmt:formatNumber value="${job.max_salary}"
														pattern="#,###"></fmt:formatNumber></span></li>
											<li><i class="fa fa-calendar icn-jd"></i><span>${job.due_date}</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="main-wrapper">
							<h2 class="widget-title">
								<span>Phúc lợi</span>
							</h2>
							<!-- content -->
							<div class="jd-content">${job.interest}</div>
							<h2 class="widget-title">
								<span>Mô tả công việc</span>
							</h2>
							<div class="jd-content">${job.description}</div>
							<h2 class="widget-title">
								<span>Yêu cầu công việc</span>
							</h2>
							<div class="jd-content">${job.job_require }</div>

						</div>
					</div>
				</div>
			</div>
			<!-- (end) job detail header -->

			<div class="clearfix"></div>
		</div>
	</div>
	<footer class="login-footer"  style="margin-top: 5%">
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