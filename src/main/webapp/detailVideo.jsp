<%@page import="java.util.List"%>
<%@page import="com.poly.entity.Favorite"%>
<%@page import="com.poly.dao.FavoriteDAOImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.poly.dao.VideoDAOImpl"%>
<%@ page import="com.poly.entity.Video"%>
<%
String id = request.getParameter("id");

VideoDAOImpl dao = new VideoDAOImpl();
Video v = dao.findById(id);
request.setAttribute("video", v);

FavoriteDAOImpl fdao = new FavoriteDAOImpl();
List<Favorite> f = fdao.findByVideo(id);
request.setAttribute("favorites", f);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail Video</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						href="listVideo">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="listUser">Management
							User</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row">

			<div class="col-sm-8">
				<h3>DETAILS VIDEO</h3>
				<p class="my-3 fs-3">
					<strong>Id:</strong> ${video.id}
				</p>
				<p class="my-3 fs-3">
					<strong>Video's title:</strong> ${video.title}
				</p>
				<p class="my-3 fs-3">
					<strong>Description:</strong> ${video.description}
				</p>
				<p class="my-3 fs-3">
					<strong>Views:</strong> ${video.views}
				</p>
				<p class="my-3 fs-3">
					<strong>Status:</strong>
					<c:choose>
						<c:when test="${video.active}">Active</c:when>
						<c:otherwise>Not active</c:otherwise>
					</c:choose>
				</p>
			</div>


			<div class="col-sm-4">
				<h3>Video's poster</h3>
				<img src="img/${video.poster}" alt="${video.title}"
					class="img-fluid">
			</div>
		</div>



		<div class="mt-5">
			<h3>LIST LIKE OF VIDEO</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>No</th>
						<th>Video's title</th>
						<th>User</th>
						<th>Like date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${favorites }" var="favorite" varStatus="count">
						<tr>
							<td>${count.index + 1}</td>
							<td>${favorite.video.title}</td>
							<td>${favorite.user.username}</td>
							<td><fmt:formatDate value="${favorite.likeDate}"
									pattern="dd/MM/yyyy" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</body>
</html>
