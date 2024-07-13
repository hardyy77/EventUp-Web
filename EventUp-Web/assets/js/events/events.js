import { fetchJson, API_URL, currentUser, favoriteEventIds, allEvents, setFavoriteEventIds } from '../utils.js';
import { toggleFavorite } from './favorites.js';

// Funkcja pobierająca wszystkie wydarzenia
export async function getEvents() {
    console.log('Fetching events');
    return fetchJson(`${API_URL}/events.php?action=getEvents`);
}

// Funkcja pobierająca popularne wydarzenia
export async function getPopularEvents(limit) {
    console.log('Fetching popular events');
    const events = await fetchJson(`${API_URL}/events.php?action=getPopularEvents&limit=${limit}`);
    return events;
}

// Funkcja pobierająca najnowsze wydarzenia
export async function getLatestEvents(limit) {
    console.log('Fetching latest events');
    const events = await fetchJson(`${API_URL}/events.php?action=getLatestEvents&limit=${limit}`);
    return events;
}

// Funkcja dodająca nowe wydarzenie
export async function addEvent(eventData) {
    console.log('Adding event:', eventData);
    const formData = new FormData();
    formData.append('action', 'addEvent');
    Object.keys(eventData).forEach(key => formData.append(key, eventData[key]));

    return fetchJson(`${API_URL}/events.php`, {
        method: 'POST',
        body: formData
    });
}

// Funkcja edytująca istniejące wydarzenie
export async function editEvent(eventData) {
    console.log('Editing event:', eventData);
    const response = await fetch(`${API_URL}/events.php?action=editEvent`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(eventData)
    });

    const result = await response.json();

    if (response.ok) {
        return result;
    } else {
        throw new Error(result.error || 'Error editing event');
    }
}

// Funkcja usuwająca wydarzenie
export async function deleteEvent(eventId) {
    console.log('Deleting event:', eventId);
    const formData = new FormData();
    formData.append('action', 'deleteEvent');
    formData.append('id', eventId);

    return fetchJson(`${API_URL}/events.php`, {
        method: 'POST',
        body: formData
    });
}

// Funkcja wyświetlająca wydarzenia
export function displayEvents(events, containerId) {
    const container = document.getElementById(containerId);
    if (!container) return;

    container.innerHTML = '';

    if (events.length === 0) {
        container.innerHTML = '<p>Brak wydarzeń do wyświetlenia.</p>';
        return;
    }

    const eventCards = document.createElement('div');
    eventCards.className = 'event-cards';

    events.forEach(event => {
        const eventCard = document.createElement('div');
        eventCard.className = 'event-card';

        const eventCardContent = document.createElement('div');
        eventCardContent.className = 'event-card-content';

        const eventTitle = document.createElement('h3');
        eventTitle.textContent = event.name;

        const eventLocation = document.createElement('p');
        eventLocation.textContent = event.location;

        const eventDate = document.createElement('p');
        eventDate.textContent = event.date;

        const eventGenre = document.createElement('p');
        eventGenre.textContent = `Gatunek: ${event.genres || 'Brak informacji'}`;

        const eventCardFooter = document.createElement('div');
        eventCardFooter.className = 'event-card-footer';

        const favoriteButton = document.createElement('button');
        favoriteButton.textContent = favoriteEventIds && favoriteEventIds.includes(event.id) ? 'Usuń z ulubionych' : 'Ulubione';
        favoriteButton.onclick = () => toggleFavorite(event.id);

        eventCardFooter.appendChild(favoriteButton);

        if (currentUser && currentUser.role === 'admin') {
            const editButton = document.createElement('button');
            editButton.textContent = 'Edytuj';
            editButton.onclick = () => openEditEventForm(event);
            eventCardFooter.appendChild(editButton);

            const deleteButton = document.createElement('button');
            deleteButton.textContent = 'Usuń';
            deleteButton.onclick = async () => {
                if (confirm('Czy na pewno chcesz usunąć to wydarzenie?')) {
                    await deleteEvent(event.id);
                    loadEvents();
                }
            };
            eventCardFooter.appendChild(deleteButton);
        }

        eventCardContent.appendChild(eventTitle);
        eventCardContent.appendChild(eventLocation);
        eventCardContent.appendChild(eventDate);
        eventCardContent.appendChild(eventGenre);
        eventCardContent.appendChild(eventCardFooter);

        eventCard.appendChild(eventCardContent);

        eventCards.appendChild(eventCard);
    });

    container.appendChild(eventCards);
}

// Funkcja otwierająca formularz edycji wydarzenia
function openEditEventForm(event) {
    document.getElementById('edit-event-id').value = event.id;
    document.getElementById('edit-event-name').value = event.name;
    document.getElementById('edit-event-location').value = event.location;
    document.getElementById('edit-event-date').value = event.date;
    document.getElementById('edit-event-genres').value = event.genres;
    document.getElementById('edit-event-description').value = event.description;
    document.getElementById('edit-modal').style.display = 'block';
}

// Obsługa zdarzenia DOMContentLoaded
document.addEventListener('DOMContentLoaded', async () => {
    const eventsSection = document.getElementById('events-section');
    if (eventsSection) {
        await loadEvents();

        const closeButton = document.querySelector('.close-button');
        if (closeButton) {
            closeButton.addEventListener('click', () => {
                document.getElementById('edit-modal').style.display = 'none';
            });
        }

        window.addEventListener('click', (event) => {
            if (event.target == document.getElementById('edit-modal')) {
                document.getElementById('edit-modal').style.display = 'none';
            }
        });

        const editEventForm = document.getElementById('edit-event-form');
        if (editEventForm) {
            editEventForm.addEventListener('submit', async (e) => {
                e.preventDefault();

                const eventId = document.getElementById('edit-event-id').value;
                const name = document.getElementById('edit-event-name').value;
                const location = document.getElementById('edit-event-location').value;
                const date = document.getElementById('edit-event-date').value;
                const genres = document.getElementById('edit-event-genres').value;
                const description = document.getElementById('edit-event-description').value;

                try {
                    const response = await editEvent({ id: eventId, name, location, date, genres, description });
                    alert('Wydarzenie zostało zaktualizowane');
                    document.getElementById('edit-modal').style.display = 'none';
                    loadEvents();
                } catch (error) {
                    console.error('Błąd podczas zapisywania zmian:', error);
                    alert('Wystąpił błąd podczas zapisywania zmian: ' + error.message);
                }
            });
        }
    }
});

window.displayEvents = displayEvents;
window.getPopularEvents = getPopularEvents;
window.getLatestEvents = getLatestEvents;
window.openEditEventForm = openEditEventForm;
