<%@page import="com.poly.entity.Video"%>
<%@page import="com.poly.dao.VideoDAOImpl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String id = request.getParameter("id");

    VideoDAOImpl dao = new VideoDAOImpl();
    Video v = dao.findById(id);
    request.setAttribute("video", v);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Video</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light mb-5">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="listVideo">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listUser">Management User</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <div class="col-sm-8">
                <h3>UPDATE VIDEO</h3>

                <!-- Form to update the video -->
                <form action="listVideo" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="videoId" class="form-label">Video ID</label>
                        <input type="text" class="form-control" id="videoId" name="id" value="${video.id}" readonly />
                    </div>

                    <div class="mb-3">
                        <label for="videoTitle" class="form-label">Video Title</label>
                        <input type="text" class="form-control" id="videoTitle" name="title" value="${video.title}" required />
                    </div>

                    <div class="mb-3">
                        <label for="videoDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="videoDescription" name="description" rows="3" required>${video.description}</textarea>
                    </div>

                    <div class="mb-3">
                        <label for="videoViews" class="form-label">Views</label>
                        <input type="number" class="form-control" id="videoViews" name="views" value="${video.views}" readonly />
                    </div>

                    <div class="mb-3">
                        <label for="videoActive" class="form-label">Status</label>
                        <select class="form-control" id="active" name="active">
                            <option value="true" ${video.active ? 'selected' : ''}>Active</option>
                            <option value="false" ${!video.active ? 'selected' : ''}>Not Active</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="videoPoster" class="form-label">Poster (Image)</label>
                        <input type="file" class="form-control" id="poster" name="poster" accept="image/*"/>
                    </div>


                    <form action="listVideo" method="post">
                        
                        <%--Tạo hidden truyền tham số --%>
                        <input type="hidden" name="id" value="${video.id}">
                        
                        <button type="submit" class="btn btn-warning" name="action" value="update">Update Video</button>
                        <button type="submit" class="btn btn-danger" name="action" value="delete">Delete Video</button>
                    </form>
                    
                </form>
            </div>

            <div class="col-sm-4">
                <h3>Video's Poster</h3>
                <img src="img/${video.poster}" alt="${video.title}" class="img-fluid"/>
            </div>
        </div>
    </div>

</body>
</html>
