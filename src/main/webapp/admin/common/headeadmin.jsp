<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/logout"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<base href="/Assignment_JAVA/">
</head>
<body>
	<header class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="#"> <img
			src="https://i.pinimg.com/736x/be/f1/a7/bef1a7357e78a802ff8a5a3ffff2fba0.jpg"
			class="rounded-circle mx-2" height="55">
		</a>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
			<li class="nav-link">LeonMovieHub</li>
				<li class="nav-item"><a class="nav-link"
					href="/Assignment_JAVA/admin/video" role="button">Video</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/Assignment_JAVA/editUser/index" role="button">Users</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/Assignment_JAVA/ReportsManagementServlet" role="button">Reports</a></li>
			</ul>

			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="bi bi-globe"></i> VietNam</a></li>
				<c:if test="${empty sessionScope.taiKhoan}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navdrop"
						data-bs-toggle="dropdown"> <i class="fas fa-sign-in-alt"></i>
							Đăng nhập / Đăng ký
					</a>
						<div class="dropdown-menu dropdown-menu-end">
							<a class="dropdown-item" href="/Assignment_JAVA/login">Đăng nhập</a>
							<hr>
							<a class="dropdown-item" href="/Assignment_JAVA/register">
								Đăng ký</a>
						</div></li>
				</c:if>
				<c:if test="${!empty sessionScope.taiKhoan}">
					<li class="nav-item dropdown" id="Login"><a
						style="width: 180px;" class="nav-link dropdown-toggle" href="#"
						id="navdrop" data-toggle="dropdown"> <i
							class="fas fa-user-circle"></i> ${sessionScope.taiKhoan}
					</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/Assignment_JAVA/ProfileServlet">Thông tin</a>
							<hr>
							<a class="dropdown-item" href="${url}">Đăng xuất</a>
						</div></li>
				</c:if>
			</ul>
		</div>
	</header>
</body>
</html>