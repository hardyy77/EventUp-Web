import { API_URL, fetchJson, updateProfileLink, updateProfileSection, setCurrentUser, setFavoriteEventIds, loadEvents } from '../utils.js';
import { getFavoriteEvents, renderFavorites } from '../events/favorites.js';

export async function loginUser(email, password) {
    console.log('Login user function called with:', email, password);

    const formData = new FormData();
    formData.append('action', 'login');
    formData.append('email', email);
    formData.append('password', password);

    try {
        // Wysyłanie żądania logowania do serwera
        const response = await fetch(`${API_URL}/auth.php`, {
            method: 'POST',
            body: formData
        });

        // Odczytanie odpowiedzi jako tekst
        const text = await response.text();
        console.log('Raw response text:', text);

        // Parsowanie odpowiedzi jako JSON
        const result = JSON.parse(text);
        console.log('Parsed login result:', result);

        if (result.success) {
            // Ustawienie bieżącego użytkownika
            setCurrentUser(result.user);
            localStorage.setItem('currentUser', JSON.stringify(result.user));
            console.log('User set in localStorage:', result.user);

            // Pobranie ulubionych wydarzeń użytkownika
            const favoriteEvents = await getFavoriteEvents(result.user.uid);
            const favoriteEventIds = favoriteEvents.map(event => event.id);
            setFavoriteEventIds(favoriteEventIds);
            localStorage.setItem('favoriteEventIds', JSON.stringify(favoriteEventIds));
            console.log('Fetched favoriteEventIds:', favoriteEventIds);

            // Załadowanie wydarzeń po zalogowaniu
            await loadEvents();
            updateProfileLink();
            updateProfileSection();
            alert('Zalogowano pomyślnie');
            window.location.reload(); // Przeładowanie strony w celu aktualizacji sekcji profilu
        } else {
            alert(result.error || 'Login failed');
        }
    } catch (error) {
        console.error('Błąd logowania:', error);
        alert('Wystąpił błąd podczas logowania');
    }
}

// Obsługa zdarzeń DOMContentLoaded
document.addEventListener('DOMContentLoaded', () => {
    // Obsługa wysłania formularza logowania
    document.getElementById('login-form').addEventListener('submit', async (event) => {
        event.preventDefault();
        let email = document.getElementById('login-email').value;
        let password = document.getElementById('login-password').value;

        console.log('Form data:', { email, password });
        await loginUser(email, password);
    });

    // Obsługa przełączania do formularza rejestracji
    document.getElementById('show-register-form').addEventListener('click', (event) => {
        event.preventDefault();
        console.log('Showing register form');
        document.getElementById('login-form').style.display = 'none';
        document.getElementById('register-form').style.display = 'block';

        const backToLoginLink = document.createElement('p');
        backToLoginLink.innerHTML = 'Masz już konto? <a href="#" id="show-login-form">Zaloguj się</a>';
        document.getElementById('register-form').appendChild(backToLoginLink);

        // Obsługa przełączania do formularza logowania
        document.getElementById('show-login-form').addEventListener('click', (event) => {
            event.preventDefault();
            console.log('Showing login form');
            document.getElementById('register-form').style.display = 'none';
            document.getElementById('login-form').style.display = 'block';
        });
    });
});
