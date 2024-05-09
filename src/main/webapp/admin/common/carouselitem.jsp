<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- Thẻ Nav -->

	<!-- Tag Slide-show -->
	<div id="carouselExample" class="carousel slide">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://cdn.galaxycine.vn/media/2024/4/4/pht-2048_1712199059507.jpg"
					height="100%" width="100%">
				<div class="carousel-caption">
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Đặt
						vé</button>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://cdn.galaxycine.vn/media/2024/4/2/18x2-2048_1712028163819.jpg"
					height="100%" width="100%">
				<div class="carousel-caption">
					<h3>Phim sắp chiếu</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Đặt
						vé</button>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://cdn.galaxycine.vn/media/2024/4/2/mobile-suit-gundam-seed-freedom-3_1712027621954.jpg"
					height="100%" width="100%">
				<div class="carousel-caption">
					<h3>Phim sắp chiếu</h3>
					<button type="button" class="btn btn-outline-light btn-lg">
						Xem chi tiết</button>
					<button type="button" class="btn btn-primary btn-lg">Đặt
						vé</button>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExample" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExample" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</body>
</html>