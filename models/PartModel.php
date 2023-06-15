<?php
include_once "../models/UserModel.php";

function getPartInfo($part_code){
    $sql = "SELECT * FROM Parts where part_code = '$part_code'";
    $record_set = (mysqli_query($GLOBALS["mysql"], $sql));
    return convertToReadableData($record_set);
}

function generatePartCode() {
    $existingPartCodes = array();

    $sql = "SELECT part_code FROM Parts";
    $result = mysqli_query($GLOBALS["mysql"], $sql);

    while ($row = mysqli_fetch_assoc($result)) {
        $existingPartCodes[] = $row['part_code'];
    }

    do {
        $partCode = rand(10000, 9999999);
    } while (in_array($partCode, $existingPartCodes));

    return $partCode;
}

function addPart($partName, $partPrice, $partQuantity, $partBrand, $partImage1, $partImage2, $partImage3, $status) {
    try {
        $sql_check = "SELECT * FROM Parts WHERE name = '$partName'";
        $result_check = mysqli_query($GLOBALS["mysql"], $sql_check);
        $existing_part = mysqli_fetch_assoc($result_check);

        if ($existing_part) {
            return "Запчастина вже є в каталозі.";
        }

        $partCode = generatePartCode();
        $sql = "INSERT INTO Parts (name, price, quantity, part_code, part_image, part_image2, part_image3, status, brand) 
                VALUES ('$partName', '$partPrice', '$partQuantity', '$partCode', '$partImage1', '$partImage2', '$partImage3', '$status', '$partBrand')";
        $record_set = mysqli_query($GLOBALS["mysql"], $sql);

        if ($record_set) {
            return "success";
        } else {
            throw new Exception("помилка при додаванні у базу даних.");
        }
    } catch (Exception $e) {
        return $e->getMessage();
    }
}

function getPartsByName($partName)
{
    $sql = "SELECT * FROM Parts WHERE name LIKE '%$partName%'";
    $record_set = (mysqli_query($GLOBALS["mysql"], $sql));
    return convertToReadableData($record_set);
}

function orderPart($orderPartCode, $userEmail, $userPhone, $orderPartQuantity, $addressOrder, $descriptionOrder){
    if ($userEmail == null) {
        $userPhone = "+380" . $userPhone;
        $userQuery = "SELECT * FROM users WHERE phone = '$userPhone'";
    } else {
        $userQuery = "SELECT * FROM users WHERE email = '$userEmail'";
    }

    $userResult = mysqli_query($GLOBALS["mysql"], $userQuery);

    if (mysqli_num_rows($userResult) > 0) {
        $userRow = mysqli_fetch_assoc($userResult);
        $userId = $userRow['id'];
    } else {
        $userId = NULL;
    }

    $partQuery = "SELECT * FROM parts WHERE part_code = '$orderPartCode'";
    $partResult = mysqli_query($GLOBALS["mysql"], $partQuery);

    if (mysqli_num_rows($partResult) > 0) {
        $partRow = mysqli_fetch_assoc($partResult);
        $partId = $partRow['id'];

        $insertOrderQuery = "INSERT INTO Orders (user_id, part_id, quantity, address, description, phoneOrder)
                             VALUES (".($userId ? "'$userId'" : "NULL").", '$partId', '$orderPartQuantity', '$addressOrder', '$descriptionOrder', ".($userId ? "NULL" : "'$userPhone'").")";
        mysqli_query($GLOBALS["mysql"], $insertOrderQuery);

        return "success";
    } else {
        return "error";
    }
}

function getAllOrders(){
    $orders = array();

    $sql = "SELECT * FROM Orders order by order_date desc";
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

function getOrderById($order_id){
    $sql = "SELECT * FROM Orders where id = '$order_id'";
    return mysqli_query($GLOBALS["mysql"], $sql);
}

function setOrderStatus($order_id, $status){
    $sql = "UPDATE Orders SET status = '$status' WHERE id = '$order_id'";
    return mysqli_query($GLOBALS["mysql"], $sql);

}

function deleteFromView($order_id){
    $sql = "UPDATE Orders SET deleted = 1 WHERE id = '$order_id'";
    return mysqli_query($GLOBALS["mysql"], $sql);
}

function editPartName($part_id, $part_name){
    $sql = "UPDATE Parts SET name = '$part_name' WHERE id = '$part_id'";
    mysqli_query($GLOBALS["mysql"], $sql);

    $sql = "SELECT * FROM Parts where id = '$part_id'";
    return mysqli_fetch_assoc(mysqli_query($GLOBALS["mysql"], $sql))['part_code'];
}

function editPartPrice($part_id, $part_price){
    $sql = "UPDATE Parts SET price = '$part_price' WHERE id = '$part_id'";
    mysqli_query($GLOBALS["mysql"], $sql);

    $sql = "SELECT * FROM Parts where id = '$part_id'";
    return mysqli_fetch_assoc(mysqli_query($GLOBALS["mysql"], $sql))['part_code'];
}

function editPartStatus($part_id, $status){
    $sql = "UPDATE Parts SET status = '$status' WHERE id = '$part_id'";
    mysqli_query($GLOBALS["mysql"], $sql);

    $sql = "SELECT * FROM Parts where id = '$part_id'";
    return mysqli_fetch_assoc(mysqli_query($GLOBALS["mysql"], $sql))['part_code'];
}