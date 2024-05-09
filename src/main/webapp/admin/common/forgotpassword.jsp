<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<c:url var="url" value="/FindPassword" />

	<c:if test="${!empty requestScope.show}">
		<div class="container pt-4" style="display: block">
			<div
				class="alert alert-${backround} alert-dismissible fade show text-center">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong style="color: red;">Thông báo!</strong> ${message}
			</div>
		</div>
	</c:if>
<div class="container mt-2">
        <form action="${url}" method="post" class="d-flex justify-content-center mx-auto">
            <fieldset class="border p-2">
                <h3>Forgot Password</h3>
                <div class="mb-3">
                    <label for="exampleInputUsername" class="form-label">Username?</label>
                    <input type="text" class="form-control" id="exampleInputName" name="username" value="${username}">
                    <label for="exampleInputEmail1" class="form-label">Email?</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" name="email" value="${email}">
                </div>
                <button type="submit" class="btn btn-danger float-end">Retrieve</button>
            </fieldset>
        </form>
        <div class="text-center">
			Trở về <a href="/WebMovie/index">trang chủ</a>
		</div>
		<div class="text-center">
		<a href="/Assignment_JAVA/login">Đăng nhập</a>
		</div>
    </div>
</body>
</html>