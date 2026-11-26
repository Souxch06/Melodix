// Evaluate one read-only DOM probe on the first WebView page via DevTools (Node 22 global WebSocket).
const expr = `JSON.stringify({customStyle: !!document.getElementById('sf-custom-style'),
  customStyleLen: (document.getElementById('sf-custom-style')||{textContent:''}).textContent.length,
  loginFixed: !!document.getElementById('sf-login-fixed-style'),
  classicButton: !!document.querySelector('a.fuckd'),
  bodyClass: document.body && document.body.className,
  formActions: [...document.forms].map(f => f.getAttribute('action')),
  bodyBg: document.body && getComputedStyle(document.body).backgroundImage.slice(0,80)})`;
(async () => {
  const pages = await (await fetch('http://127.0.0.1:9222/json')).json();
  const page = pages.find(p => p.type === 'page');
  const ws = new WebSocket(page.webSocketDebuggerUrl);
  ws.onopen = () => ws.send(JSON.stringify({id: 1, method: 'Runtime.evaluate', params: {expression: expr, returnByValue: true}}));
  ws.onmessage = m => { const r = JSON.parse(m.data); if (r.id === 1) { console.log(r.result?.result?.value ?? JSON.stringify(r)); process.exit(0); } };
  setTimeout(() => { console.log('timeout'); process.exit(0); }, 5000);
})().catch(e => console.log('error ' + e.message));
