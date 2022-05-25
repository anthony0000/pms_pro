<?php
    require "php/db_connection.php";
    session_start();
    if($con) {
        session_unset();
        session_destroy();
        $query = "UPDATE admin_credentials SET IS_LOGGED_IN = 'false'";
        $result = mysqli_query($con, $query);
    }
    header('location: login.php');
?>