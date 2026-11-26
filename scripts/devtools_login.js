// Staged DevTools login on Melodix's own WebView. Logs stages and timings only:
// never the email, password, cookie values or tokens. Stops if Spotify asks for a human.
const rawEmail = process.env.SPOTIFY_TEST_EMAIL || '', rawPassword = process.env.SPOTIFY_TEST_PASSWORD || '';
// Pasted secrets often carry a trailing newline/space; trim and report only booleans.
const email = rawEmail.trim(), password = rawPassword.replace(/^[\r\n]+|[\r\n]+$/g, '');
const secretShape = `emailHasAt=${email.includes('@')} emailTrimmed=${email !== rawEmail} passwordNewlineTrimmed=${password !== rawPassword} passwordEdgeSpace=${/^\s|\s$/.test(password)}`;
const t0 = Date.now(); const log = s => console.log(`[${((Date.now() - t0) / 1000).toFixed(1)}s] ${s}`);
setTimeout(() => { log('STOP global-timeout'); process.exit(6); }, 140000);
const sleep = ms => new Promise(r => setTimeout(r, ms));
const withTimeout = (p, ms, what) => Promise.race([p, sleep(ms).then(() => { throw new Error('timeout ' + what); })]);
async function targets() { return withTimeout(fetch('http://127.0.0.1:9222/json').then(r => r.json()), 5000, '/json'); }
function cdp(url) {
  const ws = new WebSocket(url); let id = 0; const wait = {};
  ws.onmessage = m => { const r = JSON.parse(m.data); if (wait[r.id]) { wait[r.id](r); delete wait[r.id]; } };
  return { ready: withTimeout(new Promise((r, j) => { ws.onopen = r; ws.onerror = () => j(new Error('ws error')); }), 8000, 'ws open'),
    close: () => ws.close(),
    send: (method, params = {}) => withTimeout(new Promise(r => { const i = ++id; wait[i] = r; ws.send(JSON.stringify({ id: i, method, params })); }), 8000, method) };
}
const SEL = "var USER='#login-username,input[autocomplete=username],input[type=email],input[name=username]',PASS='input[type=password]';";
const val = async (c, expression) => (await c.send('Runtime.evaluate', { expression: SEL + expression, returnByValue: true })).result?.result?.value;
const host = u => { try { const x = new URL(u); return x.host + x.pathname; } catch { return String(u).slice(0, 40); } };
async function attach(stage) {
  const ts = await targets();
  log(`${stage} targets=${ts.length} ` + ts.map(t => `${t.type}:${host(t.url)}`).join(' | '));
  const p = ts.find(t => t.type === 'page'); if (!p) throw new Error('no page target');
  const c = cdp(p.webSocketDebuggerUrl); await c.ready; return c;
}
const HUMAN = "(()=>{const t=(document.body&&document.body.innerText||'').toLowerCase();const f=[...document.querySelectorAll('iframe')].map(i=>i.src||'');return {captcha: f.some(s=>/recaptcha\\/.*(bframe|challenge)|hcaptcha|arkose|funcaptcha/.test(s)) || /i.m not a robot|verify you are human|prove you.re human/.test(t), code: /enter the code|we sent (a|you a) code|6-digit|verification code|check your email|confirm it.s you/.test(t)};})()";
(async () => {
  if (!email || !password) { log('STOP missing-secrets'); process.exit(2); }
  log('S0b secret-shape ' + secretShape);
  let c = await attach('S1');
  const t = Date.now(); log(`S2 ping=${await val(c, '1+1')} in ${Date.now() - t}ms`);
  log(`S3 page=${await val(c, 'location.host+location.pathname')} classicLink=${await val(c, "!!document.querySelector('a.fuckd')")} passwordField=${await val(c, "!!document.querySelector(PASS)")}`);
  if (!(await val(c, "!!document.querySelector(PASS)"))) {
    if (!(await val(c, "!!document.querySelector('a.fuckd')"))) { log('STOP classic-link-absent-from-DOM'); process.exit(3); }
    log('S4 click classic link -> ' + await val(c, "(()=>{const a=document.querySelector('a.fuckd');const h=new URL(a.href);a.click();return h.host+h.pathname+(h.search.includes('allow_password')?' allow_password':'');})()"));
    c.close(); await sleep(6000);
    let ok = false;
    for (let i = 0; i < 10 && !ok; i++) { try { c = await attach('S4b'); ok = await val(c, "!!document.querySelector(USER)&&!!document.querySelector(PASS)"); if (!ok) { c.close(); await sleep(2000); } } catch (e) { log('S4b ' + e.message); await sleep(2000); } }
    if (!ok) { log('STOP password-form-not-found'); process.exit(4); }
  }
  let h = await val(c, HUMAN); log(`S5 human-check captcha=${h?.captcha} code=${h?.code}`);
  if (h?.captcha || h?.code) { log('STOP human-intervention-required (before submit)'); process.exit(7); }
  const fill = "(function(sel,v){const el=document.querySelector(sel);const set=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set;set.call(el,v);el.dispatchEvent(new Event('input',{bubbles:true}));el.dispatchEvent(new Event('change',{bubbles:true}));return el.value.length===v.length;})";
  log(`S6 filled user=${await val(c, `${fill}(USER,${JSON.stringify(email)})`)} pass=${await val(c, `${fill}(PASS,${JSON.stringify(password)})`)}`);
  if (process.env.LOGIN_DRY_RUN === '1') { log('DRY-RUN stop before submit'); process.exit(0); }
  log('S6 submit=' + await val(c, "(()=>{const b=document.querySelector('#login-button')||document.querySelector('button[type=submit]')||[...document.querySelectorAll('button')].find(x=>/^log ?in$/i.test(x.innerText.trim()));if(!b)return false;b.click();return true;})()"));
  c.close();
  for (let i = 0; i < 20; i++) {
    await sleep(3000);
    try {
      c = await attach('S7');
      const where = await val(c, 'location.host+location.pathname');
      h = await val(c, HUMAN);
      if (h?.captcha || h?.code) { log(`STOP human-intervention-required page=${where} captcha=${h.captcha} code=${h.code}`); process.exit(7); }
      const ck = (await c.send('Network.getCookies', { urls: ['https://open.spotify.com/', 'https://accounts.spotify.com/'] })).result?.cookies || [];
      const spdc = ck.some(k => k.name === 'sp_dc');  // presence only; value never read out
      const err = await val(c, "(document.querySelector('[data-encore-id=banner],[role=alert]')||{}).innerText||''");
      log(`S7 page=${where} sp_dc=${spdc}${err ? ' alert=' + JSON.stringify(err.slice(0, 120)) : ''}`);
      c.close();
      if (spdc && where.startsWith('open.spotify.com')) { log('DONE spotify-session-cookie-present'); process.exit(0); }
      if (err) { log('STOP login-refused'); process.exit(5); }
    } catch (e) { log('S7 ' + e.message); }
  }
  log('STOP no-session-after-submit'); process.exit(8);
})().catch(e => { log('STOP error ' + e.message); process.exit(9); });
