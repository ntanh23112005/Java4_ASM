<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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

<!-- Nút để mở Modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserVideoModal">
  Add User / Add Video
</button>

<!-- Modal -->
<div class="modal fade" id="addUserVideoModal" tabindex="-1" aria-labelledby="addUserVideoModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addUserVideoModalLabel">Add User / Add Video</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- Tab Navigation -->
        <ul class="nav nav-tabs" id="addUserVideoTabs" role="tablist">
          <li class="nav-item" role="presentation">
            <a class="nav-link active" id="user-tab" data-bs-toggle="tab" href="#addUser" role="tab" aria-controls="addUser" aria-selected="true">Add User</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link" id="video-tab" data-bs-toggle="tab" href="#updateVideo" role="tab" aria-controls="updateVideo" aria-selected="false">Add Video</a>
          </li>
        </ul>
        
        <!-- Tab Content -->
        <div class="tab-content" id="addUserVideoTabsContent">
          <!-- Tab 1 - Add User -->
          <div class="tab-pane fade show active" id="addUser" role="tabpanel" aria-labelledby="user-tab">
            <form action="listUser" method="post" enctype="multipart/form-data">
              <div class="my-3 fs-3">
                <strong>ID: </strong> 
                <input type="text" class="form-control" name="id" required />
              </div>
              <div class="my-3 fs-3">
                <strong>Username:</strong> 
                <input type="text" name="username" class="form-control" required />
              </div>
              <div class="my-3 fs-3">
                <strong>Email:</strong> 
                <input type="email" name="email" class="form-control" required />
              </div>
              <div class="my-3 fs-3">
                <strong>Password:</strong> 
                <input type="password" name="password" class="form-control" required />
              </div>
              <div class="my-3 fs-3">
                <strong>Role:</strong> 
                <select name="admin" class="form-control" required>
                  <option value="true">Admin</option>
                  <option value="false">User</option>
                </select>
              </div>
              <div class="my-3 fs-3">
                <strong>Picture:</strong>
                <input type="file" class="form-control" id="hinh" name="hinh" accept="image/*"/>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                
                <input type="hidden" name="action" value="create">
                <button type="submit" class="btn btn-primary">Save User</button>
              </div>
            </form>
          </div>

          <!-- Tab 2 - Add Video -->
          <div class="tab-pane fade" id="updateVideo" role="tabpanel" aria-labelledby="video-tab">
            <form action="listVideo" method="post" enctype="multipart/form-data">
              <div class="my-3 fs-3">
                <label for="videoId" class="form-label">Video ID</label>
                <input type="text" class="form-control" id="videoId" name="id" required />
              </div>

              <div class="my-3 fs-3">
                <label for="videoTitle" class="form-label">Video Title</label>
                <input type="text" class="form-control" id="videoTitle" name="title" required />
              </div>

			<div class="my-3 fs-3">
                <label for="videoId" class="form-label">Link video</label>
                <input type="text" class="form-control" id="link" name="link" required />
              </div>
              <div class="my-3 fs-3">
                <label for="videoDescription" class="form-label">Description</label>
                <input type="text" class="form-control" id="videoDescription" name="description" required />
              </div>

              <div class="my-3 fs-3">
                <label for="videoViews" class="form-label">Views</label>
                <input type="number" class="form-control" id="videoViews" name="views" readonly value="0" />
              </div>

              <div class="my-3 fs-3">
                <label for="videoActive" class="form-label">Status</label>
                <select class="form-control" id="active" name="active">
                  <option value="true">Active</option>
                  <option value="false">Not Active</option>
                </select>
              </div>

              <div class="my-3 fs-3">
                <label for="videoPoster" class="form-label">Poster (Image)</label>
                <input type="file" class="form-control" id="poster" name="poster" accept="image/*"/>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-danger" name="action" value="create">Create Video</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


    <div class="container">
        <h1 class="text-center bg-light mb-3">LIST OF VIDEO</h1>
        <div class="row">
            <c:forEach items="${videos}" var="video">
                <div class="col-sm-3 mb-3">
                    <div class="card">
                        <a href="${video.link }">
                        <img class="card-img-top" src="img/${video.poster }" alt="">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">${video.title}</h5>
                            <p class="card-text">Views: ${video.views}</p>
                            <div class="d-flex justify-content-between">
                                <a href="detailVideo.jsp?id=${video.id}" class="btn btn-primary">Details</a>
                                <a href="editVideo.jsp?id=${video.id}" class="btn btn-warning">Edit</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>