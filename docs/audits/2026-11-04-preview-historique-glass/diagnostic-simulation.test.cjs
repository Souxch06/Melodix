// Purely synthetic tests against the exact historical assets. No network, no real tokens.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const {JSDOM} = require('jsdom');

const root = process.env.MELODIX_HISTORICAL_ROOT;
if (!root) throw new Error('MELODIX_HISTORICAL_ROOT is required');
const bridgeText = fs.readFileSync(path.join(root, 'assets/spotify_bridge.js'), 'utf8');
const shellText = fs.readFileSync(path.join(root, 'assets/native_ui_shell.js'), 'utf8');
const getBlock = (from, to) => {
    const start = bridgeText.indexOf(from), end = bridgeText.indexOf(to, start);
    assert.ok(start >= 0 && end > start, `missing historical block: ${from}`);
    return bridgeText.slice(start, end);
};

function libraryBridge(responses, hasToken = true, callback = null) {
    const calls = [], offsets = [];
    const w = { spotAuthToken: hasToken ? 'Bearer synthetic-token' : null, spotCliToken: null };
    const context = vm.createContext({
        window: w,
        AndBridge: {onMediaItemsLoaded: (id, data) => {calls.push({id, rows: JSON.parse(data)}); if (callback) callback(id,data);}},
        console: {log() {}, warn() {}, error() {}},
        ensureAuthToken: async () => Boolean(w.spotAuthToken),
        getGqlHash: (name, fallback) => fallback,
        oriFetch: async (url, init) => {
            assert.equal(url, 'https://api-partner.spotify.com/pathfinder/v2/query');
            const body = JSON.parse(init.body);
            assert.equal(body.operationName, 'libraryV3');
            offsets.push(body.variables.offset);
            const response = responses.shift();
            assert.ok(response, 'unexpected extra request');
            return {ok: response.ok, status: response.status || 200, statusText: response.statusText || '', json: async () => response.body};
        },
    });
    vm.runInContext(getBlock('    window.pendingMediaRequests = ', '    // =========================================================================\n    // SECTION 5:'), context);
    vm.runInContext(getBlock('    window.__sfMediaItemsCache = ', '    window.fetchMediaItems = fetchMediaItems;') + '\nwindow.fetchMediaItems = fetchMediaItems;', context);
    return {w, calls, offsets};
}
const item = i => ({item: {data: {__typename: 'Playlist', uri: `spotify:playlist:fake${i}`, name: `Fictive ${i}`}}});
const success = rows => ({ok: true, body: {data: {me: {libraryV3: {items: rows}}}}});

test('synthetic bridge: 75 library playlists are paginated at 50 and delivered', async () => {
    const b = libraryBridge([success(Array.from({length:50},(_,i)=>item(i))), success(Array.from({length:25},(_,i)=>item(i+50)))]);
    await b.w.fetchMediaItems('playlists');
    assert.deepEqual(b.offsets, [0,50]);
    assert.equal(b.w.mediaLib.playlists.length, 75);
    assert.equal(b.calls.filter(c => c.id === 'playlists' && c.rows.length === 75).length, 2);
    assert.equal(b.w.pendingMediaRequests.size, 0);
});

for (const status of [401,403,429]) {
    test(`synthetic bridge: HTTP ${status} on first page yields empty library, not an error state`, async () => {
        const b = libraryBridge([{ok:false, status, statusText:'synthetic refusal'}]);
        await b.w.fetchMediaItems('playlists');
        assert.deepEqual(b.offsets, [0]);
        assert.equal(b.w.mediaLib.playlists.length, 0);
        assert.ok(b.calls.some(c => c.id === 'playlists' && c.rows.length === 0));
    });
}

test('synthetic bridge: a full result set stops at the 1000-item historical ceiling', async () => {
    const pages = Array.from({length:20},(_,page)=>success(Array.from({length:50},(_,i)=>item(page*50+i))));
    const b = libraryBridge(pages);
    await b.w.fetchMediaItems('playlists');
    assert.equal(b.offsets.length,20);
    assert.equal(b.offsets[19],950);
    assert.equal(b.w.mediaLib.playlists.length,1000);
});

test('synthetic bridge: later page refusal yields a partial library without a partial error', async () => {
    const b = libraryBridge([success(Array.from({length:50},(_,i)=>item(i))), {ok:false, statusText:'synthetic refusal'}]);
    await b.w.fetchMediaItems('playlists');
    assert.deepEqual(b.offsets, [0,50]);
    assert.equal(b.w.mediaLib.playlists.length, 50);
    assert.ok(b.calls.some(c => c.id === 'playlists' && c.rows.length === 50));
});

test('synthetic bridge: GraphQL errors in HTTP 200 are interpreted as an empty library', async () => {
    const b = libraryBridge([{ok:true, body:{errors:[{message:'synthetic error'}]}}]);
    await b.w.fetchMediaItems('playlists');
    assert.equal(b.w.mediaLib.playlists.length, 0);
    assert.ok(b.calls.some(c => c.id === 'playlists' && c.rows.length === 0));
});

test('synthetic bridge: missing token leaves request pending with no native callback', async () => {
    const b = libraryBridge([], false);
    await b.w.fetchMediaItems('playlists');
    assert.deepEqual(b.offsets, []);
    assert.equal(b.calls.length, 0);
    assert.equal(b.w.pendingMediaRequests.has('playlists'), true);
});

function bootShell(route, html, options = {}) {
    const dom = new JSDOM(`<!doctype html><body>${html}</body>`, {url:`https://open.spotify.com${route}`});
    const document = dom.window.document;
    const calls = [], navigations = [], timers = [], ready = [], listeners = {};
    const location = {hostname:'open.spotify.com', pathname:route, href:`https://open.spotify.com${route}`, assign: url => navigations.push(url)};
    const w = {
        location,
        AndBridge: {onNativeUiData: (screen, data) => calls.push({screen, data}), onNativeUiReady() {ready.push(true);}, onNativeUiRoute() {}},
        addEventListener(name, fn) {listeners[name] = fn;}, setTimeout(fn, delay) {timers.push({fn,delay}); return timers.length;}, clearTimeout() {},
        MutationObserver: class {observe() {}}, ...options,
    };
    vm.runInNewContext(shellText, {window:w, document, URL, console});
    assert.equal(w.__sfNativeUiShellCompleted, true);
    return {w, calls, navigations, timers, ready, document, listeners, close: () => dom.window.close()};
}
const latest = (calls, screen) => {
    const call = calls.filter(c => c.screen === screen).at(-1);
    return call ? JSON.parse(call.data) : null;
};
const anchors = n => Array.from({length:n},(_,i)=>`<a href="/playlist/fake${i}">Fictive ${i}</a>`).join('');

test('synthetic Home: 75 loaded playlists produce only the first 12 saved rows', () => {
    const playlists = Array.from({length:75},(_,i)=>({id:`spotify:playlist:fake${i}`,name:`Fictive ${i}`}));
    const b = bootShell('/', '<main id="main-view"></main>', {mediaLib:{playlists}});
    try {
        const rows = latest(b.calls, 'home');
        assert.equal(rows.length, 12);
        assert.equal(rows[11].title, 'Fictive 11');
    } finally {b.close();}
});

test('synthetic live collection without bridge: DOM fallback caps 75 links at 32', () => {
    const b = bootShell('/collection/playlists', `<main id="main-view">${anchors(75)}</main>`);
    try {
        const rows = latest(b.calls, 'media:playlists');
        assert.equal(rows.length, 32);
        assert.equal(rows[31].title, 'Fictive 31');
    } finally {b.close();}
});

test('synthetic library action navigates to Spotify collection when bridge is absent', () => {
    const b = bootShell('/', '<main id="main-view"></main>');
    try {
        assert.equal(b.w.__sfOpenLibrary(), true);
        assert.deepEqual(b.navigations, ['https://open.spotify.com/collection/playlists']);
    } finally {b.close();}
});

test('synthetic playlist action uses bridge, or navigates directly without it', () => {
    const b = bootShell('/', '<main id="main-view"></main>');
    try {
        assert.equal(b.w.__sfOpenCollection('spotify:playlist:fake123'), true);
        assert.deepEqual(b.navigations, ['https://open.spotify.com/playlist/fake123']);
        const requests=[];
        b.w.__sfMelodixBridgeStarted = true;
        b.w.fetchMediaItems = x => requests.push(x);
        assert.equal(b.w.__sfOpenCollection('spotify:playlist:fake456'), true);
        assert.deepEqual(requests, ['spotify:playlist:fake456']);
        assert.ok(b.timers.some(t => t.delay === 6000));
    } finally {b.close();}
});

test('synthetic liked-songs collection link is not collected by the historical DOM scraper', () => {
    const b = bootShell('/collection/playlists', '<main id="main-view"><a href="/collection/tracks">Titres likés</a></main>');
    try { assert.equal(latest(b.calls,'media:playlists'), null); } finally {b.close();}
});

test('synthetic successful bridge callback alone does not cancel six-second playlist navigation', () => {
    const b = bootShell('/', '<main id="main-view"></main>');
    try {
        const responses=[];
        b.w.__sfMelodixBridgeStarted = true;
        b.w.AndBridge.onMediaItemsLoaded = (id, data) => responses.push({id, rows:JSON.parse(data)});
        b.w.fetchMediaItems = uri => b.w.AndBridge.onMediaItemsLoaded(uri, JSON.stringify([{name:'Fictive piste',id:'spotify:track:fake1'}]));
        assert.equal(b.w.__sfOpenCollection('spotify:playlist:fake456'), true);
        assert.equal(responses.length, 1);
        assert.equal(responses[0].rows.length, 1);
        const fallback = b.timers.find(t => t.delay === 6000);
        assert.ok(fallback);
        fallback.fn();
        assert.deepEqual(b.navigations, ['https://open.spotify.com/playlist/fake456']);
    } finally {b.close();}
});

// Interpret the relevant actual Smali guard, not a rewritten JavaScript condition.
function evaluateImageGuard(input) {
    const file = fs.readFileSync(path.join(root,'smali/com/melodix/music/NativeImageLoader.smali'),'utf8');
    const method = file.match(/\.method public static load\([\s\S]*?\.end method/)[0];
    const lines = method.split('\n').map(x => x.trim()).filter(x => x && !x.startsWith('.'));
    const labels = new Map(lines.map((line,i)=>[line,i]).filter(([line])=>line.startsWith(':')));
    let v1, last;
    for (let pc=0;pc<lines.length;pc++) {
        const line = lines[pc];
        if (line === ':clear_native_image') return 'clear';
        if (line.includes('Picasso;->load(Ljava/lang/String;)')) return 'load';
        if (line === 'if-eqz p0, :image_load_done') continue; // fixture image view is non-null
        if (line === 'if-eqz p1, :clear_native_image') {if (input == null) pc=labels.get(':clear_native_image')-1; continue;}
        if (line === 'const-string v1, "https://"') {v1='https://'; continue;}
        if (line.includes('Ljava/lang/String;->startsWith(Ljava/lang/String;)Z')) {last=input.startsWith(v1); continue;}
        if (line.includes('Ljava/lang/String;->isEmpty()Z')) {last=input.length===0; continue;}
        if (line === 'move-result v1') {v1=last; continue;}
        if (line === 'if-eqz v1, :clear_native_image') {if (!v1) pc=labels.get(':clear_native_image')-1; continue;}
    }
    throw new Error('unexpected Smali flow');
}

test('historical native image guard clears even non-empty HTTPS covers before Picasso.load', () => {
    assert.equal(evaluateImageGuard('https://i.scdn.co/image/fake'), 'clear');
    assert.equal(evaluateImageGuard('http://i.scdn.co/image/fake'), 'clear');
    assert.equal(evaluateImageGuard(''), 'clear');
    assert.equal(evaluateImageGuard(null), 'clear');
});

test('full Glass CSS can be passed through the historical style assignment in a simulated JS document', () => {
    const css = fs.readFileSync(path.join(__dirname,'css_hacks_glass_complet.css'),'utf8');
    const nodes = {};
    const doc = {getElementById: id => nodes[id], createElement: () => ({}), head:{appendChild: node => {nodes[node.id]=node;}}};
    // Mirrors the historical JSONObject.quote/style.textContent path, without Android's WebView.
    const script = `(function(){let style=document.getElementById('sf-custom-style');if(!style){style=document.createElement('style');style.id='sf-custom-style';document.head.appendChild(style);}style.textContent=${JSON.stringify(css)}+"";})();`;
    vm.runInNewContext(script,{document:doc});
    assert.equal(nodes['sf-custom-style'].textContent,css);
    assert.match(css, /SECTION 9: MELODIX MOBILE HOME/);
    assert.ok(Buffer.byteLength(css)>100000);
});


test('synthetic readiness requires the user-widget element, not just a populated page', () => {
    const b = bootShell('/', '<main id="main-view"><a href="/playlist/fake1">Fictive</a></main>');
    try {
        assert.equal(b.ready.length,0);
        assert.ok(latest(b.calls,'home').length > 0);
        const widget = b.document.createElement('button');
        widget.setAttribute('data-testid','user-widget-link');
        b.document.body.appendChild(widget);
        b.w.__sfNativeRequestHome();
        assert.equal(b.ready.length,1);
    } finally {b.close();}
});

test('synthetic Home re-scrapes a playlist mounted after the initial empty page', () => {
    const b = bootShell('/', '<button data-testid="user-widget-link"></button><main id="main-view"></main>');
    try {
        assert.deepEqual(latest(b.calls,'home'),[]);
        b.document.querySelector('#main-view').innerHTML='<a href="/playlist/fake99">Fictive tardive</a>';
        assert.equal(b.w.__sfNativeRequestHome(), true);
        assert.equal(latest(b.calls,'home')[0].title, 'Fictive tardive');
    } finally {b.close();}
});


test('synthetic detail DOM fallback sends at most 32 of 40 track links', () => {
    const links=Array.from({length:40},(_,i)=>`<a href="/track/fake${i}">Piste fictive ${i}</a>`).join('');
    const b=bootShell('/playlist/fake1', `<main id="main-view"><h1>Playlist fictive</h1>${links}</main>`);
    try {
        const rows=latest(b.calls,'detail');
        assert.equal(rows.length,32);
        assert.equal(rows[31].title,'Piste fictive 31');
    } finally {b.close();}
});

test('synthetic detail DOM: removing the last track does not send an empty update', () => {
    const b=bootShell('/playlist/fake1', '<main id="main-view"><a href="/track/fake1">Piste fictive</a></main>');
    try {
        assert.equal(latest(b.calls,'detail').length,1);
        const count=b.calls.filter(c=>c.screen==='detail').length;
        b.document.querySelector('#main-view').innerHTML='';
        b.listeners.popstate();
        const scheduled=b.timers.find(t=>t.delay===120);
        assert.ok(scheduled);
        scheduled.fn();
        assert.equal(b.calls.filter(c=>c.screen==='detail').length,count);
    } finally {b.close();}
});

test('synthetic stored library is served even when the current token is absent',async()=>{
    const b=libraryBridge([],false);
    b.w.mediaLib={playlists:[{id:'spotify:playlist:fake1',name:'Fictive mémoire'}]};
    await b.w.fetchMediaItems('playlists');
    assert.equal(b.offsets.length,0);
    assert.equal(b.calls.length,1);
    assert.equal(b.calls[0].rows[0].name,'Fictive mémoire');
});

test('synthetic Home sends both the generic and dedicated native callbacks',()=>{
    const events=[];
    const bridge={
        onNativeUiReady(){},
        onNativeUiData:(screen,data)=>{if(screen==='home')events.push({kind:'generic',data});},
        onNativeHomeRows:data=>events.push({kind:'dedicated',data}),
    };
    const b=bootShell('/', '<main id="main-view"></main>',{
        AndBridge:bridge,mediaLib:{playlists:[{id:'spotify:playlist:fake1',name:'Fictive'}]},
    });
    try {
        assert.deepEqual(events.map(e=>e.kind),['generic','dedicated']);
        assert.equal(events[0].data,events[1].data);
    } finally {b.close();}
});

// Chain the actual historical JS with the isolated Smali interpreters.
// The bridge objects, data, network responses, and native activity are fixtures.
const {dispatch: interpretDispatch}=require('./native-dispatch-characterization.test.cjs');
const {run: interpretNativeRoute}=require('./native-routing-characterization.test.cjs');
const weakActivity={kind:'activity',name:'synthetic-activity'};
const appContext={kind:'application'};
const activityContext={kind:'activity',name:'synthetic-context'};

test('synthetic JS-to-native library chain: 75 rows reach callback but application context drops them',async()=>{
    const nativeRenders=[],posts=[];
    const b=libraryBridge([success(Array.from({length:50},(_,i)=>item(i))),success(Array.from({length:25},(_,i)=>item(i+50)))],true,(id,data)=>{
        const dispatched=interpretDispatch(weakActivity,appContext,'media:'+id,data);
        posts.push(...dispatched);
        for(const p of dispatched) nativeRenders.push(...interpretNativeRoute(p.screen,p.data,{nativeExpectedId:'playlists',nativeCurrentScreen:'library'}).renders);
    });
    await b.w.fetchMediaItems('playlists');
    assert.ok(b.calls.some(x=>x.id==='playlists'&&x.rows.length===75));
    assert.equal(posts.length,0);
    assert.equal(nativeRenders.length,0);
});

test('synthetic JS-to-native library control: activity context allows the same payload to reach renderer',async()=>{
    const nativeRenders=[];
    const b=libraryBridge([success([item(1)])],true,(id,data)=>{
        const posts=interpretDispatch(weakActivity,activityContext,'media:'+id,data);
        for(const p of posts) nativeRenders.push(...interpretNativeRoute(p.screen,p.data,{nativeExpectedId:'playlists',nativeCurrentScreen:'library'}).renders);
    });
    await b.w.fetchMediaItems('playlists');
    assert.ok(nativeRenders.length>0);
    assert.equal(JSON.parse(nativeRenders[0].payload)[0].name,'Fictive 1');
});

test('synthetic Home chain: dedicated callback can reach renderer while generic callback is dropped',()=>{
    const generic=[],nativeRenders=[];
    const bridge={
        onNativeUiReady(){},
        onNativeUiData:(screen,data)=>generic.push(...interpretDispatch(weakActivity,appContext,screen,data)),
        // Model the dedicated weak-activity callback previously verified in Smali.
        onNativeHomeRows:data=>nativeRenders.push(...interpretNativeRoute('home',data,{nativeCurrentScreen:'home'}).renders),
    };
    const b=bootShell('/', '<main id="main-view"></main>',{
        AndBridge:bridge,mediaLib:{playlists:[{id:'spotify:playlist:fake1',name:'Fictive'}]},
    });
    try {
        assert.equal(generic.length,0);
        assert.equal(nativeRenders.length,1);
        assert.equal(JSON.parse(nativeRenders[0].payload)[0].title,'Fictive');
    } finally {b.close();}
});
