<?php
$servername = "192.168.1.144"; // Adres serwera MySQL
$username = "root";             // Nazwa użytkownika MySQL
$password = "root";             // Hasło do MySQL
$dbname = "eventup";            // Nazwa bazy danych

// Tworzenie połączenia
$conn = new mysqli($servername, $username, $password, $dbname);

// Sprawdzanie połączenia
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully to the database.";
?>
