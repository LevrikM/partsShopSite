<?php
include_once "../models/PartModel.php";
include_once "../library/mainFunctions.php";

function showAction($smarty){
    $code = $_GET["part-code"] ?? null;
    $code = trim($code, "[NS,L]");
    $rsPartInfo = getPartInfo($code);

    $smarty -> assign("pageTitle", "Деталі про запчастину");
    $smarty -> assign("rsPartInfo", $rsPartInfo);

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "partShow");
}


function addAction($smarty){
    $partName = $_POST["partName"] ?? null;
    if($partName != null){
        $partPrice = (int)$_POST["partPrice"] ?? null;
        $partQuantity = (int)$_POST["partQuantity"] ?? null;
        $partBrand = $_POST["partBrand"] ?? null;
        $partImage1 = $_POST["partImage1"] ?? null;
        $partImage2 = $_POST["partImage2"] ?? "";
        $partImage3 = $_POST["partImage3"] ?? "";
        $addToList = $_POST["addToList"] ?? null;
        if($addToList != null) $addToList = 1;
        $statusAdd = addPart($partName, $partPrice, $partQuantity, $partBrand, $partImage1, $partImage2, $partImage3, $addToList);
        $smarty -> assign("pageTitle", "Додавання запчастини");
        $smarty -> assign("partName", $partName);
        $smarty -> assign("status", $statusAdd);
        $smarty -> assign("action", "part");

        loadTemplate($smarty, "header");
        loadTemplate($smarty, "pageMessage");
    }
    else{
        $smarty -> assign("pageTitle", "Додавання запчастини");
        loadTemplate($smarty, "header");
        loadTemplate($smarty, "partAdd");
    }
}


function findAction($smarty){
    $findPart = $_GET["nameFind"] ?? null;
    $trimmed = trim($findPart, "[NS,L]");
    $rsParts = getPartsByName($trimmed);


    $smarty -> assign("pageTitle", "Головна");
    $smarty -> assign("rsParts", $rsParts);
    $smarty -> assign("action", "find");

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "index");
    loadTemplate($smarty, "footer");
}

function orderAction($smarty){
    $partName = $_GET["part_name"] ?? null;
    if($partName != ""){
        $partName = trim($partName, "[NS,L]");
        $partCode = $_GET["part_code"] ?? null;
        $partCode = trim($partCode, "[NS,L]");
        $partQuantity = $_GET["quantity"] ?? null;
        $partQuantity = trim($partQuantity, "[NS,L]");


        $smarty -> assign("pageTitle", "Замовлення");
        $smarty -> assign("partName", $partName);
        $smarty -> assign("partCode", $partCode);
        $smarty -> assign("partQuantity", $partQuantity);

        loadTemplate($smarty, "header");
        loadTemplate($smarty, "partOrder");
        loadTemplate($smarty, "footer");
    }
    else{
        $orderPartName = $_POST["orderPartName"] ?? null;
        $orderPartCode = $_POST["orderPartCode"] ?? null;
        $userEmail = $_POST["userEmail"] ?? null;
        $userPhone = $_POST["userPhone"] ?? null;
        $orderPartQuantity = $_POST["orderPartQuantity"] ?? null;
        $addressOrder = $_POST["addressOrder"] ?? null;
        $descriptionOrder = $_POST["descriptionOrder"] ?? null;


        $status = orderPart($orderPartCode, $userEmail, $userPhone, $orderPartQuantity, $addressOrder, $descriptionOrder);

        if($status == "success"){
            $smarty -> assign("action", "order");
            $smarty -> assign("status", $status);
            $smarty -> assign("partName", $orderPartName);
            $smarty -> assign("pageTitle", "Успіх!");


            loadTemplate($smarty, "header");
            loadTemplate($smarty, "pageMessage");
        }
    }
}

function ordersAction($smarty){
    $orders = getAllOrders();

    $smarty -> assign("pageTitle", "Головна");
    $smarty -> assign("orders", $orders);
    $smarty -> assign("action", "all");

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "orderList");
    loadTemplate($smarty, "footer");
}

function orderfindAction($smarty){
    $order_id = $_GET["order_id"] ?? null;
    $order_id = trim($order_id, "[NS,L]");



    $orders = getOrderById($order_id);

    $smarty -> assign("pageTitle", "Головна");
    $smarty -> assign("orders", $orders);
    $smarty -> assign("action", "find");

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "orderList");
    loadTemplate($smarty, "footer");
}

function setstatusAction($smarty){
    $order_id = $_GET["order_id"] ?? null;
    $order_id = trim($order_id, "[NS,L]");
    $status = $_GET["status"] ?? null;
    $status = trim($status, "[NS,L]");


    setOrderStatus($order_id, $status);

    header('Location: http://auto/part/orders/');
    exit;

}

function delorderAction($smarty){
    $order_id = $_GET["order_id"] ?? null;
    $order_id = trim($order_id, "[NS,L]");


    deleteFromView($order_id);

    header('Location: http://auto/part/orders/');
    exit;
}

function editnameAction($smarty){
    $part_id = $_GET["part_id"] ?? null;
    $part_id = trim($part_id, "[NS,L]");
    $new_name = $_GET["new_name"] ?? null;
    $new_name = trim($new_name, "[NS,L]");

    $part_code = editPartName($part_id, $new_name);

    header('Location: http://auto/part/show/?part-code='.$part_code);
    exit;
}

function editpriceAction($smarty){
    $part_id = $_GET["part_id"] ?? null;
    $part_id = trim($part_id, "[NS,L]");
    $new_price = $_GET["new_price"] ?? null;
    $new_price = trim($new_price, "[NS,L]");

    $part_code = editPartPrice($part_id, $new_price);

    header('Location: http://auto/part/show/?part-code='.$part_code);
    exit;
}

function partstatusAction($smarty){
    $part_id = $_GET["part_id"] ?? null;
    $part_id = trim($part_id, "[NS,L]");
    $status = $_GET["status"] ?? null;
    $status = trim($status, "[NS,L]");

    $part_code = editPartStatus($part_id, $status);

    header('Location: http://auto/part/show/?part-code='.$part_code);
    exit;
}