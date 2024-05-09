<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
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
<base href="/Assignment_JAVA/" />
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${!empty check}">
		<div class="container pt-4" style="display: block">
			<div
				class="alert alert-${backround} alert-dismissible fade show text-center">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong style="color: red;">Thông báo!</strong> ${message}
			</div>
		</div>
	</c:if>
	<div class="container mt-2">
		<form action="/ProfileServlet" method="post"
			class="d-flex justify-content-center mx-auto">
			<fieldset class="border p-2">
				<h3>Edit Profile</h3>
				<div class="row mb-3">
					<div class="col">
						<label for="exampleInputUsername" class="form-label">Username</label>
						<input type="text" class="form-control" id="username"
							name="username" readonly="readonly" value="${user.username}">
					</div>
					<div class="col">
						<label for="exampleInputPass" class="form-label">Password</label>
						<input type="password" class="form-control" id="matKhau"
							name="matKhau" required="required" value="${user.matKhau}">
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="exampleInputName" class="form-label">Fullname</label>
						<input type="text" class="form-control" id="fullname"
							name="fullname" required="required" value="${user.fullname}">
					</div>
					<div class="col">
						<label for="exampleInputEmail1" class="form-label">Email
							Address</label> <input type="email" class="form-control" id="email"
							name="email" required="required" value="${user.email }">
					</div>
				</div>
				<button type="submit" class="btn btn-danger float-end"
					formaction="ProfileServlet">Update</button>
			</fieldset>
		</form>
	</div>
</body>
</html>