import { API_URL, fetchJson } from '../utils.js';

// Funkcja rejestracji nowego użytkownika
export async function registerUser(email, password, displayName) {
    console.log('Register user function called with:', email, password, displayName);

    const formData = new FormData();
    formData.append('action', 'register');
    formData.append('email', email);
    formData.append('password', password);
    formData.append('displayName', displayName);

    try {
        // Wysyłanie żądania rejestracji do serwera
        const response = await fetch(`${API_URL}/auth.php`, {
            method: 'POST',
            body: formData
        });

        // Odczytanie i parsowanie odpowiedzi jako JSON
        const result = await response.json();
        console.log('Register result:', result);

        if (result.success) {
            // Powiadomienie użytkownika o pomyślnej rejestracji
            alert('Rejestracja zakończona pomyślnie. Możesz się teraz zalogować.');
            document.getElementById('register-form').reset();
            document.getElementById('register-form').style.display = 'none';
            document.getElementById('login-form').style.display = 'block';
        } else {
            // Powiadomienie użytkownika o błędzie rejestracji
            alert(result.error || 'Rejestracja nie powiodła się');
        }
    } catch (error) {
        // Logowanie błędu i powiadomienie użytkownika
        console.error('Błąd rejestracji:', error);
        alert('Wystąpił błąd podczas rejestracji');
    }
}

// Obsługa zdarzenia wysłania formularza rejestracji
document.getElementById('register-form').addEventListener('submit', async (event) => {
    event.preventDefault();

    // Pobranie danych z formularza
    let email = document.getElementById('register-email').value;
    let password = document.getElementById('register-password').value;
    let displayName = document.getElementById('register-display-name').value;

    console.log('Form data:', { email, password, displayName });

    // Wywołanie funkcji rejestracji użytkownika
    await registerUser(email, password, displayName);
});
