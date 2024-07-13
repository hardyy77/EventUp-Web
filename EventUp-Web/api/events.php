<?php
include 'db.php';

// Ustawienia nagłówków dla obsługi CORS i ustawienie formatu odpowiedzi na JSON
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');

// Pobranie akcji z zapytania GET
$action = $_GET['action'] ?? '';

try {
    // Obsługa akcji w zależności od wartości parametru 'action'
    if ($action == 'getEvents') {
        error_log("Fetching all events");
        getEvents($conn);
    } elseif ($action == 'deleteEvent') {
        $id = $_GET['id'] ?? '';
        error_log("Deleting event: id=$id");
        deleteEvent($conn, $id);
    } elseif ($action == 'getPopularEvents') {
        error_log("Fetching popular events");
        getPopularEvents($conn);
    } elseif ($action == 'getLatestEvents') {
        error_log("Fetching latest events");
        getLatestEvents($conn);
    } elseif ($action == 'searchEvents') {
        $query = $_GET['query'] ?? '';
        error_log("Searching events: query=$query");
        searchEvents($conn, $query);
    } elseif ($action == 'editEvent') {
        $data = json_decode(file_get_contents('php://input'), true);
        $id = $data['id'] ?? '';
        error_log("Editing event: id=$id");
        editEvent($conn, $data);
    } elseif ($action == 'addEvent') {
        error_log("Adding new event");
        addEvent($conn);
    } else {
        // Wyrzucenie wyjątku dla nieprawidłowej akcji
        throw new Exception('Invalid action');
    }
} catch (Exception $e) {
    // Logowanie błędu i zwrócenie komunikatu o błędzie
    error_log("Error: " . $e->getMessage());
    echo json_encode(['error' => $e->getMessage()]);
}

// Funkcja pobierająca wszystkie wydarzenia
function getEvents($conn) {
    // Przygotowanie zapytania SQL
    $sql = "SELECT * FROM events";
    $result = $conn->query($sql);

    // Inicjalizacja tablicy do przechowywania wyników
    $events = array();
    while ($row = $result->fetch_assoc()) {
        $events[] = $row;
    }

    // Sprawdzenie czy znaleziono wydarzenia
    if (empty($events)) {
        error_log("No events found");
        echo json_encode(['message' => 'No events found']);
    } else {
        error_log("Fetched events count: " . count($events));
        echo json_encode($events);
    }
}

// Funkcja usuwająca wydarzenie
function deleteEvent($conn, $id) {
    // Sprawdzenie czy ID wydarzenia jest podane
    if (empty($id)) {
        error_log("Invalid event ID for deletion");
        echo json_encode(['error' => 'Invalid event ID']);
        return;
    }

    // Przygotowanie zapytania SQL do usunięcia wydarzenia
    $sql = "DELETE FROM events WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        error_log("Event deleted successfully: id=$id");
        echo json_encode(['success' => 'Event deleted successfully']);
    } else {
        error_log("Error deleting event: " . $conn->error);
        echo json_encode(['error' => "Error deleting event: " . $conn->error]);
    }
}

// Funkcja pobierająca popularne wydarzenia
function getPopularEvents($conn) {
    // Przygotowanie zapytania SQL do pobrania popularnych wydarzeń
    $sql = "SELECT * FROM events ORDER BY interest DESC LIMIT 6";
    $result = $conn->query($sql);

    // Inicjalizacja tablicy do przechowywania wyników
    $events = array();
    while ($row = $result->fetch_assoc()) {
        $events[] = $row;
    }

    // Sprawdzenie czy znaleziono popularne wydarzenia
    if (empty($events)) {
        error_log("No popular events found");
        echo json_encode(['message' => 'No popular events found']);
    } else {
        error_log("Fetched popular events count: " . count($events));
        echo json_encode($events);
    }
}

// Funkcja pobierająca najnowsze wydarzenia
function getLatestEvents($conn) {
    // Przygotowanie zapytania SQL do pobrania najnowszych wydarzeń
    $sql = "SELECT * FROM events ORDER BY added_date DESC LIMIT 6";
    $result = $conn->query($sql);

    // Inicjalizacja tablicy do przechowywania wyników
    $events = array();
    while ($row = $result->fetch_assoc()) {
        $events[] = $row;
    }

    // Sprawdzenie czy znaleziono najnowsze wydarzenia
    if (empty($events)) {
        error_log("No latest events found");
        echo json_encode(['message' => 'No latest events found']);
    } else {
        error_log("Fetched latest events count: " . count($events));
        echo json_encode($events);
    }
}

// Funkcja wyszukująca wydarzenia
function searchEvents($conn, $query) {
    // Sprawdzenie czy zapytanie wyszukiwania jest podane
    if (empty($query)) {
        error_log("No search query provided");
        echo json_encode(['message' => 'No search query provided']);
        return;
    }

    // Przygotowanie zapytania SQL do wyszukania wydarzeń
    $sql = "SELECT * FROM events WHERE name LIKE '%$query%' OR description LIKE '%$query%' OR location LIKE '%$query%' OR genres LIKE '%$query%'";
    $result = $conn->query($sql);

    // Inicjalizacja tablicy do przechowywania wyników
    $events = array();
    while ($row = $result->fetch_assoc()) {
        $events[] = $row;
    }

    // Sprawdzenie czy znaleziono wydarzenia pasujące do zapytania
    if (empty($events)) {
        error_log("No events found for query: $query");
        echo json_encode(['message' => 'No events found']);
    } else {
        error_log("Fetched events count for query '$query': " . count($events));
        echo json_encode($events);
    }
}

// Funkcja dodająca nowe wydarzenie
function addEvent($conn) {
    // Pobranie danych z zapytania POST
    $name = $_POST['name'] ?? '';
    $location = $_POST['location'] ?? '';
    $date = $_POST['date'] ?? '';
    $genres = $_POST['genres'] ?? '';
    $description = $_POST['description'] ?? '';

    // Sprawdzenie czy wszystkie wymagane dane są podane
    if (empty($name) || empty($location) || empty($date) || empty($genres) || empty($description)) {
        error_log("Missing required fields for adding event");
        echo json_encode(['error' => 'Missing required fields']);
        return;
    }

    // Przygotowanie zapytania SQL do dodania nowego wydarzenia
    $sql = "INSERT INTO events (name, location, date, genres, description) VALUES ('$name', '$location', '$date', '$genres', '$description')";

    // Wykonanie zapytania i obsługa odpowiedzi
    if ($conn->query($sql) === TRUE) {
        error_log("Event added successfully: name=$name");
        echo json_encode(['success' => 'Event added successfully']);
    } else {
        error_log("Error adding event: " . $conn->error);
        echo json_encode(['error' => "Error adding event: " . $conn->error]);
    }
}

// Funkcja edytująca istniejące wydarzenie
function editEvent($conn, $data) {
    // Pobranie danych z tablicy
    $id = $data['id'] ?? '';
    $name = $data['name'] ?? '';
    $location = $data['location'] ?? '';
    $date = $data['date'] ?? '';
    $genres = $data['genres'] ?? '';
    $description = $data['description'] ?? '';

    // Sprawdzenie czy wszystkie wymagane dane są podane
    if (empty($id) || empty($name) || empty($location) || empty($date) || empty($genres) || empty($description)) {
        error_log("Missing required fields for editing event");
        echo json_encode(['error' => 'Missing required fields']);
        return;
    }

    // Przygotowanie zapytania SQL do edycji wydarzenia
    $sql = "UPDATE events SET name='$name', location='$location', date='$date', genres='$genres', description='$description' WHERE id='$id'";

    // Wykonanie zapytania i obsługa odpowiedzi
    if ($conn->query($sql) === TRUE) {
        error_log("Event updated successfully: id=$id");
        echo json_encode(['success' => 'Event updated successfully']);
    } else {
        error_log("Error updating event: " . $conn->error);
        echo json_encode(['error' => "Error updating event: " . $conn->error]);
    }
}
?>
