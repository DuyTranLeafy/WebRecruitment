<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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



<!-- Font Awesome -->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<!-- select 2 css -->
<link rel="stylesheet" href="resources/css/select2.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Owl Stylesheets -->
<link rel="stylesheet"
	href="resources/css/owlcarousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/css/owlcarousel/owl.theme.default.min.css">
<!-- main css -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>

<body>
	<!-- main nav -->
	<div class="container-fluid fluid-nav">
		<div class="container cnt-tnar">
			<nav class="navbar navbar-expand-lg navbar-light bg-light tjnav-bar">
				<!-- <a class="navbar-brand" href="#">Navbar</a> -->
				<a href="#" class="nav-logo"> <img
					src="resources/img/fast-logo.png">
				</a>
				<button class="navbar-toggler tnavbar-toggler" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<!-- <span class="navbar-toggler-icon"></span> -->
					<i class="fa fa-bars icn-res" aria-hidden="true"></i>

				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto my-2 my-lg-0 tnav-right tn-nav">
						<li class="nav-item dropdown"><a
							class="nav-link btn btn-employers dropdown-toggle" href="#"
							id="navbarDropdown" tabindex="-1" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-disabled="true">${username}</a>
							<div class="dropdown-menu tdropdown"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="${pageContext.request.contextPath}/loginSuccess">Dashboard</a> 
								<a class="dropdown-item" href="${pageContext.request.contextPath}/doLogout?${_csrf.parameterName}=${_csrf.token}">Đăng xuất</a>
							</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!-- (end) main nav -->

	<div class="clearfix"></div>

	<!-- main banner -->
	<div class="container-fluid clear-left clear-right">
		<div class="main-banner">
			<div class="banner-image">
				<img src="resources/img/banner2.jpg" alt="banner-image">
			</div>
		</div>
	</div>
	<!-- (end) main banner -->

	<!-- search section -->
	<div class="container-fluid search-fluid">
		<div class="container">
			<div class="search-wrapper" style="margin-top: -5rem;">

				<ul class="nav nav-tabs search-nav-tabs" id="myTab" role="tablist">
					<li class="nav-item search-nav-item">
    <a class="nav-link" href="<c:url value="/?loggedin=employer&name=${username}"/>">TRANG CHỦ</a>
</li>
					<!-- <li class="nav-item search-nav-item">
                        <a class="nav-link snav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                    </li>
                    <li class="nav-item search-nav-item">
                        <a class="nav-link snav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">About</a>
                    </li> -->
				</ul>
				<div class="tab-content search-tab-content" id="myTabContent">
					<!-- content tab 1 -->
					<div class="tab-pane stab-pane fade show active" id="home"
						role="tabpanel" aria-labelledby="home-tab">
						<form class="bn-search-form">
							<div class="row">
								<div class="col-md-10 col-sm-12">
									<div class="input-group s-input-group">
										<input type="text" class="form-control sinput"
											placeholder="Nhập công việc hoặc ngành nghề"> <span><i
											class="fa fa-search"></i></span>
									</div>
								</div>
								<div class="col-md-2 col-sm-12">
									<button type="submit"
										class="btn btn-primary btn-search col-sm-12">Tìm kiếm</button>
								</div>
							</div>
						</form>
					</div>
					<!-- (end) content tab 1 -->
					<!-- content tab 2 -->
					<div class="tab-pane stab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<form class="bn-search-form">
							<div class="row">
								<div class="col-md-10 col-sm-12">
									<div class="input-group s-input-group w-100">
										<input type="text" class="form-control sinput"
											placeholder="Nhập công việc, ngành nghề..."> <span><i
											class="fa fa-search"></i></span>
									</div>
								</div>
								<div class="col-md-2 col-sm-12">
									<button type="submit"
										class="btn btn-primary btn-search col-sm-12">Tìm kiếm</button>
								</div>
							</div>
						</form>
					</div>
					<!-- (end) content tab 2 -->
				</div>

			</div>
		</div>
	</div>
	<!-- (end) search section -->

	<!-- job board & sidebar section  -->
	<div class="container-fluid jb-wrapper">
		<div class="container">
			<div class="row">
				<!-- job board -->
				<div class="col-md-12 col-sm-12 col-12">
					<div class="job-board-wrap">
						<div class="job-content">
							<div class="job-desc">
								<h2 class="widget-title">
									<span>Danh sách ứng viên</span>
								</h2>
							</div>
						</div>
						<c:choose>
							<c:when test="${not empty profileCVs }">
								<c:forEach var="profileCV" items="${profileCVs}">
									<div class="job-group">
										<div class="job pagi">
											<div class="job-content">

												<div class="job-desc">
													<div class="job-title">
														<a >${profileCV.name}</a>
													</div>
													<div class="job-company">
														<a>Số điện thoại: ${profileCV.phone }</a>
													</div>
													<div class="job-company">
														<a>Địa chỉ: ${profileCV.address }</a>
													</div>
													<div class="job-company">
														<a>Giới tính: ${profileCV.sex }</a>
													</div>
													<div class="job-company">
														<a href="resources/file_cv/${profileCV.file_cv }" style="color:blue"
														download='${fn:substring(profileCV.file_cv, 0, fn:indexOf(profileCV.file_cv, "\\.")) }'>
        												<img src="resources/img/download-file.png" alt="File Icon">Tải CV</a>
													</div>
												</div>
											</div>
										</div>

									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="job-group">
									<div class="job pagi">
										<div class="job-content">
											<div class="job-desc">
												<div class="job-title">
													<a>Không có ứng viên</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>

				</div>
				<!-- (end) job board -->
			</div>
		</div>
	</div>
	<!-- (end) job board & sidebar section  -->



	<!-- footer -->
	<div class="container-fluid footer-wrap  clear-left clear-right">
		<div class="container footer">
			<div class="row">
				<div class="col-md-6 col-sm-12 col-12">
					<ul class="footer-contact">
						<li><a href="#"> <i class="fa fa-phone fticn"></i> +123
								456 7890
						</a></li>
						<li><a href="#"> <i class="fa fa-envelope fticn"></i>
								demo@123.com
						</a></li>
						<li><a href="#"> <i class="fa fa-map-marker fticn"></i>
								Số 1, Võ Văn Ngân, Thủ Đức, Thành phố Hồ Chí Minh
						</a></li>
					</ul>
				</div>
				<div class="col-md-6 col-sm-12 col-12">
					<h2 class="footer-heading">
						<span>Giới thiệu</span>
					</h2>
					<p class="footer-content">Dẫn đầu trong việc nâng cao cuộc sống qua việc kết nối ứng viên với cơ hội việc làm. 
					Chúng tôi cam kết mang đến sự hài lòng cho cả nhà tuyển dụng và người tìm việc thông qua nền tảng tìm việc hiệu quả và thuận tiện.</p>
				</div>


			</div>
		</div>
	</div>

	<footer class="container-fluid copyright-wrap">
		<div class="container copyright">
			<p class="copyright-content">
			<p style="color: white;">
				Copyright © 2024 <a href="#"> GoJob</b></a>. All Right
				Reserved.
			</p>
		</div>
	</footer>


	<!-- (end) footer -->


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/readmore.js"></script>
	<script type="text/javascript">
		$('.catelog-list')
				.readmore(
						{
							speed : 75,
							maxHeight : 150,
							moreLink : '<a href="#">Xem thêm<i class="fa fa-angle-down pl-2"></i></a>',
							lessLink : '<a href="#">Rút gọn<i class="fa fa-angle-up pl-2"></i></a>'
						});
	</script>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="resources/js/jquery-3.4.1.slim.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/select2.min.js"></script>
	<script src="resources/js/jobdata.js"></script>

	<!-- <script type="text/javascript" src="js/pagination.js"></script> -->
	<!-- Owl Stylesheets Javascript -->
	<script src="resources/js/owlcarousel/owl.carousel.js"></script>
	<!-- Read More Plugin -->
</body>

</html>