// conocernos · couples card game
(() => {
  'use strict';

  const MAX_SKIPS = 3;
  const LS_THEME = 'conocernos:theme';
  const LS_FAVS = 'conocernos:favorites';
  const LS_PLAYERS = 'conocernos:players';
  const LS_FILTERS = 'conocernos:filters';

  const ALL_CATEGORIES = ['revelaciones','complicidad','futuro','intimidad','retos'];
  const ALL_LEVELS = ['suave','picante','sin-filtros'];
  const ALL_AUDIENCES = ['inicio','establecida'];
  const ALL_AGES = ['16-25','26-40','40+'];

  const CATEGORY_LABELS = {
    'revelaciones': 'Revelaciones íntimas',
    'complicidad':  'Complicidad',
    'futuro':       'Futuro',
    'intimidad':    'Intimidad',
    'retos':        'Retos',
  };

  const LEVEL_LABELS = {
    'suave':       'Suave',
    'picante':     'Picante',
    'sin-filtros': 'Sin filtros',
  };

  // -------- estado --------
  const state = {
    questions: [],
    pool: [],
    seen: new Set(),
    skipsLeft: MAX_SKIPS,
    turn: 0, // 0 = p1, 1 = p2
    players: ['', ''],
    current: null,
    favorites: new Set(loadFavorites()),
    theme: localStorage.getItem(LS_THEME) || 'noche',
    prevScreen: 'welcome',
    filters: loadFilters(),
  };

  function loadFilters() {
    try {
      const raw = JSON.parse(localStorage.getItem(LS_FILTERS) || 'null');
      if (!raw) throw 0;
      const validAge = raw.age && (raw.age === 'any' || ALL_AGES.includes(raw.age)) ? raw.age : 'any';
      return {
        categories: new Set(raw.categories?.length ? raw.categories : ALL_CATEGORIES),
        levels: new Set(raw.levels?.length ? raw.levels : ALL_LEVELS),
        audiences: new Set(raw.audiences?.length ? raw.audiences : ALL_AUDIENCES),
        age: validAge,
      };
    } catch {
      return {
        categories: new Set(ALL_CATEGORIES),
        levels: new Set(ALL_LEVELS),
        audiences: new Set(ALL_AUDIENCES),
        age: 'any',
      };
    }
  }
  function saveFilters() {
    localStorage.setItem(LS_FILTERS, JSON.stringify({
      categories: [...state.filters.categories],
      levels: [...state.filters.levels],
      audiences: [...state.filters.audiences],
      age: state.filters.age,
    }));
  }

  // -------- helpers persistencia --------
  function loadFavorites() {
    try { return JSON.parse(localStorage.getItem(LS_FAVS) || '[]'); }
    catch { return []; }
  }
  function saveFavorites() {
    localStorage.setItem(LS_FAVS, JSON.stringify([...state.favorites]));
  }
  function loadPlayers() {
    try { return JSON.parse(localStorage.getItem(LS_PLAYERS) || '["",""]'); }
    catch { return ['', '']; }
  }
  function savePlayers() {
    localStorage.setItem(LS_PLAYERS, JSON.stringify(state.players));
  }

  // -------- DOM --------
  const $ = (id) => document.getElementById(id);

  const screens = {
    welcome:   $('screen-welcome'),
    game:      $('screen-game'),
    favorites: $('screen-favorites'),
    end:       $('screen-end'),
  };

  function show(name) {
    Object.entries(screens).forEach(([k, el]) => {
      el.classList.toggle('active', k === name);
    });
    if (name !== 'favorites') state.prevScreen = name;
  }

  // -------- tema --------
  function applyTheme() {
    document.documentElement.setAttribute('data-theme', state.theme);
    const metaColor = document.querySelector('meta[name="theme-color"]');
    if (metaColor) {
      metaColor.setAttribute('content', state.theme === 'noche' ? '#0f0a0c' : '#fdf6f3');
    }
  }
  function toggleTheme() {
    state.theme = state.theme === 'noche' ? 'aurora' : 'noche';
    localStorage.setItem(LS_THEME, state.theme);
    applyTheme();
  }

  // -------- carga preguntas --------
  async function loadQuestions() {
    const res = await fetch('/api/questions');
    if (!res.ok) throw new Error('Fallo al cargar preguntas');
    state.questions = await res.json();
  }

  // -------- lógica juego --------
  function questionMatchesAge(q) {
    if (state.filters.age === 'any') return true;
    const ages = (q.ages || 'all').split(',').map(s => s.trim());
    return ages.includes('all') || ages.includes(state.filters.age);
  }
  function computePool() {
    state.pool = state.questions.filter(q =>
      state.filters.categories.has(q.category) &&
      state.filters.levels.has(q.level) &&
      state.filters.audiences.has(q.audience) &&
      questionMatchesAge(q)
    );
  }
  function pickRandom() {
    const available = state.pool.filter(q => !state.seen.has(q.id));
    if (available.length === 0) return null;
    return available[Math.floor(Math.random() * available.length)];
  }

  function renderCard(q) {
    state.current = q;
    const card = $('card');
    card.dataset.category = q.category;
    $('card-category').textContent = CATEGORY_LABELS[q.category] || q.category;
    $('card-level').textContent = LEVEL_LABELS[q.level] || q.level;
    $('card-text').textContent = q.text;
    const playerName = state.players[state.turn] || `Jugador/a ${state.turn + 1}`;
    $('card-turn').innerHTML = `Turno de <strong>${escapeHtml(playerName)}</strong>`;

    const favBtn = $('btn-fav');
    favBtn.setAttribute('aria-pressed', state.favorites.has(q.id));

    $('card-counter').textContent = state.seen.size + 1;
    $('card-total').textContent = state.pool.length;
    $('skips-left').textContent = state.skipsLeft;
    $('btn-skip').disabled = state.skipsLeft <= 0;

    card.classList.remove('flip-in');
    void card.offsetWidth;
    card.classList.add('flip-in');
  }

  function nextCard({ skipped = false } = {}) {
    if (state.current) {
      state.seen.add(state.current.id);
      if (skipped) state.skipsLeft--;
    }
    if (state.seen.size >= state.pool.length) {
      return endGame();
    }
    state.turn = 1 - state.turn;
    const q = pickRandom();
    if (!q) return endGame();
    renderCard(q);
  }

  function startGame() {
    computePool();
    if (state.pool.length === 0) {
      alert('El mazo está vacío. Selecciona al menos una categoría y un nivel.');
      return;
    }
    state.seen = new Set();
    state.skipsLeft = MAX_SKIPS;
    state.turn = Math.random() < 0.5 ? 0 : 1;
    state.current = null;
    show('game');
    const q = pickRandom();
    if (q) renderCard(q);
  }

  function endGame() {
    $('stat-played').textContent = state.seen.size;
    $('stat-favs').textContent = state.favorites.size;
    show('end');
  }

  function toggleFavorite() {
    if (!state.current) return;
    const id = state.current.id;
    if (state.favorites.has(id)) state.favorites.delete(id);
    else state.favorites.add(id);
    saveFavorites();
    $('btn-fav').setAttribute('aria-pressed', state.favorites.has(id));
  }

  function renderFavorites() {
    const list = $('favorites-list');
    const empty = $('favorites-empty');
    list.innerHTML = '';
    const favIds = [...state.favorites];
    if (favIds.length === 0) {
      empty.classList.remove('hidden');
      return;
    }
    empty.classList.add('hidden');
    const byId = new Map(state.questions.map(q => [q.id, q]));
    favIds.forEach(id => {
      const q = byId.get(id);
      if (!q) return;
      const card = document.createElement('div');
      card.className = 'fav-card';
      card.dataset.category = q.category;
      card.innerHTML = `
        <div class="fav-meta">
          <span class="tag">${escapeHtml(CATEGORY_LABELS[q.category] || q.category)}</span>
          <span class="dot"></span>
          <span class="tag">${escapeHtml(LEVEL_LABELS[q.level] || q.level)}</span>
        </div>
        <p></p>
        <button class="remove-fav" aria-label="Quitar de favoritas">×</button>
      `;
      card.querySelector('p').textContent = q.text;
      card.querySelector('.remove-fav').addEventListener('click', () => {
        state.favorites.delete(id);
        saveFavorites();
        renderFavorites();
      });
      list.appendChild(card);
    });
  }

  function escapeHtml(s) {
    return String(s)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  // -------- menú --------
  function openMenu() {
    $('modal-menu').classList.remove('hidden');
    $('modal-menu').setAttribute('aria-hidden', 'false');
  }
  function closeMenu() {
    $('modal-menu').classList.add('hidden');
    $('modal-menu').setAttribute('aria-hidden', 'true');
  }

  // -------- UI filtros --------
  function syncFilterChips() {
    document.querySelectorAll('#filter-age .chip').forEach(b => {
      b.setAttribute('aria-pressed', state.filters.age === b.dataset.age);
    });
    document.querySelectorAll('#filter-audience .chip').forEach(b => {
      b.setAttribute('aria-pressed', state.filters.audiences.has(b.dataset.aud));
    });
    document.querySelectorAll('#filter-categories .chip').forEach(b => {
      b.setAttribute('aria-pressed', state.filters.categories.has(b.dataset.cat));
    });
    document.querySelectorAll('#filter-levels .chip').forEach(b => {
      b.setAttribute('aria-pressed', state.filters.levels.has(b.dataset.lvl));
    });
    updatePoolPreview();
  }
  function updatePoolPreview() {
    if (!state.questions.length) return;
    computePool();
    const n = state.pool.length;
    const el = $('pool-preview');
    if (!el) return;
    el.textContent = n === 0 ? 'mazo vacío' : `${n} carta${n === 1 ? '' : 's'}`;
    el.style.color = n === 0 ? 'var(--danger)' : '';
    $('btn-start').disabled = n === 0;
  }
  function bindFilterChips() {
    document.querySelectorAll('#filter-age .chip').forEach(b => {
      b.addEventListener('click', () => {
        state.filters.age = b.dataset.age;
        saveFilters();
        syncFilterChips();
      });
    });
    document.querySelectorAll('#filter-audience .chip').forEach(b => {
      b.addEventListener('click', () => {
        const a = b.dataset.aud;
        if (state.filters.audiences.has(a) && state.filters.audiences.size > 1) {
          state.filters.audiences.delete(a);
        } else if (!state.filters.audiences.has(a)) {
          state.filters.audiences.add(a);
        }
        saveFilters();
        syncFilterChips();
      });
    });
    document.querySelectorAll('#filter-categories .chip').forEach(b => {
      b.addEventListener('click', () => {
        const c = b.dataset.cat;
        if (state.filters.categories.has(c) && state.filters.categories.size > 1) {
          state.filters.categories.delete(c);
        } else if (!state.filters.categories.has(c)) {
          state.filters.categories.add(c);
        }
        saveFilters();
        syncFilterChips();
      });
    });
    document.querySelectorAll('#filter-levels .chip').forEach(b => {
      b.addEventListener('click', () => {
        const l = b.dataset.lvl;
        if (state.filters.levels.has(l) && state.filters.levels.size > 1) {
          state.filters.levels.delete(l);
        } else if (!state.filters.levels.has(l)) {
          state.filters.levels.add(l);
        }
        saveFilters();
        syncFilterChips();
      });
    });
  }

  // -------- listeners --------
  function bind() {
    // bienvenida
    const savedPlayers = loadPlayers();
    if (savedPlayers[0]) $('player1').value = savedPlayers[0];
    if (savedPlayers[1]) $('player2').value = savedPlayers[1];

    bindFilterChips();
    syncFilterChips();

    $('form-start').addEventListener('submit', (e) => {
      e.preventDefault();
      state.players = [
        $('player1').value.trim() || 'Jugador/a 1',
        $('player2').value.trim() || 'Jugador/a 2',
      ];
      savePlayers();
      startGame();
    });

    $('btn-party').addEventListener('click', () => {
      state.players = [
        $('player1').value.trim() || 'Jugador/a 1',
        $('player2').value.trim() || 'Jugador/a 2',
      ];
      savePlayers();
      state.filters.categories = new Set(['retos']);
      state.filters.levels = new Set(ALL_LEVELS);
      saveFilters();
      syncFilterChips();
      startGame();
    });

    $('btn-theme-toggle-welcome').addEventListener('click', toggleTheme);
    $('btn-favorites-welcome').addEventListener('click', () => {
      renderFavorites();
      show('favorites');
    });

    // juego
    $('btn-theme-toggle').addEventListener('click', toggleTheme);
    $('btn-menu').addEventListener('click', openMenu);
    $('btn-fav').addEventListener('click', toggleFavorite);
    $('btn-next').addEventListener('click', () => nextCard());
    $('btn-skip').addEventListener('click', () => {
      if (state.skipsLeft <= 0) return;
      const card = $('card');
      card.classList.add('skip-out');
      setTimeout(() => {
        card.classList.remove('skip-out');
        nextCard({ skipped: true });
      }, 280);
    });

    // favoritas
    $('btn-back-fav').addEventListener('click', () => {
      show(state.prevScreen || 'welcome');
    });

    // final
    $('btn-replay').addEventListener('click', startGame);
    $('btn-show-favs').addEventListener('click', () => {
      renderFavorites();
      show('favorites');
    });

    // modal
    document.querySelectorAll('[data-close="menu"]').forEach(el => {
      el.addEventListener('click', closeMenu);
    });
    document.querySelectorAll('.menu-item').forEach(btn => {
      btn.addEventListener('click', () => {
        const action = btn.dataset.action;
        closeMenu();
        switch (action) {
          case 'resume': break;
          case 'favorites': renderFavorites(); show('favorites'); break;
          case 'restart': startGame(); break;
          case 'quit': show('welcome'); break;
        }
      });
    });

    // gestos: swipe para siguiente / saltar
    let touchStartX = null;
    const stage = document.querySelector('.card-stage');
    if (stage) {
      stage.addEventListener('touchstart', (e) => {
        touchStartX = e.changedTouches[0].clientX;
      }, { passive: true });
      stage.addEventListener('touchend', (e) => {
        if (touchStartX === null) return;
        const dx = e.changedTouches[0].clientX - touchStartX;
        if (Math.abs(dx) > 80) {
          if (dx < 0 && state.skipsLeft > 0) $('btn-skip').click();
          else if (dx > 0) $('btn-next').click();
        }
        touchStartX = null;
      }, { passive: true });
    }
  }

  // -------- init --------
  async function init() {
    applyTheme();
    bind();
    try {
      await loadQuestions();
      updatePoolPreview();
    } catch (err) {
      $('form-start').innerHTML = `<p style="color:var(--danger)">No se pudieron cargar las preguntas. Recarga la página.</p>`;
      console.error(err);
    }
  }

  document.addEventListener('DOMContentLoaded', init);
})();
