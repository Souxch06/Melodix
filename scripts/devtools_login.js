// Classic Spotify login inside the app WebView via DevTools. Credentials come only from env; never printed.
const email = process.env.SPOTIFY_TEST_EMAIL, password = process.env.SPOTIFY_TEST_PASSWORD;
if (!email || !password) { console.log('missing-secrets'); process.exit(2); }
const sleep = ms => new Promise(r => setTimeout(r, ms));
async function page() { return (await (await fetch('http://127.0.0.1:9222/json')).json()).find(p => p.type === 'page'); }
function cdp(url) {
  const ws = new WebSocket(url); let id = 0; const wait = {};
  ws.onmessage = m => { const r = JSON.parse(m.data); if (wait[r.id]) { wait[r.id](r); delete wait[r.id]; } };
  const ready = new Promise(r => ws.onopen = r);
  return { ready, close: () => ws.close(), send: (method, params = {}) => new Promise(r => { const i = ++id; wait[i] = r; ws.send(JSON.stringify({ id: i, method, params })); }) };
}
const evalJs = async (c, expression) => (await c.send('Runtime.evaluate', { expression, returnByValue: true })).result?.result?.value;
(async () => {
  let c = cdp((await page()).webSocketDebuggerUrl); await c.ready;
  await c.send('Page.navigate', { url: 'https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_password=1' });
  let ok = false;
  for (let i = 0; i < 30 && !ok; i++) { await sleep(1000); ok = await evalJs(c, "!!document.querySelector('#login-username') && !!document.querySelector('#login-password')"); }
  if (!ok) { console.log('form-not-found url=' + (await evalJs(c, 'location.host+location.pathname'))); process.exit(3); }
  // React-controlled inputs: use the native value setter, then dispatch input events.
  const fill = `(function(sel, v){const el=document.querySelector(sel);const set=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set;set.call(el,v);el.dispatchEvent(new Event('input',{bubbles:true}));el.dispatchEvent(new Event('change',{bubbles:true}));return true;})`;
  await evalJs(c, `${fill}('#login-username', ${JSON.stringify(email)})`);
  await evalJs(c, `${fill}('#login-password', ${JSON.stringify(password)})`);
  await evalJs(c, "(document.querySelector('#login-button')||document.querySelector('button[type=submit]')).click()");
  c.close();
  for (let i = 0; i < 45; i++) {
    await sleep(1000);
    let p; try { p = await page(); } catch { continue; }
    if (!p) continue;
    const u = new URL(p.url);
    if (u.host === 'open.spotify.com') { console.log('logged-in host=' + u.host); process.exit(0); }
    if (i === 44) { c = cdp(p.webSocketDebuggerUrl); await c.ready;
      const msg = await evalJs(c, "(document.querySelector('[data-encore-id=banner],[role=alert]')||{}).innerText||''");
      console.log('not-logged-in host=' + u.host + u.pathname + ' alert=' + JSON.stringify((msg||'').slice(0,160))); process.exit(4); }
  }
})().catch(e => { console.log('error ' + e.message); process.exit(5); });
