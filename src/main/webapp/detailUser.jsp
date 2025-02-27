<%@ page import="java.util.List"%>
<%@ page import="com.poly.entity.Favorite"%>
<%@ page import="com.poly.dao.FavoriteDAOImpl"%>
<%@ page import="com.poly.entity.User"%>
<%@ page import="com.poly.dao.UserDAOImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String id = request.getParameter("id");

UserDAOImpl dao = new UserDAOImpl();
User user = dao.findById(id);
request.setAttribute("user", user);

FavoriteDAOImpl fdao = new FavoriteDAOImpl();
List<Favorite> f = fdao.findByUser(id);
request.setAttribute("favorites", f);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Detail</title>
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
		<form action="listUser" method="post" enctype="multipart/form-data">
			<div class="row">
				<!-- Information about user -->
				<div class="col-sm-8">
					<h3>EDIT USER DETAILS</h3>

					<div class="my-3 fs-3">
						<strong>ID: </strong> 
						<input type="text" class="form-control" name="id" value="${user.id}" readonly/>
					</div>
					<div class="my-3 fs-3">
						<strong>Username:</strong> 
						<input type="text" name="username"
							value="${user.username}" class="form-control" required />
					</div>
					<div class="my-3 fs-3">
						<strong>Email:</strong> 
						<input type="email" name="email"
							value="${user.email}" class="form-control" required />
					</div>
					<div class="my-3 fs-3">
						<strong>Password:</strong> 
						<input type="password" name="password"
							value="${user.password}" class="form-control" required />
					</div>
					<div class="my-3 fs-3">
						<strong>Role:</strong> 
						<select name="admin" class="form-control"
							required>
							<option value="true" ${user.admin == true ? 'selected' : ''}>Admin</option>
							<option value="false" ${user.admin == false ? 'selected' : ''}>User</option>
						</select>
					</div>
					
					<div class="my-3 fs-3">
					<strong>Picture</strong>
                        <input type="file" class="form-control" id="hinh" name="hinh" accept="image/*"/>
					</div>

					<form action="listUser" method="post">
                        
                        <%--Tạo hidden truyền tham số --%>
                        <input type="hidden" name="id" value="${user.id}">
                        
                        <button type="submit" class="btn btn-warning" name="action" value="update">Update User</button>
                        <button type="submit" class="btn btn-danger" name="action" value="delete">Delete User</button>
                    </form>
				</div>

				<!-- User profile picture -->
				<div class="col-sm-4">
					<h3>User's Profile Picture</h3>
					<img src="img/${user.hinh}" class="img-fluid">
				</div>
			</div>
		</form>

		<div class="mt-5">
			<h3>LIST OF FAVORITE VIDEOS</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>No</th>
						<th>Video's Title</th>
						<th>Like Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${favorites}" var="favorite" varStatus="count">
						<tr>
							<td>${count.index + 1}</td>
							<td>${favorite.video.title}</td>
							<td><fmt:formatDate value="${favorite.likeDate}"
									pattern="dd/MM/yyyy" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
