<?php

function loadPage($smarty, $controllerName, $action="index"){
    if(file_exists(PathPrefix.$controllerName.PathPostfix)){
        require_once PathPrefix.$controllerName.PathPostfix;
        $func = $action."Action";
        if(function_exists($func)){
            $func($smarty);
        }
    }
}

function convertToReadableData($record_set){
    if(!$record_set) return false;
    $readableData = array();
    while ($row = mysqli_fetch_assoc($record_set)){
        $readableData[] = $row;
    }
    return $readableData;
}

function loadTemplate($smarty, $templateName){
    $smarty -> display($templateName.TemplatePostfix);
}