  // Lot B / B1 — passive, read-only structural probe.
  // Defined on demand by the existing "Copier" action; never runs by itself.
  // It reads attributes of a fixed list of selectors. It never reads text
  // content, never dispatches events, never clicks, never fetches, never reads
  // storage or cookies, and returns a bounded object or an error marker.
  window.__melodixLiveStructure = function () {
    try {
      var LABELS = [
        'Lire', 'Pause', 'Play', 'Mettre en pause', 'Reprendre',
        'Lecture aléatoire', 'Lecture aléatoire activée', 'Lecture aléatoire désactivée',
        'Activer la lecture aléatoire', 'Désactiver la lecture aléatoire', 'Shuffle',
        'Répéter', 'Répéter activé', 'Répéter le titre', 'Répéter la liste',
        'Activer la répétition', 'Désactiver la répétition', 'Repeat',
        'Ajouter à vos titres likés', 'Retirer des titres likés', 'Ajouter', 'Retirer', 'Like', 'Unlike',
        'Volume', 'Couper le son', 'Activer le son', 'Mute', 'Unmute',
        'Suivant', 'Précédent', 'Titre suivant', 'Titre précédent',
        'File d’attente', 'File d\'attente', 'Paroles', 'Appareils'
      ];
      var TESTIDS = [
        'now-playing-bar', 'control-button-playpause', 'control-button-shuffle',
        'control-button-repeat', 'control-button-back', 'control-button-forward',
        'control-button-queue', 'volume-bar', 'add-button', 'remove-from-liked',
        'playback-progressbar', 'full-screen-player', 'player-controls'
      ];
      var cap = function (value, max) {
        return typeof value === 'string' && value.length <= max ? value : null;
      };
      var labelOf = function (el) {
        var raw = el.getAttribute('aria-label');
        if (typeof raw !== 'string') return null;
        return LABELS.indexOf(raw) >= 0 ? raw : 'other';
      };
      var testidOf = function (el) {
        var raw = el.getAttribute('data-testid');
        return typeof raw === 'string' && TESTIDS.indexOf(raw) >= 0 ? raw : null;
      };
      var shape = function (el) {
        var disabledAttr = el.getAttribute('aria-disabled');
        return {
          present: true,
          tag: el.tagName ? el.tagName.toLowerCase() : null,
          role: cap(el.getAttribute('role'), 40),
          testid: testidOf(el),
          ariaLabel: labelOf(el),
          disabled: el.disabled === true || disabledAttr === 'true',
          ariaPressed: cap(el.getAttribute('aria-pressed'), 10),
          ariaChecked: cap(el.getAttribute('aria-checked'), 10),
          ariaValueNow: cap(el.getAttribute('aria-valuenow'), 12),
          childCount: el.children ? Math.min(el.children.length, 99) : 0
        };
      };
      var pick = function (testid) {
        var el = document.querySelector('[data-testid="' + testid + '"]');
        return el ? shape(el) : { present: false };
      };
      var bar = document.querySelector('[data-testid="now-playing-bar"]');
      var barButtons = [];
      if (bar) {
        var nodes = bar.querySelectorAll('button');
        for (var i = 0; i < nodes.length && barButtons.length < 30; i += 1) {
          barButtons.push(shape(nodes[i]));
        }
      }
      var controls = {};
      TESTIDS.forEach(function (id) { controls[id] = pick(id); });
      return {
        version: 'lot-b-b1-2',
        nowPlayingBarPresent: bar !== null,
        nowPlayingBarButtonCount: barButtons.length,
        nowPlayingBarButtons: barButtons,
        controls: controls,
        queueControlPresent: document.querySelector('[data-testid="control-button-queue"]') !== null,
        volumeBarPresent: document.querySelector('[data-testid="volume-bar"]') !== null,
        openTrace: (function () {
          var t = window.__melodixOpenTrace, num = function (x) { return typeof x === 'number' && isFinite(x) ? Math.round(x) : null; };
          if (!t || typeof t !== 'object') return null;
          var phases = ['none', 'open', 'ready', 'dom', 'dom-empty', 'classified', 'classified-empty', 'rendered', 'unavailable'];
          return {
            kind: t.kind === 'liked' || t.kind === 'playlist' ? t.kind : null,
            phase: phases.indexOf(t.phase) >= 0 ? t.phase : null,
            navigation: num(t.nav), ready: num(t.ready), domRows: num(t.dom), classifiedRows: num(t.classified),
            sentToNative: num(t.rendered), firstRowsMs: num(t.first), fullListMs: num(t.full), updates: num(t.updates)
          };
        })()
      };
    } catch (_) {
      return { error: 'probe-failed' };
    }
  };
