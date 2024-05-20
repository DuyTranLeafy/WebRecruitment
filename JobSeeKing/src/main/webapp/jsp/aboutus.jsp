<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>FindJOB</title>
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
						<!--begin chinhsua-->
						<li class="nav-item dropdown"><a
							class="nav-link btn btn-employers dropdown-toggle" href="#"
							id="navbarDropdown" tabindex="-1" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-disabled="true">Người Tìm Việc</a>
							<div class="dropdown-menu tdropdown"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="register?user=USER">Đăng
									ký</a> <a class="dropdown-item" href="login?user=USER">Đăng
									nhập</a>
							</div></li>
					
						<!--end chinhsua-->
						<!-- <li class="nav-item"><a class="nav-link"
							href="register?user=USER">Đăng Ký</a></li>
						<li class="nav-item"><a class="nav-link"
							href="login?user=USER">Đăng Nhập</a></li> -->
							
						<li class="nav-item dropdown"><a
							class="nav-link btn btn-employers dropdown-toggle" href="#"
							id="navbarDropdown" tabindex="-1" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							aria-disabled="true">Nhà Tuyển Dụng</a>
							<div class="dropdown-menu tdropdown"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="register?user=EMPLOYER">Đăng
									ký</a> <a class="dropdown-item" href="login?user=EMPLOYER">Đăng
									nhập</a>
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
			<div class="search-wrapper" style="margin-top: -2rem;">

				<ul class="nav nav-tabs search-nav-tabs" id="myTab" role="tablist">
					<li class="nav-item search-nav-item"><a class="nav-link"
						href="./">TRANG CHỦ</a></li>
					<c:set var="user" value="user" />
					<c:set var="employer" value="employer" />
					<c:set var="admin" value="admin" />
					<c:choose>
						<c:when test="${not empty isLoggedin }">
							<c:if test="${isLoggedin eq user}">
								<li class="nav-item search-nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/loginSuccess">VIỆC
										LÀM</a></li>
							</c:if>
							<c:if test="${isLoggedin eq employer}">
								<li class="nav-item search-nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/loginSuccess">NHÀ
										TUYỂN DỤNG</a></li>
							</c:if>
							<c:if test="${isLoggedin eq admin}">
								<li class="nav-item search-nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/loginSuccess">QUẢN
										TRỊ VIÊN</a></li>
							</c:if>
						</c:when>
					</c:choose>
					<li class="nav-item search-nav-item"><a class="nav-link"
						href="#">VỀ CHÚNG TÔI</a></li>
					<!-- <li class="nav-item search-nav-item">
                        <a class="nav-link snav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
                    </li>
                    <li class="nav-item search-nav-item">
                        <a class="nav-link snav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">About</a>
                    </li> -->
				</ul>
			</div>
		</div>
	</div>
	<!-- (end) search section -->

	<!--about us-->
	<div class="container job-board2">
	<div class="row">
	<div class="col-md-12 job-board2-wrap-header">
					<h3>About US</h3>
	<p style="font-size: 20px;line-height: 1.5;font-weight:bold;">Đồ án Thương mại điện tử<br>
Trần Văn Bảo Duy - 21110155<br>
<br>
Nguyễn Kim Hồng - 21110829<br>
<br>
Nguyễn Nhất Huy - 21110830<br>
<br>
Trương Thị Thùy Dung - 21110820<br>
<br>
Nguyễn Bảo Đăng Khoa - 21110212<br>
Đây là project cuối kỳ của nhóm chúng em.Chúng em cảm ơn thầy đã dành thời gian xem qua ạ.</p>
	</div>
	</div>
	</div>
	<div class="clearfix"></div>


	<script>
		$(document).ready(function() {
			var owl = $('.owl-carousel');
			owl.owlCarousel({
				loop : true,
				margin : 10,
				nav : true,
				autoplay : true,
				autoplayTimeout : 3000,
				autoplayHoverPause : true,
				responsiveClass : true,
				responsive : {
					0 : {
						items : 2,
						nav : true,
						slideBy : 2,
						dots : false
					},
					600 : {
						items : 4,
						nav : false,
						slideBy : 2,
						dots : false
					},
					1000 : {
						items : 6,
						nav : true,
						loop : false,
						slideBy : 2
					}
				}
			});
		})
	</script>
	<!-- (end) job board v2 -->

	<div class="clearfix"></div>

	

	<!-- job support -->
	<div class="container-fluid job-support-wrapper">
		<div class="container-fluid job-support-wrap">
			<div class="container job-support">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-12 d-flex text-center w-100">
						<ul class="spp-list justify-content-center">
							<li><span><i class="fa fa-question-circle pr-2 icsp"></i>Hỗ
									trợ nhà tuyển dụng:</span></li>
							<li><span><i class="fa fa-phone pr-2 icsp"></i> +84 123456789</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- (end) job support -->

	<!-- footer -->
	<div class="container-fluid footer-wrap  clear-left clear-right">
		<div class="container footer">
			<div class="row">
				<div class="col-md-6 col-sm-12 col-12">
					<ul class="footer-contact">
						<li><a href="#"> <i class="fa fa-phone fticn"></i> +84 123456789
						</a></li>
						<li><a href="#"> <i class="fa fa-envelope fticn"></i>
								bomonThuongMaiDienTu@gmail.com
						</a></li>
						<li><a href="#"> <i class="fa fa-map-marker fticn"></i>
								Số 1 Võ Văn Ngân, Thủ Đức, Thành phố Hồ Chí Minh
						</a></li>
					</ul>
				</div>
				<div class="col-md-6 col-sm-12 col-12">
					<h2 class="footer-heading">
						<span>Giới thiệu</span>
					</h2>
					<p class="footer-content">Dẫn đầu trong việc nâng cao cuộc sống
						qua việc kết nối ứng viên với cơ hội việc làm. Chúng tôi cam kết
						mang đến sự hài lòng cho cả nhà tuyển dụng và người tìm việc thông
						qua nền tảng tìm việc hiệu quả và thuận tiện.</p>
				</div>


			</div>
		</div>
	</div>

	<footer class="container-fluid copyright-wrap">
		<div class="container copyright">
			<p class="copyright-content">
				Copyright © 2024 <a href="#"> FindJob</a>. All Right Reserved.
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

</body>

</html>