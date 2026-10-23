const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = path.resolve(__dirname, '..');

function loadAllowlist() {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const start = src.indexOf('    function isAllowedNativeFetchUrl(raw) {');
    const stop = src.indexOf('\n    function wrapNativeFetchBridge()', start);
    assert.ok(start >= 0 && stop > start, 'isAllowedNativeFetchUrl must exist in the playback bridge');
    return vm.runInNewContext(src.slice(start, stop) + '\nisAllowedNativeFetchUrl;', { URL });
}

// Lightweight Dalvik bytecode interpreter for executing NativeFetchGuard.smali directly on real inputs.
function createGuardVm(mockNetwork = {}) {
    const smali = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeFetchGuard.smali'), 'utf8');
    const methods = new Map();
    const methodRe = /^\.method\s+([^\n]+)\s+([A-Za-z0-9_$<>]+\([^)]*\)[^\s]+)\s*\n([\s\S]*?)^\.end method/gm;
    for (const m of smali.matchAll(methodRe)) {
        const isStatic = m[1].includes('static');
        const sig = m[2];
        const lines = m[3].split('\n').map(l => l.trim()).filter(l => l && !l.startsWith('#') && !l.startsWith('.line'));
        let locals = 0;
        const labels = new Map();
        const catches = [];
        const insns = [];
        for (const line of lines) {
            if (line.startsWith('.locals ')) {
                locals = Number(line.slice(8).trim());
            } else if (line.startsWith('.catchall ')) {
                const cm = line.match(/\{:(\w+)\s*\.\.\s*:(\w+)\}\s*:(\w+)/);
                catches.push({ type: 'all', start: cm[1], end: cm[2], target: cm[3] });
            } else if (line.startsWith('.catch ')) {
                const cm = line.match(/\.catch\s+(\S+)\s+\{:(\w+)\s*\.\.\s*:(\w+)\}\s*:(\w+)/);
                catches.push({ type: cm[1], start: cm[2], end: cm[3], target: cm[4] });
            } else if (line.startsWith(':')) {
                labels.set(line.slice(1), insns.length);
            } else {
                insns.push(line);
            }
        }
        methods.set(sig, { isStatic, sig, locals, labels, catches, insns });
    }

    const parseAndroidUri = (raw) => {
        if (typeof raw !== 'string') return null;
        // Android Uri.parse RFC 2396 behavior
        const schemeMatch = raw.match(/^([A-Za-z][A-Za-z0-9+.-]*):(.*)$/s);
        const scheme = schemeMatch ? schemeMatch[1] : null;
        let rest = schemeMatch ? schemeMatch[2] : raw;
        let authority = null;
        if (rest.startsWith('//')) {
            const after = rest.slice(2);
            const cut = after.search(/[/?#]/);
            authority = cut >= 0 ? after.slice(0, cut) : after;
        }
        let userInfo = null;
        let hostPort = authority;
        if (authority !== null) {
            const atIdx = authority.lastIndexOf('@');
            if (atIdx >= 0) {
                userInfo = authority.slice(0, atIdx);
                hostPort = authority.slice(atIdx + 1);
            }
        }
        let host = null;
        let port = -1;
        if (hostPort !== null) {
            if (hostPort.startsWith('[')) {
                const close = hostPort.indexOf(']');
                host = close >= 0 ? hostPort.slice(0, close + 1) : hostPort;
                const rem = close >= 0 ? hostPort.slice(close + 1) : '';
                if (rem.startsWith(':') && /^\d+$/.test(rem.slice(1))) port = Number(rem.slice(1));
            } else {
                const colon = hostPort.indexOf(':');
                if (colon >= 0) {
                    host = hostPort.slice(0, colon);
                    const p = hostPort.slice(colon + 1);
                    port = p === '' ? -1 : (/^\d+$/.test(p) ? Number(p) : -1);
                } else {
                    host = hostPort;
                }
            }
        }
        return {
            _kind: 'Uri',
            getScheme: () => scheme,
            getEncodedAuthority: () => authority,
            getAuthority: () => authority,
            getUserInfo: () => userInfo,
            getPort: () => port,
            getHost: () => host,
        };
    };

    const makeJavaUrl = (raw, base = null) => {
        const u = base ? new URL(raw, base._href) : new URL(raw);
        if (!['http:', 'https:'].includes(u.protocol)) {
            const err = new Error('MalformedURLException');
            err._javaSimpleName = 'MalformedURLException';
            throw err;
        }
        const scheme = u.protocol.slice(0, -1);
        const userInfo = u.username || u.password
            ? `${u.username}${u.password ? ':' + u.password : ''}`
            : null;
        const port = u.port ? Number(u.port) : -1;
        const host = u.hostname;
        const authority = `${userInfo ? userInfo + '@' : ''}${host}${u.port ? ':' + u.port : ''}`;
        return {
            _kind: 'URL',
            _href: u.href,
            getProtocol: () => scheme,
            getUserInfo: () => userInfo,
            getAuthority: () => authority,
            getPort: () => port,
            getHost: () => host,
            toExternalForm: () => u.href,
            openConnection: () => {
                if (scheme !== 'https') {
                    return { _kind: 'HttpURLConnection', _notHttps: true };
                }
                const reqHeaders = new Map();
                const bodyChunks = [];
                const state = {
                    url: u.href,
                    host,
                    method: 'GET',
                    followRedirects: true,
                    useCaches: true,
                    connectTimeout: 0,
                    readTimeout: 0,
                    doOutput: false,
                    disconnected: false,
                    reqHeaders,
                    body: '',
                    response: null,
                };
                if (mockNetwork.connections) mockNetwork.connections.push(state);
                const ensureResponse = () => {
                    if (!state.response) {
                        state.response = mockNetwork.respond(state);
                    }
                    return state.response;
                };
                return {
                    _kind: 'HttpsURLConnection',
                    _state: state,
                    setInstanceFollowRedirects: (v) => { state.followRedirects = Boolean(v); },
                    setUseCaches: (v) => { state.useCaches = Boolean(v); },
                    setConnectTimeout: (v) => { state.connectTimeout = v; },
                    setReadTimeout: (v) => { state.readTimeout = v; },
                    setRequestMethod: (m) => { state.method = m; },
                    setRequestProperty: (k, v) => { reqHeaders.set(k, v); },
                    getRequestProperty: (k) => reqHeaders.has(k) ? reqHeaders.get(k) : null,
                    setDoOutput: (v) => { state.doOutput = Boolean(v); },
                    getOutputStream: () => ({
                        write: (bytes) => { bodyChunks.push(Buffer.from(bytes)); },
                        close: () => { state.body = Buffer.concat(bodyChunks).toString('utf8'); },
                    }),
                    getResponseCode: () => ensureResponse().status,
                    getHeaderField: (name) => {
                        const headers = ensureResponse().headers || {};
                        const hit = Object.keys(headers).find(k => k.toLowerCase() === name.toLowerCase());
                        if (!hit) return null;
                        const val = headers[hit];
                        return Array.isArray(val) ? val[0] : val;
                    },
                    getHeaderFields: () => {
                        const headers = ensureResponse().headers || {};
                        const map = new Map();
                        for (const [k, v] of Object.entries(headers)) {
                            map.set(k, Array.isArray(v) ? v : [String(v)]);
                        }
                        return map;
                    },
                    getInputStream: () => makeStream(ensureResponse().body || ''),
                    getErrorStream: () => makeStream(ensureResponse().errorBody ?? ensureResponse().body ?? ''),
                    disconnect: () => { state.disconnected = true; },
                };
            },
        };
    };

    const makeStream = (str) => {
        const buf = Buffer.from(str, 'utf8');
        let pos = 0;
        return {
            read: (arr) => {
                if (pos >= buf.length) return -1;
                const n = Math.min(arr.length, buf.length - pos);
                buf.copy(arr, 0, pos, pos + n);
                pos += n;
                return n;
            },
            close: () => {},
        };
    };

    function invoke(target, args) {
        if (target.startsWith('Lcom/melodix/music/NativeFetchGuard;->')) {
            const sub = target.split('->')[1];
            return runMethod(sub, args);
        }
        switch (target) {
            case 'Ljava/lang/String;->isEmpty()Z': return args[0].length === 0 ? 1 : 0;
            case 'Ljava/lang/String;->trim()Ljava/lang/String;': return args[0].trim();
            case 'Ljava/lang/String;->length()I': return args[0].length;
            case 'Ljava/lang/String;->charAt(I)C': return args[0].charCodeAt(args[1]);
            case 'Ljava/lang/String;->indexOf(I)I': return args[0].indexOf(String.fromCharCode(args[1]));
            case 'Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;': return args[0].toLowerCase();
            case 'Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;': return args[0].toUpperCase();
            case 'Ljava/lang/String;->equals(Ljava/lang/Object;)Z': return args[0] === args[1] ? 1 : 0;
            case 'Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z':
                return typeof args[1] === 'string' && args[0].toLowerCase() === args[1].toLowerCase() ? 1 : 0;
            case 'Ljava/lang/String;->endsWith(Ljava/lang/String;)Z': return args[0].endsWith(args[1]) ? 1 : 0;
            case 'Ljava/lang/String;->startsWith(Ljava/lang/String;)Z': return args[0].startsWith(args[1]) ? 1 : 0;
            case 'Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z': return args[0].includes(args[1]) ? 1 : 0;
            case 'Ljava/lang/String;->getBytes(Ljava/lang/String;)[B': return Buffer.from(args[0], 'utf8');
            case 'Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;': return parseAndroidUri(args[0]);
            case 'Landroid/net/Uri;->getScheme()Ljava/lang/String;': return args[0].getScheme();
            case 'Landroid/net/Uri;->getUserInfo()Ljava/lang/String;': return args[0].getUserInfo();
            case 'Landroid/net/Uri;->getEncodedAuthority()Ljava/lang/String;': return args[0].getEncodedAuthority();
            case 'Landroid/net/Uri;->getPort()I': return args[0].getPort();
            case 'Landroid/net/Uri;->getHost()Ljava/lang/String;': return args[0].getHost();
            case 'Ljava/net/URL;-><init>(Ljava/lang/String;)V':
                Object.assign(args[0], makeJavaUrl(args[1]));
                return undefined;
            case 'Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V':
                Object.assign(args[0], makeJavaUrl(args[2], args[1]));
                return undefined;
            case 'Ljava/net/URL;->getProtocol()Ljava/lang/String;': return args[0].getProtocol();
            case 'Ljava/net/URL;->getUserInfo()Ljava/lang/String;': return args[0].getUserInfo();
            case 'Ljava/net/URL;->getAuthority()Ljava/lang/String;': return args[0].getAuthority();
            case 'Ljava/net/URL;->getPort()I': return args[0].getPort();
            case 'Ljava/net/URL;->getHost()Ljava/lang/String;': return args[0].getHost();
            case 'Ljava/net/URL;->toExternalForm()Ljava/lang/String;': return args[0].toExternalForm();
            case 'Ljava/net/URL;->openConnection()Ljava/net/URLConnection;': return args[0].openConnection();
            case 'Lcom/google/firebase/perf/network/FirebasePerfUrlConnection;->instrument(Ljava/lang/Object;)Ljava/lang/Object;':
                return args[0];
            case 'Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V': args[0].setInstanceFollowRedirects(args[1]); return;
            case 'Ljava/net/URLConnection;->setUseCaches(Z)V': args[0].setUseCaches(args[1]); return;
            case 'Ljava/net/URLConnection;->setConnectTimeout(I)V': args[0].setConnectTimeout(args[1]); return;
            case 'Ljava/net/URLConnection;->setReadTimeout(I)V': args[0].setReadTimeout(args[1]); return;
            case 'Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V': args[0].setRequestMethod(args[1]); return;
            case 'Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V': args[0].setRequestProperty(args[1], args[2]); return;
            case 'Ljava/net/URLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;': return args[0].getRequestProperty(args[1]);
            case 'Ljava/net/URLConnection;->setDoOutput(Z)V': args[0].setDoOutput(args[1]); return;
            case 'Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;': return args[0].getOutputStream();
            case 'Ljava/io/OutputStream;->write([B)V': args[0].write(args[1]); return;
            case 'Ljava/io/OutputStream;->close()V': args[0].close(); return;
            case 'Ljava/net/HttpURLConnection;->getResponseCode()I': return args[0].getResponseCode();
            case 'Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;': return args[0].getHeaderField(args[1]);
            case 'Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;': return args[0].getHeaderFields();
            case 'Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;': return args[0].getErrorStream();
            case 'Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;': return args[0].getInputStream();
            case 'Ljava/net/HttpURLConnection;->disconnect()V': args[0].disconnect(); return;
            case 'Ljava/io/ByteArrayOutputStream;-><init>()V': args[0]._chunks = []; return;
            case 'Ljava/io/ByteArrayOutputStream;->write([BII)V':
                args[0]._chunks.push(Buffer.from(args[1].subarray(args[2], args[2] + args[3])));
                return;
            case 'Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;':
                return Buffer.concat(args[0]._chunks).toString('utf8');
            case 'Ljava/io/InputStream;->read([B)I': return args[0].read(args[1]);
            case 'Ljava/io/InputStream;->close()V': args[0].close(); return;
            case 'Lorg/json/JSONObject;-><init>()V': args[0]._obj = {}; return;
            case 'Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;': return JSON.stringify(String(args[0]));
            case 'Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V': args[0]._obj = JSON.parse(args[1]); return;
            case 'Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;':
            case 'Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;':
                args[0]._obj[args[1]] = args[2] && args[2]._obj ? args[2]._obj : args[2];
                return args[0];
            case 'Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;':
                args[0]._obj[args[1]] = Boolean(args[2]);
                return args[0];
            case 'Lorg/json/JSONObject;->toString()Ljava/lang/String;': return JSON.stringify(args[0]._obj);
            case 'Lorg/json/JSONObject;->keys()Ljava/util/Iterator;': {
                const keys = Object.keys(args[0]._obj);
                let i = 0;
                return { hasNext: () => (i < keys.length ? 1 : 0), next: () => keys[i++] };
            }
            case 'Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;':
                return String(args[0]._obj[args[1]] ?? '');
            case 'Ljava/util/Map;->entrySet()Ljava/util/Set;': return args[0];
            case 'Ljava/util/Set;->iterator()Ljava/util/Iterator;': {
                const entries = [...args[0].entries()];
                let i = 0;
                return {
                    hasNext: () => (i < entries.length ? 1 : 0),
                    next: () => {
                        const entry = entries[i++];
                        return { getKey: () => entry[0], getValue: () => entry[1] };
                    },
                };
            }
            case 'Ljava/util/Iterator;->hasNext()Z': return args[0].hasNext();
            case 'Ljava/util/Iterator;->next()Ljava/lang/Object;': return args[0].next();
            case 'Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;': return args[0].getKey();
            case 'Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;': return args[0].getValue();
            case 'Ljava/util/List;->isEmpty()Z': return args[0].length === 0 ? 1 : 0;
            case 'Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;':
                return args[1].join(args[0]);
            case 'Ljava/lang/Object;->getClass()Ljava/lang/Class;':
                return { getSimpleName: () => args[0]._javaSimpleName || 'IOException' };
            case 'Ljava/lang/Class;->getSimpleName()Ljava/lang/String;': return args[0].getSimpleName();
            case 'Ljava/lang/StringBuilder;-><init>()V': args[0]._s = ''; return;
            case 'Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;':
                args[0]._s += String(args[1]);
                return args[0];
            case 'Ljava/lang/StringBuilder;->toString()Ljava/lang/String;': return args[0]._s;
            default:
                throw new Error('Unhandled invoke in NativeFetchGuard VM: ' + target);
        }
    }

    function runMethod(sig, callArgs) {
        const m = methods.get(sig);
        assert.ok(m, `Missing NativeFetchGuard method ${sig}`);
        const regs = new Map();
        callArgs.forEach((val, idx) => regs.set(`p${idx}`, val));
        let lastResult = undefined;
        let pendingEx = undefined;
        let pc = 0;

        while (pc < m.insns.length) {
            const insn = m.insns[pc];
            try {
                let match;
                if ((match = insn.match(/^const(?:\/4|\/16)?\s+(\w+),\s*(-?0x[0-9a-fA-F]+|-?\d+)$/))) {
                    const rawLit = match[2];
                    const n = rawLit.startsWith('-0x') ? -parseInt(rawLit.slice(3), 16) : parseInt(rawLit, 0);
                    regs.set(match[1], n);
                    pc++;
                } else if ((match = insn.match(/^const-string\s+(\w+),\s*"((?:\\.|[^"])*)"$/))) {
                    regs.set(match[1], JSON.parse(`"${match[2]}"`));
                    pc++;
                } else if ((match = insn.match(/^sget-object\s+(\w+),\s*Ljava\/util\/Locale;->ROOT:Ljava\/util\/Locale;$/))) {
                    regs.set(match[1], 'ROOT');
                    pc++;
                } else if ((match = insn.match(/^move(?:-object)?\s+(\w+),\s*(\w+)$/))) {
                    regs.set(match[1], regs.get(match[2]));
                    pc++;
                } else if ((match = insn.match(/^move-result(?:-object)?\s+(\w+)$/))) {
                    regs.set(match[1], lastResult);
                    pc++;
                } else if ((match = insn.match(/^move-exception\s+(\w+)$/))) {
                    regs.set(match[1], pendingEx);
                    pendingEx = undefined;
                    pc++;
                } else if ((match = insn.match(/^new-instance\s+(\w+),\s*(\S+)$/))) {
                    regs.set(match[1], { _type: match[2] });
                    pc++;
                } else if ((match = insn.match(/^new-array\s+(\w+),\s*(\w+),\s*\[B$/))) {
                    regs.set(match[1], Buffer.alloc(regs.get(match[2])));
                    pc++;
                } else if ((match = insn.match(/^instance-of\s+(\w+),\s*(\w+),\s*(\S+)$/))) {
                    const val = regs.get(match[2]);
                    const simple = val && val._javaSimpleName ? val._javaSimpleName : '';
                    regs.set(match[1], simple && match[3].endsWith('/' + simple + ';') ? 1 : 0);
                    pc++;
                } else if ((match = insn.match(/^check-cast\s+(\w+),\s*(\S+)$/))) {
                    const val = regs.get(match[1]);
                    if (match[2] === 'Ljavax/net/ssl/HttpsURLConnection;' && val && val._notHttps) {
                        const err = new Error('ClassCastException');
                        err._javaSimpleName = 'ClassCastException';
                        throw err;
                    }
                    pc++;
                } else if ((match = insn.match(/^add-int\/lit8\s+(\w+),\s*(\w+),\s*(-?0x[0-9a-fA-F]+|-?\d+)$/))) {
                    const rawLit = match[3];
                    const delta = rawLit.startsWith('-0x') ? -parseInt(rawLit.slice(3), 16) : parseInt(rawLit, 0);
                    regs.set(match[1], (regs.get(match[2]) ?? 0) + delta);
                    pc++;
                } else if ((match = insn.match(/^invoke-\w+\s+\{([^}]*)\},\s*(\S+)$/))) {
                    const argNames = match[1].trim() ? match[1].split(',').map(s => s.trim()) : [];
                    const vals = argNames.map(a => regs.get(a));
                    lastResult = invoke(match[2], vals);
                    pc++;
                } else if ((match = insn.match(/^if-(eqz|nez|ltz|gez|lez|gtz)\s+(\w+),\s*:(\w+)$/))) {
                    const raw = regs.get(match[2]);
                    const isZero = raw === null || raw === undefined || raw === 0 || raw === false;
                    const num = raw === null || raw === undefined ? 0 : Number(raw);
                    const cond = {
                        eqz: isZero,
                        nez: !isZero,
                        ltz: num < 0,
                        gez: num >= 0,
                        lez: num <= 0,
                        gtz: num > 0,
                    }[match[1]];
                    pc = cond ? m.labels.get(match[3]) : pc + 1;
                } else if ((match = insn.match(/^if-(eq|ne|lt|ge|gt|le)\s+(\w+),\s*(\w+),\s*:(\w+)$/))) {
                    const a = regs.get(match[2]) ?? 0;
                    const b = regs.get(match[3]) ?? 0;
                    const cond = {
                        eq: a === b,
                        ne: a !== b,
                        lt: a < b,
                        ge: a >= b,
                        gt: a > b,
                        le: a <= b,
                    }[match[1]];
                    pc = cond ? m.labels.get(match[4]) : pc + 1;
                } else if ((match = insn.match(/^goto(?:\/16)?\s+:(\w+)$/))) {
                    pc = m.labels.get(match[1]);
                } else if (insn === 'return-void') {
                    return undefined;
                } else if ((match = insn.match(/^return-object\s+(\w+)$/))) {
                    const r = regs.get(match[1]);
                    return r === 0 ? null : r;
                } else if ((match = insn.match(/^return\s+(\w+)$/))) {
                    const r = regs.get(match[1]);
                    return sig.endsWith(')Z') ? Boolean(r) : r;
                } else if ((match = insn.match(/^throw\s+(\w+)$/))) {
                    throw regs.get(match[1]);
                } else {
                    throw new Error('Unhandled Dalvik instruction: ' + insn);
                }
            } catch (err) {
                const simple = err && err._javaSimpleName ? err._javaSimpleName : '';
                const handler = m.catches.find(c => {
                    if (!(pc >= m.labels.get(c.start) && pc < m.labels.get(c.end))) return false;
                    if (!c.exType || c.exType === 'all' || c.exType === 'Ljava/lang/Throwable;' || c.exType === 'Ljava/lang/Exception;') {
                        return true;
                    }
                    return Boolean(simple && c.exType.endsWith('/' + simple + ';'));
                });
                if (!handler) throw err;
                pendingEx = err;
                pc = m.labels.get(handler.target);
            }
        }
    }

    return {
        isIpLiteral: (s) => runMethod('isIpLiteral(Ljava/lang/String;)Z', [s]),
        isSpotifyAuthHost: (s) => runMethod('isSpotifyAuthHost(Ljava/lang/String;)Z', [s]),
        isAllowedHost: (s) => runMethod('isAllowedHost(Ljava/lang/String;)Z', [s]),
        isAllowedUrl: (s) => runMethod('isAllowedUrl(Ljava/lang/String;)Z', [s]),
        sanitizeError: (e) => runMethod('sanitizeError(Ljava/lang/Throwable;)Ljava/lang/String;', [e]),
        buildSafePlayFromUriJs: (s) => runMethod('buildSafePlayFromUriJs(Ljava/lang/String;)Ljava/lang/String;', [s]),
        execute: (url, method, headers, body) =>
            JSON.parse(runMethod('execute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;', [url, method, headers, body])),
    };
}

test('nativeFetch JS allowlist accepts only the hosts the bridge actually calls', () => {
    const allow = loadAllowlist();
    assert.equal(allow('https://gew4-spclient.spotify.com/connect-state/v1/player/command/from/x/to/x'), true);
    assert.equal(allow('https://api-partner.spotify.com/pathfinder/v2/query'), true);
    assert.equal(allow('https://api.spotify.com/v1/shows/abc/episodes'), true);
    assert.equal(allow('https://open.spotify.com/melody/v1/msg'), true);
    assert.equal(allow('https://misc.scdn.co/liked-songs/liked-songs-640.png'), true);
});

test('nativeFetch JS allowlist rejects lookalike hosts, HTTP, ports, userinfo and IPs', () => {
    const allow = loadAllowlist();
    assert.equal(allow('https://evil.com/?spotify.com'), false);
    assert.equal(allow('https://evil-spotify.com/'), false);
    assert.equal(allow('https://open.spotify.com.evil.com/connect-state'), false);
    assert.equal(allow('http://open.spotify.com/'), false);
    assert.equal(allow('https://open.spotify.com:8080/'), false);
    assert.equal(allow('https://user:pass@open.spotify.com/'), false);
    assert.equal(allow('https://127.0.0.1/connect-state'), false);
    assert.equal(allow('https://8.8.8.8/'), false);
    assert.equal(allow('not a url'), false);
    assert.equal(allow(''), false);
});

test('AndBridge.nativeFetch delegates to NativeFetchGuard before any URL.openConnection', () => {
    const bridge = fs.readFileSync(path.join(root, 'smali/com/melodix/music/AndBridge.smali'), 'utf8');
    const guard = fs.readFileSync(path.join(root, 'smali/com/melodix/music/NativeFetchGuard.smali'), 'utf8');
    const method = bridge.slice(
        bridge.indexOf('.method public final nativeFetch'),
        bridge.indexOf('.end method', bridge.indexOf('.method public final nativeFetch'))
    );
    assert.equal(method.includes('Ljava/net/URL;->openConnection'), false, 'AndBridge.nativeFetch must not call openConnection directly');
    assert.match(method, /NativeFetchGuard;->execute/);

    const execBody = guard.slice(
        guard.indexOf('.method public static execute('),
        guard.indexOf('.end method', guard.indexOf('.method public static execute('))
    );
    const parseAt = execBody.indexOf('NativeFetchGuard;->parseAllowedUrl');
    const openAt = execBody.indexOf('Ljava/net/URL;->openConnection');
    assert.ok(parseAt > 0 && openAt > parseAt, 'URL allowlist validation must precede URL.openConnection in NativeFetchGuard');
    assert.match(execBody, /setInstanceFollowRedirects\(Z\)V/, 'automatic redirects must be disabled');
});

test('NativeFetchGuard Smali bytecode accepts valid HTTPS Spotify/CDN URLs and blocks all SSRF vectors', () => {
    const guard = createGuardVm();

    // Positive cases
    assert.equal(guard.isAllowedUrl('https://open.spotify.com/'), true);
    assert.equal(guard.isAllowedUrl('https://open.spotify.com:443/melody/v1/msg'), true);
    assert.equal(guard.isAllowedUrl('https://gew4-spclient.spotify.com/connect-state/v1/player/command/from/a/to/b'), true);
    assert.equal(guard.isAllowedUrl('https://api-partner.spotify.com/pathfinder/v2/query'), true);
    assert.equal(guard.isAllowedUrl('https://api.spotify.com/v1/me'), true);
    assert.equal(guard.isAllowedUrl('https://i.scdn.co/image/ab67616d0000b273'), true);
    assert.equal(guard.isAllowedUrl('https://mosaic.scdn.co/640/ab67'), true);
    assert.equal(guard.isAllowedUrl('https://image-cdn-ak.spotifycdn.com/image/ab67706c'), true);

    // Negative cases: schemes, ports, userinfo, parser differentials, IPv4/IPv6/localhost, lookalike domains
    assert.equal(guard.isAllowedUrl('http://open.spotify.com/'), false);
    assert.equal(guard.isAllowedUrl('ftp://open.spotify.com/'), false);
    assert.equal(guard.isAllowedUrl('file:///etc/hosts'), false);
    assert.equal(guard.isAllowedUrl('https://open.spotify.com:8080/'), false);
    assert.equal(guard.isAllowedUrl('https://open.spotify.com:8443/'), false);
    assert.equal(guard.isAllowedUrl('https://user:pass@open.spotify.com/'), false);
    assert.equal(guard.isAllowedUrl('https://open.spotify.com@evil.example/'), false);
    assert.equal(guard.isAllowedUrl('https://evil.example\\@open.spotify.com/'), false);
    assert.equal(guard.isAllowedUrl('https://127.0.0.1/'), false);
    assert.equal(guard.isAllowedUrl('https://169.254.169.254/latest/meta-data/'), false);
    assert.equal(guard.isAllowedUrl('https://[::1]/'), false);
    assert.equal(guard.isAllowedUrl('https://localhost/'), false);
    assert.equal(guard.isAllowedUrl('https://evil-spotify.com/'), false);
    assert.equal(guard.isAllowedUrl('https://open.spotify.com.evil.com/'), false);
    assert.equal(guard.isAllowedUrl('https://open.spotify.com./'), false);
    assert.equal(guard.isAllowedUrl(''), false);
    assert.equal(guard.isAllowedUrl(null), false);
});

test('NativeFetchGuard Smali bytecode blocks disallowed redirects, strips auth headers off spotify.com, and sanitizes errors', () => {
    const connections = [];
    const guard = createGuardVm({
        connections,
        respond: (req) => {
            if (req.url === 'https://open.spotify.com/redirect-to-evil') {
                return { status: 302, headers: { Location: 'https://evil.example/steal' }, body: '' };
            }
            if (req.url === 'https://open.spotify.com/redirect-to-http') {
                return { status: 301, headers: { Location: 'http://open.spotify.com/downgrade' }, body: '' };
            }
            if (req.url === 'https://open.spotify.com/redirect-to-cdn') {
                return { status: 302, headers: { Location: 'https://i.scdn.co/image/cover123' }, body: '' };
            }
            if (req.url === 'https://i.scdn.co/image/cover123') {
                return {
                    status: 200,
                    headers: { 'Content-Type': 'application/json', 'Set-Cookie': 'sp_dc=secret_cookie_value' },
                    body: '{"ok":true}',
                };
            }
            return { status: 200, headers: {}, body: '{}' };
        },
    });

    // 1. Disallowed initial URL never opens a socket at all
    const blockedInitial = guard.execute('https://169.254.169.254/latest/meta-data/', 'GET', '{"Authorization":"Bearer secret"}', null);
    assert.equal(blockedInitial.status, 403);
    assert.equal(connections.length, 0);

    // 2. Redirect to disallowed external host disconnects immediately without connecting to evil.example
    const blockedEvilRedirect = guard.execute(
        'https://open.spotify.com/redirect-to-evil',
        'GET',
        '{"Authorization":"Bearer secret_token","Cookie":"sp_dc=secret_cookie"}',
        null
    );
    assert.equal(blockedEvilRedirect.status, 403);
    assert.equal(connections.length, 1);
    assert.equal(connections[0].followRedirects, false);
    assert.equal(connections[0].disconnected, true);

    // 3. Redirect downgrading HTTPS -> HTTP is rejected before opening HTTP connection
    connections.length = 0;
    const blockedHttpDowngrade = guard.execute('https://open.spotify.com/redirect-to-http', 'GET', '{}', null);
    assert.equal(blockedHttpDowngrade.status, 403);
    assert.equal(connections.length, 1);

    // 4. Redirect from open.spotify.com -> i.scdn.co succeeds, strips Authorization/Cookie on CDN hop, and strips Set-Cookie on response
    connections.length = 0;
    const allowedCdnHop = guard.execute(
        'https://open.spotify.com/redirect-to-cdn',
        'GET',
        '{"Authorization":"Bearer secret_token","Cookie":"sp_dc=secret_cookie","Client-Token":"cli_secret","Accept":"application/json"}',
        null
    );
    assert.equal(allowedCdnHop.status, 200);
    assert.equal(connections.length, 2);
    assert.equal(connections[0].reqHeaders.get('Authorization'), 'Bearer secret_token');
    assert.equal(connections[1].host, 'i.scdn.co');
    assert.equal(connections[1].reqHeaders.has('Authorization'), false, 'Authorization must never cross from spotify.com to CDN hosts');
    assert.equal(connections[1].reqHeaders.has('Cookie'), false, 'Cookie must never cross from spotify.com to CDN hosts');
    assert.equal(connections[1].reqHeaders.has('Client-Token'), false, 'Client-Token must never cross from spotify.com to CDN hosts');
    assert.equal(connections[1].reqHeaders.get('Accept'), 'application/json');
    assert.equal(allowedCdnHop.headers['Set-Cookie'], undefined, 'Set-Cookie header must never be exposed to JS');

    // 5. Exception diagnostics never leak URLs, tokens, or stack details
    const err = new Error('Failed connecting with Bearer super_secret_token and sp_dc=my_cookie');
    err._javaSimpleName = 'SSLHandshakeException';
    const sanitized = guard.sanitizeError(err);
    assert.equal(sanitized, 'Network request failed: SSLHandshakeException');
    assert.doesNotMatch(sanitized, /secret|sp_dc|Bearer/);
});

test('JS wraps AndBridge.nativeFetch so direct JS calls also hit the allowlist', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    assert.match(src, /function wrapNativeFetchBridge\(/);
    assert.match(src, /bridge\.nativeFetch = guarded/);
    assert.match(src, /_sfAllowlisted/);

    const start = src.indexOf('    function sanitizeDiagnostic(value) {');
    const stop = src.indexOf('\n    // >>> sf-pause-intent', start);
    const calls = [];
    const window = {
        AndBridge: {
            nativeFetch: (url, method) => {
                calls.push({ url, method });
                return JSON.stringify({ status: 200, body: '{}' });
            }
        }
    };
    const logs = [];
    vm.runInNewContext(
        src.slice(start, stop) + '\nwrapNativeFetchBridge;',
        {
            URL,
            window,
            console: { error: (...args) => logs.push(args.join(' ')) }
        }
    );
    assert.equal(typeof window.AndBridge.nativeFetch, 'function');
    const denied = JSON.parse(window.AndBridge.nativeFetch('https://evil.com/?spotify.com', 'GET', '{}', null));
    assert.equal(denied.status, 403);
    assert.equal(calls.length, 0);
    const ok = JSON.parse(window.AndBridge.nativeFetch('https://gew4-spclient.spotify.com/connect-state', 'GET', '{}', null));
    assert.equal(ok.status, 200);
    assert.equal(calls.length, 1);
});

test('when AndBridge.nativeFetch is not assignable, wrap does not pretend to intercept direct calls', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const start = src.indexOf('    function sanitizeDiagnostic(value) {');
    const stop = src.indexOf('\n    // >>> sf-pause-intent', start);
    const calls = [];
    const original = (url) => {
        calls.push(url);
        return JSON.stringify({ status: 200, body: '{}' });
    };
    const window = { AndBridge: {} };
    Object.defineProperty(window.AndBridge, 'nativeFetch', {
        value: original,
        writable: false,
        configurable: false
    });
    vm.runInNewContext(src.slice(start, stop), {
        URL,
        window,
        console: { error() {} }
    });
    assert.equal(window.AndBridge.nativeFetch, original);
    JSON.parse(window.AndBridge.nativeFetch('https://evil.com/?spotify.com', 'GET', '{}', null));
    assert.equal(calls.length, 1, 'direct nativeFetch still reaches the original method');
});

test('fetch wrapper resolves Request.url instead of calling includes on a Request', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const start = src.indexOf('    function resolveFetchUrl(input) {');
    const stop = src.indexOf('\n    const oriFetch = window.fetch;', start);
    const resolveFetchUrl = vm.runInNewContext(src.slice(start, stop) + '\nresolveFetchUrl;');
    assert.equal(resolveFetchUrl('https://open.spotify.com/connect-state'), 'https://open.spotify.com/connect-state');
    assert.equal(resolveFetchUrl({ url: 'https://gew4-spclient.spotify.com/melody/v1/msg' }), 'https://gew4-spclient.spotify.com/melody/v1/msg');
    assert.equal(resolveFetchUrl(null), '');
    assert.equal(resolveFetchUrl({}), '');
});

test('playback skip trace is registered once and playFromUri does not log device ids', () => {
    const src = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
    const skipTraces = src.split("tracePlayback('dom-skip'").length - 1;
    assert.equal(skipTraces, 1);
    assert.doesNotMatch(src, /playFromUri sending command for uri=/);
    assert.doesNotMatch(src, /devId=\$\{devId\}/);
});

test('NativeFetchGuard bytecode executes buildSafePlayFromUriJs, custom-scheme redirect 403, and timeout 504', () => {
    const guard = createGuardVm();
    assert.equal(
        guard.buildSafePlayFromUriJs('spotify:track:4cOdK2wGLETKBW3PvgPWqT'),
        'playFromUri("spotify:track:4cOdK2wGLETKBW3PvgPWqT");'
    );
    assert.equal(
        guard.buildSafePlayFromUriJs('https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M'),
        'playFromUri("https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M");'
    );
    for (const malicious of [
        null,
        '',
        "spotify:track:1');window.__pwned=1;//",
        'https://open.spotify.com/track/1");alert(1);//',
        'javascript:alert(1)',
        'spotify://evil.attacker.example/track/1',
        'https://evil.attacker.example/track/1',
        'http://open.spotify.com/track/1',
        'spotify:track:1\nwindow.__pwned=1',
    ]) {
        assert.equal(guard.buildSafePlayFromUriJs(malicious), null, `Must reject ${malicious}`);
    }

    const redirectGuard = createGuardVm({
        respond: () => ({ status: 302, headers: { Location: 'javascript:alert(1)' }, body: '' }),
    });
    const redirRes = redirectGuard.execute('https://gew4-spclient.spotify.com/connect-state/v1/test', 'GET', '{}', null);
    assert.equal(redirRes.status, 403);
    assert.equal(redirRes.body, 'Blocked disallowed redirect target');

    const timeoutGuard = createGuardVm({
        respond: () => {
            const err = new Error('Read timed out');
            err._javaSimpleName = 'SocketTimeoutException';
            throw err;
        },
    });
    const timeoutRes = timeoutGuard.execute('https://gew4-spclient.spotify.com/connect-state/v1/test', 'GET', '{}', null);
    assert.equal(timeoutRes.status, 504);
    assert.equal(timeoutRes.body, 'Request timed out');
});

