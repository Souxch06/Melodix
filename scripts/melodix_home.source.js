(function() {
    'use strict';
    if (window._sfMelodixHomeAssetLoaded) return;
    window._sfMelodixHomeAssetLoaded = true;
    window.__sfMelodixHomeInitAttempted = true;

    function traceMelodixHome(message) {
        var line = String(message || '').slice(0, 160);
        try {
            if (typeof window.__sfBridgeTrace === 'function') {
                window.__sfBridgeTrace(line);
                return;
            }
        } catch (_) {}
        try {
            var bridge = window.AndBridge;
            if (bridge && typeof bridge.logDiagEvent === 'function') bridge.logDiagEvent(line);
        } catch (_) {}
    }

const MELODIX_HOME_ACTIVE_CLASS = 'sf-melodix-home-active';
const MELODIX_HOME_STYLE_PROBE_CLASS = 'sf-melodix-home-style-probe';
const MELODIX_HOME_STYLE_MARKER = 'SF_MELODIX_HOME_STYLES_V1';
const MELODIX_HOME_TYPES = new Set(['playlist', 'album', 'artist', 'track', 'show', 'episode', 'audiobook']);
const MELODIX_HOME_MODES = new Set(['csshack', 'bigwindow']);
const MELODIX_HOME_CARD_CONTAINERS = [
    '[data-testid="card"]',
    '[data-encore-id="card"]',
    '[data-testid="tracklist-row"]',
    '[data-testid*="card-container"]',
    '[data-encore-id*="card"]',
    '[role="listitem"]',
    'article',
    'li'
].join(',');
const MELODIX_HOME_TITLE_SELECTORS = [
    '[data-testid="card-title"]',
    '[data-encore-id="cardTitle"]',
    '[data-testid*="card-title"]',
    '[role="heading"]',
    'h1', 'h2', 'h3'
].join(',');
const MELODIX_HOME_ROOT_SELECTORS = [
    '#main-view',
    '[data-testid="main-view"]',
    '#main-content',
    '[data-testid="main-content"]',
    '[data-testid="home-page"]',
    '[data-testid="browse-feed"]',
    '[data-testid="content-feed"]',
    '[role="main"]',
    'main'
];
const MELODIX_HOME_LINK_SELECTOR = 'a[href], [role="link"][href]';
const MELODIX_HOME_NAV_SELECTOR = 'nav, [role="navigation"], aside, header, footer, #global-nav-bar, ' +
    '#Desktop_LeftSidebar_Id, #sf-mobile-nav, #sf-mobile-navigation, #sf-melodix-home, ' +
    '[data-testid="now-playing-bar"], [data-testid="mobile-playback-bar"], ' +
    '[data-testid="now-playing-widget"], [data-testid="mini-player"]';
let lastHomeDecisionSignature = '';

function melodixHomeRoutePath() {
    const parts = String(window.location.pathname || '/').split('/').filter(Boolean);
    if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
    return parts.length ? `/${parts.join('/')}` : '/';
}

function isMelodixHomeRoute() {
    const path = melodixHomeRoutePath();
    return window.location.hostname === 'open.spotify.com' && (path === '/' || path === '/home');
}

function melodixHomeCopy() {
    const locale = (document.documentElement.lang || navigator.language || 'en').toLowerCase().split('-')[0];
    const copy = {
        fr: { morning: 'Bonjour', afternoon: 'Bon après-midi', evening: 'Bonsoir', discover: 'À découvrir' },
        en: { morning: 'Good morning', afternoon: 'Good afternoon', evening: 'Good evening', discover: 'Discover' },
        es: { morning: 'Buenos días', afternoon: 'Buenas tardes', evening: 'Buenas noches', discover: 'Descubre' },
        de: { morning: 'Guten Morgen', afternoon: 'Guten Tag', evening: 'Guten Abend', discover: 'Entdecken' },
        it: { morning: 'Buongiorno', afternoon: 'Buon pomeriggio', evening: 'Buonasera', discover: 'Scopri' },
        pt: { morning: 'Bom dia', afternoon: 'Boa tarde', evening: 'Boa noite', discover: 'Descobrir' }
    };
    const labels = copy[locale] || copy.en;
    const hour = new Date().getHours();
    return {
        greeting: hour < 12 ? labels.morning : hour < 18 ? labels.afternoon : labels.evening,
        discover: labels.discover
    };
}

function melodixHomeResourcePath(href) {
    try {
        const url = new URL(String(href || ''), window.location.href);
        if (url.protocol !== 'https:' || url.hostname !== 'open.spotify.com' || url.origin !== window.location.origin) {
            return '';
        }
        const parts = url.pathname.split('/').filter(Boolean);
        if (parts.length && /^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0])) parts.shift();
        const type = String(parts[0] || '').toLowerCase();
        const id = String(parts[1] || '').trim();
        if (!MELODIX_HOME_TYPES.has(type) || !id || parts.length > 2) return '';
        return `/${type}/${id}`;
    } catch (_) {
        return '';
    }
}

function isMelodixHomeNavigationLink(anchor) {
    try {
        return Boolean(anchor && typeof anchor.closest === 'function' && anchor.closest(MELODIX_HOME_NAV_SELECTOR));
    } catch (_) {
        return false;
    }
}

function melodixHomeResourceCount(root) {
    if (!root || typeof root.querySelectorAll !== 'function') return 0;
    let anchors = [];
    try {
        anchors = Array.from(root.querySelectorAll(MELODIX_HOME_LINK_SELECTOR)).slice(0, 300);
    } catch (_) {
        return 0;
    }
    const seen = new Set();
    anchors.forEach((anchor) => {
        if (isMelodixHomeNavigationLink(anchor) || (anchor.closest && anchor.closest('#sf-melodix-home'))) return;
        const path = melodixHomeResourcePath(anchor.href || anchor.getAttribute('href'));
        if (path) seen.add(path);
    });
    return seen.size;
}

function melodixHomeHasNavigation(root) {
    if (!root || typeof root.querySelector !== 'function') return false;
    try {
        return Boolean(root.querySelector(MELODIX_HOME_NAV_SELECTOR));
    } catch (_) {
        return false;
    }
}

function findFallbackMelodixHomeRoot() {
    let anchors = [];
    try {
        anchors = Array.from(document.querySelectorAll(MELODIX_HOME_LINK_SELECTOR)).slice(0, 300);
    } catch (_) {
        return null;
    }
    const candidates = [];
    const candidateDepth = new Map();
    anchors.forEach((anchor) => {
        if (isMelodixHomeNavigationLink(anchor)) return;
        const href = anchor.href || anchor.getAttribute('href') || '';
        if (!melodixHomeResourcePath(href)) return;
        let node = anchor.parentElement;
        let depth = 1;
        while (node && node !== document.body && node !== document.documentElement && depth <= 8) {
            const tag = String(node.tagName || '').toUpperCase();
            if (node.id === 'sf-melodix-home' || (node.closest && node.closest('#sf-melodix-home'))) break;
            if (!['HTML', 'BODY', 'NAV', 'HEADER', 'FOOTER', 'ASIDE'].includes(tag) &&
                !melodixHomeHasNavigation(node)) {
                if (!candidateDepth.has(node) && candidates.length < 64) {
                    candidates.push(node);
                    candidateDepth.set(node, depth);
                } else if (candidateDepth.has(node) && depth < candidateDepth.get(node)) {
                    candidateDepth.set(node, depth);
                }
            }
            node = node.parentElement;
            depth += 1;
        }
    });

    let best = null;
    let bestCount = 0;
    let bestDepth = Infinity;
    candidates.forEach((candidate) => {
        const count = melodixHomeResourceCount(candidate);
        const depth = candidateDepth.get(candidate) || Infinity;
        if (count > bestCount || (count > 0 && count === bestCount && depth < bestDepth)) {
            best = candidate;
            bestCount = count;
            bestDepth = depth;
        }
    });
    if (!best) return null;
    return {
        element: best,
        selector: `fallback:${String(best.tagName || 'element').toLowerCase()}`,
        resourceCount: bestCount
    };
}

function findMelodixHomeContentRoot() {
    let firstRoot = null;
    let firstSelector = '';
    let bestRoot = null;
    let bestSelector = '';
    let bestCount = -1;
    const seen = new Set();

    MELODIX_HOME_ROOT_SELECTORS.forEach((selector) => {
        let candidate = null;
        try {
            candidate = document.querySelector(selector);
        } catch (_) {}
        if (!candidate || seen.has(candidate) || candidate.id === 'sf-melodix-home' ||
            (candidate.closest && candidate.closest('#sf-melodix-home'))) return;
        seen.add(candidate);
        if (!firstRoot) {
            firstRoot = candidate;
            firstSelector = selector;
        }
        const count = melodixHomeResourceCount(candidate);
        if (count > bestCount) {
            bestRoot = candidate;
            bestSelector = selector;
            bestCount = count;
        }
    });

    // Spotify's current Home may not expose #main-view or another semantic
    // main element. Bound the fallback to real Spotify links and eight ancestor
    // levels; never treat arbitrary page text as a card.
    if (!bestRoot || bestCount < 2) {
        const fallback = findFallbackMelodixHomeRoot();
        if (fallback && fallback.resourceCount > bestCount) {
            bestRoot = fallback.element;
            bestSelector = fallback.selector;
            bestCount = fallback.resourceCount;
        }
    }
    if (!bestRoot && firstRoot) {
        bestRoot = firstRoot;
        bestSelector = firstSelector;
        bestCount = 0;
    }
    window.__sfMelodixHomeRootSelector = bestRoot ? bestSelector : 'none';
    window.__sfMelodixHomeRootResourceCount = bestRoot ? Math.max(0, bestCount) : 0;
    return bestRoot;
}

function markMelodixHomeSourceRoot(root) {
    const previous = window._sfMelodixHomeSourceRoot;
    if (previous && previous !== root && typeof previous.removeAttribute === 'function') {
        previous.removeAttribute('data-sf-melodix-source-root');
    }
    if (root && typeof root.setAttribute === 'function') {
        root.setAttribute('data-sf-melodix-source-root', 'true');
        window._sfMelodixHomeSourceRoot = root;
    }
}

function safeMelodixHomeImage(raw) {
    try {
        const url = new URL(String(raw || '').trim(), window.location.href);
        const host = url.hostname.toLowerCase();
        if (url.protocol !== 'https:') return '';
        if (
            host !== 'scdn.co' && !host.endsWith('.scdn.co') &&
            host !== 'spotifycdn.com' && !host.endsWith('.spotifycdn.com')
        ) return '';
        return url.href;
    } catch (_) {
        return '';
    }
}

function melHomeText(node) {
    return String(node && (node.innerText || node.textContent) || '').replace(/\s+/g, ' ').trim();
}

function firstMelodyHomeText(root, selector) {
    if (!root || typeof root.querySelector !== 'function') return '';
    try {
        return melHomeText(root.querySelector(selector));
    } catch (_) {
        return '';
    }
}

function findMelodixHomeCard(anchor, mainView) {
    if (anchor && typeof anchor.closest === 'function') {
        try {
            const known = anchor.closest(MELODIX_HOME_CARD_CONTAINERS);
            if (known && known !== mainView) return known;
        } catch (_) {}
    }

    let node = anchor;
    for (let depth = 0; node && node.parentElement && node.parentElement !== mainView && depth < 6; depth += 1) {
        const parent = node.parentElement;
        if (/^(MAIN|SECTION|NAV|UL|OL)$/.test(parent.tagName || '')) break;
        let resourceLinks = 0;
        try {
            resourceLinks = Array.from(parent.querySelectorAll('a[href], [role="link"][href]'))
                .filter((item) => melodixHomeResourcePath(item.href || item.getAttribute('href'))).length;
        } catch (_) {}
        if (resourceLinks > 1) break;
        if (parent.querySelector('img') || parent.hasAttribute('aria-label')) node = parent;
        else break;
    }
    return node || anchor;
}

function melodixHomeImage(card, anchor) {
    const image = (anchor && anchor.querySelector && anchor.querySelector('img')) ||
        (card && card.querySelector && card.querySelector('img'));
    if (image) {
        let raw = image.currentSrc || image.getAttribute('src') || image.getAttribute('data-src') || image.src || '';
        if (!raw) {
            const srcset = image.getAttribute('srcset') || '';
            raw = (String(srcset).split(',')[0] || '').trim().split(/\s+/)[0] || '';
        }
        const safe = safeMelodixHomeImage(raw);
        if (safe) return safe;
    }
    const backgroundNode = card && card.querySelector
        ? card.querySelector('[style*="background-image"]')
        : null;
    if (backgroundNode) {
        const style = backgroundNode.style && backgroundNode.style.backgroundImage ||
            (typeof window.getComputedStyle === 'function'
                ? window.getComputedStyle(backgroundNode).backgroundImage
                : '');
        const match = /url\((?:['"])?(.*?)(?:['"])?\)/i.exec(style || '');
        if (match) return safeMelodixHomeImage(match[1]);
    }
    return '';
}

function melodixHomeShelf(card, mainView) {
    let node = card;
    while (node && node !== mainView) {
        if (node.matches && node.matches('section, [data-testid*="shelf"], [data-encore-id*="grid"], [role="list"]')) {
            return node;
        }
        node = node.parentElement;
    }
    return mainView;
}

function collectMelodixHomeSections(mainView) {
    if (!mainView || typeof mainView.querySelectorAll !== 'function') return [];
    // Spotify has changed card data-testid values repeatedly. Start from
    // real navigable resource links, then infer their enclosing card from
    // multiple stable structural/Encore selectors with a bounded ancestor
    // fallback. No card text, artwork or playlist is synthesized.
    let anchors = [];
    try {
        anchors = Array.from(mainView.querySelectorAll('a[href], [role="link"][href]'));
    } catch (_) {
        return [];
    }
    const grouped = new Map();
    const seen = new Set();

    anchors.forEach((anchor) => {
        const href = anchor.href || anchor.getAttribute('href') || '';
        const resourcePath = melodixHomeResourcePath(href);
        if (!resourcePath || seen.has(resourcePath) || isMelodixHomeNavigationLink(anchor) ||
            (anchor.closest && anchor.closest('#sf-melodix-home'))) return;
        const card = findMelodixHomeCard(anchor, mainView);
        const lines = String(card.innerText || card.textContent || anchor.innerText || anchor.textContent || '')
            .split('\n')
            .map((line) => line.replace(/\s+/g, ' ').trim())
            .filter(Boolean);
        const title = firstMelodyHomeText(card, MELODIX_HOME_TITLE_SELECTORS) ||
            firstMelodyHomeText(anchor, MELODIX_HOME_TITLE_SELECTORS) ||
            String((anchor.querySelector('img') || card.querySelector('img') || {}).alt || '').trim() ||
            lines[0] ||
            melHomeText(card.getAttribute && card.getAttribute('aria-label')) ||
            melHomeText(anchor.getAttribute && anchor.getAttribute('aria-label'));
        if (!title) return;

        const shelf = melodixHomeShelf(card, mainView);
        let heading = '';
        if (shelf !== mainView) {
            const headingNodes = Array.from(shelf.querySelectorAll('h1, h2, h3, [role="heading"], [data-testid*="shelf-title"]'));
            const headingNode = headingNodes.find((item) => !(item.closest && item.closest(MELODIX_HOME_CARD_CONTAINERS)));
            heading = melHomeText(headingNode).slice(0, 80);
        }
        const subtitle = firstMelodyHomeText(card,
            '[data-testid="card-subtitle"], [data-encore-id="cardSubtitle"], [data-testid*="subtitle"]') ||
            lines.find((line) => line !== title) || '';
        const cardHref = new URL(href, window.location.href).href;
        const group = grouped.get(shelf) || { title: heading, cards: [] };
        group.cards.push({
            title: title.slice(0, 100),
            subtitle: subtitle.slice(0, 120),
            image: melodixHomeImage(card, anchor),
            href: cardHref,
            resourcePath,
            sourceAnchor: anchor
        });
        grouped.set(shelf, group);
        seen.add(resourcePath);
    });

    return Array.from(grouped.values())
        .map((group) => ({ ...group, cards: group.cards.slice(0, 8) }))
        .filter((group) => group.cards.length > 0)
        .slice(0, 4);
}

function setMelodixHomeDecision(reason, details) {
    const state = details || {};
    const guiMode = String(window.SF_CONFIG && window.SF_CONFIG.guiMode || 'missing').slice(0, 24);
    const rootSelector = String(state.rootSelector || window.__sfMelodixHomeRootSelector || '?').slice(0, 36);
    const signature = [reason, guiMode, state.route || '?', state.stylesReady ? '1' : '0', state.cardCount || 0, rootSelector].join('|');
    window.__sfMelodixHomeGuiMode = guiMode;
    window.__sfMelodixHomeRoute = state.route || '?';
    window.__sfMelodixHomeStylesReady = Boolean(state.stylesReady);
    window.__sfMelodixHomeSourceCardCount = Number(state.cardCount || 0);
    window.__sfMelodixHomeSectionCount = Number(state.sectionCount || 0);
    window.__sfMelodixHomeDecision = String(reason || 'unknown').slice(0, 32);
    if (signature !== lastHomeDecisionSignature) {
        lastHomeDecisionSignature = signature;
        traceMelodixHome('home-web ' + window.__sfMelodixHomeDecision +
            ' mode=' + guiMode + ' route=' + window.__sfMelodixHomeRoute +
            ' styles=' + (state.stylesReady ? '1' : '0') +
            ' cards=' + window.__sfMelodixHomeSourceCardCount +
            ' sections=' + window.__sfMelodixHomeSectionCount +
            ' root=' + rootSelector);
    }
}

function deactivateMelodixHome() {
    if (document.body) document.body.classList.remove(MELODIX_HOME_ACTIVE_CLASS);
    const home = document.getElementById('sf-melodix-home');
    if (home) home.remove();
    const sourceRoot = window._sfMelodixHomeSourceRoot;
    if (sourceRoot && typeof sourceRoot.removeAttribute === 'function') {
        sourceRoot.removeAttribute('data-sf-melodix-source-root');
    }
    window._sfMelodixHomeSourceRoot = null;
    window._sfMelodixHomeSignature = '';
}

function scheduleMelodixHomeUpdate() {
    if (window._sfMelodixHomeTimer != null) return;
    window._sfMelodixHomeTimer = window.setTimeout(() => {
        window._sfMelodixHomeTimer = null;
        updateMelodixHome();
    }, 80);
}

function observeMelodixHomeDom() {
    if (!document.body || window._sfMelodixHomeObserver || typeof MutationObserver !== 'function') return;
    window._sfMelodixHomeObserver = new MutationObserver(scheduleMelodixHomeUpdate);
    // Keep watching the body, not only the first #main-view instance: the
    // Spotify SPA can replace that node during a route transition.
    window._sfMelodixHomeObserver.observe(document.body, { childList: true, subtree: true });
}

function observeMelodixHomeStyles() {
    const target = document.head || document.documentElement;
    if (!target || window._sfMelodixHomeStyleObserver || typeof MutationObserver !== 'function') return;
    window._sfMelodixHomeStyleObserver = new MutationObserver(() => {
        const style = document.getElementById('sf-custom-style');
        if (style && String(style.textContent || '').indexOf(MELODIX_HOME_STYLE_MARKER) >= 0) {
            scheduleMelodixHomeUpdate();
        }
    });
    window._sfMelodixHomeStyleObserver.observe(target, { childList: true, subtree: true, characterData: true });
}

function melodixHomeStylesReady(mainView, home) {
    const style = document.getElementById('sf-custom-style');
    if (!style || String(style.textContent || '').indexOf(MELODIX_HOME_STYLE_MARKER) < 0) return false;
    if (typeof window.getComputedStyle !== 'function' || !mainView || !home) return false;

    const wasActive = document.body.classList.contains(MELODIX_HOME_ACTIVE_CLASS);
    let homeStyle;
    let mainStyle;
    try {
        document.body.classList.remove(MELODIX_HOME_ACTIVE_CLASS);
        document.body.classList.add(MELODIX_HOME_STYLE_PROBE_CLASS);
        homeStyle = window.getComputedStyle(home);
        mainStyle = window.getComputedStyle(mainView);
    } catch (_) {
        return false;
    } finally {
        document.body.classList.remove(MELODIX_HOME_STYLE_PROBE_CLASS);
        if (wasActive) document.body.classList.add(MELODIX_HOME_ACTIVE_CLASS);
    }
    const zIndex = Number.parseInt(homeStyle && homeStyle.zIndex || '0', 10) || 0;
    return Boolean(
        homeStyle && homeStyle.display === 'flex' && homeStyle.position === 'fixed' &&
        homeStyle.visibility === 'visible' && homeStyle.opacity !== '0' &&
        mainStyle && mainStyle.display === 'none' && zIndex >= 1000
    );
}

function renderMelodixHomeCard(card) {
    const button = document.createElement('button');
    button.type = 'button';
    button.className = 'sf-melodix-home__card';
    button.setAttribute('aria-label', card.subtitle ? `${card.title}, ${card.subtitle}` : card.title);

    if (card.image) {
        const image = document.createElement('img');
        image.className = 'sf-melodix-home__artwork';
        image.src = card.image;
        image.alt = '';
        image.loading = 'lazy';
        button.appendChild(image);
    }

    const title = document.createElement('span');
    title.className = 'sf-melodix-home__title';
    title.textContent = card.title;
    button.appendChild(title);

    if (card.subtitle) {
        const subtitle = document.createElement('span');
        subtitle.className = 'sf-melodix-home__subtitle';
        subtitle.textContent = card.subtitle;
        button.appendChild(subtitle);
    }

    button.addEventListener('click', () => {
        if (card.sourceAnchor && (card.sourceAnchor.isConnected || document.contains(card.sourceAnchor))) {
            card.sourceAnchor.click();
        } else {
            window.location.assign(card.href);
        }
    });
    return button;
}

function updateMelodixHome() {
    window.__sfMelodixHomeInitAttempted = true;
    const route = melodixHomeRoutePath();
    const routeLabel = route === '/' || route === '/home' ? route : 'other';
    const guiMode = String(window.SF_CONFIG && window.SF_CONFIG.guiMode || 'missing');
    const mainView = findMelodixHomeContentRoot();
    let sections = [];
    let itemCount = 0;
    if (!document.body) {
        setMelodixHomeDecision('body-missing', { route: routeLabel });
        return;
    }
    if (window.location.hostname !== 'open.spotify.com' || (route !== '/' && route !== '/home')) {
        deactivateMelodixHome();
        setMelodixHomeDecision('route-not-home', { route: routeLabel });
        return;
    }
    if (!MELODIX_HOME_MODES.has(guiMode)) {
        deactivateMelodixHome();
        setMelodixHomeDecision('gui-mode-unsupported', { route: routeLabel });
        return;
    }
    if (document.body.classList.contains('sf-fs-open')) {
        deactivateMelodixHome();
        setMelodixHomeDecision('fullscreen-open', { route: routeLabel });
        return;
    }
    if (!mainView) {
        deactivateMelodixHome();
        observeMelodixHomeDom();
        observeMelodixHomeStyles();
        setMelodixHomeDecision('content-root-missing', {
            route: routeLabel, rootSelector: window.__sfMelodixHomeRootSelector || 'none'
        });
        return;
    }
    observeMelodixHomeDom();
    observeMelodixHomeStyles();

    sections = collectMelodixHomeSections(mainView);
    itemCount = sections.reduce((count, section) => count + section.cards.length, 0);
    const rawAnchorCount = mainView.querySelectorAll(MELODIX_HOME_LINK_SELECTOR).length;
    window.__sfMelodixHomeRawAnchorCount = Math.min(rawAnchorCount, 999);
    markMelodixHomeSourceRoot(mainView);
    if (itemCount < 2) {
        deactivateMelodixHome();
        setMelodixHomeDecision('insufficient-real-cards', {
            route: routeLabel, cardCount: itemCount, sectionCount: sections.length,
            rootSelector: window.__sfMelodixHomeRootSelector
        });
        return;
    }

    let home = document.getElementById('sf-melodix-home');
    const isNewHome = !home;
    if (!home) {
        home = document.createElement('main');
        home.id = 'sf-melodix-home';
        home.className = 'sf-melodix-home';
        home.setAttribute('aria-label', 'Melodix');
        document.body.appendChild(home);
    }
    const stylesReady = melodixHomeStylesReady(mainView, home);
    if (!stylesReady) {
        deactivateMelodixHome();
        setMelodixHomeDecision('styles-not-ready', {
            route: routeLabel, cardCount: itemCount, sectionCount: sections.length, stylesReady: false,
            rootSelector: window.__sfMelodixHomeRootSelector
        });
        return;
    }

    const signature = sections.map((section) =>
        `${section.title}:${section.cards.map((card) => `${card.resourcePath}|${card.title}|${card.image}`).join(',')}`
    ).join('||');
    if (window._sfMelodixHomeSignature === signature && document.body.classList.contains(MELODIX_HOME_ACTIVE_CLASS)) {
        setMelodixHomeDecision('visible', {
            route: routeLabel, cardCount: itemCount, sectionCount: sections.length, stylesReady: true,
            rootSelector: window.__sfMelodixHomeRootSelector
        });
        return;
    }

    const labels = melodixHomeCopy();
    const globalNav = document.querySelector('#global-nav-bar');
    const navVisible = Boolean(globalNav && window.getComputedStyle(globalNav).display !== 'none');
    const navBottom = navVisible ? Math.max(0, globalNav.getBoundingClientRect().bottom) : 0;
    home.style.setProperty('--sf-melodix-home-top', `${Math.ceil(navBottom)}px`);
    home.style.setProperty('--sf-melodix-home-extra-safe-top', navVisible ? '0px' : 'env(safe-area-inset-top)');

    const header = document.createElement('header');
    header.className = 'sf-melodix-home__header';
    const brand = document.createElement('p');
    brand.className = 'sf-melodix-home__brand';
    brand.textContent = 'MELODIX';
    const greeting = document.createElement('h1');
    greeting.textContent = labels.greeting;
    header.append(brand, greeting);
    const fragment = document.createDocumentFragment();
    fragment.appendChild(header);

    sections.forEach((section) => {
        const sectionElement = document.createElement('section');
        sectionElement.className = 'sf-melodix-home__section';
        const heading = document.createElement('h2');
        heading.className = 'sf-melodix-home__section-title';
        heading.textContent = section.title || labels.discover;
        sectionElement.appendChild(heading);

        const cards = document.createElement('div');
        cards.className = 'sf-melodix-home__cards';
        section.cards.forEach((card) => cards.appendChild(renderMelodixHomeCard(card)));
        sectionElement.appendChild(cards);
        fragment.appendChild(sectionElement);
    });
    home.replaceChildren(fragment);
    window._sfMelodixHomeSignature = signature;
    document.body.classList.add(MELODIX_HOME_ACTIVE_CLASS);

    let renderedVisible = false;
    try {
        const computedHome = window.getComputedStyle(home);
        const computedMain = window.getComputedStyle(mainView);
        renderedVisible = computedHome.display === 'flex' && computedHome.position === 'fixed' &&
            computedHome.visibility === 'visible' && computedHome.opacity !== '0' &&
            computedMain.display === 'none';
    } catch (_) {}
    if (!renderedVisible) {
        deactivateMelodixHome();
        setMelodixHomeDecision('activation-visibility-check-failed', {
            route: routeLabel, cardCount: itemCount, sectionCount: sections.length, stylesReady: false,
            rootSelector: window.__sfMelodixHomeRootSelector
        });
        return;
    }
    window.__sfMelodixHomeStylesReady = true;
    setMelodixHomeDecision(isNewHome ? 'rendered' : 'updated', {
        route: routeLabel, cardCount: itemCount, sectionCount: sections.length, stylesReady: true
    });
}

function instrumentMelodixHomeHistory() {
    if (window._sfMelodixHomeHistoryInstrumented) return;
    window._sfMelodixHomeHistoryInstrumented = true;
    const history = window.history;
    ['pushState', 'replaceState'].forEach((method) => {
        if (!history || typeof history[method] !== 'function') return;
        const original = history[method];
        const wrapped = function() {
            const result = original.apply(this, arguments);
            scheduleMelodixHomeUpdate();
            return result;
        };
        try {
            history[method] = wrapped;
        } catch (_) {}
    });
}

function initializeMelodixHome() {
    if (window._sfMelodixHomeListenersAttached) return;
    window._sfMelodixHomeListenersAttached = true;
    window.__sfMelodixHomeInitAttempted = true;
    window.addEventListener('popstate', scheduleMelodixHomeUpdate);
    window.addEventListener('hashchange', scheduleMelodixHomeUpdate);
    window.addEventListener('resize', scheduleMelodixHomeUpdate);
    window.addEventListener('load', scheduleMelodixHomeUpdate, { once: true });
    document.addEventListener('click', (event) => {
        if (event.target && event.target.closest && event.target.closest(
            '#global-nav-bar [data-testid="home-button"], #sf-mobile-nav [data-sf-mobile-action="home"], #sf-melodix-home .sf-melodix-home__card'
        )) scheduleMelodixHomeUpdate();
    });
    document.addEventListener('DOMContentLoaded', () => {
        observeMelodixHomeDom();
        observeMelodixHomeStyles();
        scheduleMelodixHomeUpdate();
    }, { once: true });
    window.addEventListener('sf-melodix-home-styles-ready', scheduleMelodixHomeUpdate);
    instrumentMelodixHomeHistory();
    observeMelodixHomeDom();
    observeMelodixHomeStyles();
    updateMelodixHome();
}

    if (window.__sfMelodixHomeTestMode === true) {
        window.__sfHomeTest = {
            initializeMelodixHome: initializeMelodixHome,
            updateMelodixHome: updateMelodixHome,
            collectMelodixHomeSections: collectMelodixHomeSections,
            melodixHomeRoutePath: melodixHomeRoutePath
        };
    }
    try {
        initializeMelodixHome();
    } catch (error) {
        window.__sfMelodixHomeInitErrors = (window.__sfMelodixHomeInitErrors || 0) + 1;
        traceMelodixHome('home-web bootstrap-error ' + String(error && error.name || 'unknown').slice(0, 40));
    }
})();
