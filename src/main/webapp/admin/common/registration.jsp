<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
</head>
<body>
	<c:url var="url" value="/register" />

	<c:if test="${!empty requestScope.show}">
		<div class="container pt-4" style="display: block">
			<div
				class="alert alert-${background} alert-dismissible fade show text-center">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong style="color: red;">Thông báo!</strong> ${message}
			</div>
		</div>
	</c:if>

	<div class="container mt-2">
		<form class="d-flex justify-content-center mx-auto" action="${url}"
			method="post">
			<fieldset class="border p-2">
				<h3>Registration</h3>
				<div class="row mb-3">
					<div class="col">
						<label for="exampleInputName" class="form-label">Fullname</label>
						<input type="text" class="form-control" id="exampleInputName"
							name="fullname" value="${fullname}">
					</div>
					<div class="col">
						<label for="exampleInputUsername" class="form-label">Username</label>
						<input type="text" class="form-control" id="exampleInputUsername"
							name="username" value="${username}">
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="exampleInputPass" class="form-label">Password</label>
						<input type="password" class="form-control" id="exampleInputPass"
							name="matKhau" value="${matKhau}">
					</div>
					<div class="col">
						<label for="exampleInputPass1" class="form-label">Xác nhận
							mật khẩu</label> <input type="password" value="${xacNhan}"
							class="form-control" id="exampleInputPass1" name="xacNhan">
					</div>
				</div>
				<div class="col">
					<label for="exampleInputEmail1" class="form-label">Email
						Address</label> <input type="email" class="form-control"
						id="exampleInputEmail1" name="email" value="${Email}">
				</div>
				<div class="form-group ">
					<label class="form-check-label"><input type="checkbox"
						${dieuKhoan?'checked':''} name="dieuKhoan" value="true">
						Tôi đồng ý <a href="#" class="text-decoration-none">Điều khoản</a>
						&amp; <a href="#" class="text-decoration-none">Chính sách bảo
							mật</a></label>
				</div>
				<button type="submit" class="btn btn-danger float-end">Sign
					Up</button>
			</fieldset>
		</form>
		<div class="text-center">
			Bạn đã có tài khoản? <a href="/Assignment_JAVA/login">Đăng nhập</a>
		</div>
		<div class="text-center">
			Trở về <a href="/WebMovie/index">trang chủ</a>
		</div>
	</div>
</body>
</html>