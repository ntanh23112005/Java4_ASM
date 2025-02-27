<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="listVideo">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listUser">Management User</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container">
        <h2 class="mb-4">User List</h2>

        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>STT</th>
                    <th>Id</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Image</th>
                    <th>Admin</th>
                    <th>Detail</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${listUsers}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>
                            <img src="img/${user.hinh}" alt="User Image" class="img-fluid" style="width: 50px; height: 50px;" />
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${user.admin == true}">Admin</c:when>
                                <c:otherwise>User</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                        	<a href="detailUser.jsp?id=${user.id }">Detail</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>