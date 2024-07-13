export const API_URL = 'http://localhost/EventUp_web/EventUp-Web/api';
export let allEvents = [];
export let currentUser = JSON.parse(localStorage.getItem('currentUser')) || null;
export let favoriteEventIds = JSON.parse(localStorage.getItem('favoriteEventIds')) || [];

// Ustawia bieżącego użytkownika i zapisuje go w localStorage
export function setCurrentUser(user) {
    currentUser = user;
    localStorage.setItem('currentUser', JSON.stringify(user));
    console.log('Current user set:', user);
}

// Ustawia identyfikatory ulubionych wydarzeń i zapisuje je w localStorage
export function setFavoriteEventIds(ids) {
    favoriteEventIds = ids;
    localStorage.setItem('favoriteEventIds', JSON.stringify(ids));
    console.log('Favorite event IDs set:', ids);
}

// Pobiera dane w formacie JSON z podanego URL i obsługuje błędy
export async function fetchJson(url, options = {}) {
    console.log('Fetching URL:', url, 'with options:', options);
    try {
        const response = await fetch(url, options);
        if (!response.ok) {
            const text = await response.text();
            console.error('Response was not ok:', text);
            throw new Error('Network response was not ok');
        }
        const jsonData = await response.json();
        console.log('Received JSON:', jsonData);
        return jsonData;
    } catch (error) {
        console.error('Fetching error or JSON parsing error:', error);
        throw new Error('Fetching or JSON parsing error');
    }
}

// Ładuje wszystkie wydarzenia i zapisuje je w allEvents
export async function loadEvents() {
    console.log('Loading events');
    try {
        const events = await fetchJson(`${API_URL}/events.php?action=getEvents`);
        allEvents.splice(0, allEvents.length, ...events);
        console.log('Loaded events:', allEvents);
    } catch (error) {
        console.error('Error loading events:', error);
        alert('Wystąpił błąd podczas ładowania wydarzeń');
    }
}

// Aktualizuje link do profilu z danymi bieżącego użytkownika
export function updateProfileLink() {
    console.log('Updating profile link with currentUser:', currentUser);
    const profileLink = document.querySelector('nav ul li a[href="#profile"]');
    if (profileLink && currentUser) {
        profileLink.textContent = `Profile (${currentUser.displayName || currentUser.email})`;
    }
}

// Aktualizuje sekcję profilu na podstawie danych bieżącego użytkownika
export async function updateProfileSection() {
    console.log('Updating profile section with currentUser:', currentUser);
    const registerForm = document.getElementById('register-form');
    const loginForm = document.getElementById('login-form');
    const profileInfo = document.getElementById('profile-info');
    const adminActions = document.getElementById('admin-actions');

    if (currentUser) {
        registerForm.style.display = 'none';
        loginForm.style.display = 'none';
        profileInfo.style.display = 'block';
        profileInfo.innerHTML = `
            <p id="welcome-message">Witaj, ${currentUser.displayName || currentUser.email}!</p>
            <button onclick="logoutUser()">Logout</button>
        `;
        if (currentUser.role === 'admin') {
            adminActions.style.display = 'block';
        }
    } else {
        registerForm.style.display = 'none';
        loginForm.style.display = 'block';
        profileInfo.style.display = 'none';
        adminActions.style.display = 'none';
    }
}

// Pokazuje wybraną sekcję i zapisuje jej identyfikator w localStorage
export function showSection(section) {
    console.log('Showing section:', section);
    localStorage.setItem('currentSection', section);
    const sections = document.querySelectorAll('main > section');
    sections.forEach(sec => sec.style.display = 'none');

    const activeSection = document.getElementById(`${section}-section`);
    if (activeSection) {
        activeSection.style.display = 'block';
    }

    if (section === 'profile') {
        updateProfileSection();
    }
}

// Wylogowuje użytkownika, czyści dane i aktualizuje interfejs
export function logoutUser() {
    console.log('Logging out user');
    currentUser = null;
    favoriteEventIds = [];
    localStorage.removeItem('currentUser');
    localStorage.removeItem('favoriteEventIds');
    updateProfileLink();
    updateProfileSection();
    alert('Logged out successfully');
}

window.logoutUser = logoutUser; // Udostępnia funkcję logoutUser globalnie
