// Executes selected functions from the historical bridge against synthetic data only.
const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const root = process.env.MELODIX_HISTORICAL_ROOT;
if (!root) throw new Error('MELODIX_HISTORICAL_ROOT is required');
const source = fs.readFileSync(path.join(root,'assets/spotify_bridge.js'),'utf8');
function block(start, end) {
    const a = source.indexOf(start), b = source.indexOf(end,a);
    assert.ok(a >= 0 && b > a, `Missing ${start}`);
    return source.slice(a,b);
}

function harness(responses, initial = {}) {
    const calls = [], requests = [];
    const w = {spotAuthToken:'Bearer synthetic-token',spotCliToken:null,spotDevId:'fake-device', ...initial};
    const sandbox = vm.createContext({
        window:w,
        AndBridge:{onMediaItemsLoaded:(id,json)=>calls.push({id,rows:JSON.parse(json)})},
        console:{log(){},warn(){},error(){}},
        ensureAuthToken:async()=>Boolean(w.spotAuthToken),
        getGqlHash:(name,fallback)=>fallback,
        oriFetch:async(url,init)=>{
            assert.equal(url,'https://api-partner.spotify.com/pathfinder/v2/query');
            const req=JSON.parse(init.body);
            requests.push({operation:req.operationName,variables:req.variables});
            const next=responses.shift();
            assert.ok(next,'unexpected network request');
            return {ok:next.ok,status:next.status || 200,statusText:'fixture',json:async()=>next.body};
        },
    });
    vm.runInContext(block('    function pickOptimalArtwork(', '    function getGqlHash('),sandbox);
    vm.runInContext(block('    window.__sfMediaItemsCache = ', '    window.fetchMediaItems = fetchMediaItems;') + '\nwindow.fetchMediaItems = fetchMediaItems;',sandbox);
    return {w,calls,requests,sandbox};
}
const track = n=>({itemV2:{data:{uri:`spotify:track:fake${n}`,name:`Piste fictive ${n}`,artists:{items:[{profile:{name:'Artiste fictif'}}]},albumOfTrack:{coverArt:{sources:[{url:'https://i.scdn.co/image/fake',width:200}]}}}}});
const playlistResponse = items=>({ok:true,body:{data:{playlistV2:{content:{items}}}}});
const last = x=>x[x.length-1];

test('playlist synthetic: 80 track rows delivered and playback context remembered', async()=>{
    const h=harness([playlistResponse(Array.from({length:80},(_,i)=>track(i)))]);
    const id='spotify:playlist:fake1';
    await h.w.fetchMediaItems(id);
    assert.equal(h.requests.length,1);
    assert.equal(h.requests[0].operation,'fetchPlaylist');
    assert.equal(h.requests[0].variables.limit,80);
    assert.equal(h.requests[0].variables.offset,0);
    assert.equal(last(h.calls).id,id);
    assert.equal(last(h.calls).rows.length,80);
    assert.equal(last(h.calls).rows[0].id,'spotify:track:fake0');
    assert.equal(h.w.__sfCurrentContextUri,id);
    assert.equal(h.w.__sfCurrentTrackUris.length,80);
});

test('playlist synthetic: a successful non-empty response is reused from memory on reopening', async()=>{
    const h=harness([playlistResponse([track(1)])]);
    const id='spotify:playlist:fake1';
    await h.w.fetchMediaItems(id);
    await h.w.fetchMediaItems(id);
    assert.equal(h.requests.length,1);
    assert.equal(h.calls.length,2);
    assert.equal(h.calls[1].rows[0].id,'spotify:track:fake1');
});

test('playlist synthetic: refused request sends empty rows and can be retried', async()=>{
    const h=harness([{ok:false,status:403},playlistResponse([track(2)])]);
    const id='spotify:playlist:fake1';
    await h.w.fetchMediaItems(id);
    assert.deepEqual(last(h.calls).rows,[]);
    assert.equal(h.w.__sfMediaItemsCache.has(id),false);
    await h.w.fetchMediaItems(id);
    assert.equal(h.requests.length,2);
    assert.equal(last(h.calls).rows[0].id,'spotify:track:fake2');
});

test('playlist synthetic: GraphQL error returned with HTTP 200 is rendered as empty', async()=>{
    const h=harness([{ok:true,body:{errors:[{message:'synthetic error'}]}}]);
    await h.w.fetchMediaItems('spotify:playlist:fake1');
    assert.deepEqual(last(h.calls).rows,[]);
});

test('liked tracks synthetic: first page uses limit 50 and feeds native callback', async()=>{
    const items=Array.from({length:50},(_,i)=>({track:{data:{uri:`spotify:track:fake${i}`,name:`Piste fictive ${i}`,artists:{items:[]}}}}));
    const h=harness([{ok:true,body:{data:{me:{library:{tracks:{items}}}}}}]);
    await h.w.fetchMediaItems('spotify:collection:tracks');
    assert.equal(h.requests.length,1);
    assert.equal(h.requests[0].operation,'fetchLibraryTracks');
    assert.equal(h.requests[0].variables.limit,50);
    assert.equal(h.requests[0].variables.offset,0);
    assert.equal(last(h.calls).rows.length,50);
});

test('liked tracks synthetic: empty response is sent as empty, not reported as an error', async()=>{
    const h=harness([{ok:false,status:429}]);
    await h.w.fetchMediaItems('spotify:collection:tracks');
    assert.deepEqual(last(h.calls).rows,[]);
});

function player(initial={}) {
    const commands=[], events=[];
    const w={spotDevId:'fake-device',spotAuthToken:'Bearer synthetic-token',spotCliToken:'fake-client',...initial};
    const sandbox=vm.createContext({
        window:w,URL,featVer:'fixture',
        localStorage:{getItem:()=>null},
        tracePlayback:(...args)=>events.push(args),
        markUserPlaybackIntent:(...args)=>events.push(args),
        console:{log(){},warn(){},error(){}},
        fetch:(url,init)=>{commands.push({url,body:JSON.parse(init.body)}); return Promise.resolve({ok:true});},
    });
    vm.runInContext(block('    window.playFromUri = function(', '    async function searchAndPlay('),sandbox);
    return {w,commands,events};
}

test('play synthetic: playlist context with selected track constructs the expected command',()=>{
    const p=player();
    p.w.playFromUri('spotify:track:fake1','spotify:playlist:fake99');
    assert.equal(p.commands.length,1);
    const command=p.commands[0].body.command;
    assert.equal(command.endpoint,'play');
    assert.equal(command.context.uri,'spotify:playlist:fake99');
    assert.equal(command.options.skip_to.track_uri,'spotify:track:fake1');
});

test('play synthetic: cached playlist queue carries selected track and position',()=>{
    const p=player({__sfCurrentContextUri:'spotify:playlist:fake1',__sfCurrentTrackUris:['spotify:track:fake1','spotify:track:fake2']});
    p.w.playFromUri('spotify:track:fake2');
    assert.equal(p.commands.length,1);
    const command=p.commands[0].body.command;
    assert.equal(command.context.uri,'spotify:playlist:fake1');
    assert.equal(command.context.pages[0].tracks.length,2);
    assert.equal(command.options.skip_to.track_index,1);
});

test('play synthetic: no device ID or token means no command is sent',()=>{
    const a=player({spotDevId:null});
    a.w.playFromUri('spotify:track:fake1');
    assert.equal(a.commands.length,0);
    const b=player({spotAuthToken:null});
    b.w.playFromUri('spotify:track:fake1');
    assert.equal(b.commands.length,0);
});

test('play synthetic: liked tracks construct collection context',()=>{
    const p=player({likedSongsCache:[{id:'spotify:track:fake1'},{id:'spotify:track:fake2'}]});
    p.w.playFromUri('spotify:track:fake2','spotify:collection:tracks');
    const command=p.commands[0].body.command;
    assert.equal(command.context.uri,'spotify:collection:tracks');
    assert.equal(command.context.pages[0].tracks.length,2);
    assert.equal(command.options.skip_to.track_uri,'spotify:track:fake2');
});


test('synthetic end-to-end: loaded playlist track becomes a play command with the playlist queue',async()=>{
    const h=harness([playlistResponse([track(0),track(1)])]);
    const commands=[];
    Object.assign(h.sandbox,{
        URL,featVer:'fixture',localStorage:{getItem:()=>null},
        tracePlayback(){},markUserPlaybackIntent(){},
        fetch:(url,init)=>{commands.push(JSON.parse(init.body));return Promise.resolve({ok:true});},
    });
    vm.runInContext(block('    window.playFromUri = function(', '    async function searchAndPlay('),h.sandbox);
    await h.w.fetchMediaItems('spotify:playlist:fake1');
    const trackUri=h.calls[0].rows[1].id;
    h.w.playFromUri(trackUri);
    assert.equal(commands.length,1);
    const cmd=commands[0].command;
    assert.equal(cmd.context.uri,'spotify:playlist:fake1');
    assert.equal(cmd.options.skip_to.track_uri,'spotify:track:fake1');
    assert.equal(cmd.options.skip_to.track_index,1);
});

test('synthetic playlist cache is reused after token disappears, without a session check',async()=>{
    const h=harness([playlistResponse([track(0)])]);
    const id='spotify:playlist:fake1';
    await h.w.fetchMediaItems(id);
    h.w.spotAuthToken=null;
    await h.w.fetchMediaItems(id);
    assert.equal(h.requests.length,1);
    assert.equal(h.calls.length,2);
    assert.equal(h.calls[1].rows[0].id,'spotify:track:fake0');
});

test('synthetic playlist track payload to native row guards: click, cover and artist are skipped',async()=>{
    // The bridge really builds this fixture's payload; the following guards are
    // interpreted from Smali. Native JSON parsing/widgets are not executed.
    const {method,guardAllowsAction,row}=require('./native-smali-characterization.test.cjs');
    const h=harness([playlistResponse([track(1)])]);
    await h.w.fetchMediaItems('spotify:playlist:fake1');
    const data=last(h.calls).rows[0];
    assert.equal(data.id,'spotify:track:fake1');
    assert.deepEqual(data.artists,['Artiste fictif']);
    assert.equal(data.image,'https://i.scdn.co/image/fake');
    assert.equal(data.uri,undefined);
    for (const field of ['subtitle','artist','description','type']) assert.equal(data[field],undefined);
    const body=method(row,'.method public static create(');
    // Confirm the fallback fields used by the guards are present in the method.
    assert.match(body,/const-string v0, "uri"[\s\S]*?const-string v0, "id"/);
    assert.match(body,/const-string v0, "image"[\s\S]*?move-result-object v9/);
    assert.match(body,/const-string v0, "artists"[\s\S]*?optJSONArray/);
    const click=body.slice(body.lastIndexOf('invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z'));
    assert.equal(guardAllowsAction(click,'v8','invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z','->setOnClickListener(',data.id),false);
    assert.equal(guardAllowsAction(body.slice(body.indexOf('Landroid/widget/LinearLayout;->addView')),'v9','invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z','NativeImageLoader;->load',data.image),false);
    const artist=body.slice(body.indexOf('Lorg/json/JSONArray;->optString(ILjava/lang/String;)Ljava/lang/String;'));
    assert.equal(guardAllowsAction(artist,'v10','invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z','invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)',data.artists[0]),false);
});
