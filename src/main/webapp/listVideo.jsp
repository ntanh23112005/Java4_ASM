<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TAtube</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .submenu {
            display: none;
        }
    </style>

    <script>
        function toggleSubMenu(id) {
            const submenu = document.getElementById(id);
            submenu.style.display = submenu.style.display === 'none' ? 'block' : 'none';
        }
    </script>
</head>

<body>
    <nav class="navbar navbar-expand-sm navbar-dark sticky-top">
        <div class="container">
            <a class="navbar-brand" href="Lab3Index.html">
                <img src="img/logo.png" alt="" style="width: 150px;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">

                <div class="input-group">
                    <input type="text" name="" id="" class="form-control" placeholder="Search video here...">
                    <button class="btn btn-outline-secondary"><i
                            class="fa-solid fa-magnifying-glass"></i>Search</button>
                </div>


            </div>
        </div>
        <img src="img/hinh1.jpg" alt="" class="rounded-circle float-end me-3" style="width: 50px; height: 50px;">
    </nav>

    <div class="container-fluid">
        <div class="row">
            <aside class="col-2 p-0 border-end border-opacity-25 border-secondary">

                <div class="btn-group-vertical w-100">

                    <div class="my-5 w-100">
                        <button type="button" class="btn w-100 fs-3">
                            <i class="fa-regular fa-thumbs-up"></i> My Favorites
                        </button>
                    </div>

                    <div class="my-5 w-100">
                        <button type="button" class="btn w-100 fs-3" onclick="toggleSubMenu('menu2')">
                            <i class="fa-regular fa-user"></i> My Account
                        </button>

                        <div id="menu2" class="submenu">
                            <button type="button" class="btn w-100 fs-5 text-start mb-3">
                                <i class="fa-solid fa-right-to-bracket"></i> Login
                            </button>
                            <button type="button" class="btn w-100 fs-5 text-start mb-3">
                                <i class="fa-solid fa-question"></i> Forgot password
                            </button>
                            <button type="button" class="btn w-100 fs-5 text-start mb-3">
                                <i class="fa-regular fa-registered"></i> Registration
                            </button>
                            <button type="button" class="btn w-100 fs-5 text-start mb-3">
                                <i class="fa-solid fa-right-from-bracket"></i> Logoff
                            </button>
                            <button type="button" class="btn w-100 fs-5 text-start mb-3">
                                <i class="fa-solid fa-arrows-rotate"></i> Change Password
                            </button>
                            <button type="button" class="btn w-100 fs-5 text-start mb-3">
                                <i class="fa-regular fa-pen-to-square"></i> Edit profile
                            </button>
                        </div>
                    </div>


                </div>
            </aside>

            <article class="col-10">
                <div class="row">
                    <div class="col-4 mb-3">
                        <div class="card my-3">
                            <div class="card-body p-2">
                                <img src="img/logo.png" class="img-fluid w-100" alt="" style="height: 200px;">
                                <h5 class="card-title my-3">Nguyễn Thế Anh is da best in the worldă asdjasdh ashdjashd
                                    áhdjkadsh</h5>
                                <p>Số lượt thích: ${}</p>
                                <div class="d-flex justify-content-end">
                                    <a href="">
                                        <button type="button" class="btn btn-primary me-2"><i
                                                class="fa-regular fa-thumbs-up"></i></button>
                                    </a>
                                    <a href="">
                                        <button type="button" class="btn btn-warning"><i class="fa-solid fa-share"></i></button>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=1">|&lt;</a>
                        </li>
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}">&lt;&lt;</a>
                        </li>
                        <c:forEach begin="1" end="${totalPages}" var="page">
                            <li class="page-item ${page == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?page=${page}">${page}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}">&gt;&gt;</a>
                        </li>
                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${totalPages}">&gt;|</a>
                        </li>
                    </ul>
                </nav>
            </article>
        </div>


    </div>
</body>

</html>