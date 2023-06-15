<?php
include_once "../library/mainFunctions.php";
include_once "../config/config.php";
include "../config/dbParams.php";

$controllerName = isset($_GET["controller"]) ? ucfirst($_GET["controller"]) : "Index";
$actionName = isset($_GET["action"]) ? $_GET["action"] : "index";

loadPage($smarty, $controllerName, $actionName);