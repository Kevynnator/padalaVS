<?php
include 'db_conn.php';

$sql = "SELECT id, username, phone_number FROM users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"]. " - Username: " . $row["username"]. " - Phone Number: " . $row["phone_number"]. "<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>