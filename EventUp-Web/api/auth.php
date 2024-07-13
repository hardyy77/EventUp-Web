<?php
include 'db.php';

// Zezwól na zapytania cross-origin i ustaw typ zawartości
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');

// Pobierz akcję z zapytania
$action = $_POST['action'] ?? '';

try {
    // Zaloguj otrzymaną akcję
    error_log("Request action: $action");
    
    // Obsługa akcji logowania
    if ($action == 'login') {
        $email = $_POST['email'] ?? '';
        $password = $_POST['password'] ?? '';
        error_log("Login attempt: email=$email");
        loginUser($conn, $email, $password);
    }
    // Obsługa akcji rejestracji
    elseif ($action == 'register') {
        $email = $_POST['email'] ?? '';
        $password = $_POST['password'] ?? '';
        $displayName = $_POST['displayName'] ?? '';
        error_log("Register attempt: email=$email, displayName=$displayName");
        registerUser($conn, $email, $password, $displayName);
    } 
    // Obsługa nieprawidłowych akcji
    else {
        throw new Exception('Invalid action');
    }
} catch (Exception $e) {
    // Zaloguj i zwróć komunikat o błędzie
    error_log("Error: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
}

// Funkcja logowania użytkownika
function loginUser($conn, $email, $password) {
    // Logowanie wywołania funkcji z podanym emailem
    error_log("loginUser called with email=$email");

    // Przygotowanie zapytania SQL do pobrania użytkownika
    $sql = "SELECT * FROM users WHERE email=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    // Sprawdzenie czy użytkownik istnieje
    if ($result->num_rows == 0) {
        error_log("Login failed: email not found");
        echo json_encode(['error' => 'Invalid email or password']);
        return;
    }

    $user = $result->fetch_assoc();
    $hashedPassword = hash('sha256', $password);

    // Weryfikacja hasła
    if ($hashedPassword !== $user['password']) {
        error_log("Login failed: incorrect password");
        echo json_encode(['error' => 'Invalid email or password']);
        return;
    }

    // Zalogowanie udanego logowania
    error_log("Login successful: email=$email, uid=".$user['uid']);
    echo json_encode(['success' => 'Login successful', 'user' => [
        'uid' => $user['uid'],
        'email' => $user['email'],
        'displayName' => $user['displayName'],
        'role' => $user['role']
    ]]);
}

// Funkcja rejestracji użytkownika
function registerUser($conn, $email, $password, $displayName) {
    // Logowanie wywołania funkcji z podanym emailem i nazwą wyświetlaną
    error_log("registerUser called with email=$email, displayName=$displayName");

    $hashedPassword = hash('sha256', $password);

    // Przygotowanie zapytania SQL do dodania nowego użytkownika
    $sql = "INSERT INTO users (email, password, displayName, role) VALUES (?, ?, ?, 'user')";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $email, $hashedPassword, $displayName);

    // Wykonanie zapytania i sprawdzenie czy operacja się powiodła
    if ($stmt->execute() === TRUE) {
        error_log("Register successful: email=$email");
        echo json_encode(['success' => 'Registration successful']);
    } else {
        error_log("Register failed: " . $stmt->error);
        echo json_encode(['error' => "Error: " . $stmt->error]);
    }
}
?>
