<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

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
	<c:url var="urlUser" value="/editUser/index" />
	<jsp:include page="../common/headeadmin.jsp"></jsp:include>
	<div class="container-fluid mb-5">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="edituser-tab"
					data-bs-toggle="tab" data-bs-target="#edituser" type="button"
					role="tab" aria-controls="edituser" aria-selected="true">User
					Edition</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="User-tab" data-bs-toggle="tab"
					data-bs-target="#User" type="button" role="tab"
					aria-controls="User" aria-selected="false">User</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="edituser" role="tabpanel"
				aria-labelledby="edituser-tab" tabindex="0">
				<div class="container">
					<div class="row mt-2">
						<div class="col">
							<c:if test="${not empty message}">
								<div class="alert alert-success">${message}</div>
							</c:if>
							<c:if test="${not empty error}">
								<div class="alert alert-danger">${error}</div>
							</c:if>
						</div>
					</div>
					<div class="col-md-8">
						<form action="${urlUser}" method="post">
							<label for="exampleInputUsername" class="form-label">Username?</label>
							<input type="text" class="form-control" id="username"
								required="required" name="username" value="${user.username }">
							<label for="exampleInputPass" class="form-label">Password?</label>
							<input type="password" class="form-control" id="matKhau"
								name="matKhau" required="required" value="${user.matKhau }">
							<label for="exampleInputName" class="form-label">Fullname?</label>
							<input type="text" class="form-control" id="fullname"
								name="fullname" required="required" value="${user.fullname }">
							<label for="exampleInputEmail1" class="form-label">Email
								Address?</label> <input type="email" class="form-control" id="email"
								required="required" name="email" value="${user.email }">
							<label for="Active" class="me-2 ">Role </label> <label for=""
								class="ms-4">Admin <input type="radio"
								class="form-check-input" id="admin" name="admin" value="true"
								${!user.admin? 'checked':''}>
							</label> <label for="" class="ms-4">Người dùng <input
								type="radio" class="form-check-input" id="custome" name="admin"
								value="false" ${user.admin? 'checked':''}>
							</label>
							<div class="btn-group-lg my-2 float-end my-3">
								<button type="submit" class="btn btn-primary"
									formaction="editUser/update">Update</button>
								<button type="submit" class="btn btn-primary"
									formaction="editUser/delete">Delete</button>
								<button type="submit" class="btn btn-primary"
									formaction="editUser/reset">Reset</button>
							</div>
						</form>
					</div>

				</div>
			</div>
			<div class="tab-pane fade" id="User" role="tabpanel"
				aria-labelledby="User-tab" tabindex="0">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<table class="table table-bordered mt-2">
								<thead>
									<tr>
										<th>Username</th>
										<th>Fullname</th>
										<th>Email</th>
										<th>Role</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${users}">
										<tr>
											<td>${item.username}</td>
											<td>${item.fullname}</td>
											<td>${item.email}</td>
											<td>${item.admin?'Admin':'Người dùng'}</td>
											<td><a class="btn btn-primary btn-sm"
												data-toggle="modal"
												href="editUser/edit?username=${item.username}">Edit</a> | <a
												class="btn btn-danger btn-sm"
												href="editUser/delete?username=${item.username}">Xóa</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>