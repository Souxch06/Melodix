'use strict';
const {test}=require('node:test');
const assert=require('node:assert/strict');
const fs=require('node:fs');
const read=f=>fs.readFileSync(f,'utf8');
const base='smali/com/melodix/music/';
test('explicit page entry is separate from login, retry and session proof',()=>{
 const glass=read(base+'NativeLimitedGlass.smali');
 assert.match(glass,/Spotify \(page Web\)[\s\S]*?melodix:action:open-web-page/);
 assert.match(glass,/melodix:action:open-web-page[\s\S]*?SpotifyWebPageOpen/);
 const click=read(base+'SpotifyWebPageOpen.smali');
 assert.match(click,/SpotifyWebPageActivity/);
 assert.doesNotMatch(click,/NativeSessionGate|verify|openSpotifyLogin|removeAllCookies|deleteAllData/);
 assert.match(read('AndroidManifest.xml'),/<activity android:exported="false" android:name="com\.melodix\.music\.SpotifyWebPageActivity"/);
});
test('standalone page is labelled and has a real return, without bridge or data extraction',()=>{
 const page=read(base+'SpotifyWebPageActivity.smali');
 assert.match(page,/Spotify \(page Web\)/);assert.match(page,/Retour à Melodix/);
 assert.match(read(base+'SpotifyWebPageClose.smali'),/->finish\(\)V/);
 assert.match(page,/https:\/\/open\.spotify\.com\//);
 assert.match(page,/setAllowFileAccess\(Z\)/);assert.match(page,/setAllowContentAccess\(Z\)/);
 assert.match(page,/setCacheMode\(I\)/);assert.match(page,/SpotifyWebPageClient/);
 for(const f of ['SpotifyWebPageActivity.smali','SpotifyWebPageClose.smali','SpotifyWebPageClient.smali','SpotifyWebPageOpen.smali']){
  assert.doesNotMatch(read(base+f),/addJavascriptInterface|evaluateJavascript|CookieManager|NativeSessionGate|SharedPreferences|Log;|getText\(|getTitle\(|shouldInterceptRequest/);
 }
});
test('web page limits main-frame navigation to exact HTTPS Spotify player and account hosts',()=>{
 const client=read(base+'SpotifyWebPageClient.smali');
 for(const marker of ['"https"','getUserInfo()','getPort()','"open.spotify.com"','"accounts.spotify.com"','equalsIgnoreCase','WebResourceRequest;->getUrl()']) assert.ok(client.includes(marker),marker);
 assert.equal((client.match(/shouldOverrideUrlLoading/g)||[]).length,2);
});

test('standalone web page uses existing WebView browser profile without granting permissions',()=>{
 const page=read(base+'SpotifyWebPageActivity.smali');
 assert.match(page,/BrowserProfile;->desktopUserAgent\(Landroid\/content\/Context;\)[\s\S]*?setUserAgentString\(Ljava\/lang\/String;\)V[\s\S]*?->loadUrl/);
 assert.doesNotMatch(page,/setWebChromeClient|PermissionRequest|setAcceptThirdPartyCookies|addJavascriptInterface/);
 assert.match(read('smali/m9.smali'),/BrowserProfile;->desktopUserAgent\(Landroid\/content\/Context;\)/);
});
