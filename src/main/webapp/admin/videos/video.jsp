<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="url" value="/admin" />

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
	<jsp:include page="../common/headeadmin.jsp"></jsp:include>

	<div class="container-fluid">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="videoEdition-tab"
					data-bs-toggle="tab" data-bs-target="#videoEdition" type="button"
					role="tab" aria-controls="videoEdition" aria-selected="true">Video
					Edition</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="videoList-tab" data-bs-toggle="tab"
					data-bs-target="#videoList" type="button" role="tab"
					aria-controls="videoList" aria-selected="false">Video List</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="videoEdition"
				role="tabpanel" aria-labelledby="videoEdition-tab" tabindex="0">
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
					<div class="row p-3">
						<div class="col-md-4">
							<img width="100%" height="auto"
								src="https://i.pinimg.com/736x/fb/b3/73/fbb3739ca9b950392c0680e27805a7ee.jpg"
								alt="">
						</div>
						<div class="col-md-8">
							<form action="admin" method="post">
								<div class="mb-3">
									<label for="youtube-id" class="form-label">YOUTUBE ID?</label>
									<input type="text" class="form-control" id="videoId"
										name="videoId" value="${video.videoId }" required="required">
								</div>
								<div class="mb-3">
									<label for="video-title" class="form-label">VIDEO
										TITLE?</label> <input type="text" class="form-control" id="title"
										name="title" value="${video.title }" required="required">
								</div>
								<div class="mb-3">
									<label for="view-count" class="form-label">FOSTER</label> <input
										class="form-control" type="file" id="poster" name="poster">

									<c:if
										test="${fn:contains(requestScope['javax.servlet.forward.request_uri'], 'edit')}">
										<img src="${video.poster}" width="200" height="300">
									</c:if>

								</div>
								<div class="mb-3">
									<label for="view-count" class="form-label">VIEW COUNT?</label>
									<input type="number" class="form-control" id="views"
										name="views" value="${video.views }" required="required">
								</div>
								<div class="mb-3">
									<label for="view-count" class="form-label">ĐẠO DIỄN</label> <input
										type="text" class="form-control" id="daoDien" name="daoDien"
										value="${video.daoDien }" required="required">
								</div>
								<%-- <div class="mb-3">
									<label for="view-count" class="form-label">NGÀY CÔNG
										CHIẾU</label> <input type="date" class="form-control"
										id="ngayCongChieu" name="ngayCongChieu"
										value="${video.ngayCongChieu }">
								</div> --%>
								<div class="mb-3">
									<label for="view-count" class="form-label">THỜI LƯỢNG</label> <input
										type="number" class="form-control" id="thoiLuong"
										name="thoiLuong" value="${video.thoiLuong }" required="required">
								</div>
								<div class="mb-3">
									<label for="view-count" class="form-label">PHỤ ĐỀ</label> <input
										type="text" class="form-control" id="phuDe" name="phuDe"
										value="${video.phuDe }" required="required">
								</div>
								<div class="mb-3">
									<label for="view-count" class="form-label">TRAILER</label> <input
										type="text" class="form-control" id="trailer" name="trailer"
										value="${video.trailer }" required="required">
								</div>
								<div class="mb-3">
									<label for="Active" class="me-2 ">ACTIVE: </label> <label
										for="" class="ms-4">Có <input type="radio"
										class="form-check-input" id="active" name="active"
										value="true" ${!video.active? 'checked':''}>
									</label> <label for="" class="ms-4">Không <input type="radio"
										class="form-check-input" id="inactive" name="active"
										value="false" ${video.active? 'checked':''}>
									</label>
								</div>
								<div class="col-md-12">
									<div class="mb-3">
										<label for="description" class="form-label">DESCRIPTION?</label>
										<textarea class="form-control" id="description" required="required"
											name="description" cols="10" rows="5">${video.description}</textarea>
									</div>
								</div>
								<div class="btn-group-lg float-end">
									<button type="submit" name="action" value="add"
										class="btn btn-primary" formaction="admin/add">Create</button>
									<button type="submit" name="action" value="update"
										class="btn btn-primary" formaction="admin/update">Update</button>
									<button type="submit" class="btn btn-primary"
										formaction="admin/delete">Delete</button>
									<button type="submit" class="btn btn-primary"
										formaction="admin/reset">Reset</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="videoList" role="tabpanel"
				aria-labelledby="videoList-tab" tabindex="0">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Youtube Id</th>
										<th>Video Title</th>
										<th>View Count</th>
										<th>Status</th>
										<th>Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${videos }">
										<tr>
											<td>${item.videoId }</td>
											<td>${item.title }</td>
											<td>${item.views }</td>
											<td>${item.active?'Có':'Không' }</td>
											<%-- <td>
											<button class="btn btn-primary btn-sm"
													formaction="admin/edit?videoId=${item.videoId }">Sửa</button>
												| <button class="btn btn-danger btn-sm"
													formaction="admin/delete?videoId=${item.videoId }">Xóa</button>
												|
												<button class="btn btn-info btn-sm" formaction="${url}/watch/${item.videoId}">Xem</button></td> --%>
											<td>
												<form method="post">
													<button type="submit" class="btn btn-primary btn-sm"
														formaction="admin/edit?videoId=${item.videoId}">Sửa</button>
													<button type="submit" class="btn btn-danger btn-sm"
														formaction="admin/delete?videoId=${item.videoId}">Xóa</button>
													<button type="submit" class="btn btn-info btn-sm"
														formaction="admin/watch?videoId=${item.videoId}">Xem</button>
												</form>

											</td>

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
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>