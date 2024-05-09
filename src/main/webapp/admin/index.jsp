<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Index</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/675bbfe78c.js"
	crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css"
	rel="stylesheet">
<style type="text/css">
.overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 100%;
	width: 100%;
	opacity: 0;
	transition: .5s ease;
}

.image:hover .overlay {
	opacity: 1;
}

.detail {
	color: #fff;
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<base href="/Assignment_JAVA/" />

</head>
<body>
	<div id="top"></div>
	<!-- Tag header -->
	<jsp:include page="common/header.jsp"></jsp:include>

	<!-- Tag Phim chiếu rạp -->
	<div class="container container-2">
		<h1 class="text-center">PHIM HOT HIỆN NAY</h1>
		<div class="d-flex justify-content-center">
			<hr class="my-4 w-25 border-4">
		</div>
		<div class="row">
			<%-- <c:forEach var="item" items="${video}">
				<div class="col-md-4 product-grid">
					<div class="image">
						<a href="/Assignment_JAVA/detailMovie/${item.videoId}"> <img src="${item.poster}"
							class="w-100">
							<div class="overlay">
								<div class="detail">Xem chi tiết</div>
								
							</div>
						</a>
					</div>
					<h5 class="text-center">
						<a href="#" data-toggle="tooltip" data-placement="top" class="mt-2 text-decoration-none"
							title="${item.title}">${item.title}</a>
					</h5>
					<h5 class="text-center">Thời lượng: ${item.thoiLuong} phút</h5>
					<a href="/Assignment_JAVA/detailMovie/${item.videoId}" class="btn btn-outline-primary mb-3 mx-2 d-block">Xem phim</a>
				</div>
			</c:forEach> --%>

			<c:forEach var="video" items="${videoList}">
				<div class="col-md-4 product-grid">
					<div class="image">
						<a href="/Assignment_JAVA/detailMovie?videoId=${video.videoId}">
							<!-- Thêm videoId vào URL --> <img src="${video.poster}"
							class="w-100">
							<div class="overlay">
								<div class="detail">Xem chi tiết</div>
							</div>
						</a>
					</div>
					<h5 class="text-center">
						<a href="#" data-toggle="tooltip" data-placement="top"
							class="mt-2 text-decoration-none" title="${video.title}">${video.title}</a>
					</h5>
					<h5 class="text-center">Thời lượng: ${video.thoiLuong} phút</h5>
					<form action="/Assignment_JAVA/index" method="post">
						<!-- Sử dụng method POST -->
						<input type="hidden" name="videoId" value="${video.videoId}">
						<!-- Thêm input hidden chứa videoId -->
						<button type="submit"
							class="btn btn-outline-primary mb-3 mx-2 d-block">Xem
							phim</button>
						<!-- Thay đổi thành button type submit -->
					</form>
				</div>
			</c:forEach>

		</div>
	</div>
	<!-- Tag Phim chiếu rạp -->

	<!-- Tag To top -->
	<a href="#top" class="to-top"> <i class="fas fa-chevron-up"></i>
	</a>
	<!-- Tag To top -->

	<!-- Tag Footer -->
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- Tag Footer -->
</body>
</html>