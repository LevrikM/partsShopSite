<?php

function checkAuth($userEmail, $userPass){
    $result = getUserByEmail($userEmail);

    if(mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        $hashedPass = md5($userPass);

        if($hashedPass === $user['password']) {
            return "success";
        } else {
            return "Пароль не вірний";
        }
    } else {
        return "Такого користувача не знайдено";
    }
}


function regUser($userName, $userEmail, $userPass, $userPhone){
    $result = getUserByEmail($userEmail);

    $userPhone = "+380".$userPhone;

    if(mysqli_num_rows($result) > 0) {
        return "Користувач з такою поштою вже зареєстрований";
    } else {
        $hashedPass = md5($userPass);
        try {
            $sql = "INSERT INTO Users (name, email, password, phone) VALUES ('$userName', '$userEmail', '$hashedPass', '$userPhone')";
            $record_set = mysqli_query($GLOBALS["mysql"], $sql);

            return "success";
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }
}

function getPartFromId($partId){
    $sql = "SELECT * FROM Parts where id = '$partId'";
    return mysqli_query($GLOBALS["mysql"], $sql);
}

function getOrders($userId){
    $orders = array();

    $sql = "SELECT * FROM Orders where user_id = '$userId' AND deleted = 0";
    $result = mysqli_query($GLOBALS["mysql"], $sql);

    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $orders[] = $row;
        }
    }

    foreach ($orders as &$order) {
        $partId = $order['part_id'];
        $partResult = mysqli_fetch_assoc(getPartFromId($partId));
        $order['part_id'] = $partResult['part_code'];
    }

    return $orders;
}

function checkAdmin($userEmail){
    $result = getUserByEmail($userEmail);
    $user = mysqli_fetch_assoc($result);

    if($user['admin'] == 0) return false;
    else return true;
}

function getUserByEmail($userEmail){
    $sql = "SELECT * FROM Users WHERE email = '$userEmail'";
    return mysqli_query($GLOBALS["mysql"], $sql);
}

function getUserById($userId){
    $sql = "SELECT * FROM Users WHERE id = '$userId'";
    return mysqli_query($GLOBALS["mysql"], $sql);
}


function getAllUsers(){
    $sql = "SELECT * FROM Users";
    $record_set = (mysqli_query($GLOBALS["mysql"], $sql));
    return convertToReadableData($record_set);
}

function findUser($name){
    $sql = "SELECT * FROM Users WHERE name LIKE '%$name%'";
    $record_set = (mysqli_query($GLOBALS["mysql"], $sql));
    return convertToReadableData($record_set);
}