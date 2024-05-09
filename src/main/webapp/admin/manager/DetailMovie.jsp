<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body data-spy="scroll" data-target="#click1" data-offset="50">
	<div id="top"></div>
<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- Thẻ Nav -->

	<!-- Tab Search -->
	<div class="container-fluid bg-primary" id="find"
		style="display: none;">
		<div class="row">
			<div class="col-sm-12 pt-3">
				<div class="container">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Tìm kiếm...">
						<div class="input-group-append">
							<span class="input-group-text"><i class="fas fa-search"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tag Search -->

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

	<!-- Tag đường dẫn -->
	<div class="container mt-1 py-2 bg-secondary-subtle">
		<ul class="breadcrumb">
			<li class="breadcrumb-item"><a href="index"
				class="text-decoration-none">Trang chủ</a></li>
			<li class="breadcrumb-item"><a href="#"
				class="text-decoration-none">${video.title}</a></li>
		</ul>
	</div>
	<!-- Tag đường dẫn -->

	<!-- Tag Content -->

	<!-- Tag Information Film -->
	<h1 id="click2" class="text-center">REVIEW PHIM</h1>
	<div class="d-flex justify-content-center">
		<hr class="my-4 w-25 border-4">
	</div>
	<div class="container card container-4 ">
		<span> ${video.getDescription()} </span>
	</div>
	<div class="container container-4 mt-2">
  <div class="row justify-content-end">
    <div class="col-auto">
<a href="LikeVideo?page=/page/favorite/index&videoId=${video.videoId}" class="btn btn-primary">Like</a>
  <%--  <a href="LikeVideo?videoId=${video.videoId}" class="btn btn-primary">Like</a> --%>
   
    </div>
    <div class="col-auto">
      <a href="ShareVideo?videoId=${video.videoId}" class="btn btn-secondary">Share</a>
    </div>
  </div>
</div>

	<!-- Tag Information Film -->


	<!-- Tag Trailer phim -->
	<h1 id="" class="text-center pt-5">TRAILER</h1>
	<div class="d-flex justify-content-center">
		<!-- Dùng flexbox để căn giữa -->
		<hr class="my-4 w-25 border-4">
		<!-- Sử dụng lớp "my-4" để thêm margin trên và dưới, và lớp "w-25" để giảm độ dài xuống 25% -->
	</div>
	<div class="container card">
		<iframe width="100%" height="500"
			src="https://www.youtube.com/embed/${video.getTrailer()}"
			frameborder=""
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
			allowfullscreen></iframe>
	</div>
	<!-- Tag Trailer phim -->

	<!-- Tag Phim chiếu rạp -->
	<div class="container container-2 mt-2">
		<h1 class="text-center">YÊU THÍCH NHIỀU NHẤT</h1>
		<hr class="my-4 w-25 mx-auto d-block border-4">
		<div class="row">
			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img
						src="https://i.pinimg.com/564x/c9/cd/c2/c9cdc2a739410d3459962868c03e324d.jpg"
						class="w-100 img-fluid">
						<div class="overlay">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						style="text-decoration: none;" title="5cm/s">5 centimet trên
						giây</a>
				</h5>
				<h5 class="text-center">Thời lượng: 63 phút</h5>
				<a href="#" class="btn btn-outline-primary mb-3 mx-2 d-block">Xem
					phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img
						src="https://i.pinimg.com/564x/8a/f4/96/8af4960a101e43740dc63967df0eca07.jpg"
						class="w-100">
						<div class="overlay">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						style="text-decoration: none;" title="Khóa chặt cửa nào Suzume">Khóa
						chặt cửa nào Suzume</a>
				</h5>
				<h5 class="text-center">Thời lượng: 122 phút</h5>
				<a href="#" class="btn btn-outline-primary mb-3 mx-2 d-block">Xem
					phim</a>
			</div>

			<div class="col-md-4 product-grid">
				<div class="image">
					<a href="#"> <img
						src="https://i.pinimg.com/564x/6f/81/95/6f8195be7e17d9a64f14fc1c533c277b.jpg"
						class="w-100 img-fluid">
						<div class="overlay">
							<div class="detail">Xem chi tiết</div>
						</div>
					</a>
				</div>
				<h5 class="text-center">
					<a href="#" data-toggle="tooltip" data-placement="top"
						style="text-decoration: none;" title="Đứa con của thời tiết">Đứa
						con của thời tiết</a>
				</h5>
				<h5 class="text-center">Thời lượng: 114 phút</h5>
				<a href="#" class="btn btn-outline-primary mb-3 mx-2 d-block">Xem
					phim</a>
			</div>

		</div>
	</div>
	<!-- Tag Phim chiếu rạp -->

	<!-- Tag Comment  -->
	<h1 class="text-center pt-5">BÌNH LUẬN</h1>
	<hr class="my-4 w-25 mx-auto d-block border-4">
	<div class="container card">
		<ul class="list-unstyled mt-2">
			<li class="media"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min1.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Anna Smith</h5>
					<!--Review-->
					<i class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i class="bi bi-star"></i>
					<p>Tuyệt vời!</p>
				</div></li>
			<li class="media my-4"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min2.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Tom Headphone</h5>
					<!--Review-->
					<i class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i class="bi bi-star"></i>
					<i class="bi bi-star"></i>
					<p>Trang web cần khắc phục nhiều.</p>
				</div></li>
			<li class="media"><img class="d-flex mr-3"
				src="https://mdbootstrap.com/img/Photos/Others/avatar-min3.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Nataly Middle</h5>
					<!--Review-->
					<i class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i class="bi bi-star"></i>
					<i class="bi bi-star"></i> <i class="bi bi-star"></i>
					<p>Xem phim bị giật lag quá nhiều.</p>
				</div></li>
			<li class="media"><img class="d-flex mr-3 w-70 h-70"
				src="/Assignment_JAVA/imghuman/kimjenny.jpg"
				alt="Generic placeholder image">
				<div class="media-body">
					<h5 class="mt-0 mb-2 font-weight-bold">Kim Jenny</h5>
					<!--Review-->
					<i class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i> <i
						class="bi bi-star-fill text-warning"></i>
					<p>Phim rất hay tôi đã khóc. 10 điểm không có nhưng</p>
				</div></li>
		</ul>

	</div>

	<!-- Tag Comment  -->

	<!-- Tag To top -->
	<a href="#top" class="to-top">
		<h2>
			<i class="bi bi-arrow-up-square-fill mx-2 float-end "></i>
		</h2>
	</a>
	<!-- Tag To top -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>