(function(){
  try {
    var cached = window.__sfNativeHomeRowsJson;
    if (typeof cached === 'string' && cached.length > 2 && cached.charAt(0) === '[') return JSON.parse(cached);
    var rows = [];
    var seen = {};
    function add(title, uri, image, section) {
      if (!uri || seen[uri]) return;
      seen[uri] = 1;
      rows.push({
        title: String(title || '').replace(/\s+/g, ' ').trim().slice(0, 100),
        uri: String(uri),
        image: String(image || ''),
        section: String(section || '')
      });
    }
    var nodes = document.querySelectorAll('a[href*="/playlist/"], a[href*="/album/"], a[href*="/collection"], a[href*="/artist/"]');
    var i;
    for (i = 0; i < nodes.length && rows.length < 40; i += 1) {
      var el = nodes[i];
      var href = el.href || el.getAttribute('href') || '';
      var title = (el.getAttribute('aria-label') || el.textContent || '').replace(/\s+/g, ' ').trim();
      var img = el.querySelector && el.querySelector('img');
      var src = img && (img.currentSrc || img.src || img.getAttribute('src')) || '';
      add(title, href, src, '');
    }
    var lib = window.mediaLib;
    if (lib && lib.playlists && lib.playlists.length) {
      for (i = 0; i < lib.playlists.length; i += 1) {
        var p = lib.playlists[i] || {};
        add(p.name || p.title, p.uri || p.id || p.href, p.image || p.cover || '', 'Vos playlists');
      }
    }
    return rows;
  } catch (e) {
    return [];
  }
})()
