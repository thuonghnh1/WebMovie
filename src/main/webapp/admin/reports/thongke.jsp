<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<!-- Tag nav -->
	<jsp:include page="../common/headeadmin.jsp"></jsp:include>
	<!-- Thẻ Nav -->
	<div id="Top"></div>
	<section class="container">

<h3>Báo cáo - Thống kê</h3>
<nav>
	<div class="nav nav-tabs" id="nav-tab" role="tablist">
		<button class="nav-link active" id="favorite-tab" data-bs-toggle="tab"
			data-bs-target="#favorite" type="button" role="tab"
			aria-controls="favorite" aria-selected="true">Favorite</button>
		<button class="nav-link" id="favoriteUser-tab" data-bs-toggle="tab"
			data-bs-target="#favoriteUser" type="button" role="tab"
			aria-controls="favoriteUser" aria-selected="false">Favorite
			User</button>
		<button class="nav-link" id="shareFriend-tab" data-bs-toggle="tab"
			data-bs-target="#shareFriend" type="button" role="tab"
			aria-controls="shareFriend" aria-selected="false">Share
			Friends</button>

	</div>
</nav>
<div class="tab-content" id="nav-tabContent">
	<div class="tab-pane fade show active" id="favorite" role="tabpanel"
		aria-labelledby="favorite-tab" tabindex="0">
		<!-- tab favorite -->
		<div class="border ms-1 m-2   ">
			<table class="table table-stripe">
				<tr>
					<td><b>Video Title</b></td>
					<td><b>Favorite count</b></td>
					<td><b>Newest Date</b></td>
					<td><b>Oldest Date</b></td>

				</tr>
				<c:forEach var="item" items="${favList }">
				<tr>
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount}</td>
					<td>${item.newest }</td>
					<td>${item.oldest }</td>

				</tr>
				</c:forEach>

			</table>
		</div>



	</div>
	<div class="tab-pane fade" id="favoriteUser" role="tabpanel"
		aria-labelledby="favoriteUser-tab" tabindex="1">
		<form action="ReportsManagementServlet" method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-group">
						<div class="input-group justify-content-center ">
							<label for="videoTitle" class="input-group-text border-0 ">Video
								Title:</label> 
								<select name="videoUserId" id="videoUserId"
								class="custom-select w-50">
								<c:forEach var="item" items="${vidList }">
								<option value="${item.videoId }"
                                ${item.videoId == videoUserId? 'selected':'' } >${item.title }</option>
								</c:forEach>
							</select>
							<div class="input-group-append ms-1 ">
								<button type="submit" class="btn btn-info">Report</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>


		<div class="border ms-1 m-2 mt-3  ">
			<table class="table table-stripe">
				<tr>
					<td><b>User Name</b></td>
					<td><b>Fullname</b></td>
					<td><b>Email</b></td>
					<!-- <td><b>Favorite Date</b></td> -->

				</tr>
				<c:forEach var="item" items="${favUsers }">
				<tr>
					<td>${item.username }</td>
					<td>${item.fullname }</td>
					<td>${item.email }</td>
<%-- 					<td>${item.likedDate }</td> 
 --%>
				</tr>
				</c:forEach>

			</table>
		</div>
	</div>
	<div class="tab-pane fade" id="shareFriend" role="tabpanel"
		aria-labelledby="shareFriend-tab" tabindex="2">
		<input type="hidden" name="tab" value="shareFriends">
		
		<form action="" method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-group">
						<div class="input-group justify-content-center ">
							<label for="videoTitle" class="input-group-text border-0 ">Video
								Title:</label> 
								<select name="videoId" id="videoId"
								class="custom-select w-50">
								<c:forEach var="item" items="${vidList}">
								<option value="${item.videoId }" ${item.videoId == videoId ? 'selected' : '' }>${item.title}</option>
								</c:forEach>
							</select>
							<div class="input-group-append ms-1 ">
								<button type="submit" class="btn btn-info">Report</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>

		<div class="border ms-1 m-2  mt-3   ">



			<table class="table table-stripe">
				<tr>
					<td><b>Sender Name</b></td>
					<td><b>Sender Email</b></td>
					<td><b>Receiver Email</b></td>
					<td><b>Send Date</b></td>

				</tr>
				<c:forEach var="item" items="${shareUsers}">
				<tr>
					<td>${item.senderName }</td>
					<td>${item.senderEmail }</td>
					<td>${item.receiverEmail }</td>
					<td>${item.sendDate}</td>

				</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</div>
</section>
	<!-- Tag Footer -->
	<div class="footer-container">
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>
	<!-- Tag Footer -->

	<!-- Tag To top -->
	<a href="#Top" class="to-top"> <i class="fas fa-chevron-up"></i>
	</a>
	<!-- Tag To top -->
</body>
</html>