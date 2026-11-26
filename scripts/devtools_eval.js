// Evaluate one read-only DOM probe on the first WebView page via DevTools (Node 22 global WebSocket).
const SESSION = `JSON.stringify({host: location.host,
  userWidget: !!document.querySelector('[data-testid="user-widget-link"],[data-testid="user-widget-avatar"]'),
  loginButton: !!document.querySelector('[data-testid="login-button"]'),
  libraryRows: document.querySelectorAll('[data-testid="rootlist-item"],[role="row"][aria-labelledby*="listrow"]').length,
  melodixHome: !!document.getElementById('sf-melodix-home')})`;
const expr = process.argv[2] === 'session' ? SESSION : `JSON.stringify({customStyle: !!document.getElementById('sf-custom-style'),
  customStyleLen: (document.getElementById('sf-custom-style')||{textContent:''}).textContent.length,
  loginFixed: !!document.getElementById('sf-login-fixed-style'),
  classicButton: !!document.querySelector('a.fuckd'),
  loginFields: !!document.querySelector('input[type="password"]') && !!document.querySelector('input[type="email"],input[type="text"],input[autocomplete="username"]'),
  dockVisible: [...document.querySelectorAll('#sf-mobile-nav')].some(n => n.getBoundingClientRect().height > 0),
  page: location.host + location.pathname + (location.search.includes('allow_password') ? ' allow_password' : ''),
  bodyClass: document.body && document.body.className,
  formActions: [...document.forms].map(f => f.getAttribute('action')),
  bodyBg: document.body && getComputedStyle(document.body).backgroundImage.slice(0,80)})`;
(async () => {
  const pages = await (await fetch('http://127.0.0.1:9222/json')).json();
  const page = pages.find(p => p.type === 'page');
  const ws = new WebSocket(page.webSocketDebuggerUrl);
  const t0 = Date.now();
  ws.onopen = () => ws.send(JSON.stringify({id: 1, method: 'Runtime.evaluate', params: {expression: expr, returnByValue: true}}));
  ws.onmessage = m => { const r = JSON.parse(m.data); if (r.id === 1) { console.log((r.result?.result?.value ?? JSON.stringify(r)) + ' ms=' + (Date.now() - t0)); process.exit(0); } };
  setTimeout(() => { console.log('timeout'); process.exit(0); }, 5000);
})().catch(e => console.log('error ' + e.message));
