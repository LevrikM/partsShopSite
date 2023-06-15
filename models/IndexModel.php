<?php
function getParts($field, $order){
    $sql = "SELECT * FROM Parts ORDER BY $field $order";
    $result = mysqli_query($GLOBALS["mysql"], $sql);

    return $result;
}