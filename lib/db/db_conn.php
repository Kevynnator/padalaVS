<?php
$servername = "kevynn.helioho.st";
$username = "kevynn_admin";
$password = "j36C@u73I";
$database = "kevynn_userdb";

// Create connection
$conn = new mysqli($servername, $username, $password, $database);

// Check connection
if ($conn->connect_error) {
    error_log("Database connection failed: " . $conn->connect_error);
    exit("Database connection error. Please try again later.");
}
?>