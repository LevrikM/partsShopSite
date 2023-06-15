<?php

$dbHost = "localhost";
$dbUser = "root";
$dbPass = "";
$dbName = "db_autoworkshop";

try {
    $conn = mysqli_connect($dbHost, $dbUser, $dbPass, $dbName);
    $mysql = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
    $mysql->set_charset("utf8");
    $conn = null;
} catch (Exception $e) {
    if(str_contains($e->getMessage(), 'Access denied')){
        print "<h1 style='text-align: center;'>Помилка! Доступ до бази даних відсутній! ". "</h1><br/>";
        exit();
    }
    elseif(str_contains($e->getMessage(), 'Unknown database')){
        print "<h1 style='text-align: center;'>Помилка! База даних відсутня! ". "</h1><br/>";
        exit();
    }
    else{
        print "<h1 style='text-align: center;'>Помилка!".$e->getMessage(). "</h1><br/>";
        exit();
    }
}




