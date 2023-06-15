<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$pageTitle}</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-header">
        <a class="navbar-brand" href="http://auto/">
            <i class="fas fa-car"></i>
            <span> | Твоя автомайстерня</span>
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                </li><li class="nav-item" style="display: none">
                    <a class="nav-link" href="http://auto/user/users/">
                        <i class="fas fa-user-friends"></i>Всі користувачі
                    </a>
                </li>
                </li><li class="nav-item" style="display: none">
                    <a class="nav-link" href="http://auto/part/orders/">
                        <i class="far fa-folder-open"></i> Всі замовлення
                    </a>
                </li>
                <li class="nav-item mr-5" style="display: none">
                    <a class="nav-link" href="http://auto/part/add/">
                        <i class="fas fa-plus"></i> Додати запчастину
                    </a>
                <li class="nav-item" style="display: none">
                    <a id="buttonProfile" class="nav-link">
                        <i class="far fa-id-card"></i>
                        Кабінет
                    </a>
                </li>
                <li class="nav-item" style="display: ">
                    <a class="nav-link" href="http://auto/user/auth/">
                        <i class="fas fa-user"></i>
                        Авторизація
                    </a>
                </li>
                <li class="nav-item" style="display: none">
                    <a class="nav-link" href="http://auto/user/exit/">
                        <i class="fas fa-sign-in-alt"></i>
                        Вихід
                    </a>
                </li>
            </ul>
        </div>
    </nav>


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let isLoggedIn = localStorage.getItem("isLoggedIn");
            let isAdmin = localStorage.getItem("admin");
            let userEmail = localStorage.getItem("userEmail");

            document.getElementById("buttonProfile").href = "http://auto/user/cabinet/?userEmail=" + userEmail;
            if (isLoggedIn === "true") {
                document.querySelector(".nav-item:nth-child(5)").style.display = "none"; // Авторизація
                document.querySelector(".nav-item:nth-child(4)").style.display = "inline-block"; // Профіль
                document.querySelector(".nav-item:nth-child(6)").style.display = "inline-block"; // Вихід

                if (isAdmin === "1") {
                    document.querySelector(".nav-item:nth-child(3)").style.display = "inline-block"; // Додати запчастину
                    document.querySelector(".nav-item:nth-child(2)").style.display = "inline-block"; // Всі замовлення
                    document.querySelector(".nav-item:nth-child(1)").style.display = "inline-block"; // Всі користувачі
                }
            } else {
                document.querySelector(".nav-item:nth-child(5)").style.display = "inline-block"; // Авторизація
                document.querySelector(".nav-item:nth-child(4)").style.display = "none"; // Профіль
                document.querySelector(".nav-item:nth-child(6)").style.display = "none"; // Вихід
                document.querySelector(".nav-item:nth-child(3)").style.display = "none"; // Додати запчастину
                document.querySelector(".nav-item:nth-child(2)").style.display = "none"; // Всі замовлення
                document.querySelector(".nav-item:nth-child(1)").style.display = "none"; // Всі користувачі
            }
        });


    </script>
