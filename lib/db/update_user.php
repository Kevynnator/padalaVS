<?php
include 'db_conn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $username = $_POST['username'];
    $phone_number = $_POST['phone_number'];

    $sql = "UPDATE users SET username='$username', phone_number='$phone_number' WHERE id=$id";

    if ($conn->query($sql) === TRUE) {
        echo "User updated successfully";
    } else {
        echo "Error updating user: " . $conn->error;
    }

    $conn->close();
}
?>