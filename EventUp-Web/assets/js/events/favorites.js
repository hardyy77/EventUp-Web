import { fetchJson, API_URL, currentUser, setFavoriteEventIds, favoriteEventIds, allEvents } from '../utils.js';
import { displayEvents } from './events.js';

// Pobiera ulubione wydarzenia użytkownika
export async function getFavoriteEvents(userId) {
    console.log('Fetching favorite events for userId:', userId);
    try {
        const favoriteEvents = await fetchJson(`${API_URL}/favorites.php?action=getFavorites&userId=${userId}`);
        setFavoriteEventIds(favoriteEvents.map(event => event.id));
        return favoriteEvents;
    } catch (error) {
        console.error('Błąd pobierania ulubionych wydarzeń:', error);
        alert('Wystąpił błąd podczas pobierania ulubionych wydarzeń');
    }
}

// Dodaje wydarzenie do ulubionych
export async function addFavoriteEvent(userId, eventId) {
    console.log('Adding favorite event for userId:', userId, 'eventId:', eventId);
    const formData = new FormData();
    formData.append('userId', userId);
    formData.append('eventId', eventId);

    try {
        return fetchJson(`${API_URL}/favorites.php?action=addFavorite`, {
            method: 'POST',
            body: formData
        });
    } catch (error) {
        console.error('Błąd dodawania ulubionego wydarzenia:', error);
        alert('Wystąpił błąd podczas dodawania ulubionego wydarzenia');
    }
}

// Usuwa wydarzenie z ulubionych
export async function removeFavoriteEvent(userId, eventId) {
    console.log('Removing favorite event for userId:', userId, 'eventId:', eventId);
    const formData = new FormData();
    formData.append('userId', userId);
    formData.append('eventId', eventId);

    try {
        return fetchJson(`${API_URL}/favorites.php?action=removeFavorite`, {
            method: 'POST',
            body: formData
        });
    } catch (error) {
        console.error('Błąd usuwania ulubionego wydarzenia:', error);
        alert('Wystąpił błąd podczas usuwania ulubionego wydarzenia');
    }
}

// Przełącza stan ulubionego wydarzenia (dodaje lub usuwa)
export async function toggleFavorite(eventId) {
    console.log('Toggling favorite for eventId:', eventId);
    if (!currentUser || !favoriteEventIds) {
        console.error('User not logged in or favoriteEventIds not loaded');
        alert('Proszę się zalogować i upewnić się, że ulubione wydarzenia są załadowane.');
        return;
    }

    try {
        let isFavorite = favoriteEventIds.includes(eventId);
        if (isFavorite) {
            await removeFavoriteEvent(currentUser.uid, eventId);
            setFavoriteEventIds(favoriteEventIds.filter(id => id !== eventId));
        } else {
            await addFavoriteEvent(currentUser.uid, eventId);
            setFavoriteEventIds([...favoriteEventIds, eventId]);
        }

        // Pobierz i wyświetl wydarzenia ponownie
        const events = await fetchJson(`${API_URL}/events.php?action=getEvents`);
        allEvents.splice(0, allEvents.length, ...events);
        displayEvents(allEvents, 'events-list');
        displayEvents(allEvents, 'search-results-list');

        // Pobierz i renderuj ulubione wydarzenia ponownie
        const favoriteEvents = await getFavoriteEvents(currentUser.uid);
        renderFavorites(favoriteEvents);
    } catch (error) {
        console.error('Błąd podczas przełączania ulubionego wydarzenia:', error);
        alert('Wystąpił błąd podczas przełączania ulubionego wydarzenia');
    }
}

// Renderuje ulubione wydarzenia
export function renderFavorites(favoriteEvents) {
    const favoritesList = document.getElementById('favorites-list');
    if (!favoritesList) {
        console.warn('Favorites list element not found');
        return;
    }

    favoritesList.innerHTML = ''; // Wyczyść poprzednie ulubione wydarzenia

    if (favoriteEvents.length === 0) {
        favoritesList.innerHTML = '<p>Nie masz jeszcze ulubionych wydarzeń.</p>';
    } else {
        favoriteEvents.forEach(event => {
            const eventItem = document.createElement('div');
            eventItem.className = 'event-card';
            eventItem.innerHTML = `
                <div class="event-card-content">
                    <h3>${event.name}</h3>
                    <p>${event.location}</p>
                    <p>${event.date}</p>
                    <p>Gatunek: ${event.genres || 'Brak informacji'}</p>
                    <div class="event-card-footer">
                        <button onclick="toggleFavorite(${event.id})">${favoriteEventIds.includes(event.id) ? 'Usuń z ulubionych' : 'Ulubione'}</button>
                    </div>
                </div>
            `;
            favoritesList.appendChild(eventItem);
        });
    }
}

// Przypisanie funkcji do globalnego obiektu window
window.toggleFavorite = toggleFavorite;
window.renderFavorites = renderFavorites;
