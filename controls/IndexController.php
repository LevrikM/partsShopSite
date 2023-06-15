<?php
include_once "../models/IndexModel.php";
include_once "../library/mainFunctions.php";

function indexAction($smarty){

    $rsParts = getParts("quantity", "desc");
    $smarty -> assign("pageTitle", "Головна");
    $smarty -> assign("field", "Кількість");
    $smarty -> assign("order", "за спаданням");
    $smarty -> assign("rsParts", $rsParts);
    $smarty -> assign("action", "show");

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "index");
    loadTemplate($smarty, "footer");
}

function sortAction($smarty){
    $field = $_GET["field"] ?? null;
    $field = trim($field, "[NS,L]");
    $order = $_GET["order"] ?? null;
    $order = trim($order, "[NS,L]");

    $rsParts = getParts($field, $order);
    $smarty -> assign("pageTitle", "Головна");
    $smarty -> assign("field", $field);
    $smarty -> assign("order", $order);
    $smarty -> assign("rsParts", $rsParts);
    $smarty -> assign("action", "show");

    loadTemplate($smarty, "header");
    loadTemplate($smarty, "index");
    loadTemplate($smarty, "footer");
}


