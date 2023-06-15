<?php
include_once "../models/UserModel.php";
include_once "../library/mainFunctions.php";

function authAction($smarty){
    $userEmail = $_POST["userEmail"] ?? null;
    $userPass = $_POST["userPass"] ?? null;

    if($userEmail != "") {
        $result = checkAuth($userEmail, $userPass);

        if($result){
            $smarty -> assign("pageTitle", "Авторизацяя");
            $smarty -> assign("status", $result);
            $smarty -> assign("action", "auth");

            if($result == "success"){
                $smarty -> assign("userEmail", $userEmail);
                $smarty -> assign("admin", checkAdmin($userEmail));
            }

            loadTemplate($smarty, "header");
            loadTemplate($smarty, "pageMessage");
            loadTemplate($smarty, "footer");
        }
    }
    else{
        $smarty -> assign("pageTitle", "Авторизація");

        loadTemplate($smarty, "header");
        loadTemplate($smarty, "userAuth");
        loadTemplate($smarty, "footer");
    }


}


function registrationAction($smarty){
    $userName = $_POST["userName"] ?? null;
    $userEmail = $_POST["userEmail"] ?? null;
    $userPass = $_POST["userPass"] ?? null;
    $userPhone = $_POST["userPhone"] ?? null;

    if($userName != ""){
        $result = regUser($userName, $userEmail, $userPass, $userPhone);

        if($result){
            $smarty -> assign("pageTitle", "Реєстрація");
            $smarty -> assign("status", $result);
            $smarty -> assign("action", "register");


            loadTemplate($smarty, "header");
            loadTemplate($smarty, "pageMessage");
            loadTemplate($smarty, "footer");
        }
    }
    else{
        $smarty -> assign("pageTitle", "Реєстрація");

        loadTemplate($smarty, "header");
        loadTemplate($smarty, "userRegistration");
        loadTemplate($smarty, "footer");
    }
}


function cabinetAction($smarty){
    $smarty -> assign("pageTitle", "Кабінет користувача");
    $userEmail = $_GET['userEmail'] ?? null;
    $userId = $_GET['userId'] ?? null;
    if($userEmail != null){
        $userEmail = trim($userEmail, "[NS,L]");
        $userName = mysqli_fetch_assoc(getUserByEmail($userEmail))['name'];
        $userPhone = mysqli_fetch_assoc(getUserByEmail($userEmail))['phone'];
        $userId =  mysqli_fetch_assoc(getUserByEmail($userEmail))['id'];

        $orders = getOrders($userId);

        $smarty -> assign("name", $userName);
        $smarty -> assign("email", $userEmail);
        $smarty -> assign("phone", $userPhone);
        $smarty -> assign("orders", $orders);



        loadTemplate($smarty, "header");
        loadTemplate($smarty, "cabinetPage");
        loadTemplate($smarty, "footer");
    }
    else if($userId){
        $userId = trim($userId, "[NS,L]");

        $userName = mysqli_fetch_assoc(getUserById($userId))['name'];
        $userEmail = mysqli_fetch_assoc(getUserById($userId))['email'];
        $userPhone = mysqli_fetch_assoc(getUserById($userId))['phone'];

        $orders = getOrders($userId);

        $smarty -> assign("name", $userName);
        $smarty -> assign("email", $userEmail);
        $smarty -> assign("phone", $userPhone);
        $smarty -> assign("orders", $orders);



        loadTemplate($smarty, "header");
        loadTemplate($smarty, "cabinetPage");
        loadTemplate($smarty, "footer");
    }

}
function exitAction($smarty){
    $smarty -> assign("pageTitle", "Вихід");
    $smarty -> assign("action", "exit");


    loadTemplate($smarty, "header");
    loadTemplate($smarty, "pageMessage");
    loadTemplate($smarty, "footer");
}

function usersAction($smarty){
    $users = getAllUsers();
    $smarty -> assign("pageTitle", "Користувачі");
    $smarty -> assign("users", $users);
    $smarty -> assign("action", "users");


    loadTemplate($smarty, "header");
    loadTemplate($smarty, "usersPage");
    loadTemplate($smarty, "footer");
}

function ordersAction($smarty){
    $userId = $_GET['user_id'];
    $userId = trim($userId, "[NS,L]");

    $orders = getOrders($userId);
    $smarty -> assign("pageTitle", "Замовлення");
    $smarty -> assign("orders", $orders);
    $smarty -> assign("action", "user");
    $smarty -> assign("userId", $userId);

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "orderList");
    loadTemplate($smarty, "footer");
}

function findAction($smarty){
    $findUser = $_GET["nameFind"] ?? null;
    $findUser = trim($findUser, "[NS,L]");

    $rsUser = findUser($findUser);

    $smarty -> assign("pageTitle", "Користувачі");
    $smarty -> assign("users", $rsUser);
    $smarty -> assign("action", "user");
    $smarty -> assign("findName", $findUser);


    loadTemplate($smarty, "header");
    loadTemplate($smarty, "usersPage");
    loadTemplate($smarty, "footer");
}