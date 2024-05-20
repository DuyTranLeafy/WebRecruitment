<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Recruitment - FastJob</title>
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
							<a href="#"> <img src="resources/img/fast-logo.png"
								alt="FastJobs">
							</a>
						</h3>
						<span class="login-breadcrumb"><em>/</em> Recruitment</span>
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
                            <img src="resources/img/recruiment_form.jpg">
                        </div>
						<!-- login main form -->
						<div class="col-md-7 col-sm-12 col-12 login-main-right">

							<form:form class="login-form reg-form" id="form-recruitment"
								action="recruitment?username=${username }"
								method="POST" modelAttribute="jobCompany" accept-charset="UTF-8">
								<input type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" />
								<c:if test="${not empty success }">
	                        		<h3 style="color:green">${success}</h3>
	                        	</c:if>
								<c:if test="${not empty error }">
									<p style="color: red">${error}</p>
								</c:if>
								<div class="login-main-header">
									<h3>Đăng tin tuyển dụng</h3>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Tiêu
										đề<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="text" id="title" path="title" class="form-control"
											placeholder="Nhập tiêu đề" onchange="changeTiltleBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Số lượng cần tuyển<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="number" id="quantity" path="quantity" min="1" value="1" class="form-control" placeholder="Nhập số lượng" onchange="changeQuantityBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Lương thấp nhất
									<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="text" id="min-salary" path="min_salary" class="form-control" 
											placeholder="Nhập bằng số" onchange="changeMinsalaryBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Lương cao nhất
									<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="text" id="max-salary" path="max_salary" class="form-control"
											placeholder="Nhập bằng số" onchange="changeMaxSalaryBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Mô
										tả công việc<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:textarea class="form-control" id="description" path="description"
											placeholder="Nhập mô tả công việc" rows="5" onchange="changeDescriptionBorderColor()"></form:textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Yêu
										cầu công việc<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:textarea class="form-control" id="require" path="job_require"
											placeholder="Nhập yêu cầu công việc" rows="5" onchange="changeRequireBorderColor()"></form:textarea>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Quyền
										lợi<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:textarea class="form-control" id="interest" path="interest"
											placeholder="Quyền lợi công việc" rows="5" onchange="changeInterestBorderColor()"></form:textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Ngành nghề
									<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:select id="profession" path="profession" class="form-control" onchange=" changeProfessionBorderColor()">
											<option selected="selected" value="">Chọn ngành nghề</option>
											<option>Kinh doanh</option>
											<option>Bán hàng</option>
											<option>Chăm sóc khách hàng</option>
											<option>Tài chính/Kế toán/Kiểm toán</option>
											<option>Hành chính/Thư ký/Trợ lý</option>
											<option>Lao động phổ thông</option>
											<option>Cơ khí/Kĩ thuật ứng dụng</option>
											<option>Sinh viên/Mới tốt nghiệp/Thực tập</option>
											<option>Điện/Điện tử/Điện lạnh</option>
											<option>Báo chí/Biên tập viên</option>
											<option>Bảo vệ/Vệ sĩ/An ninh</option>
											<option>Bất động sản</option>
											<option>Biên dịch/Phiên dịch</option>
											<option>Bưu chính viễn thông</option>
											<option>Công nghệ thông tin</option>
											<option>Dầu khí/Địa chất</option>
											<option>Dệt may</option>
											<option>Du lịch/Nhà hàng/Khách sạn</option>
											<option>Dược/Hóa chất/Sinh hóa</option>
											<option>Giải trí/Vui chơi</option>
											<option>Giáo dục/Đào tạo/Thư viện</option>
											<option=>Giao thông/Vận tải/Thủy lợi/Cầu
												đường</option>
											<option>Giày da/Thuộc da</option>
											<option>Khác</option>
											<option>Kho vận/Vật tư/Thu mua</option>
											<option>Khu chế xuất/Khu công nghiệp</option>
											<option>Kiến trúc/Nội thất</option>
											<option>Làm đẹp/Thể lực/Spa</option>
											<option>Luật/Pháp lý</option>
											<option>Môi trường/Xử lý chất thải</option>
											<option>Mỹ phẩm/Thời trang/Trang sức</option>
											<option>Ngân hàng/Chứng khoán/Đầu tư</option>
											<option>Nghệ thuật/Điện ảnh</option>
											<option>Ngoại ngữ</option>
											<option>Nhân sự</option>
											<option>Nông/Lâm/Ngư nghiệp</option>
											<option>PG/PB/Lễ tân</option>
											<option>Phát triển thị trường</option>
											<option>Phục vụ/Tạp vụ/Giúp việc</option>
											<option>Quan hệ đối ngoại</option>
											<option>Quản lý điều hành</option>
											<option>Quảng cáo/Marketing/PR</option>
											<option>Sản xuất/Vận hành sản xuất</option>
											<option>Tài xế/Lái xe/Giao nhận</option>
											<option>Thẩm định/Giám định/Quản lý chất
												lượng</option>
											<option>Thể dục/Thể thao</option>
											<option>Thiết kế/Mỹ thuật</option>
											<option>Thời vụ/Bán thời gian</option>
											<option>Thực phẩm/DV ăn uống</option>
											<option>Trang thiết bị công nghiệp</option>
											<option>Trang thiết bị gia dụng</option>
											<option>Trang thiết bị văn phòng</option>
											<option>Tư vấn bảo hiểm</option>
											<option>Xây dựng</option>
											<option>Xuất-Nhập khẩu/Ngoại thương</option>
											<option>Y tế</option>
										</form:select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Nơi làm việc
									<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:select id="city" path="city" class="form-control" onchange="changeCityBorderColor()">
											<option>Hồ Chí Minh</option>
											<option>Hà Nội</option>
											<option>An Giang</option>
											<option>Bạc Liêu</option>
											<option>Bà Rịa-Vũng Tàu</option>
											<option>Bắc Cạn</option>
											<option>Bắc Giang</option>
											<option>Bắc Ninh</option>
											<option>Bến Tre</option>
											<option>Bình Dương</option>
											<option>Bình Định</option>
											<option>Bình Phước</option>
											<option>Bình Thuận</option>
											<option>Cao Bằng</option>
											<option>Cà Mau</option>
											<option>Cần Thơ</option>
											<option>Đà Nẵng</option>
											<option>Đắk Lắk</option>
											<option>Đắk Nông</option>
											<option>Điện Biên</option>
											<option>Đồng Nai</option>
											<option>Đồng Tháp</option>
											<option>Gia Lai</option>
											<option>Hà Giang</option>
											<option>Hà Nam</option>
											<option>Hà Tĩnh</option>
											<option>Hải Dương</option>
											<option>Hải Phòng</option>
											<option>Hậu Giang</option>
											<option>Hòa Bình</option>
											<option>Hưng Yên</option>
											<option>Khánh Hòa</option>
											<option>Kiên Giang</option>
											<option>Kon Tum</option>
											<option>Lai Châu</option>
											<option>Lạng Sơn</option>
											<option>Lào Cai</option>
											<option>Lâm Đồng</option>
											<option>Long An</option>
											<option>Nam Định</option>
											<option>Nghệ An</option>
											<option>Ninh Bình</option>
											<option>Ninh Thuận</option>
											<option>Phú Thọ</option>
											<option>Phú Yên</option>
											<option>Quảng Bình</option>
											<option>Quảng Nam</option>
											<option>Quảng Ngãi</option>
											<option>Quảng Ninh</option>
											<option>Quảng Trị</option>
											<option>Sóc Trăng</option>
											<option>Sơn La</option>
											<option>Tây Ninh</option>
											<option>Thái Bình</option>
											<option>Thái Nguyên</option>
											<option>Thanh Hóa</option>
											<option>Thừa Thiên-Huế</option>
											<option>Tiền Giang</option>
											<option>Trà Vinh</option>
											<option>Tuyên Quang</option>
											<option>Vĩnh Long</option>
											<option>Vĩnh Phúc</option>
											<option>Yên Bái</option>
											<option>Toàn quốc</option>
											<option>Nước ngoài</option>
										</form:select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Hạn
										nộp hồ sơ<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:input type="date" id="due-date" path="due_date" class="form-control" onchange="changeDueDateBorderColor()"/>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-3 col-form-label text-right label">Gói tin
									<span style="color: red" class="pl-2">*</span>
									</label>
									<div class="col-sm-9">
										<form:select id="fee" path="fee" class="form-control" onchange=" changeProfessionBorderColor()">
											<option>Free</option>
											<option>Premium</option>
										</form:select>
									</div>
								</div>
								<br/>
								<input type="submit"
									class="btn btn-primary float-right btn-login d-block w-100" onclick="recruitment(event)"
									value="Lưu tin">
								<div class="form-group d-block w-100 mt-5">
									<div class="text-or text-center"></div>
								</div>
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