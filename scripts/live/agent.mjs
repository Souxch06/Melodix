// Interactive live emulator: two scopes, no request logging (no keystrokes, no bodies).
//  VIEW token (the human's link): GET /screen, POST /tap /swipe /text /key  - no adb.
//  ADMIN token (Claude's session only): POST /adb  - never put in the link.
// Tokens travel in the X-Token header; the link keeps its token in the URL #fragment,
// which browsers never send to the server or the tunnel.
import http from 'node:http';
import { execFile } from 'node:child_process';
import { timingSafeEqual } from 'node:crypto';
const VIEW = process.env.VIEW_TOKEN, ADMIN = process.env.ADMIN_TOKEN;
if (!VIEW || !ADMIN || VIEW.length < 32 || ADMIN.length < 32 || VIEW === ADMIN) throw new Error('tokens required');
const run = (args, t = 60, enc = 'utf8') => new Promise((res) => execFile('adb', args, { timeout: t * 1000, maxBuffer: 64 << 20, encoding: enc },
  (e, out, err) => res({ code: e ? (typeof e.code === 'number' ? e.code : 1) : 0, stdout: out, stderr: String(err || '') })));
const eq = (a, b) => { const x = Buffer.from(a || ''), y = Buffer.from(b); return x.length === y.length && timingSafeEqual(x, y); };
const scope = (req) => eq(req.headers['x-token'], ADMIN) ? 'admin' : eq(req.headers['x-token'], VIEW) ? 'view' : null;
const body = async (req) => { let s = ''; for await (const c of req) { s += c; if (s.length > 1e5) throw new Error('too large'); } return JSON.parse(s || '{}'); };
const j = (res, c, o) => { res.writeHead(c, { 'content-type': 'application/json', 'cache-control': 'no-store' }); res.end(JSON.stringify(o)); };
const int = (v) => { const n = Math.round(Number(v)); if (!Number.isFinite(n) || n < 0 || n > 10000) throw new Error('bad coordinate'); return String(n); };
// adb `input text`: %s is a space; escape shell metacharacters. Non-ASCII is not supported by `input text`.
const esc = (s) => [...s].map((c) => c === ' ' ? '%s' : /[\\'"`$&|;<>()*?!\[\]{}~#%^]/.test(c) ? '\\' + c : c).join('');
const KEYS = { Backspace: 67, Enter: 66, Tab: 61, Back: 4, Home: 3, ArrowLeft: 21, ArrowRight: 22, ArrowUp: 19, ArrowDown: 20, Delete: 112, Escape: 111 };
import { readFileSync } from 'node:fs';
const PAGE = readFileSync(new URL('./viewer.html', import.meta.url));
http.createServer(async (req, res) => {
  const p = new URL(req.url, 'http://x').pathname;
  res.setHeader('referrer-policy', 'no-referrer'); res.setHeader('x-frame-options', 'DENY');
  try {
    if (req.method === 'GET' && p === '/') { res.writeHead(200, { 'content-type': 'text/html; charset=utf-8', 'cache-control': 'no-store' }); return res.end(PAGE); }
    const s = scope(req); if (!s) return j(res, 401, { error: 'unauthorized' });
    if (req.method === 'GET' && p === '/screen') {
      const r = await run(['exec-out', 'screencap', '-p'], 20, 'buffer');
      if (r.code) return j(res, 500, { error: 'screencap failed' });
      res.writeHead(200, { 'content-type': 'image/png', 'cache-control': 'no-store' }); return res.end(r.stdout);
    }
    if (req.method === 'POST' && p === '/install') {
      if (s !== 'admin') return j(res, 403, { error: 'forbidden' });
      const { mkdtempSync, createWriteStream } = await import('node:fs'); const { pipeline } = await import('node:stream/promises');
      const f = mkdtempSync('/tmp/apk-') + '/app.apk'; await pipeline(req, createWriteStream(f));
      return j(res, 200, await run(['install', '-r', '-d', '-g', f], 300));
    }
    if (req.method !== 'POST') return j(res, 404, { error: 'not found' });
    const b = await body(req);
    switch (p) {
      case '/tap': await run(['shell', 'input', 'tap', int(b.x), int(b.y)]); return j(res, 200, { ok: true });
      case '/swipe': await run(['shell', 'input', 'swipe', int(b.x1), int(b.y1), int(b.x2), int(b.y2), String(Math.min(int(b.ms || 300), 3000))]); return j(res, 200, { ok: true });
      case '/text': { const t = String(b.text || '').slice(0, 500); if (/[^\x20-\x7e]/.test(t)) return j(res, 400, { error: 'ASCII only' });
        for (const chunk of t.match(/[\s\S]{1,60}/g) || []) await run(['shell', 'input', 'text', esc(chunk)]); return j(res, 200, { ok: true }); }
      case '/key': { const k = KEYS[b.key]; if (!k) return j(res, 400, { error: 'unknown key' }); await run(['shell', 'input', 'keyevent', String(k)]); return j(res, 200, { ok: true }); }
      case '/adb': if (s !== 'admin') return j(res, 403, { error: 'forbidden' });
        if (!Array.isArray(b.args)) return j(res, 400, { error: 'args' }); return j(res, 200, await run(b.args.map(String), Math.min(Number(b.timeout) || 60, 600)));
      case '/stop': if (s !== 'admin') return j(res, 403, { error: 'forbidden' }); (await import('node:fs')).writeFileSync('/tmp/live-stop', '1'); return j(res, 200, { ok: true });
    }
    return j(res, 404, { error: 'not found' });
  } catch (e) { j(res, 400, { error: String(e.message || e).slice(0, 80) }); }
}).listen(8080, '127.0.0.1');
