<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login - FastJobs</title>
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

                            <form class="login-form" action="doLogin" method="POST" id="form-login">
                                <c:if test="${not empty success }">
                                    <h3 style="color: green">${success}</h3>
                                </c:if>
                                <c:set var="errorParam" value="${param['error'] }"></c:set>
                                <c:if test="${errorParam eq 'true'}">
                                    <p style="color:red">Email hoặc mật khẩu không chính xác.</p>
                                </c:if>
                                <div class="login-main-header">
                                    <h3>ĐĂNG NHẬP</h3>
                                </div>

                                <div class="input-div one">
                                    <h4>Email</h4>
                                    <div class="div lg-lable">
                                        <input type="text" name="username" id="email"
                                            class="input form-control-lgin" placeholder="Nhập email" onchange="changeEmailBorderColor()">
                                    </div>
                                </div>
                                <div class="input-div pass">
                                    <h4>Password</h4>
                                    <div class="div lg-lable">
                                        <input type="hidden" name="${_csrf.parameterName}"
                                            value="${_csrf.token}" />
                                        <input type="password" name="password" class="input form-control-lgin"
                                            onchange="changePasswordBorderColor()"
                                            placeholder="Nhập password">
                                    </div>
                                </div>
                                <c:set var="USER" value="USER" />
                                <c:set var="EMPLOYER" value="EMPLOYER" />
                                <c:choose>
                                    <c:when test="${not empty user }">
                                        <c:if test="${user eq USER}">
                                            <c:set var="url" value="register?user=USER"></c:set>
                                        </c:if>
                                        <c:if test="${user eq EMPLOYER}">
                                            <c:set var="url" value="register?user=EMPLOYER"></c:set>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="url" value="register?user=NONE"></c:set>
                                    </c:otherwise>
                                </c:choose>
                                <div class="form-group d-block frm-text">
                                    <a href="forgot-password" class="fg-login d-inline-block">Quên
                                        mật khẩu</a>
                                    <a href="${url }"
                                        class="fg-login float-right d-inline-block">Bạn chưa có
                                        tài khoản? Đăng ký</a>
                                </div>
                                <input type="submit" name="submit"
                                    class="btn btn-primary float-right btn-login d-block w-100" onclick="login(event)"
                                    value="Đăng Nhập" />
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
    <script src="resources/js/form.js"></script>

    <script type="text/javascript" src="resources/js/main.js"></script>
</body>

</html>
