<?php
// Ustawienia połączenia z bazą danych
$servername = "192.168.1.144";
$username = "root";
$password = "root";
$dbname = "eventup";

// Utworzenie nowego połączenia z bazą danych
$conn = new mysqli($servername, $username, $password, $dbname);

// Sprawdzenie czy połączenie zostało nawiązane poprawnie
if ($conn->connect_error) {
    // Logowanie błędu połączenia z bazą danych
    error_log("Connection failed: " . $conn->connect_error);
    // Zakończenie skryptu i wyświetlenie komunikatu o błędzie
    die("Connection failed: " . $conn->connect_error);
}

// Logowanie udanego połączenia z bazą danych
error_log("Connected successfully to database");
?>
