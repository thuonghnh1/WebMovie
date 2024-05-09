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
	<jsp:include page="../common/header.jsp"></jsp:include>
	<%-- <c:if test="${not empty requestScope.error}">
    <div class="container pt-4">
        <div class="alert alert-danger alert-dismissible fade show text-center">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <strong>Error!</strong> ${requestScope.error}
        </div>
    </div>
</c:if> --%>
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
	<c:if test="${not empty favoriteVideos}">
	<div class="container container-2">
		<h1 class="text-center">YÊU THÍCH</h1>
		<hr class="line">
		<div class="row">
			<c:forEach var="video" items="${favoriteVideos}">
				<div class="col-md-3 product-grid">
					<div class="image">
						<a href="/Assignment_JAVA/detailMovie/${video.videoId}"> <img
							src="${video.poster}" class="w-100">
							<div class="overlay2">
								<div class="detail">Xem chi tiết</div>
							</div>
						</a>
					</div>
					<h5 class="text-center">
						<a href="/Assignment_JAVA/detailMovie/${video.videoId}"
							data-toggle="tooltip" data-placement="top" title="${video.title}">${video.title}</a>
					</h5>
					<h5 class="text-center">Thời lượng: ${video.thoiLuong} phút</h5>
					<form
						action="/Assignment_JAVA/page/favorite/dislike/${video.videoId}"
						method="post">
						<button type="submit" class="btn buy">Bỏ thích</button>
					</form>
				</div>
			</c:forEach>

		</div>
	</div>
	</c:if>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>