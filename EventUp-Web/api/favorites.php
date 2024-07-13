<?php
include 'db.php';

// Ustawienia nagłówków dla obsługi CORS i ustawienie formatu odpowiedzi na JSON
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');

// Pobranie akcji z zapytania GET lub POST
$action = $_GET['action'] ?? $_POST['action'] ?? '';

try {
    // Obsługa akcji w zależności od wartości parametru 'action'
    if ($action == 'getFavorites') {
        $userId = $_GET['userId'] ?? '';
        error_log("Fetching favorites for userId: $userId");
        getFavorites($conn, $userId);
    } elseif ($action == 'addFavorite') {
        $userId = $_POST['userId'] ?? '';
        $eventId = $_POST['eventId'] ?? '';
        error_log("Adding favorite: userId=$userId, eventId=$eventId");
        addFavorite($conn, $userId, $eventId);
    } elseif ($action == 'removeFavorite') {
        $userId = $_POST['userId'] ?? '';
        $eventId = $_POST['eventId'] ?? '';
        error_log("Removing favorite: userId=$userId, eventId=$eventId");
        removeFavorite($conn, $userId, $eventId);
    } else {
        // Wyrzucenie wyjątku dla nieprawidłowej akcji
        throw new Exception('Invalid action');
    }
} catch (Exception $e) {
    // Logowanie błędu i zwrócenie komunikatu o błędzie
    error_log("Error: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
}

// Funkcja pobierająca ulubione wydarzenia użytkownika
function getFavorites($conn, $userId) {
    // Przygotowanie zapytania SQL do pobrania ulubionych wydarzeń użytkownika
    $sql = "SELECT e.* FROM events e JOIN user_favorites f ON e.id = f.event_id WHERE f.user_id = '$userId'";
    $result = $conn->query($sql);

    // Inicjalizacja tablicy do przechowywania wyników
    $events = array();
    while ($row = $result->fetch_assoc()) {
        $events[] = $row;
    }

    // Logowanie liczby znalezionych ulubionych wydarzeń i zwrócenie wyników
    error_log("Fetched favorite events count for userId '$userId': " . count($events));
    echo json_encode($events);
}

// Funkcja dodająca wydarzenie do ulubionych użytkownika
function addFavorite($conn, $userId, $eventId) {
    // Przygotowanie zapytania SQL do dodania wydarzenia do ulubionych
    $sql = "INSERT INTO user_favorites (user_id, event_id) VALUES ('$userId', '$eventId')";
    
    // Wykonanie zapytania i obsługa odpowiedzi
    if ($conn->query($sql) === TRUE) {
        error_log("Event added to favorites: userId=$userId, eventId=$eventId");
        echo json_encode(['success' => 'Event added to favorites']);
    } else {
        error_log("Error adding event to favorites: " . $conn->error);
        echo json_encode(['error' => "Error: " . $conn->error]);
    }
}

// Funkcja usuwająca wydarzenie z ulubionych użytkownika
function removeFavorite($conn, $userId, $eventId) {
    // Przygotowanie zapytania SQL do usunięcia wydarzenia z ulubionych
    $sql = "DELETE FROM user_favorites WHERE user_id = '$userId' AND event_id = '$eventId'";
    
    // Wykonanie zapytania i obsługa odpowiedzi
    if ($conn->query($sql) === TRUE) {
        error_log("Event removed from favorites: userId=$userId, eventId=$eventId");
        echo json_encode(['success' => 'Event removed from favorites']);
    } else {
        error_log("Error removing event from favorites: " . $conn->error);
        echo json_encode(['error' => "Error: " . $conn->error]);
    }
}
?>
