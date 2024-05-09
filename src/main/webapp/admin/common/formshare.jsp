<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div class="offset-md-3 col-md-6">
	<form action="ShareVideo" method="post" class="mt-2">
		<input type="hidden" name="videoId" value="${videoId }">
		<div class="card">
			<div class="card-header">Send Video to your friend</div>
			<div class="card-body">
				<c:if test="${not empty message }">
					<div class="row">
						<div class="col">
							<div class="alert alter-sucess bg-success text-white">${message}</div>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty error }">
					<div class="row">
						<div class="col">
							<div class="alert alter-danger bg-warning text-dark">${error}</div>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label for="email">Your Friend's Email</label> <input type="email"
						class="form-control" name="email" id="email"
						aria-describedby="emailHelperId" placeholder="Email"> <small
						id="emailHelperId" class="form-text text-muted">Email is
						required</small>
				</div>
			</div>
			<div class="card-footer">
				<!-- Sử dụng lớp CSS của Bootstrap -->
				<button type="submit" class="btn btn-success">Send</button>
				<a href="index" class="btn btn-primary">Home</a>
			</div>
		</div>
	</form>
</div>
</body>
</html>