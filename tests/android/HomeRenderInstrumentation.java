package com.melodix.test;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Insets;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.KeyEvent;
import android.view.Window;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.webkit.ValueCallback;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Android integration test for the exact Preview APK built by the same CI run.
 *
 * It verifies the unauthenticated WebView/login surface and empty-Home native error/retry state,
 * exercises the native status renderer with a status-only payload, and runs the
 * packaged Web Home renderer in an isolated local Android WebView fixture at
 * the native recovery route /app. The fixture is test-only; its explicit
 * private-library-proof flags exercise the renderer gate but do not represent
 * a Spotify response or authentication. It supplies no account content, Spotify credentials,
 * or cookies and does not claim an authenticated Home test. Its opt-in
 * authenticated-home mode only brings the existing task forward and passively
 * observes the primary WebView after a person has signed in; it never automates
 * authentication/navigation or dispatches fixture content.
 */
public final class HomeRenderInstrumentation extends Instrumentation {
    private static final String TARGET_PACKAGE = "com.melodix.music.preview";
    private static final String HARNESS_TAG = "MelodixHarness";

    // Expose only the four shell callbacks needed by this fixture. In
    // particular, no bundled-asset reader is forwarded, so the test cannot
    // bootstrap spotify_bridge.js or start a library fetch.
    public static final class NativeUiShellTestBridge {
        private final Object delegate;
        private final Class<?> bridgeClass;

        public NativeUiShellTestBridge(Context context) throws Exception {
            bridgeClass = context.getClassLoader().loadClass("com.melodix.music.AndBridge");
            delegate = bridgeClass.getConstructor(Context.class).newInstance(context);
        }

        @android.webkit.JavascriptInterface
        public void onNativeUiData(String screen, String data) {
            invoke("onNativeUiData", new Class<?>[]{String.class, String.class}, screen, data);
        }

        @android.webkit.JavascriptInterface
        public void onNativeUiRoute(String screen) {
            invoke("onNativeUiRoute", new Class<?>[]{String.class}, screen);
        }

        @android.webkit.JavascriptInterface
        public void onNativeUiReady() {
            invoke("onNativeUiReady", new Class<?>[0]);
        }

        @android.webkit.JavascriptInterface
        public void onMelodixHomeVisibility(boolean active, boolean sessionProven) {
            invoke("onMelodixHomeVisibility", new Class<?>[]{boolean.class, boolean.class},
                    active, sessionProven);
        }

        @android.webkit.JavascriptInterface
        public void logDiagEvent(String event) {
            invoke("logDiagEvent", new Class<?>[]{String.class}, event);
        }

        @android.webkit.JavascriptInterface
        public String getDiagnosticSessionId() {
            Object value = invoke("getDiagnosticSessionId", new Class<?>[0]);
            return value == null ? "" : String.valueOf(value);
        }

        private Object invoke(String name, Class<?>[] parameterTypes, Object... args) {
            try {
                return bridgeClass.getMethod(name, parameterTypes).invoke(delegate, args);
            } catch (Exception error) {
                throw new IllegalStateException("Native shell fixture bridge call failed", error);
            }
        }
    }

    private Bundle runnerArguments = new Bundle();
    private static final long WEBVIEW_SETTLE_TIMEOUT_MS = 60000L;
    private static final long REQUIRED_STABLE_MS = 1800L;
    private static final long AUTHENTICATED_OBSERVATION_POLL_MS = 500L;
    private static final int MAX_OBSERVED_ROUTES = 16;
    private static final int[] MOBILE_VIEWPORT_MATRIX_WIDTHS = {360, 384, 393, 412};
    private Application observedApplication;
    private volatile boolean activityLifecycleObserverRegistered;
    private volatile boolean backKeyObserverInstalled;
    private volatile boolean backKeyObserverActive;
    private volatile WeakReference<Activity> resumedTargetActivity = new WeakReference<>(null);
    private volatile boolean targetActivityResumed;
    private volatile boolean targetActivityStoppedObserved;
    private volatile boolean targetActivityResumedAfterBackground;
    private volatile boolean targetActivityRecreated;
    private volatile int targetActivityCreateCount;
    private volatile int targetActivityResumeCount;
    private volatile int targetActivityPauseCount;
    private volatile int targetActivityStopCount;
    private volatile int targetActivityDestroyCount;
    private volatile int androidBackKeyUpCount;
    private Window observedBackWindow;
    private Window.Callback observedBackOriginal;
    private Window.Callback observedBackProxy;
    private final Application.ActivityLifecycleCallbacks activityLifecycleObserver =
            new Application.ActivityLifecycleCallbacks() {
        @Override public void onActivityCreated(Activity activity, Bundle state) {
            if (!isTargetActivity(activity)) return;
            targetActivityCreateCount += 1;
            if (targetActivityDestroyCount > 0) targetActivityRecreated = true;
        }
        @Override public void onActivityStarted(Activity activity) {}
        @Override public void onActivityResumed(Activity activity) {
            if (!isTargetActivity(activity)) return;
            resumedTargetActivity = new WeakReference<>(activity);
            targetActivityResumed = true;
            targetActivityResumeCount += 1;
            if (targetActivityStoppedObserved) {
                targetActivityResumedAfterBackground = true;
                targetActivityStoppedObserved = false;
            }
        }
        @Override public void onActivityPaused(Activity activity) {
            if (!isTargetActivity(activity)) return;
            targetActivityPauseCount += 1;
            Activity current = resumedTargetActivity.get();
            if (current == activity) targetActivityResumed = false;
        }
        @Override public void onActivityStopped(Activity activity) {
            if (!isTargetActivity(activity)) return;
            targetActivityStopCount += 1;
            targetActivityStoppedObserved = true;
        }
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) {
            if (!isTargetActivity(activity)) return;
            targetActivityDestroyCount += 1;
            Activity current = resumedTargetActivity.get();
            if (current == activity) {
                targetActivityResumed = false;
                resumedTargetActivity = new WeakReference<>(null);
            }
        }
    };
    private static final String LOGIN_DOM_PROBE =
            "(function(){try{" +
            "var body=String((document.body&&document.body.innerText)||'').toLowerCase();" +
            "var visible=function(e){return !!(e&&e.getClientRects().length&&getComputedStyle(e).visibility!=='hidden');};" +
            "var words=/\\b(log[\\s-]?in|sign[\\s-]?in|se connecter|s'inscrire|create an account|create account|connexion)\\b/.test(body);" +
            "var password=visible(document.querySelector('input[type=\"password\"]'));" +
            "var identity=visible(document.querySelector('input[type=\"email\"],input[name=\"username\"],input[autocomplete=\"username\"]'));" +
            "var accountHost=location.hostname==='accounts.spotify.com';" +
            "var playerLogin=visible(document.querySelector('[data-testid=\"web-player-link\"]'));" +
            "return !!(words||(accountHost&&(password||identity))||(playerLogin&&body));" +
            "}catch(e){return false;}})()";
    private static final String AUTHENTICATED_HOME_PROBE =
            "(function(){try{" +
            "var hostname=String(location.hostname||'').toLowerCase();" +
            "var host=hostname==='open.spotify.com'?'open.spotify.com':hostname==='accounts.spotify.com'?'accounts.spotify.com':'other';" +
            "var parts=String(location.pathname||'/').split('/').filter(Boolean);" +
            "if(parts.length&&/^intl-[a-z]{2}(?:-[a-z]{2})?$/i.test(parts[0]))parts.shift();" +
            "var first=parts.length?String(parts[0]).toLowerCase():'';" +
            "var detailTypes=['playlist','album','artist','track','show','episode','audiobook'];" +
            "var route=parts.length===0?'home':first==='home'||first==='app'?'home':first==='search'?'search':first==='collection'?'library':detailTypes.indexOf(first)>=0?'detail':'other';" +
            "var homeRoute=host==='open.spotify.com'&&route==='home';" +
            "var visible=function(element){if(!element)return false;var style=getComputedStyle(element);var rect=element.getBoundingClientRect();" +
            "return style.display!=='none'&&style.visibility==='visible'&&Number(style.opacity)>0&&rect.width>0&&rect.height>0;};" +
            "var rectOf=function(element){if(!element)return {left:0,top:0,width:0,height:0};var r=element.getBoundingClientRect();" +
            "var n=function(v){return Number.isFinite(Number(v))?Math.max(-10000,Math.min(10000,Math.round(Number(v)))):0;};" +
            "return {left:n(r.left),top:n(r.top),width:n(r.width),height:n(r.height)};};" +
            "var bounded=function(value,max){var n=Number(value);return Number.isFinite(n)?Math.max(0,Math.min(max,Math.floor(n))):0;};" +
            "var enumValue=function(value,allowed,fallback){return allowed.indexOf(value)>=0?value:fallback;};" +
            "var library=window.mediaLib&&typeof window.mediaLib==='object'?window.mediaLib:null;" +
            "var libraryProven=window.__sfMediaLibSessionProofKnown===true&&window.__sfMediaLibSessionProven===true;" +
            "var status=String(window.__sfMediaLibStatus||'absent');if(['absent','pending','loading','ready','error'].indexOf(status)<0)status='other';" +
            "var fetchDiagnostic=window.__sfMediaLibLastDiagnostic&&typeof window.__sfMediaLibLastDiagnostic==='object'?window.__sfMediaLibLastDiagnostic:null;" +
            "var fetchPhases=['request','response','parse','transform','settle'];" +
            "var fetchMimes=['json','html','other','missing'];" +
            "var fetchErrors=['none','empty','http-401','http-403','http-other','timeout','network','non-json','invalid-json','unexpected-shape','graphql','parse','transform'];" +
            "var fetchPhase=fetchDiagnostic?enumValue(fetchDiagnostic.phase,fetchPhases,'unknown'):'unknown';" +
            "var fetchMime=fetchDiagnostic?enumValue(fetchDiagnostic.mime,fetchMimes,'unknown'):'unknown';" +
            "var fetchHttp=fetchDiagnostic?bounded(fetchDiagnostic.http,599):-1;" +
            "var fetchDuration=fetchDiagnostic?bounded(fetchDiagnostic.durationMs,999999):-1;" +
            "var fetchError=fetchDiagnostic?enumValue(fetchDiagnostic.error,fetchErrors,'other'):'unavailable';" +
            "var fetchStatusMatches=function(code){return !!fetchDiagnostic&&fetchPhase==='response'&&fetchHttp===code&&fetchError==='http-'+code;};" +
            "if((fetchError==='http-401'&&!fetchStatusMatches(401))||(fetchError==='http-403'&&!fetchStatusMatches(403)))fetchError='http-other';" +
            "var normalizeLibraryError=function(value){if(value==='http-401')return fetchStatusMatches(401)?'http-401':'other';" +
            "if(value==='http-403')return fetchStatusMatches(403)?'http-403':'other';" +
            "if(/^http-[1-5][0-9]{2}$/.test(value)){var code=Number(value.slice(5));" +
            "return fetchDiagnostic&&fetchPhase==='response'&&fetchHttp===code&&fetchError==='http-other'?'http-other':'other';}" +
            "if(value==='http-unknown'||value==='network-error')return'network';" +
            "if(['timeout','non-json','invalid-json','unexpected-shape','graphql-error','transform-error','fetch-parse-error','empty'].indexOf(value)>=0)" +
            "return value==='graphql-error'?'graphql':value==='transform-error'?'transform':value==='fetch-parse-error'?'parse':value;" +
            "return value?'other':'none';};" +
            "var libraryError=normalizeLibraryError(typeof window.__sfMediaLibError==='string'?window.__sfMediaLibError:'');" +
            "var libraryPlaylistObserved=!!(libraryProven&&library&&Array.isArray(library.playlists)&&library.playlists.length>0);" +
            "var home=document.getElementById('sf-melodix-home');var homeVisible=visible(home);" +
            "var mainId=document.getElementById('main-view');var semanticMain=mainId||document.querySelector('[data-testid=\"home-page\"]');" +
            "var mainVisible=visible(semanticMain);var body=document.body;" +
            "var spotifyMain=mainId||semanticMain;" +
            "var decision=String(window.__sfMelodixHomeDecision||'not-run');" +
            "var allowedDecisions=['not-run','rendered','visible','body-missing','route-not-home','gui-mode-unsupported','fullscreen-open','renderer-inactive','styles-not-ready','activation-visibility-check-failed','home-root-missing','initialization-error'];" +
            "if(allowedDecisions.indexOf(decision)<0&&!/^(?:status-visible-(loading|empty|error|partial|ready)|rendered-status-(loading|empty|error|unavailable))$/.test(decision))decision='other';" +
            "var nativeRoute=['home','search','library','detail','player','settings'].indexOf(window.__sfNativeUiRoute)>=0?window.__sfNativeUiRoute:'other';" +
            "var bridge=window.AndBridge||null;var owner=homeVisible?'melodix-web-home':mainVisible?'spotify-web':'web-unknown';" +
            "var homeRect=rectOf(home);var mainRect=rectOf(mainId);" +
            "return {probe_error:false,host_category:host,route_category:route,home_route:homeRoute," +
            "library_status:status,library_error:libraryError," +
            "library_fetch_diagnostic_available:!!fetchDiagnostic,library_fetch_phase:fetchPhase," +
            "library_fetch_http_status:fetchHttp,library_fetch_mime:fetchMime," +
            "library_fetch_duration_ms:fetchDuration,library_fetch_error:fetchError," +
            "real_library_playlist_observed:libraryPlaylistObserved," +
            "renderer_decision:decision,sf_melodix_home_present:!!home,sf_melodix_home_visible:homeVisible," +
            "sf_melodix_home_rect:homeRect,main_view_id_present:!!mainId,main_view_visible:visible(mainId)," +
            "home_active_class:!!(body&&body.classList&&body.classList.contains('sf-melodix-home-active'))," +
            "native_route:nativeRoute,native_route_callback_returned:!!window.__sfNativeUiLastRouteSent&&window.__sfNativeUiLastRouteSent===window.__sfNativeUiRoute," +
            "native_home_data_callback_returned:window.__sfNativeUiHomeDataSent===true," +
            "native_home_state_callback_returned:window.__sfNativeUiHomeStateSent===true," +
            "native_ready_callback_returned:window.__sfNativeUiReadyNotified===true," +
            "bridge_started:window.__sfMelodixBridgeStarted===true," +
            "bridge_route_callback_available:!!(bridge&&typeof bridge.onNativeUiRoute==='function')," +
            "bridge_data_callback_available:!!(bridge&&typeof bridge.onNativeUiData==='function')," +
            "bridge_ready_callback_available:!!(bridge&&typeof bridge.onNativeUiReady==='function')," +
            "webview_page_owner:owner};" +
            "}catch(e){var name=String(e&&e.name||'Error');return {probe_error:true,probe_error_type:/^[A-Za-z0-9_$]+$/.test(name)?name.slice(0,48):'Error'};}})()";
    private static final String MOBILE_VIEWPORT_LAYOUT_PROBE =
            "(function(){try{" +
            "var settledStyles=document.createElement('style');settledStyles.textContent='*,*::before,*::after{animation:none!important;transition:none!important;}';document.head.appendChild(settledStyles);" +
            "var n=function(v){v=Number(v);return Number.isFinite(v)?Math.max(-10000,Math.min(10000,Math.round(v*100)/100)):null;};" +
            "var rect=function(e){if(!e)return null;var r=e.getBoundingClientRect();return{left:n(r.left),top:n(r.top),right:n(r.right),bottom:n(r.bottom),width:n(r.width),height:n(r.height)};};" +
            "var style=function(e){if(!e)return null;var s=getComputedStyle(e);var z=String(s.zIndex||'');z=/^-?\\d+$/.test(z)?n(z):z==='auto'?'auto':'other';" +
            "return{display:['none','block','inline','inline-block','flex','grid'].indexOf(s.display)>=0?s.display:'other'," +
            "position:['static','relative','absolute','fixed','sticky'].indexOf(s.position)>=0?s.position:'other',zIndex:z," +
            "opacity:n(s.opacity),visibility:s.visibility==='hidden'?'hidden':s.visibility==='collapse'?'collapse':'visible'," +
            "pointerEvents:s.pointerEvents==='none'?'none':'auto'," +
            "overflowX:['visible','hidden','clip','auto','scroll'].indexOf(s.overflowX)>=0?s.overflowX:'other'," +
            "overflowY:['visible','hidden','clip','auto','scroll'].indexOf(s.overflowY)>=0?s.overflowY:'other'};};" +
            "var visible=function(e){if(!e)return false;var s=style(e),r=rect(e);return !!(s&&r&&s.display!=='none'&&s.visibility==='visible'&&s.opacity>0&&r.width>0&&r.height>0);};" +
            "var surface=function(e){var r=rect(e),s=style(e);return{present:!!e,visible:visible(e),rect:r,style:s," +
            "clientWidth:e?n(e.clientWidth):null,clientHeight:e?n(e.clientHeight):null,scrollWidth:e?n(e.scrollWidth):null,scrollHeight:e?n(e.scrollHeight):null};};" +
            "var classify=function(e){for(var c=e;c;c=c.parentElement){if(c.id==='sf-fs-player')return'fullscreen-player';" +
            "if(c.id==='sf-mobile-nav')return'mobile-navigation';if(c.id==='Desktop_LeftSidebar_Id')return'desktop-sidebar';" +
            "if(c.id==='sf-melodix-home')return'melodix-home';if(c.id==='main-view')return'spotify-main';" +
            "if(c.getAttribute&&c.getAttribute('data-testid')==='now-playing-bar')return'now-playing-bar';" +
            "if(c.id==='global-nav-bar')return'spotify-global-navigation';}return e?'other':'none';};" +
            "var ownerAt=function(e){var r=rect(e);if(!r||r.width<=0||r.height<=0)return'unavailable';" +
            "try{return classify(document.elementFromPoint(r.left+r.width/2,r.top+r.height/2));}catch(_){return'unavailable';}};" +
            "var state=function(name){var nav=document.getElementById('sf-mobile-nav');" +
            "var player=document.querySelector('aside[data-testid=\\\"now-playing-bar\\\"]');" +
            "var home=document.getElementById('sf-melodix-home');var main=document.getElementById('main-view');" +
            "var sidebar=document.getElementById('Desktop_LeftSidebar_Id');var fs=document.getElementById('sf-fs-player');" +
            "var dockRect=rect(nav),playerRect=rect(player),homeRect=rect(home),sidebarRect=rect(sidebar);" +
            "var overlapX=dockRect&&playerRect?Math.max(0,Math.min(dockRect.right,playerRect.right)-Math.max(dockRect.left,playerRect.left)):null;" +
            "var overlapY=dockRect&&playerRect?Math.max(0,Math.min(dockRect.bottom,playerRect.bottom)-Math.max(dockRect.top,playerRect.top)):null;" +
            "var homeOverlapY=homeRect&&playerRect?Math.max(0,Math.min(homeRect.bottom,playerRect.bottom)-Math.max(homeRect.top,playerRect.top)):null;" +
            "var sidebarOverlapX=sidebarRect&&playerRect?Math.max(0,Math.min(sidebarRect.right,playerRect.right)-Math.max(sidebarRect.left,playerRect.left)):null;" +
            "var sidebarOverlapY=sidebarRect&&playerRect?Math.max(0,Math.min(sidebarRect.bottom,playerRect.bottom)-Math.max(sidebarRect.top,playerRect.top)):null;" +
            "var actions=[];if(nav){var buttons=nav.querySelectorAll('[data-sf-mobile-action]');" +
            "for(var i=0;i<buttons.length&&i<3;i++){var b=buttons[i],raw=String(b.getAttribute('data-sf-mobile-action')||'');" +
            "var action=['home','search','library'].indexOf(raw)>=0?raw:'other',r=rect(b),owner=ownerAt(b);" +
            "actions.push({action:action,width:r?r.width:null,height:r?r.height:null,owner:owner,reachable:owner==='mobile-navigation'});}}" +
            "var play=player&&player.querySelector('button[data-testid=\\\"control-button-playpause\\\"]');" +
            "var fullPlay=fs&&fs.querySelector('.sf-fs-play');" +
            "var card=home&&home.querySelector('.sf-melodix-home__card');var playRect=rect(play),fullPlayRect=rect(fullPlay),cardRect=rect(card);" +
            "var visual=window.visualViewport||null;var screen=window.screen||{};var root=document.documentElement;" +
            "var topInset=Number.parseFloat(root&&root.style?root.style.getPropertyValue('--sf-safe-area-top'):'');" +
            "if(!Number.isFinite(topInset))topInset=null;var meta=document.querySelector('meta[name=\\\"viewport\\\"]');" +
            "var fit=!!(meta&&String(meta.getAttribute('content')||'').indexOf('viewport-fit=cover')>=0);" +
            "var horizontal=function(e){return e?Math.max(0,n(e.scrollWidth)-n(e.clientWidth)):null;};" +
            "var vertical=function(e){return e?Math.max(0,n(e.scrollHeight)-n(e.clientHeight)):null;};" +
            "var innerWidth=n(window.innerWidth),innerHeight=n(window.innerHeight);" +
            "var centerOwner='unavailable';try{centerOwner=classify(document.elementFromPoint(innerWidth/2,innerHeight/2));}catch(_){}" +
            "return{name:name,viewport:{innerWidth:innerWidth,innerHeight:innerHeight,screenWidth:n(screen.width),screenHeight:n(screen.height)," +
            "devicePixelRatio:n(window.devicePixelRatio),orientation:screen.orientation&&['portrait-primary','portrait-secondary','landscape-primary','landscape-secondary'].indexOf(screen.orientation.type)>=0?screen.orientation.type:'unknown'," +
            "visualWidth:visual?n(visual.width):null,visualHeight:visual?n(visual.height):null,visualScale:visual?n(visual.scale):null}," +
            "media:{portrait:matchMedia('(orientation: portrait)').matches,coarsePointer:matchMedia('(pointer: coarse)').matches}," +
            "safeArea:{viewportFitCover:fit,topCustomInsetCssPx:topInset,navBottomGapCssPx:dockRect?n(innerHeight-dockRect.bottom):null," +
            "homeBottomGapCssPx:homeRect?n(innerHeight-homeRect.bottom):null," +
            "bottomInsetInferredCssPx:dockRect?n(Math.max(0,dockRect.height-72)):null,playerBottomGapCssPx:playerRect?n(innerHeight-playerRect.bottom):null}," +
            "surfaces:{globalNavigation:surface(document.getElementById('global-nav-bar')),sidebar:surface(sidebar),main:surface(main)," +
            "home:surface(home),mobileNavigation:surface(nav),player:surface(player),fullscreenPlayer:surface(fs)}," +
            "overlap:{dockPlayerHorizontalPx:overlapX,dockPlayerVerticalPx:overlapY,dockPlayerIntersecting:!!(overlapX>0&&overlapY>0)," +
            "homePlayerVerticalPx:homeOverlapY,homePlayerIntersecting:!!(homeOverlapY>0),sidebarPlayerHorizontalPx:sidebarOverlapX," +
            "sidebarPlayerVerticalPx:sidebarOverlapY,sidebarPlayerIntersecting:!!(sidebarOverlapX>0&&sidebarOverlapY>0)}," +
            "hitTargets:{navigation:actions,playPause:{available:!!play,width:playRect?playRect.width:null,height:playRect?playRect.height:null," +
            "owner:ownerAt(play),reachable:ownerAt(play)==='now-playing-bar'},fullscreenPlay:{available:!!fullPlay,width:fullPlayRect?fullPlayRect.width:null," +
            "height:fullPlayRect?fullPlayRect.height:null,owner:ownerAt(fullPlay),reachable:ownerAt(fullPlay)==='fullscreen-player'}," +
            "homeCard:{available:!!card,width:cardRect?cardRect.width:null,height:cardRect?cardRect.height:null," +
            "owner:ownerAt(card),reachable:ownerAt(card)==='melodix-home'},sidebarCenterOwner:ownerAt(sidebar),viewportCenterOwner:centerOwner}," +
            "scroll:{documentHorizontalOverflow:horizontal(root),bodyHorizontalOverflow:horizontal(document.body)," +
            "mainHorizontalOverflow:horizontal(main),mainVerticalOverflow:vertical(main),homeHorizontalOverflow:horizontal(home)," +
            "homeVerticalOverflow:vertical(home),sidebarVerticalOverflow:vertical(sidebar)}};};" +
            "var body=document.body,fs=document.getElementById('sf-fs-player');" +
            "body.className='sf-mobile-shell sf-fullscreen-disabled sf-melodix-home-active';if(fs)fs.style.display='none';" +
            "var compact=state('compact');body.classList.add('sf-library-open');var libraryOpen=state('library-open');" +
            "body.classList.remove('sf-library-open','sf-fullscreen-disabled');body.classList.add('sf-fullscreen-enabled','sf-expanded','sf-fs-open');" +
            "if(fs)fs.style.display='';var expanded=state('expanded');" +
            "return{probe_error:false,fixture_test_only:true,states:[compact,libraryOpen,expanded]};" +
            "}catch(e){var name=String(e&&e.name||'Error');return{probe_error:true,probe_error_type:/^[A-Za-z0-9_$]+$/.test(name)?name.slice(0,48):'Error'};}})()";
    private static final String BROWSER_COMPATIBILITY_PROBE =
            "(function(){try{" +
            "var body=String((document.body&&document.body.innerText)||'').toLowerCase();" +
            "var english=/\\bbrowser\\b.{0,80}\\b(?:not supported|unsupported|not compatible|incompatible|does not support|doesn't support)\\b|\\bunsupported browser\\b|\\bplease (?:update|upgrade) (?:your )?browser\\b/.test(body);" +
            "var french=/\\bnavigateur\\b.{0,80}\\b(?:pas compatible|non compatible|pas pris en charge|non pris en charge|n'est pas pris en charge|n’est pas pris en charge|obsol[eè]te)\\b|\\bmettre à jour (?:votre )?navigateur\\b/.test(body);" +
            "return !!(english||french);" +
            "}catch(e){return null;}})()";
    private static final String JAVASCRIPT_UA_DIAGNOSTIC_PROBE =
            "(function(){try{" +
            "var ua=String(navigator.userAgent||'');" +
            "var versionAfter=function(source,marker){var start=source.indexOf(marker);if(start<0)return '';start+=marker.length;var end=start;while(end<source.length){var c=source.charCodeAt(end);if((c>=48&&c<=57)||c===46)end++;else break;}return source.slice(start,end);};" +
            "var majorOf=function(value){return String(value||'').split('.')[0];};" +
            "var errorType=function(error){var name=String(error&&error.name||'Error');return /^[A-Za-z0-9_$]+$/.test(name)?name.slice(0,48):'Error';};" +
            "var data=navigator.userAgentData||null;var brand='';var brandVersion='';" +
            "if(data&&Array.isArray(data.brands)){for(var i=0;i<data.brands.length;i++){var item=data.brands[i]||{};if(item.brand==='Chromium'||item.brand==='Google Chrome'){brand=String(item.brand);brandVersion=String(item.version||'');if(item.brand==='Google Chrome')break;}}}" +
            "var uaChrome=versionAfter(ua,'Chrome/');var major=majorOf(uaChrome);" +
            "var coherent=!!uaChrome;if(data&&data.brands){coherent=!!(coherent&&brand&&majorOf(brandVersion)===major);}" +
            "var platform=String(data&&data.platform||'');if(['Android','Windows','macOS','Linux','Chrome OS'].indexOf(platform)<0)platform=platform?'other':'unavailable';" +
            "var result={probe_error:false,user_agent_chrome_version:uaChrome,user_agent_android_version:versionAfter(ua,'Android ')," +
            "client_hints_available:!!data,client_hints_platform:platform,client_hints_mobile:data?!!data.mobile:null," +
            "client_hints_brand:brand,client_hints_brand_version:brandVersion,client_hints_full_version:''," +
            "client_hints_full_brand_version:'',client_hints_platform_version:''," +
            "client_hints_high_entropy_supported:!!(data&&typeof data.getHighEntropyValues==='function')," +
            "client_hints_high_entropy_complete:!(data&&typeof data.getHighEntropyValues==='function')," +
            "client_hints_high_entropy_error:false,client_hints_high_entropy_error_type:'',coherent:coherent};" +
            "var publish=function(){try{window.__sfMelodixRuntimeUaProbeV1=JSON.stringify(result);}catch(_){}};publish();" +
            "if(data&&typeof data.getHighEntropyValues==='function'){result.client_hints_high_entropy_complete=false;publish();" +
            "try{data.getHighEntropyValues(['fullVersionList','platformVersion','uaFullVersion']).then(function(values){" +
            "values=values||{};var fullVersion=String(values.uaFullVersion||'');var fullBrandVersion='';" +
            "var fullList=Array.isArray(values.fullVersionList)?values.fullVersionList:[];" +
            "for(var j=0;j<fullList.length;j++){var fullItem=fullList[j]||{};if(fullItem.brand===brand||fullItem.brand==='Google Chrome'||fullItem.brand==='Chromium'){fullBrandVersion=String(fullItem.version||'');if(fullItem.brand===brand)break;}}" +
            "if(!fullVersion)fullVersion=fullBrandVersion;result.client_hints_full_version=fullVersion;" +
            "result.client_hints_full_brand_version=fullBrandVersion;result.client_hints_platform_version=String(values.platformVersion||'');" +
            "if((fullVersion&&majorOf(fullVersion)!==major)||(fullBrandVersion&&majorOf(fullBrandVersion)!==major))result.coherent=false;" +
            "result.client_hints_high_entropy_complete=true;publish();" +
            "}).catch(function(error){result.client_hints_high_entropy_error=true;result.client_hints_high_entropy_error_type=errorType(error);result.client_hints_high_entropy_complete=true;publish();});" +
            "}catch(error){result.client_hints_high_entropy_error=true;result.client_hints_high_entropy_error_type=errorType(error);result.client_hints_high_entropy_complete=true;publish();}}" +
            "return result;}catch(error){var name=String(error&&error.name||'Error');return {probe_error:true,probe_error_type:/^[A-Za-z0-9_$]+$/.test(name)?name.slice(0,48):'Error'};}})()";
    private static final String JAVASCRIPT_UA_RESULT_PROBE =
            "(function(){try{var value=window.__sfMelodixRuntimeUaProbeV1;return value?JSON.parse(value):null;}catch(e){return {probe_error:true};}})()";
    private static final String LIVE_SPOTIFY_CSS_PROBE =
            "(function(){try{" +
            "var host=location.hostname==='open.spotify.com'?'open.spotify.com':location.hostname==='accounts.spotify.com'?'accounts.spotify.com':'other';" +
            "var path=String(location.pathname||'/');var route=path==='/'?'root':(path==='/login'||path.indexOf('/login/')===0)?'login':'other';" +
            "var style=document.getElementById('sf-custom-style');var root=getComputedStyle(document.documentElement);" +
            "var names=['--mel-bg','--mel-bg-2','--mel-surface-light','--mel-surface-light-2','--mel-surface-light-3','--mel-text-mute-a','--mel-text-mute-c','--mel-accent','--mel-accent-wash-11','--mel-home-status-wash','--mel-home-status-stroke','--mel-home-status-error-wash','--mel-home-status-error-stroke'];" +
            "var tokens={};for(var i=0;i<names.length;i++)tokens[names[i]]=String(root.getPropertyValue(names[i])||'').trim();" +
            "var main=document.querySelector('#main-view');var home=document.getElementById('sf-melodix-home');" +
            "var bridge=window.AndBridge||null;" +
            "return {probe_error:false,host:host,route_category:route,style_present:!!style," +
            "style_marker_present:!!(style&&String(style.textContent||'').indexOf('SF_MELODIX_HOME_STYLES_V1')>=0)," +
            "tokens:tokens,home_present:!!home,home_active:!!(document.body&&document.body.classList.contains('sf-melodix-home-active'))," +
            "home_display_flex:!!(home&&getComputedStyle(home).display==='flex'),source_main_present:!!main," +
            "bridge_present:!!bridge,bridge_media_callback:!!(bridge&&typeof bridge.onMediaItemsLoaded==='function')," +
            "bridge_diag_callback:!!(bridge&&typeof bridge.logDiagEvent==='function')};" +
            "}catch(e){var name=String(e&&e.name||'Error');return {probe_error:true,probe_error_type:/^[A-Za-z0-9_$]+$/.test(name)?name.slice(0,48):'Error'};}})()";
    // This runs only in the explicitly marked, isolated renderer fixture. It
    // measures the cascade in Android's installed WebView engine, including
    // the darkest/lightest Home background endpoints and status/error washes.
    private static final String WEB_HOME_COLOR_STATES_PROBE =
            "(function(){try{" +
            "var home=document.getElementById('sf-melodix-home');var main=document.getElementById('main-view');" +
            "if(!home||!main||!window.__sfHomeTest||typeof window.__sfHomeTest.updateMelodixHome!=='function')return {probe_error:true,fixture_test_only:true};" +
            "var parseColor=function(value){var s=String(value||'').trim().toLowerCase();if(s.indexOf('rgb')===0){var a=s.indexOf('(');var b=s.indexOf(')');if(a<0||b<0)return null;var p=s.slice(a+1,b).split(',');if(p.length<3)return null;return [parseFloat(p[0]),parseFloat(p[1]),parseFloat(p[2]),p.length>3?parseFloat(p[3]):1];}" +
            "if(s.charAt(0)==='#'){var h=s.slice(1);if(h.length===3)h=h.charAt(0)+h.charAt(0)+h.charAt(1)+h.charAt(1)+h.charAt(2)+h.charAt(2);if(h.length===6)return [parseInt(h.slice(0,2),16),parseInt(h.slice(2,4),16),parseInt(h.slice(4,6),16),1];}return null;};" +
            "var blend=function(f,b){if(!f||!b)return null;var a=f.length>3?f[3]:1;return [f[0]*a+b[0]*(1-a),f[1]*a+b[1]*(1-a),f[2]*a+b[2]*(1-a),1];};" +
            "var channel=function(v){v=v/255;return v<=0.04045?v/12.92:Math.pow((v+0.055)/1.055,2.4);};" +
            "var luminance=function(c){return 0.2126*channel(c[0])+0.7152*channel(c[1])+0.0722*channel(c[2]);};" +
            "var contrast=function(a,b){var x=luminance(a);var y=luminance(b);return (Math.max(x,y)+0.05)/(Math.min(x,y)+0.05);};" +
            "var saved={html:main.innerHTML,status:window.__sfMediaLibStatus,error:window.__sfMediaLibError,raw:window.__sfMediaLibRawItemCount,homeState:window.__sfNativeUiHomeState,hadLibrary:Object.prototype.hasOwnProperty.call(window,'mediaLib'),library:window.mediaLib};" +
            "var scenarios=[];" +
            "var record=function(label){var h=document.getElementById('sf-melodix-home');var hs=getComputedStyle(h);var base=parseColor(hs.backgroundColor);var root=getComputedStyle(document.documentElement);var wash=parseColor(root.getPropertyValue('--mel-accent-wash-11'));var peak=blend(wash,base)||base;" +
            "var cards=h.querySelectorAll('.sf-melodix-home__card');var status=h.querySelector('.sf-melodix-home__status');var retry=h.querySelector('.sf-melodix-home__retry');var ratios={};var colors={background_base:hs.backgroundColor,background_gradient_peak:peak?'rgb('+peak[0]+', '+peak[1]+', '+peak[2]+')':'',home_text:hs.color,gradient_token:root.getPropertyValue('--mel-accent-wash-11').trim()};" +
            "var add=function(name,color,bgs){var c=parseColor(color);if(!c)return;var values=[];for(var i=0;i<bgs.length;i++)if(bgs[i])values.push(contrast(c,bgs[i]));if(values.length)ratios[name]=Math.min.apply(Math,values);};" +
            "add('home_text',hs.color,[base,peak]);" +
            "var brand=h.querySelector('.sf-melodix-home__brand');var greeting=h.querySelector('.sf-melodix-home__header h1');var section=h.querySelector('.sf-melodix-home__section-title');var title=h.querySelector('.sf-melodix-home__title');var subtitle=h.querySelector('.sf-melodix-home__subtitle');" +
            "if(brand){var bs=getComputedStyle(brand);colors.brand=bs.color;add('brand',bs.color,[base,peak]);}" +
            "if(greeting){var gs=getComputedStyle(greeting);colors.greeting=gs.color;add('greeting',gs.color,[base,peak]);}" +
            "if(section){var ss=getComputedStyle(section);colors.section_title=ss.color;add('section_title',ss.color,[base,peak]);}" +
            "if(title){var ts=getComputedStyle(title);colors.card_title=ts.color;add('card_title',ts.color,[base,peak]);}" +
            "if(subtitle){var us=getComputedStyle(subtitle);colors.card_subtitle=us.color;add('card_subtitle',us.color,[base,peak]);}" +
            "var statusState='none';var statusBackdrops=[base,peak];if(status){statusState=String(status.getAttribute('data-state')||'other');var st=getComputedStyle(status);var statusBase=blend(parseColor(st.backgroundColor),base);var statusPeak=blend(parseColor(st.backgroundColor),peak);statusBackdrops=[statusBase,statusPeak];var statusTitle=status.querySelector('.sf-melodix-home__status-title');var statusBody=status.querySelector('.sf-melodix-home__status-body');colors.status_background=st.backgroundColor;if(statusTitle){var tt=getComputedStyle(statusTitle);colors.status_title=tt.color;add('status_title',tt.color,statusBackdrops);}if(statusBody){var tb=getComputedStyle(statusBody);colors.status_body=tb.color;add('status_body',tb.color,statusBackdrops);}}" +
            "if(retry){var rs=getComputedStyle(retry);var buttonBg=parseColor(rs.backgroundColor);colors.retry_button_text=rs.color;colors.retry_button_background=rs.backgroundColor;add('retry_button_text',rs.color,[buttonBg]);add('retry_button_fill',rs.backgroundColor,statusBackdrops);retry.focus();var fs=getComputedStyle(retry);if(fs.outlineStyle!=='none'&&parseFloat(fs.outlineWidth)>0){var outline=parseColor(fs.outlineColor);if(outline){colors.retry_focus_outline=fs.outlineColor;add('retry_focus_outline',fs.outlineColor,statusBackdrops);}}if(document.activeElement===retry)retry.blur();}" +
            "var keys=Object.keys(ratios);var pass=keys.length>0&&keys.every(function(k){return ratios[k]>=4.5;});" +
            "return {label:label,status_state:statusState,card_count:cards.length,partial_data:cards.length>0&&statusState==='error',home_visible:hs.display==='flex'&&hs.position==='fixed'&&hs.visibility==='visible'&&hs.opacity!=='0'&&getComputedStyle(main).display==='none',background_gradient_present:String(hs.backgroundImage||'').indexOf('radial-gradient')>=0,colors:colors,contrast_ratios:ratios,all_contrast_pass:pass};};" +
            "var setState=function(status,error,raw,homeState){window.__sfMediaLibStatus=status;window.__sfMediaLibError=error;window.__sfMediaLibRawItemCount=raw;window.__sfNativeUiHomeState=homeState;window.mediaLib={};window.__sfHomeTest.updateMelodixHome();};" +
            "try{scenarios.push(record('normal'));main.innerHTML='';setState('loading','',0,'');scenarios.push(record('loading'));setState('ready','',0,'empty');scenarios.push(record('empty'));setState('error','network-error',0,'error');scenarios.push(record('error'));main.innerHTML=saved.html;setState('error','network-error',2,'error');scenarios.push(record('partial'));}" +
            "finally{main.innerHTML=saved.html;window.__sfMediaLibStatus=saved.status;window.__sfMediaLibError=saved.error;window.__sfMediaLibRawItemCount=saved.raw;window.__sfNativeUiHomeState=saved.homeState;if(saved.hadLibrary)window.mediaLib=saved.library;else delete window.mediaLib;try{window.__sfHomeTest.updateMelodixHome();}catch(_){}}" +
            "return {probe_error:false,fixture_test_only:true,theme_mode:'dark',light_theme_available:false,scenarios:scenarios};" +
            "}catch(e){var name=String(e&&e.name||'Error');return {probe_error:true,fixture_test_only:true,probe_error_type:/^[A-Za-z0-9_$]+$/.test(name)?name.slice(0,48):'Error'};}})()";
    private static final String WEB_HOME_RENDERER_VISIBLE_PROBE =
            "(function(){try{" +
            "var h=document.getElementById('sf-melodix-home');" +
            "var m=document.querySelector('#main-view');" +
            "var s=document.getElementById('sf-custom-style');" +
            "var text=String(h&&(h.innerText||h.textContent)||'');" +
            "var rect=h&&h.getBoundingClientRect();" +
            "var brand=h&&h.querySelector('.sf-melodix-home__brand');" +
            "var card=h&&h.querySelector('.sf-melodix-home__card');" +
            "var brandRect=brand&&brand.getBoundingClientRect();" +
            "var cardRect=card&&card.getBoundingClientRect();" +
            "var homeStyle=h&&getComputedStyle(h);" +
            "var mainStyle=m&&getComputedStyle(m);" +
            "return !!(location.hostname==='open.spotify.com'&&location.pathname==='/app'&&" +
            "window.SF_CONFIG&&window.SF_CONFIG.guiMode==='csshack'&&" +
            "window.__sfMelodixHomeInitAttempted===true&&window.__sfMelodixHomeStylesReady===true&&" +
            "document.body.classList.contains('sf-melodix-home-active')&&s&&" +
            "s.textContent.indexOf('SF_MELODIX_HOME_STYLES_V1')>=0&&" +
            "h&&h.querySelectorAll('.sf-melodix-home__card').length===2&&" +
            "text.indexOf('MELODIX')>=0&&text.indexOf('Route fixture playlist')>=0&&" +
            "text.indexOf('Route fixture album')>=0&&homeStyle.display==='flex'&&" +
            "homeStyle.position==='fixed'&&homeStyle.visibility==='visible'&&homeStyle.opacity!=='0'&&" +
            "Number(homeStyle.zIndex)>=1000&&mainStyle.display==='none'&&" +
            "rect.width>0&&rect.height>0&&brandRect.width>0&&brandRect.height>0&&" +
            "cardRect.width>0&&cardRect.height>0);" +
            "}catch(e){return false;}})()";
    private static final String WEB_HOME_RENDERER_DIAGNOSTIC_PROBE =
            "(function(){try{" +
            "var h=document.getElementById('sf-melodix-home');" +
            "var m=document.querySelector('#main-view');" +
            "var s=document.getElementById('sf-custom-style');" +
            "var cards=h?h.querySelectorAll('.sf-melodix-home__card'):[];" +
            "var hs=h&&getComputedStyle(h);" +
            "var ms=m&&getComputedStyle(m);" +
            "var brand=h&&h.querySelector('.sf-melodix-home__brand');" +
            "var card=cards&&cards.length?cards[0]:null;" +
            "var decision=String(window.__sfMelodixHomeDecision||'');" +
            "var rendererStyle=window.__sfMelodixHomeStyleProbeResult||{};" +
            "var rootResourceCount=Math.max(0,Number(window.__sfMelodixHomeRootResourceCount)||0);" +
            "var sourceCardCount=Math.max(0,Number(window.__sfMelodixHomeSourceCardCount)||0);" +
            "var styleProbe=(function(){var b=document.body;var p=h;var created=false;" +
            "var wasActive=!!(b&&b.classList.contains('sf-melodix-home-active'));" +
            "var wasProbe=!!(b&&b.classList.contains('sf-melodix-home-style-probe'));" +
            "var out={completed:false,home_display_flex:false,home_position_fixed:false," +
            "home_visibility_visible:false,home_opacity_nonzero:false,home_z_index_high:false,main_hidden:false};" +
            "try{if(!b||!m)return out;if(!p){p=document.createElement('main');p.id='sf-melodix-home';" +
            "b.appendChild(p);created=true;}b.classList.remove('sf-melodix-home-active');" +
            "b.classList.add('sf-melodix-home-style-probe');var ps=getComputedStyle(p);var ms=getComputedStyle(m);" +
            "out={completed:true,home_display_flex:ps.display==='flex',home_position_fixed:ps.position==='fixed'," +
            "home_visibility_visible:ps.visibility==='visible',home_opacity_nonzero:ps.opacity!=='0'," +
            "home_z_index_high:(parseInt(ps.zIndex||'0',10)||0)>=1000,main_hidden:ms.display==='none'};" +
            "}catch(_){}finally{if(created&&p&&p.parentNode)p.parentNode.removeChild(p);" +
            "if(b){b.classList.remove('sf-melodix-home-style-probe');" +
            "if(wasProbe)b.classList.add('sf-melodix-home-style-probe');" +
            "if(wasActive)b.classList.add('sf-melodix-home-active');}}return out;})();" +
            "return {route_app:location.hostname==='open.spotify.com'&&location.pathname==='/app'," +
            "mode_csshack:!!(window.SF_CONFIG&&window.SF_CONFIG.guiMode==='csshack')," +
            "main_view_present:!!m,raw_anchor_count:Math.min(m?m.querySelectorAll('a[href]').length:0,3)," +
            "root_resource_count:Math.min(rootResourceCount,3),source_card_count:Math.min(sourceCardCount,3)," +
            "root_selector_is_main_view:String(window.__sfMelodixHomeRootSelector||'')==='#main-view'," +
            "styles_ready:window.__sfMelodixHomeStylesReady===true," +
            "decision_rendered_status:decision.indexOf('rendered-status-')===0," +
            "decision_content_root_missing:decision==='content-root-missing'," +
            "decision_styles_not_ready:decision==='styles-not-ready'," +
            "decision_fullscreen_open:decision==='fullscreen-open'," +
            "style_probe_completed:styleProbe.completed," +
            "renderer_style_probe_marker_present:rendererStyle.marker_present===true," +
            "renderer_style_probe_computed_style_available:rendererStyle.computed_style_available===true," +
            "renderer_style_probe_home_display_flex:rendererStyle.home_display_flex===true," +
            "renderer_style_probe_home_position_fixed:rendererStyle.home_position_fixed===true," +
            "renderer_style_probe_home_visibility_visible:rendererStyle.home_visibility_visible===true," +
            "renderer_style_probe_home_opacity_nonzero:rendererStyle.home_opacity_nonzero===true," +
            "renderer_style_probe_home_z_index_high:rendererStyle.home_z_index_high===true," +
            "renderer_style_probe_main_hidden:rendererStyle.main_hidden===true," +
            "renderer_style_probe_error:rendererStyle.probe_error===true," +
            "style_probe_home_display_flex:styleProbe.home_display_flex," +
            "style_probe_home_position_fixed:styleProbe.home_position_fixed," +
            "style_probe_home_visibility_visible:styleProbe.home_visibility_visible," +
            "style_probe_home_opacity_nonzero:styleProbe.home_opacity_nonzero," +
            "style_probe_home_z_index_high:styleProbe.home_z_index_high," +
            "style_probe_main_hidden:styleProbe.main_hidden," +
            "init_attempted:window.__sfMelodixHomeInitAttempted===true," +
            "style_marker_present:!!(s&&String(s.textContent||'').indexOf('SF_MELODIX_HOME_STYLES_V1')>=0)," +
            "active_class:!!(document.body&&document.body.classList.contains('sf-melodix-home-active'))," +
            "home_exists:!!h,home_card_count:Math.min(cards?cards.length:0,3)," +
            "home_display_flex:!!(hs&&hs.display==='flex'),home_position_fixed:!!(hs&&hs.position==='fixed')," +
            "home_visible:!!(hs&&hs.visibility==='visible'&&hs.opacity!=='0')," +
            "source_hidden:!!(ms&&ms.display==='none')," +
            "brand_has_bounds:!!(brand&&brand.getBoundingClientRect().width>0&&brand.getBoundingClientRect().height>0)," +
            "first_card_has_bounds:!!(card&&card.getBoundingClientRect().width>0&&card.getBoundingClientRect().height>0)}" +
            "}catch(e){return {probe_error:true};}})()";

    @Override
    public void onCreate(Bundle arguments) {
        // Android can attach instrumentation to the already-running app
        // without restarting it. This custom Instrumentation must start its
        // own callback thread after onCreate or onStart() never executes.
        Log.i(HARNESS_TAG, "instrumentation_onCreate_entered");
        runnerArguments = arguments == null ? new Bundle() : new Bundle(arguments);
        super.onCreate(arguments);
        Log.i(HARNESS_TAG, "instrumentation_onCreate_returned");
        start();
        Log.i(HARNESS_TAG, "instrumentation_runner_thread_started");
    }

    @Override
    public void onStart() {
        String failurePhase = "instrumentation_start";
        Log.i(HARNESS_TAG, "instrumentation_onStart_entered");
        try {
            super.onStart();
            Log.i(HARNESS_TAG, "instrumentation_onStart_super_returned");
            if ("authenticated-home".equals(runnerArguments.getString("mode"))) {
                failurePhase = "authenticated_home_launch";
                notePhase(failurePhase);
                registerActivityLifecycleObservation();
                try {
                    Activity authenticatedActivity = launchTargetPreservingTask();
                    failurePhase = "authenticated_home_wait";
                    notePhase(failurePhase);
                    runAuthenticatedHomeObservation(authenticatedActivity, runnerArguments);
                } finally {
                    restoreBackKeyObservation();
                    unregisterActivityLifecycleObservation();
                }
                return;
            }
            failurePhase = "launch_target";
            Log.i(HARNESS_TAG, "started");
            notePhase(failurePhase);
            Activity activity = launchTarget();
            failurePhase = "await_webview";
            notePhase(failurePhase);
            WebView webView = awaitStableWebView(activity);
            final String[] originalWebViewUrlHolder = new String[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    originalWebViewUrlHolder[0] = webView.getUrl();
                }
            });
            if (originalWebViewUrlHolder[0] == null) throw new AssertionError("The original WebView URL is unavailable");
            final String originalWebViewUrl = originalWebViewUrlHolder[0];
            failurePhase = "verify_runtime_webview_profile";
            notePhase(failurePhase);
            final Bundle[] runtimeProfile = new Bundle[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    runtimeProfile[0] = inspectRuntimeUserAgent(activity, webView);
                }
            });
            if (runtimeProfile[0] == null) throw new AssertionError("Could not inspect the runtime WebView profile");
            sendStatus(1, runtimeProfile[0]);
            if (!runtimeProfile[0].getBoolean("configured_ua_chrome_major_matches_runtime")) {
                throw new AssertionError("Configured desktop UA does not match the installed WebView Chrome version");
            }

            failurePhase = "browser_compatibility_probe";
            notePhase(failurePhase);
            boolean browserCompatibilityWarning = awaitBooleanProbe(
                    webView, BROWSER_COMPATIBILITY_PROBE, "browser_compatibility_warning_visible");
            if (browserCompatibilityWarning) {
                throw new AssertionError("Spotify displayed a browser compatibility warning on launch");
            }

            failurePhase = "cold_start_native_home_visibility";
            notePhase(failurePhase);
            awaitNativeHomeStatusReady(activity);
            final Bundle[] coldHomeState = new Bundle[1];
            final Throwable[] coldHomeFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        coldHomeState[0] = inspectHomeStatus(activity, webView, originalWebViewUrl);
                        coldHomeState[0].remove("home_status_payload_fixture_non_playlist");
                        coldHomeState[0].putString("phase", "cold_start_native_home_status");
                        coldHomeState[0].putBoolean("cold_start_native_owner_verified", true);
                    } catch (Throwable error) {
                        coldHomeFailure[0] = error;
                    }
                }
            });
            if (coldHomeFailure[0] != null) throw coldHomeFailure[0];
            sendStatus(1, coldHomeState[0]);
            failurePhase = "cold_start_native_home_timeline";
            notePhase(failurePhase);
            captureNativeHomeTimeline(activity, webView, originalWebViewUrl, "cold_home", false);

            failurePhase = "verify_login_surface";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            failurePhase = "login_dom_probe";
            notePhase(failurePhase);
            final boolean loginDomVisible = awaitLoginUiVisible(webView);
            failurePhase = "user_agent_profile_probe";
            notePhase(failurePhase);
            Bundle javascriptProfile = inspectJavascriptUserAgentProfile(webView, runtimeProfile[0]);
            sendStatus(1, javascriptProfile);
            if (!javascriptProfile.getBoolean("javascript_ua_profile_coherent")) {
                throw new AssertionError("JavaScript User-Agent or Client Hints do not match the installed WebView version");
            }

            failurePhase = "login_surface_visibility";
            notePhase(failurePhase);
            final Bundle[] loginState = new Bundle[1];
            final Throwable[] loginFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        loginState[0] = inspectLoginSurface(activity, webView, loginDomVisible);
                    } catch (Throwable error) {
                        loginFailure[0] = unwrapInvocationTarget(error);
                    }
                }
            });
            if (loginFailure[0] != null) throw loginFailure[0];
            final boolean loginSpaExitObserved = verifyLoginSpaExitBeforeHomeFixture(activity);
            loginState[0].putBoolean("login_spa_exit_probe_performed", true);
            loginState[0].putBoolean("login_spa_exit_observed", loginSpaExitObserved);
            sendStatus(1, loginState[0]);

            failurePhase = "live_spotify_css_runtime_probe";
            notePhase(failurePhase);
            Bundle liveCssState = inspectLiveSpotifyCssTheme(webView);
            sendStatus(1, liveCssState);
            boolean cssThemeApplicable = liveCssState.getBoolean("live_webview_css_theme_applicable");
            if (!liveCssState.getBoolean("live_spotify_host_confirmed") ||
                    (cssThemeApplicable && !liveCssState.getBoolean("live_webview_css_tokens_valid")) ||
                    liveCssState.getBoolean("live_webview_home_active")) {
                throw new AssertionError("The existing Spotify WebView had an invalid origin or applicable Home theme tokens, or took over the unauthenticated login surface");
            }

            failurePhase = "empty_home_bridge_dispatch";
            notePhase(failurePhase);
            final Throwable[] dispatchFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchEmptyHomeThroughAndBridge(activity);
                    } catch (Throwable error) {
                        dispatchFailure[0] = error;
                    }
                }
            });
            if (dispatchFailure[0] != null) throw dispatchFailure[0];
            failurePhase = "empty_home_native_error_visibility";
            notePhase(failurePhase);
            awaitNativeHomeErrorReady(activity);

            final Bundle[] fallbackState = new Bundle[1];
            final Throwable[] fallbackFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        fallbackState[0] = inspectEmptyHomeNativeError(activity, webView, originalWebViewUrl);
                    } catch (Throwable error) {
                        fallbackFailure[0] = error;
                    }
                }
            });
            if (fallbackFailure[0] != null) throw fallbackFailure[0];
            sendStatus(1, fallbackState[0]);

            failurePhase = "capture_empty_home_evidence";
            notePhase(failurePhase);
            captureEmptyHomeUiEvidence();
            Log.i(HARNESS_TAG, "empty_home_evidence_captured");
            failurePhase = "empty_home_native_owner_timeline";
            notePhase(failurePhase);
            captureNativeHomeTimeline(activity, webView, originalWebViewUrl, "empty_home", true);

            // Renderer-only fixture: it is an explicit state panel, not a
            // playlist/card or authentication signal. The clean session stays
            // unauthenticated throughout this isolated bridge exercise.
            failurePhase = "home_status_renderer_dispatch";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            final Throwable[] statusDispatchFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchHomeStatusThroughAndBridge(activity);
                    } catch (Throwable error) {
                        statusDispatchFailure[0] = error;
                    }
                }
            });
            if (statusDispatchFailure[0] != null) throw statusDispatchFailure[0];

            failurePhase = "home_status_renderer_visibility";
            notePhase(failurePhase);
            awaitNativeHomeStatusReady(activity);
            failurePhase = "home_status_owner_callback";
            notePhase(failurePhase);
            final Throwable[] ownerCallbackFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchUnprovenHomeOwnerCallback(activity);
                    } catch (Throwable error) {
                        ownerCallbackFailure[0] = error;
                    }
                }
            });
            if (ownerCallbackFailure[0] != null) throw ownerCallbackFailure[0];
            waitForIdleSync();
            Thread.sleep(250L);
            awaitNativeHomeStatusReady(activity);
            final Bundle[] statusState = new Bundle[1];
            final Throwable[] statusFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        statusState[0] = inspectHomeStatus(activity, webView, originalWebViewUrl);
                    } catch (Throwable error) {
                        statusFailure[0] = error;
                    }
                }
            });
            if (statusFailure[0] != null) throw statusFailure[0];
            sendStatus(1, statusState[0]);

            failurePhase = "capture_home_status_evidence";
            notePhase(failurePhase);
            captureHomeStatusUiEvidence();
            Log.i(HARNESS_TAG, "home_status_evidence_captured");

            // Reset the Home fixture, then explicitly request the login surface.
            // Empty or absent Home content is never allowed to reveal Spotify Web.
            failurePhase = "restore_login_after_status";
            notePhase(failurePhase);
            final Throwable[] clearFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchEmptyHomeThroughAndBridge(activity);
                        requestExplicitLoginWebUi(activity);
                    } catch (Throwable error) {
                        clearFailure[0] = error;
                    }
                }
            });
            if (clearFailure[0] != null) throw clearFailure[0];
            waitForIdleSync();
            Thread.sleep(250L);
            boolean loginRestored = awaitLoginUiVisible(webView);
            final Bundle[] restoredState = new Bundle[1];
            final Throwable[] restoredFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        restoredState[0] = inspectLoginSurface(activity, webView, loginRestored);
                    } catch (Throwable error) {
                        restoredFailure[0] = error;
                    }
                }
            });
            if (restoredFailure[0] != null) throw restoredFailure[0];
            requireUnauthenticatedSession(activity);
            final String[] restoredUrl = new String[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    restoredUrl[0] = webView.getUrl();
                }
            });
            if (!loginRestored || !equalsNullable(originalWebViewUrl, restoredUrl[0])) {
                throw new AssertionError("Explicit login action did not preserve the existing login WebView");
            }
            restoredState[0].putBoolean("login_surface_restored_after_status", true);

            // Run the packaged native shell itself in an isolated Spotify-origin
            // WebView. Its JavaScript handoff sends a status-only Home while
            // libraryV3 proof remains absent; measure the native view state after
            // readiness. The preceding owner-callback check separately verifies
            // that a negative Web-Home signal preserves this status-only shell.
            failurePhase = "javascript_native_shell_home_handoff";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            final WebView[] shellFixtureHolder = new WebView[1];
            Bundle javascriptHandoffState = null;
            Throwable shellFixtureFailure = null;
            try {
                failurePhase = "javascript_native_shell_fixture_create";
                notePhase(failurePhase);
                shellFixtureHolder[0] = createNativeUiShellHandoffFixture(activity);
                failurePhase = "javascript_native_shell_asset_install";
                notePhase(failurePhase);
                // The primary WebView remains on the explicit login page. Temporarily
                // release only its UI-owner gate for this synthetic, status-only
                // native-shell handoff; the original URL, WebView and session stay untouched.
                clearLoginOwnerForNativeShellFixture(activity);
                installPackagedNativeUiShell(shellFixtureHolder[0], activity);
                failurePhase = "javascript_native_shell_status_visibility";
                notePhase(failurePhase);
                awaitNativeHomeStatusReady(activity);
                failurePhase = "javascript_native_shell_home_status_inspection";
                notePhase(failurePhase);
                final String shellStateJson = evaluateJavascriptAndWait(shellFixtureHolder[0],
                        "({proofKnown:window.__sfMediaLibSessionProofKnown===true," +
                        "proofProven:window.__sfMediaLibSessionProven===true," +
                        "takeoverProven:window.__sfNativeUiTakeoverProven===true," +
                        "readyNotified:window.__sfNativeUiReadyNotified===true," +
                        "homeStateSent:window.__sfNativeUiHomeStateSent===true," +
                        "homeDataSent:window.__sfNativeUiHomeDataSent===true," +
                        "homeSessionUnproven:window.__sfNativeUiHomeSessionUnproven===true," +
                        "homeState:String(window.__sfNativeUiHomeState||'')," +
                        "homeRows:Number(window.__sfNativeUiHomeRowsCount||0)," +
                        "lastRoute:String(window.__sfNativeUiLastRouteSent||'')," +
                        "hasPrivateLibrary:Object.prototype.hasOwnProperty.call(window,'mediaLib')})");
                final Bundle[] handoffState = new Bundle[1];
                final Throwable[] handoffInspectFailure = new Throwable[1];
                runOnMainSync(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            handoffState[0] = inspectJavascriptHomeHandoff(
                                    activity, webView, originalWebViewUrl, shellStateJson);
                        } catch (Throwable error) {
                            handoffInspectFailure[0] = error;
                        }
                    }
                });
                if (handoffInspectFailure[0] != null) throw handoffInspectFailure[0];
                javascriptHandoffState = handoffState[0];
                sendStatus(1, javascriptHandoffState);
            } catch (Throwable error) {
                shellFixtureFailure = error;
            } finally {
                removeWebHomeRendererFixture(shellFixtureHolder[0]);
            }
            if (shellFixtureFailure != null) throw shellFixtureFailure;
            failurePhase = "restore_login_after_javascript_shell_handoff";
            notePhase(failurePhase);
            final Throwable[] shellClearFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchEmptyHomeThroughAndBridge(activity);
                        requestExplicitLoginWebUi(activity);
                    } catch (Throwable error) {
                        shellClearFailure[0] = error;
                    }
                }
            });
            if (shellClearFailure[0] != null) throw shellClearFailure[0];
            waitForIdleSync();
            Thread.sleep(250L);
            boolean loginRestoredAfterShell = awaitLoginUiVisible(webView);
            final String[] loginUrlAfterShell = new String[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    loginUrlAfterShell[0] = webView.getUrl();
                }
            });
            if (!loginRestoredAfterShell || !equalsNullable(originalWebViewUrl, loginUrlAfterShell[0])) {
                throw new AssertionError("The explicit login action did not preserve the original login WebView");
            }
            restoredState[0].putBoolean("javascript_native_shell_handoff_tested", true);
            restoredState[0].putBoolean("login_surface_restored_after_javascript_shell_handoff", true);

            // Exercise the exact packaged Web Home renderer in Android's
            // installed WebView engine. The fixture is loaded only in a
            // temporary second WebView; the original login WebView, URL,
            // cookies, and clean unauthenticated state remain untouched.
            failurePhase = "web_home_app_route_renderer";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            final WebView[] webHomeFixtureHolder = new WebView[1];
            Bundle webHomeColorState = null;
            Throwable webHomeFixtureFailure = null;
            try {
                failurePhase = "web_home_fixture_create";
                notePhase(failurePhase);
                webHomeFixtureHolder[0] = createWebHomeRendererFixture(activity);
                failurePhase = "web_home_renderer_asset_install";
                notePhase(failurePhase);
                installPackagedWebHomeRenderer(webHomeFixtureHolder[0], activity);
                failurePhase = "web_home_renderer_visibility_probe";
                notePhase(failurePhase);
                awaitWebHomeRendererVisible(webHomeFixtureHolder[0]);

                failurePhase = "web_home_computed_color_contrast_fixture";
                notePhase(failurePhase);
                webHomeColorState = inspectWebHomeColorStates(webHomeFixtureHolder[0]);
                sendStatus(1, webHomeColorState);
                if (!webHomeColorState.getBoolean("web_home_color_probe_validation_passed")) {
                    throw new AssertionError("Web Home computed color/contrast validation failed; see the bounded fixture diagnostics");
                }
                if (!"true".equals(evaluateJavascriptAndWait(
                        webHomeFixtureHolder[0], WEB_HOME_RENDERER_VISIBLE_PROBE))) {
                    throw new AssertionError("Web Home fixture did not return to its original visible card state after contrast probes");
                }

                failurePhase = "web_home_renderer_native_visibility";
                notePhase(failurePhase);
                final Bundle[] webHomeState = new Bundle[1];
                final Throwable[] webHomeInspectFailure = new Throwable[1];
                runOnMainSync(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            webHomeState[0] = inspectWebHomeRenderer(
                                    activity, webHomeFixtureHolder[0], originalWebViewUrl, webView);
                        } catch (Throwable error) {
                            webHomeInspectFailure[0] = error;
                        }
                    }
                });
                if (webHomeInspectFailure[0] != null) throw webHomeInspectFailure[0];
                sendStatus(1, webHomeState[0]);
                failurePhase = "web_home_renderer_evidence_capture";
                notePhase(failurePhase);
                captureWebHomeRendererEvidence();
                restoredState[0].putBoolean("web_home_app_route_renderer_visible", true);
                restoredState[0].putBoolean("web_home_renderer_evidence_captured", true);
                restoredState[0].putBoolean("authenticated_home_test_performed", false);
                Log.i(HARNESS_TAG, "web_home_route_evidence_captured");
            } catch (Throwable error) {
                webHomeFixtureFailure = error;
            } finally {
                removeWebHomeRendererFixture(webHomeFixtureHolder[0]);
            }
            if (webHomeFixtureFailure != null) throw webHomeFixtureFailure;
            failurePhase = "restore_login_after_web_home_fixture";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            boolean loginRestoredAfterFixture = awaitLoginUiVisible(webView);
            final String[] loginUrlAfterFixture = new String[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    loginUrlAfterFixture[0] = webView.getUrl();
                }
            });
            if (!loginRestoredAfterFixture || !equalsNullable(originalWebViewUrl, loginUrlAfterFixture[0])) {
                throw new AssertionError("The isolated /app renderer fixture disturbed the original login WebView");
            }
            restoredState[0].putBoolean("login_surface_restored_after_web_home_fixture", true);

            // Measure the packaged mobile CSS in the installed Android WebView
            // at each requested CSS viewport width. This second fixture has no
            // Spotify account data and remains separate from the primary login
            // WebView, which must stay visible and unchanged throughout.
            failurePhase = "mobile_viewport_layout_matrix";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            Bundle mobileViewportState = runMobileViewportMatrix(activity, webView, originalWebViewUrl);
            sendStatus(1, mobileViewportState);
            restoredState[0].putAll(mobileViewportState);

            failurePhase = "native_route_owner_matrix";
            notePhase(failurePhase);
            requireUnauthenticatedSession(activity);
            Bundle nativeRouteState = verifyNativeRouteOwnerMatrix(activity, webView, originalWebViewUrl);
            sendStatus(1, nativeRouteState);
            restoredState[0].putAll(nativeRouteState);

            Bundle result = new Bundle(restoredState[0]);
            if (webHomeColorState != null) result.putAll(webHomeColorState);
            result.putString("phase", "completed");
            result.putBoolean("empty_home_evidence_captured", true);
            result.putBoolean("home_status_evidence_captured", true);
            result.putBoolean("home_status_payload_fixture_non_playlist", true);
            result.putBoolean("login_surface_restored_after_status", true);
            result.putBoolean("web_home_app_route_renderer_visible", true);
            result.putBoolean("web_home_renderer_evidence_captured", true);
            result.putBoolean("web_home_renderer_fixture_test_only", true);
            result.putBoolean("login_surface_restored_after_web_home_fixture", true);
            result.putBoolean("authenticated_home_test_performed", false);
            result.putString("overall", "passed");
            sendStatus(1, result);
            Log.i(HARNESS_TAG, "completed");
            finish(Activity.RESULT_OK, result);
        } catch (Throwable failure) {
            Throwable reportableFailure = unwrapInvocationTarget(failure);
            Log.e(HARNESS_TAG, "failure phase=" + failurePhase + " type=" + reportableFailure.getClass().getSimpleName());
            Bundle status = new Bundle();
            status.putString("overall", "failed");
            status.putString("failure_phase", failurePhase);
            status.putString("failure_type", reportableFailure.getClass().getSimpleName());
            sendStatus(2, status);
            finish(Activity.RESULT_CANCELED, status);
        }
    }

    private void notePhase(String phase) {
        Log.i(HARNESS_TAG, "phase=" + phase);
    }

    private static Throwable unwrapInvocationTarget(Throwable failure) {
        Throwable current = failure;
        for (int depth = 0; depth < 4 && current instanceof InvocationTargetException; depth++) {
            Throwable target = ((InvocationTargetException) current).getTargetException();
            if (target == null || target == current) break;
            current = target;
        }
        return current;
    }

    private Activity launchTarget() {
        Intent launch = getTargetContext().getPackageManager()
                .getLaunchIntentForPackage(TARGET_PACKAGE);
        if (launch == null) throw new AssertionError("Preview launcher activity missing");
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        Activity activity = startActivitySync(launch);
        if (activity == null) throw new AssertionError("Preview activity did not start");
        return activity;
    }

    // Manual-only observation mode: bring the existing primary Activity forward
    // without clearing its task, then passively observe it. It never navigates,
    // logs in, changes page storage, or creates a secondary WebView.
    private Activity launchTargetPreservingTask() {
        Intent launch = getTargetContext().getPackageManager()
                .getLaunchIntentForPackage(TARGET_PACKAGE);
        if (launch == null) throw new AssertionError("Preview launcher activity missing");
        // MainActivity is singleInstance; NEW_TASK foregrounds that existing
        // instance without clearing its task, history, WebView URL, or storage.
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
        Activity activity = startActivitySync(launch);
        if (activity == null) throw new AssertionError("Preview activity did not become available");
        return activity;
    }

    private long authenticatedHomeTimeoutMs(Bundle arguments) {
        long value = 900000L;
        String raw = arguments == null ? null : arguments.getString("timeout_ms");
        if (raw != null) {
            try {
                value = Long.parseLong(raw);
            } catch (NumberFormatException ignored) {}
        }
        return Math.max(30000L, Math.min(900000L, value));
    }

    private void putTargetBuildIdentity(Bundle state) {
        state.putString("target_package", TARGET_PACKAGE);
        state.putString("target_version_name", "unavailable");
        state.putLong("target_version_code", -1L);
        try {
            PackageInfo info = getTargetContext().getPackageManager()
                    .getPackageInfo(TARGET_PACKAGE, 0);
            if (info.versionName != null) state.putString("target_version_name", info.versionName);
            long versionCode = Build.VERSION.SDK_INT >= 28
                    ? info.getLongVersionCode() : (long) info.versionCode;
            state.putLong("target_version_code", versionCode);
        } catch (Throwable ignored) {}
    }

    private boolean isTargetActivity(Activity activity) {
        return activity != null && TARGET_PACKAGE.equals(activity.getPackageName());
    }

    private void registerActivityLifecycleObservation() {
        Context applicationContext = getTargetContext().getApplicationContext();
        if (!(applicationContext instanceof Application)) {
            throw new AssertionError("Target Application is unavailable for passive lifecycle observation");
        }
        observedApplication = (Application) applicationContext;
        observedApplication.registerActivityLifecycleCallbacks(activityLifecycleObserver);
        activityLifecycleObserverRegistered = true;
    }

    private boolean unregisterActivityLifecycleObservation() {
        Application application = observedApplication;
        if (application == null) return !activityLifecycleObserverRegistered;
        try {
            application.unregisterActivityLifecycleCallbacks(activityLifecycleObserver);
            observedApplication = null;
            activityLifecycleObserverRegistered = false;
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private Activity resumedActivityOr(Activity fallback) {
        Activity current = resumedTargetActivity.get();
        return current != null && !current.isFinishing() ? current : fallback;
    }

    private void installBackKeyObservationOnMain(final Activity activity) {
        if (activity == null || activity.getWindow() == null) return;
        final Window window = activity.getWindow();
        if (observedBackWindow == window && observedBackProxy != null
                && window.getCallback() == observedBackProxy) return;
        if (!restoreBackKeyObservationOnMain()) return;
        final Window.Callback original = window.getCallback();
        if (original == null) return;
        Window.Callback proxy = (Window.Callback) Proxy.newProxyInstance(
                Window.Callback.class.getClassLoader(),
                new Class<?>[] { Window.Callback.class },
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxyObject, Method method, Object[] args) throws Throwable {
                        if ("dispatchKeyEvent".equals(method.getName()) && args != null && args.length > 0
                                && args[0] instanceof KeyEvent) {
                            KeyEvent event = (KeyEvent) args[0];
                            if (event.getKeyCode() == KeyEvent.KEYCODE_BACK
                                    && event.getAction() == KeyEvent.ACTION_UP) {
                                androidBackKeyUpCount += 1;
                            }
                        }
                        try {
                            return method.invoke(original, args);
                        } catch (InvocationTargetException error) {
                            throw error.getCause() == null ? error : error.getCause();
                        }
                    }
                });
        observedBackWindow = window;
        observedBackOriginal = original;
        observedBackProxy = proxy;
        window.setCallback(proxy);
        backKeyObserverInstalled = true;
        backKeyObserverActive = window.getCallback() == proxy;
    }

    private boolean restoreBackKeyObservationOnMain() {
        Window window = observedBackWindow;
        Window.Callback original = observedBackOriginal;
        Window.Callback proxy = observedBackProxy;
        try {
            if (window != null && proxy != null && window.getCallback() == proxy) {
                if (original == null) return false;
                window.setCallback(original);
                if (window.getCallback() == proxy) return false;
            }
        } catch (Throwable ignored) {
            return false;
        }
        observedBackWindow = null;
        observedBackOriginal = null;
        observedBackProxy = null;
        backKeyObserverActive = false;
        return true;
    }

    private boolean restoreBackKeyObservation() {
        final boolean[] restored = new boolean[] { false };
        try {
            runOnMainSync(new Runnable() {
                @Override public void run() {
                    restored[0] = restoreBackKeyObservationOnMain();
                }
            });
        } catch (Throwable ignored) {
            return false;
        }
        return restored[0];
    }

    private String safeRendererDecision(String value) {
        if ("not-run".equals(value) || "rendered".equals(value) || "rendered-partial".equals(value)
                || "updated".equals(value) || "visible".equals(value) || "renderer-inactive".equals(value)
                || "body-missing".equals(value) || "route-not-home".equals(value)
                || "gui-mode-unsupported".equals(value) || "fullscreen-open".equals(value)
                || "styles-not-ready".equals(value)
                || "activation-visibility-check-failed".equals(value)
                || "home-root-missing".equals(value) || "initialization-error".equals(value)) return value;
        if (value != null && (value.matches("status-visible-(loading|empty|error|partial|ready)"
                + "|rendered-status-(loading|empty|error|unavailable)"))) return value;
        return "other";
    }

    private void runAuthenticatedHomeObservation(Activity activity, Bundle arguments) throws Exception {
        Bundle waiting = new Bundle();
        waiting.putString("phase", "authenticated_home_wait");
        waiting.putString("overall", "waiting_for_manual_home_and_real_playlist");
        waiting.putString("next_action", "sign_in_normally_and_navigate_manually; no action is automated");
        waiting.putBoolean("fixture_test_only", false);
        waiting.putBoolean("manual_auth_or_navigation_is_automated", false);
        waiting.putBoolean("authenticated_home_test_performed", false);
        waiting.putBoolean("activity_lifecycle_observer_registered", activityLifecycleObserverRegistered);
        waiting.putBoolean("process_restart_requires_a_new_observation_run", true);
        putTargetBuildIdentity(waiting);
        sendStatus(1, waiting);

        awaitStableWebView(activity);
        long observationTimeoutMs = authenticatedHomeTimeoutMs(arguments);
        long deadline = System.currentTimeMillis() + observationTimeoutMs;
        String previousScreen = null;
        String lastStatusSignature = "";
        ArrayList<String> routeSequence = new ArrayList<>();
        boolean homeToSearch = false;
        boolean searchToHome = false;
        boolean homeToLibrary = false;
        boolean libraryToHome = false;
        boolean androidBackReturnToHome = false;
        boolean authenticatedHomeObserved = false;
        String firstHomeDefectiveCondition = "not_observed";
        boolean backEventSincePreviousRoute = false;
        boolean backgroundResumeObserved = false;
        boolean activityRecreatedObserved = false;
        boolean navigationMutationObserved = false;
        int lastBackCount = androidBackKeyUpCount;
        int sampleCount = 0;
        JSONObject lastProbe = null;
        Bundle lastState = null;

        while (System.currentTimeMillis() < deadline) {
            Activity currentActivity = resumedActivityOr(activity);
            final Activity sampleActivity = currentActivity;
            final WebView[] currentWebView = new WebView[1];
            final boolean[] foreground = new boolean[1];
            runOnMainSync(new Runnable() {
                @Override public void run() {
                    currentWebView[0] = findWebView(sampleActivity);
                    Window window = sampleActivity.getWindow();
                    View decor = window == null ? null : window.getDecorView();
                    boolean windowFocused = window != null && sampleActivity.hasWindowFocus();
                    boolean decorVisible = decor != null && decor.isShown();
                    foreground[0] = windowFocused && decorVisible && !sampleActivity.isFinishing();
                    if (foreground[0]) installBackKeyObservationOnMain(sampleActivity);
                }
            });

            JSONObject probe = null;
            if (foreground[0] && currentWebView[0] != null) {
                try {
                    probe = new JSONObject(evaluateJavascriptAndWait(
                            currentWebView[0], AUTHENTICATED_HOME_PROBE));
                } catch (InterruptedException interrupted) {
                    throw interrupted;
                } catch (Throwable error) {
                    probe = new JSONObject();
                    probe.put("probe_error", true);
                    String name = String.valueOf(error.getClass().getSimpleName());
                    probe.put("probe_error_type", name.matches("[A-Za-z0-9_$]+") ? name : "Error");
                }
            }
            if (probe != null) lastProbe = probe;
            sampleCount += 1;

            String host = probe == null ? "other" : safeHomeHost(probe.optString("host_category", "other"));
            boolean privateContentObserved = probe != null && !probe.optBoolean("probe_error", true)
                    && probe.optBoolean("real_library_playlist_observed");
            String webRoute = probe == null ? "other" : safeHomeRoute(probe.optString("route_category", "other"));
            String nativeRoute = probe == null ? "other" : safeNativeRoute(probe.optString("native_route", "other"));
            // Navigation coverage follows the primary WebView's recognized
            // URL route, not a possibly stale native bridge route flag.
            String screen = webRoute;
            boolean validSpotifyPage = "open.spotify.com".equals(host)
                    && probe != null && !probe.optBoolean("probe_error", true);
            boolean realPlaylistObserved = privateContentObserved;
            if (validSpotifyPage && realPlaylistObserved && routeSequence.size() < MAX_OBSERVED_ROUTES
                    && (routeSequence.isEmpty() || !routeSequence.get(routeSequence.size() - 1).equals(screen))) {
                routeSequence.add(screen);
            }
            if (androidBackKeyUpCount > lastBackCount) backEventSincePreviousRoute = true;
            if (validSpotifyPage && realPlaylistObserved && previousScreen != null
                    && !previousScreen.equals(screen)) {
                if ("home".equals(previousScreen) && "search".equals(screen)) homeToSearch = true;
                if ("search".equals(previousScreen) && "home".equals(screen)) searchToHome = true;
                if ("home".equals(previousScreen) && "library".equals(screen)) homeToLibrary = true;
                if ("library".equals(previousScreen) && "home".equals(screen)) libraryToHome = true;
                if ("home".equals(screen) && !"home".equals(previousScreen)
                        && backEventSincePreviousRoute) {
                    androidBackReturnToHome = true;
                    backEventSincePreviousRoute = false;
                }
                navigationMutationObserved = true;
            }
            if (validSpotifyPage && probe.optBoolean("home_route") && realPlaylistObserved) {
                authenticatedHomeObserved = true;
            }
            if (targetActivityResumedAfterBackground) backgroundResumeObserved = true;
            if (targetActivityRecreated) activityRecreatedObserved = true;
            lastBackCount = androidBackKeyUpCount;
            if (validSpotifyPage && realPlaylistObserved) previousScreen = screen;

            if (probe != null) {
                lastState = inspectAuthenticatedHome(sampleActivity, currentWebView[0], probe);
            } else {
                lastState = inspectAuthenticatedHome(sampleActivity, currentWebView[0], new JSONObject());
            }
            lastState.putString("phase", authenticatedHomeObserved
                    ? "authenticated_home_observation" : "authenticated_home_wait");
            lastState.putString("overall", authenticatedHomeObserved
                    ? "authenticated_home_observed_navigation_in_progress"
                    : "waiting_for_manual_session_home_and_real_playlist");
            lastState.putBoolean("authenticated_home_test_performed", authenticatedHomeObserved);
            lastState.putBoolean("authenticated_home_requires_real_playlist", true);
            lastState.putBoolean("real_library_playlist_observed", realPlaylistObserved);
            lastState.putBoolean("manual_auth_or_navigation_is_automated", false);
            lastState.putBoolean("fixture_test_only", false);
            lastState.putBoolean("activity_foreground", foreground[0]);
            lastState.putBoolean("activity_lifecycle_observer_registered", activityLifecycleObserverRegistered);
            lastState.putBoolean("window_callback_observer_active", backKeyObserverActive);
            lastState.putBoolean("target_activity_resumed_callback_seen", targetActivityResumed);
            lastState.putBoolean("activity_resumed_after_background", backgroundResumeObserved);
            lastState.putBoolean("activity_recreated_during_observation", activityRecreatedObserved);
            lastState.putBoolean("process_restart_requires_a_new_observation_run", true);
            lastState.putBoolean("home_to_search_observed", homeToSearch);
            lastState.putBoolean("search_to_home_observed", searchToHome);
            lastState.putBoolean("home_to_library_observed", homeToLibrary);
            lastState.putBoolean("library_to_home_observed", libraryToHome);
            lastState.putBoolean("android_back_key_seen", androidBackKeyUpCount > 0);
            lastState.putBoolean("android_back_return_to_home_observed", androidBackReturnToHome);
            lastState.putBoolean("navigation_mutation_observed", navigationMutationObserved);
            lastState.putInt("android_back_key_up_count", Math.max(0, Math.min(999, androidBackKeyUpCount)));
            lastState.putInt("target_activity_create_count", Math.max(0, Math.min(99, targetActivityCreateCount)));
            lastState.putInt("target_activity_resume_count", Math.max(0, Math.min(999, targetActivityResumeCount)));
            lastState.putInt("target_activity_pause_count", Math.max(0, Math.min(999, targetActivityPauseCount)));
            lastState.putInt("target_activity_stop_count", Math.max(0, Math.min(999, targetActivityStopCount)));
            lastState.putInt("target_activity_destroy_count", Math.max(0, Math.min(999, targetActivityDestroyCount)));
            lastState.putInt("probe_sample_count_capped", Math.max(0, Math.min(9999, sampleCount)));
            lastState.putString("observed_route_sequence", routeSequence.isEmpty()
                    ? "none" : joinSafeRoutes(routeSequence));
            lastState.putBoolean("process_restart_observed", false);
            String currentDefectiveCondition = validSpotifyPage && realPlaylistObserved
                    && probe.optBoolean("home_route") && foreground[0]
                    ? firstDefectiveCondition(probe, lastState) : "not_applicable_current_sample";
            if ("not_observed".equals(firstHomeDefectiveCondition)
                    && validSpotifyPage && realPlaylistObserved && probe.optBoolean("home_route") && foreground[0]) {
                firstHomeDefectiveCondition = currentDefectiveCondition;
            }
            lastState.putString("current_defective_condition", currentDefectiveCondition);
            lastState.putString("first_home_defective_condition", firstHomeDefectiveCondition);
            lastState.putString("first_defective_condition", "not_observed".equals(firstHomeDefectiveCondition)
                    ? firstDefectiveCondition(lastProbe, lastState) : firstHomeDefectiveCondition);
            String signature = observationStatusSignature(lastState);
            if (!signature.equals(lastStatusSignature)) {
                sendStatus(1, lastState);
                lastStatusSignature = signature;
            }
            waitForIdleSync();
            Thread.sleep(AUTHENTICATED_OBSERVATION_POLL_MS);
        }

        boolean transitionCoverage = homeToSearch && searchToHome && homeToLibrary && libraryToHome
                && androidBackReturnToHome && backgroundResumeObserved;
        boolean callbackWasInstalled = backKeyObserverInstalled;
        boolean callbackRestored = restoreBackKeyObservation();
        boolean lifecycleObserverWasRegistered = activityLifecycleObserverRegistered;
        boolean lifecycleObserverUnregistered = unregisterActivityLifecycleObservation();
        Bundle finalState = lastState == null ? new Bundle() : new Bundle(lastState);
        finalState.putString("phase", "authenticated_home_observation_complete");
        finalState.putString("overall", authenticatedHomeObserved
                ? transitionCoverage ? "home_content_observation_complete"
                : "home_content_observed_navigation_incomplete"
                : "blocked_no_home_content_observed");
        finalState.putBoolean("authenticated_home_test_performed", authenticatedHomeObserved);
        finalState.putBoolean("authenticated_home_requires_real_playlist", true);
        finalState.putBoolean("real_library_playlist_observed", authenticatedHomeObserved);
        finalState.putBoolean("navigation_coverage_complete", transitionCoverage);
        finalState.putBoolean("app_process_restart_verified", false);
        finalState.putBoolean("process_restart_requires_a_new_observation_run", true);
        finalState.putBoolean("manual_auth_or_navigation_is_automated", false);
        finalState.putBoolean("observation_deadline_reached", true);
        finalState.putLong("observation_timeout_ms_capped", observationTimeoutMs);
        finalState.putBoolean("activity_lifecycle_observer_registered", lifecycleObserverWasRegistered);
        finalState.putBoolean("activity_lifecycle_observer_unregistered", lifecycleObserverUnregistered);
        finalState.putBoolean("window_callback_observer_installed", callbackWasInstalled);
        finalState.putBoolean("window_callback_observer_restored", callbackRestored);
        finalState.putBoolean("window_callback_observer_active", backKeyObserverActive);
        finalState.putString("first_defective_condition", "not_observed".equals(firstHomeDefectiveCondition)
                ? firstDefectiveCondition(lastProbe, finalState) : firstHomeDefectiveCondition);
        finalState.putString("first_home_defective_condition", firstHomeDefectiveCondition);
        if (!authenticatedHomeObserved) {
            finalState.putString("first_failure_stage", "authenticated_home_wait");
            if (lastProbe != null && !lastProbe.optBoolean("probe_error", true)) {
                finalState.putString("last_host_category", safeHomeHost(lastProbe.optString("host_category", "other")));
                finalState.putString("last_route_category", safeHomeRoute(lastProbe.optString("route_category", "other")));
            }
        }
        sendStatus(authenticatedHomeObserved ? 1 : 2, finalState);
        Log.i(HARNESS_TAG, authenticatedHomeObserved
                ? "home_content_observation_complete" : "home_content_not_observed");
        finish(authenticatedHomeObserved ? Activity.RESULT_OK : Activity.RESULT_CANCELED, finalState);
    }

    private String joinSafeRoutes(ArrayList<String> routes) {
        StringBuilder result = new StringBuilder();
        for (String route : routes) {
            if (result.length() > 0) result.append(',');
            result.append(safeNativeRoute(route));
        }
        return result.toString();
    }

    private String observationStatusSignature(Bundle state) {
        String[] keys = {
                "activity_foreground", "home_route", "final_screen_owner", "first_defective_condition",
                "home_to_search_observed", "search_to_home_observed",
                "home_to_library_observed", "library_to_home_observed", "android_back_key_seen",
                "android_back_return_to_home_observed", "activity_resumed_after_background",
                "activity_recreated_during_observation", "renderer_decision", "library_status",
                "library_error", "library_fetch_diagnostic_available", "library_fetch_phase",
                "library_fetch_http_status", "library_fetch_mime", "library_fetch_duration_ms",
                "library_fetch_error", "real_library_playlist_observed",
                "native_route",
                "native_route_callback_returned", "native_home_data_callback_returned",
                "native_home_state_callback_returned", "native_ready_callback_returned",
                "hscroll_visible", "webview_container_visible", "primary_webview_visible",
                "native_root_visible", "splash_visible", "progress_bar_visible",
                "primary_webview_width_px", "primary_webview_height_px", "native_root_width_px",
                "native_root_height_px", "splash_overlay_width_px", "splash_overlay_height_px"
        };
        StringBuilder signature = new StringBuilder();
        for (String key : keys) {
            signature.append(key).append('=').append(String.valueOf(state.get(key))).append('|');
        }
        return signature.toString();
    }

    private String firstDefectiveCondition(JSONObject probe, Bundle state) {
        if (probe == null || probe.optBoolean("probe_error", true)) return "web_probe_not_completed";
        if (!state.getBoolean("activity_foreground")) return "target_activity_not_foreground";
        if (!state.getBoolean("primary_webview_present")) return "primary_webview_not_found";
        if (!"open.spotify.com".equals(probe.optString("host_category", "other"))) {
            return "spotify_player_origin_not_loaded";
        }
        if (!probe.optBoolean("home_route")) return "home_route_not_reached";
        if (!probe.optBoolean("real_library_playlist_observed")) return "home_content_not_observed";
        if (!probe.optBoolean("bridge_started")) return "bridge_not_started";
        boolean routeAvailable = probe.optBoolean("bridge_route_callback_available");
        boolean dataAvailable = probe.optBoolean("bridge_data_callback_available");
        boolean readyAvailable = probe.optBoolean("bridge_ready_callback_available");
        if (!routeAvailable || !dataAvailable || !readyAvailable) return "bridge_callbacks_unavailable";
        String decision = safeRendererDecision(probe.optString("renderer_decision", "not-run"));
        if ("styles-not-ready".equals(decision)) return "renderer_styles_not_ready";
        if ("route-not-home".equals(decision)) return "renderer_home_route_gate_blocked";
        if ("activation-visibility-check-failed".equals(decision)) return "renderer_visibility_check_failed";
        if ("gui-mode-unsupported".equals(decision)) return "renderer_gui_mode_unsupported";
        if ("fullscreen-open".equals(decision)) return "renderer_fullscreen_gate_blocked";
        if ("body-missing".equals(decision)) return "renderer_document_body_missing";
        if ("home-root-missing".equals(decision)) return "renderer_home_root_missing";
        if ("initialization-error".equals(decision)) return "renderer_initialization_error";
        if ("other".equals(decision)) return "renderer_decision_unrecognized";
        String owner = state.getString("final_screen_owner", "unknown");
        if ("splash".equals(owner)) return "splash_overlay_still_owns_screen";
        if ("native-shell".equals(owner)) return "native_home_content_not_ready";
        if ("native-home".equals(owner)) {
            if (!probe.optBoolean("native_route_callback_returned")) return "native_route_callback_not_returned";
            if (!probe.optBoolean("native_home_data_callback_returned")
                    && !probe.optBoolean("native_home_state_callback_returned")) {
                return "native_home_content_callback_not_returned";
            }
            if (!probe.optBoolean("native_ready_callback_returned")) return "native_ready_callback_not_returned";
            return "none_observed";
        }
        if ("melodix-web-home".equals(owner)) {
            return probe.optBoolean("sf_melodix_home_visible") ? "none_observed" : "web_home_root_not_visible";
        }
        if ("spotify-web".equals(owner)) {
            if (probe.optBoolean("sf_melodix_home_present")
                    && !probe.optBoolean("sf_melodix_home_visible")) return "web_home_root_not_visible";
            if ("not-run".equals(decision)) return "web_home_renderer_not_started";
            if (!probe.optBoolean("native_route_callback_returned")) {
                return "native_route_callback_not_returned";
            }
            if (!probe.optBoolean("native_home_data_callback_returned")
                    && !probe.optBoolean("native_home_state_callback_returned")) {
                return "native_home_data_callback_not_returned";
            }
            if (!probe.optBoolean("native_ready_callback_returned")) {
                return "native_ready_callback_not_returned";
            }
            return "spotify_home_still_owns_webview";
        }
        if ("webview-shell".equals(owner)) return "primary_webview_not_visible";
        if ("unknown".equals(owner)) return "no_visible_screen_owner";
        if ("other".equals(owner)) return "visible_owner_not_classified";
        return "none_observed";
    }

    private Bundle inspectAuthenticatedHome(final Activity activity, final WebView webView,
            final JSONObject probe) throws Exception {
        final Bundle[] state = new Bundle[1];
        final Throwable[] failure = new Throwable[1];
        runOnMainSync(new Runnable() {
            @Override public void run() {
                try {
                    state[0] = inspectAuthenticatedHomeOnMain(activity, webView, probe);
                } catch (Throwable error) {
                    failure[0] = error;
                }
            }
        });
        if (failure[0] instanceof Exception) throw (Exception) failure[0];
        if (failure[0] instanceof Error) throw (Error) failure[0];
        if (state[0] == null) throw new AssertionError("Authenticated Home surface probe returned no state");
        return state[0];
    }

    private Bundle inspectAuthenticatedHomeOnMain(Activity activity, WebView webView, JSONObject probe)
            throws Exception {
        ViewGroup mainRoot = (ViewGroup) optionalView(activity, "main");
        View hScroll = optionalView(activity, "hScrollView");
        View webContainer = optionalView(activity, "webViewContainer");
        View nativeRoot = optionalView(activity, "nativeRoot");
        View nativeContent = optionalView(activity, "nativeContent");
        View splash = optionalView(activity, "splashOverlay");
        View progress = optionalView(activity, "progressBar");
        WebView primaryWebView = webView != null ? webView : findWebView(activity);
        Window window = activity.getWindow();
        View decor = window == null ? null : window.getDecorView();
        boolean activityWindowFocus = window != null && activity.hasWindowFocus();
        boolean activityForeground = activityWindowFocus && decor != null && decor.isShown()
                && !activity.isFinishing() && !activity.isDestroyed();
        boolean nativeContentReady = readBooleanSafely(activity, "nativeHomeContentReady");
        boolean nativeCardsAttached = readBooleanSafely(activity, "nativeHomeCardsAttached");
        boolean nativeStatusAttached = readBooleanSafely(activity, "nativeHomeStatusAttached");
        int screenWidth = mainRoot == null ? 0 : mainRoot.getWidth();
        int screenHeight = mainRoot == null ? 0 : mainRoot.getHeight();
        String frontmost = frontmostFullscreenSurface(hScroll, nativeRoot, splash, mainRoot,
                screenWidth, screenHeight);
        boolean webViewVisible = isActuallyVisible(primaryWebView) && isActuallyVisible(webContainer)
                && isActuallyVisible(hScroll);
        String pageOwner = safeWebPageOwner(probe.optString("webview_page_owner", "web-unknown"));
        String finalOwner;
        if ("splash_overlay".equals(frontmost)) {
            finalOwner = "splash";
        } else if ("native_root".equals(frontmost)) {
            finalOwner = nativeContentReady && (nativeCardsAttached || nativeStatusAttached)
                    ? "native-home" : "native-shell";
        } else if ("hscroll".equals(frontmost) && webViewVisible) {
            finalOwner = pageOwner;
        } else if ("hscroll".equals(frontmost)) {
            finalOwner = "webview-shell";
        } else {
            finalOwner = "unknown";
        }

        Bundle state = new Bundle();
        state.putString("phase", "authenticated_home_observation");
        state.putString("overall", "authenticated_home_observed");
        state.putBoolean("fixture_test_only", false);
        state.putBoolean("authenticated_home_test_performed",
                probe.optBoolean("home_route") && probe.optBoolean("real_library_playlist_observed"));
        state.putBoolean("authenticated_home_requires_real_playlist", true);
        state.putBoolean("real_library_playlist_observed",
                probe.optBoolean("real_library_playlist_observed"));
        state.putBoolean("activity_foreground", activityForeground);
        state.putBoolean("activity_window_focus", activityWindowFocus);
        state.putBoolean("activity_lifecycle_resumed", targetActivityResumed);
        state.putBoolean("activity_lifecycle_resumed_callback_seen", targetActivityResumeCount > 0);
        state.putString("activity_component", isTargetActivity(activity) ? "com.melodix.music.MainActivity" : "other");
        state.putBoolean("primary_webview_present", primaryWebView != null);
        state.putBoolean("primary_webview_visible", webViewVisible);
        state.putInt("primary_webview_load_progress", primaryWebView == null ? -1 : primaryWebView.getProgress());
        putTargetBuildIdentity(state);
        state.putInt("android_api_level", Build.VERSION.SDK_INT);
        state.putString("host_category", safeHomeHost(probe.optString("host_category", "other")));
        state.putString("route_category", safeHomeRoute(probe.optString("route_category", "other")));
        state.putBoolean("home_route", probe.optBoolean("home_route"));
        boolean fetchDiagnosticAvailable = probe.optBoolean("library_fetch_diagnostic_available");
        String fetchPhase = safeLibraryFetchPhase(probe.optString("library_fetch_phase", "unknown"));
        int fetchHttpStatus = safeBoundedDiagnosticInt(probe, "library_fetch_http_status", -1, -1, 599);
        String fetchMime = safeLibraryFetchMime(probe.optString("library_fetch_mime", "unknown"));
        int fetchDurationMs = safeBoundedDiagnosticInt(probe, "library_fetch_duration_ms", -1, -1, 999999);
        String fetchError = safeLibraryFetchError(probe.optString("library_fetch_error", "unavailable"),
                fetchDiagnosticAvailable, fetchPhase, fetchHttpStatus);
        state.putString("library_status", safeLibraryStatus(probe.optString("library_status", "other")));
        state.putString("library_error", safeLibraryErrorWithFetchEvidence(
                probe.optString("library_error", "other"), fetchDiagnosticAvailable,
                fetchPhase, fetchHttpStatus, fetchError));
        state.putBoolean("library_fetch_diagnostic_available", fetchDiagnosticAvailable);
        state.putString("library_fetch_phase", fetchPhase);
        state.putInt("library_fetch_http_status", fetchHttpStatus);
        state.putString("library_fetch_mime", fetchMime);
        state.putInt("library_fetch_duration_ms", fetchDurationMs);
        state.putString("library_fetch_error", fetchError);
        state.putBoolean("real_library_playlist_observed",
                probe.optBoolean("real_library_playlist_observed"));
        state.putString("renderer_decision", safeRendererDecision(probe.optString("renderer_decision", "not-run")));
        state.putBoolean("sf_melodix_home_present", probe.optBoolean("sf_melodix_home_present"));
        state.putBoolean("sf_melodix_home_visible", probe.optBoolean("sf_melodix_home_visible"));
        JSONObject homeRect = probe.optJSONObject("sf_melodix_home_rect");
        if (homeRect != null) {
            state.putInt("sf_melodix_home_width_css_px", Math.max(0, Math.min(10000, homeRect.optInt("width"))));
            state.putInt("sf_melodix_home_height_css_px", Math.max(0, Math.min(10000, homeRect.optInt("height"))));
        }
        state.putBoolean("main_view_id_present", probe.optBoolean("main_view_id_present"));
        state.putBoolean("main_view_visible", probe.optBoolean("main_view_visible"));
        state.putBoolean("home_active_class", probe.optBoolean("home_active_class"));
        state.putBoolean("native_root_visible", isActuallyVisible(nativeRoot));
        state.putBoolean("native_home_content_ready", nativeContentReady);
        state.putBoolean("native_home_cards_attached", nativeCardsAttached);
        state.putBoolean("native_home_status_attached", nativeStatusAttached);
        state.putBoolean("splash_visible", isActuallyVisible(splash));
        state.putBoolean("progress_bar_visible", isActuallyVisible(progress));
        state.putBoolean("webview_container_visible", isActuallyVisible(webContainer));
        state.putBoolean("hscroll_visible", isActuallyVisible(hScroll));
        state.putString("runtime_frontmost_fullscreen_surface", frontmost);
        state.putString("final_screen_owner", finalOwner);
        state.putString("owner_determination", "runtime_visibility_alpha_geometry_z_and_sibling_draw_order");
        state.putString("native_route", safeNativeRoute(probe.optString("native_route", "other")));
        state.putBoolean("native_route_callback_returned", probe.optBoolean("native_route_callback_returned"));
        state.putBoolean("native_home_data_callback_returned",
                probe.optBoolean("native_home_data_callback_returned"));
        state.putBoolean("native_home_state_callback_returned",
                probe.optBoolean("native_home_state_callback_returned"));
        state.putBoolean("native_ready_callback_returned", probe.optBoolean("native_ready_callback_returned"));
        state.putBoolean("bridge_started", probe.optBoolean("bridge_started"));
        state.putBoolean("bridge_route_callback_available", probe.optBoolean("bridge_route_callback_available"));
        state.putBoolean("bridge_data_callback_available", probe.optBoolean("bridge_data_callback_available"));
        state.putBoolean("bridge_ready_callback_available", probe.optBoolean("bridge_ready_callback_available"));
        state.putBoolean("primary_webview_melodix_home_is_visible_owner", "melodix-web-home".equals(finalOwner));
        state.putBoolean("manual_auth_or_navigation_is_automated", false);
        state.putBoolean("process_restart_observed", false);
        state.putBoolean("process_restart_requires_a_new_observation_run", true);
        if (primaryWebView != null) measureSurface(state, "primary_webview", primaryWebView, mainRoot, screenWidth, screenHeight);
        measureSurface(state, "hscroll", hScroll, mainRoot, screenWidth, screenHeight);
        measureSurface(state, "webview_container", webContainer, mainRoot, screenWidth, screenHeight);
        measureSurface(state, "native_root", nativeRoot, mainRoot, screenWidth, screenHeight);
        measureSurface(state, "splash_overlay", splash, mainRoot, screenWidth, screenHeight);
        measureSurface(state, "progress_bar", progress, mainRoot, screenWidth, screenHeight);
        return state;
    }

    private boolean readBooleanSafely(Activity activity, String name) {
        try {
            return readBooleanField(activity, name);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private boolean isActuallyVisible(View view) {
        return view != null && view.getVisibility() == View.VISIBLE && view.isShown()
                && view.getAlpha() > 0f && view.getWidth() > 0 && view.getHeight() > 0
                && visibleBounds(view) != null;
    }

    private View optionalView(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", TARGET_PACKAGE);
        return id == 0 ? null : activity.findViewById(id);
    }

    private Rect measureSurface(Bundle state, String prefix, View view, ViewGroup mainRoot,
            int screenWidth, int screenHeight) {
        if (view == null) {
            if (state != null) {
                state.putBoolean(prefix + "_present", false);
                state.putString(prefix + "_visibility", "missing");
                state.putBoolean(prefix + "_shown", false);
                state.putBoolean(prefix + "_globally_visible", false);
            }
            return null;
        }
        int visibility = view.getVisibility();
        String visibilityName = visibility == View.VISIBLE ? "visible"
                : visibility == View.INVISIBLE ? "invisible" : visibility == View.GONE ? "gone" : "other";
        int[] screenPosition = new int[2];
        view.getLocationOnScreen(screenPosition);
        Rect globalBounds = new Rect();
        boolean globallyVisible = view.getGlobalVisibleRect(globalBounds)
                && globalBounds.width() > 0 && globalBounds.height() > 0;
        float effectiveAlpha = 1f;
        View current = view;
        while (current != null) {
            effectiveAlpha *= Math.max(0f, Math.min(1f, current.getAlpha()));
            if (!(current.getParent() instanceof View)) break;
            current = (View) current.getParent();
        }
        ViewGroup parent = view.getParent() instanceof ViewGroup ? (ViewGroup) view.getParent() : null;
        int parentIndex = parent == null ? -1 : parent.indexOfChild(view);
        int siblingCount = parent == null ? 0 : parent.getChildCount();
        View rootDrawingChild = view;
        while (mainRoot != null && rootDrawingChild.getParent() instanceof View
                && rootDrawingChild.getParent() != mainRoot) {
            rootDrawingChild = (View) rootDrawingChild.getParent();
        }
        int rootDrawingIndex = mainRoot == null ? -1 : mainRoot.indexOfChild(rootDrawingChild);
        float visibleRatio = screenWidth <= 0 || screenHeight <= 0 ? 0f
                : Math.min(1f, (float) (Math.max(0, globalBounds.width()) * (long) Math.max(0, globalBounds.height()))
                        / (float) (screenWidth * (long) screenHeight));
        if (state != null) {
            state.putBoolean(prefix + "_present", true);
            state.putString(prefix + "_visibility", visibilityName);
            state.putBoolean(prefix + "_shown", view.isShown());
            state.putBoolean(prefix + "_globally_visible", globallyVisible);
            state.putFloat(prefix + "_alpha", view.getAlpha());
            state.putFloat(prefix + "_effective_alpha", effectiveAlpha);
            state.putFloat(prefix + "_runtime_z", view.getZ());
            state.putFloat(prefix + "_runtime_elevation", view.getElevation());
            state.putFloat(prefix + "_runtime_translation_z", view.getTranslationZ());
            state.putInt(prefix + "_measured_width_px", Math.max(0, view.getMeasuredWidth()));
            state.putInt(prefix + "_measured_height_px", Math.max(0, view.getMeasuredHeight()));
            state.putInt(prefix + "_width_px", Math.max(0, view.getWidth()));
            state.putInt(prefix + "_height_px", Math.max(0, view.getHeight()));
            state.putInt(prefix + "_screen_x_px", screenPosition[0]);
            state.putInt(prefix + "_screen_y_px", screenPosition[1]);
            state.putInt(prefix + "_drawing_index", parentIndex);
            state.putInt(prefix + "_sibling_count", siblingCount);
            state.putInt(prefix + "_root_drawing_index", rootDrawingIndex);
            state.putInt(prefix + "_root_sibling_count", mainRoot == null ? 0 : mainRoot.getChildCount());
            state.putFloat(prefix + "_visible_area_ratio", visibleRatio);
            if (globallyVisible) putBounds(state, prefix + "_visible_bounds", globalBounds);
        }
        return globallyVisible ? globalBounds : null;
    }

    private String frontmostFullscreenSurface(View hScroll, View nativeRoot, View splash,
            ViewGroup mainRoot, int screenWidth, int screenHeight) {
        View[] candidates = { hScroll, nativeRoot, splash };
        String[] names = { "hscroll", "native_root", "splash_overlay" };
        View frontmost = null;
        String frontmostName = "none";
        float frontmostZ = -Float.MAX_VALUE;
        int frontmostIndex = -1;
        long screenArea = Math.max(0L, screenWidth) * Math.max(0L, screenHeight);
        for (int index = 0; index < candidates.length; index++) {
            View candidate = candidates[index];
            if (!isActuallyVisible(candidate) || candidate.getAlpha() <= 0.01f) continue;
            Rect bounds = new Rect();
            if (!candidate.getGlobalVisibleRect(bounds) || screenArea <= 0L) continue;
            long area = Math.max(0L, bounds.width()) * Math.max(0L, bounds.height());
            if (area < screenArea / 2L) continue;
            int drawingIndex = mainRoot == null ? -1 : mainRoot.indexOfChild(candidate);
            float z = candidate.getZ();
            if (frontmost == null || z > frontmostZ || (z == frontmostZ && drawingIndex > frontmostIndex)) {
                frontmost = candidate;
                frontmostName = names[index];
                frontmostZ = z;
                frontmostIndex = drawingIndex;
            }
        }
        return frontmostName;
    }

    private String safeHomeHost(String value) {
        return "open.spotify.com".equals(value) ? value
                : "accounts.spotify.com".equals(value) ? value : "other";
    }

    private String safeHomeRoute(String value) {
        return "root".equals(value) || "home".equals(value) || "app".equals(value)
                || "search".equals(value) || "library".equals(value) || "detail".equals(value)
                || "other".equals(value) ? value : "other";
    }

    private String safeWebPageOwner(String value) {
        return "melodix-web-home".equals(value) || "spotify-web".equals(value) ? value : "web-unknown";
    }

    private String safeNativeRoute(String value) {
        return "home".equals(value) || "search".equals(value) || "library".equals(value)
                || "detail".equals(value) || "player".equals(value) || "settings".equals(value)
                ? value : "other";
    }

    private String safeLibraryStatus(String value) {
        return "absent".equals(value) || "pending".equals(value) || "loading".equals(value)
                || "ready".equals(value) || "error".equals(value) ? value : "other";
    }

    private String safeLibraryError(String value) {
        return "none".equals(value) || "empty".equals(value) || "http-401".equals(value)
                || "http-403".equals(value) || "http-other".equals(value) || "timeout".equals(value)
                || "network".equals(value) || "non-json".equals(value) || "invalid-json".equals(value)
                || "unexpected-shape".equals(value) || "graphql".equals(value) || "parse".equals(value)
                || "transform".equals(value) ? value : "other";
    }

    private String safeLibraryFetchPhase(String value) {
        return "request".equals(value) || "response".equals(value) || "parse".equals(value)
                || "transform".equals(value) || "settle".equals(value) ? value : "unknown";
    }

    private String safeLibraryFetchMime(String value) {
        return "json".equals(value) || "html".equals(value) || "other".equals(value)
                || "missing".equals(value) ? value : "unknown";
    }

    private String safeLibraryFetchError(String value, boolean diagnosticAvailable,
            String phase, int httpStatus) {
        String safe = "unavailable".equals(value) ? value : safeLibraryError(value);
        if ("http-401".equals(safe)
                && (!diagnosticAvailable || !"response".equals(phase) || httpStatus != 401)) {
            return "http-other";
        }
        if ("http-403".equals(safe)
                && (!diagnosticAvailable || !"response".equals(phase) || httpStatus != 403)) {
            return "http-other";
        }
        return safe;
    }

    private String safeLibraryErrorWithFetchEvidence(String value, boolean diagnosticAvailable,
            String phase, int httpStatus, String fetchError) {
        String safe = safeLibraryError(value);
        if ("http-401".equals(safe)
                && (!diagnosticAvailable || !"response".equals(phase) || httpStatus != 401
                        || !"http-401".equals(fetchError))) return "other";
        if ("http-403".equals(safe)
                && (!diagnosticAvailable || !"response".equals(phase) || httpStatus != 403
                        || !"http-403".equals(fetchError))) return "other";
        return safe;
    }

    private int safeBoundedDiagnosticInt(JSONObject probe, String key, int fallback, int min, int max) {
        int value = probe == null ? fallback : probe.optInt(key, fallback);
        return Math.max(min, Math.min(max, value));
    }

    private WebView awaitStableWebView(final Activity activity) throws InterruptedException {
        long deadline = System.currentTimeMillis() + WEBVIEW_SETTLE_TIMEOUT_MS;
        long stableSince = 0L;
        String previousUrl = "";
        WebView lastWebView = null;

        while (System.currentTimeMillis() < deadline) {
            final WebView[] current = new WebView[1];
            final int[] progress = new int[] { -1 };
            final String[] url = new String[] { "" };
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    current[0] = findWebView(activity);
                    if (current[0] != null) {
                        progress[0] = current[0].getProgress();
                        String currentUrl = current[0].getUrl();
                        url[0] = currentUrl == null ? "" : currentUrl;
                    }
                }
            });

            if (current[0] != null && progress[0] == 100 && !url[0].isEmpty()) {
                if (url[0].equals(previousUrl)) {
                    if (stableSince == 0L) stableSince = System.currentTimeMillis();
                    if (System.currentTimeMillis() - stableSince >= REQUIRED_STABLE_MS) {
                        return current[0];
                    }
                } else {
                    previousUrl = url[0];
                    stableSince = 0L;
                }
                lastWebView = current[0];
            } else {
                previousUrl = "";
                stableSince = 0L;
                if (current[0] != null) lastWebView = current[0];
            }
            Thread.sleep(250L);
        }
        if (lastWebView == null) {
            throw new AssertionError("WebView did not become available on the clean login launch");
        }
        throw new AssertionError("WebView page did not reach a stable completed state");
    }

    private void requireUnauthenticatedSession(Activity activity) {
        try {
            Class<?> singleton = activity.getClassLoader()
                    .loadClass("com.melodix.music.AppSingleton");
            Field loggedIn = singleton.getDeclaredField("B");
            loggedIn.setAccessible(true);
            if (loggedIn.getBoolean(null)) {
                throw new AssertionError("Clean-emulator login phase unexpectedly reports an authenticated session");
            }
        } catch (AssertionError error) {
            throw error;
        } catch (Throwable error) {
            throw new AssertionError("Could not verify the clean unauthenticated session state");
        }
    }

    private Bundle inspectRuntimeUserAgent(Activity activity, WebView webView) {
        String platformUserAgent = WebSettings.getDefaultUserAgent(activity);
        String configuredUserAgent = webView.getSettings().getUserAgentString();
        String platformVersion = userAgentVersion(platformUserAgent, "Chrome/");
        String configuredVersion = userAgentVersion(configuredUserAgent, "Chrome/");
        String platformMajor = majorVersion(platformVersion);
        String configuredMajor = majorVersion(configuredVersion);
        boolean matches = platformMajor != null && platformMajor.equals(configuredMajor);
        Bundle state = new Bundle();
        state.putString("phase", "runtime_webview_profile");
        state.putInt("android_api_level", Build.VERSION.SDK_INT);
        state.putString("android_release", Build.VERSION.RELEASE == null ? "unavailable" : Build.VERSION.RELEASE);
        state.putString("installed_webview_chrome_major", platformMajor == null ? "unavailable" : platformMajor);
        state.putString("installed_webview_chrome_version", platformVersion == null ? "unavailable" : platformVersion);
        state.putString("installed_webview_ua_android_version", userAgentVersion(platformUserAgent, "Android "));
        state.putString("configured_ua_chrome_major", configuredMajor == null ? "unavailable" : configuredMajor);
        state.putString("configured_ua_chrome_version", configuredVersion == null ? "unavailable" : configuredVersion);
        state.putString("configured_ua_android_version", userAgentVersion(configuredUserAgent, "Android "));
        state.putBoolean("configured_ua_chrome_major_matches_runtime", matches);
        String webViewPackage = "unavailable";
        String webViewPackageVersion = "unavailable";
        if (Build.VERSION.SDK_INT >= 26) {
            try {
                PackageInfo current = WebView.getCurrentWebViewPackage();
                if (current != null) {
                    webViewPackage = current.packageName == null ? "unavailable" : current.packageName;
                    webViewPackageVersion = current.versionName == null ? "unavailable" : current.versionName;
                }
            } catch (Throwable ignored) {}
        }
        state.putString("installed_webview_package", webViewPackage);
        state.putString("installed_webview_package_version", webViewPackageVersion);
        return state;
    }

    private Bundle inspectJavascriptUserAgentProfile(WebView webView, Bundle runtimeProfile)
            throws InterruptedException {
        JSONObject probe;
        try {
            probe = new JSONObject(evaluateJavascriptAndWait(webView, JAVASCRIPT_UA_DIAGNOSTIC_PROBE));
        } catch (org.json.JSONException error) {
            return javascriptUserAgentProbeFailure(safeExceptionType(error));
        }
        boolean resultProbeError = probe.optBoolean("probe_error", true);
        String resultProbeErrorType = safeProbeErrorType(
                probe.optString("probe_error_type", resultProbeError ? "ProbeError" : "none"));
        boolean resultParseError = false;
        String resultParseErrorType = "none";
        long highEntropyDeadline = System.currentTimeMillis() + 5000L;
        while (probe.optBoolean("client_hints_high_entropy_supported") &&
                !probe.optBoolean("client_hints_high_entropy_complete") && !resultProbeError &&
                System.currentTimeMillis() < highEntropyDeadline) {
            Thread.sleep(100L);
            String latestResult = evaluateJavascriptAndWait(webView, JAVASCRIPT_UA_RESULT_PROBE);
            if (latestResult == null || "null".equals(latestResult)) break;
            try {
                JSONObject latest = new JSONObject(latestResult);
                if (latest.optBoolean("probe_error", true)) {
                    resultProbeError = true;
                    resultProbeErrorType = safeProbeErrorType(latest.optString("probe_error_type", "ProbeError"));
                    break;
                }
                probe = latest;
            } catch (org.json.JSONException error) {
                resultParseError = true;
                resultParseErrorType = safeExceptionType(error);
                break;
            }
        }
        boolean highEntropyTimedOut = !resultProbeError && !resultParseError &&
                probe.optBoolean("client_hints_high_entropy_supported") &&
                !probe.optBoolean("client_hints_high_entropy_complete");
        evaluateJavascriptAndWait(webView, "window.__sfMelodixRuntimeUaProbeV1=null;true");
        String javascriptVersion = probe.optString("user_agent_chrome_version", "");
        String javascriptMajor = majorVersion(javascriptVersion);
        String installedMajor = runtimeProfile.getString("installed_webview_chrome_major", "unavailable");
        boolean versionMatches = javascriptMajor != null && javascriptMajor.equals(installedMajor);
        boolean coherent = !resultProbeError && !resultParseError && probe.optBoolean("coherent") && versionMatches;
        Bundle state = new Bundle();
        state.putString("phase", "javascript_webview_profile");
        state.putString("javascript_user_agent_chrome_version",
                javascriptVersion.isEmpty() ? "unavailable" : javascriptVersion);
        state.putString("javascript_user_agent_android_version",
                probe.optString("user_agent_android_version", "unavailable"));
        state.putBoolean("javascript_chrome_major_matches_installed_webview", versionMatches);
        state.putBoolean("client_hints_available", probe.optBoolean("client_hints_available"));
        state.putString("client_hints_platform", probe.optString("client_hints_platform", "unavailable"));
        if (!probe.isNull("client_hints_mobile")) {
            state.putBoolean("client_hints_mobile", probe.optBoolean("client_hints_mobile"));
        }
        state.putString("client_hints_browser_brand", probe.optString("client_hints_brand", "unavailable"));
        state.putString("client_hints_browser_major",
                probe.optString("client_hints_brand_version", "unavailable"));
        state.putString("client_hints_full_browser_version",
                probe.optString("client_hints_full_version", "unavailable"));
        state.putString("client_hints_full_brand_version",
                probe.optString("client_hints_full_brand_version", "unavailable"));
        state.putString("client_hints_platform_version",
                probe.optString("client_hints_platform_version", "unavailable"));
        state.putBoolean("client_hints_high_entropy_api_supported",
                probe.optBoolean("client_hints_high_entropy_supported"));
        state.putBoolean("client_hints_high_entropy_complete",
                probe.optBoolean("client_hints_high_entropy_complete"));
        boolean highEntropyError = probe.optBoolean("client_hints_high_entropy_error");
        String highEntropyErrorType = probe.optString("client_hints_high_entropy_error_type", "").trim();
        if (!highEntropyError) highEntropyErrorType = "none";
        else if (highEntropyErrorType.isEmpty()) highEntropyErrorType = "HighEntropyError";
        state.putBoolean("client_hints_high_entropy_error", highEntropyError);
        state.putString("client_hints_high_entropy_error_type", safeProbeErrorType(highEntropyErrorType));
        state.putBoolean("javascript_ua_profile_probe_error", resultProbeError || resultParseError);
        state.putString("javascript_user_agent_probe_error_type", resultParseError
                ? resultParseErrorType : resultProbeError ? resultProbeErrorType : "none");
        state.putBoolean("client_hints_high_entropy_timed_out", highEntropyTimedOut);
        state.putBoolean("javascript_ua_profile_coherent", coherent);
        return state;
    }

    private Bundle javascriptUserAgentProbeFailure(String errorType) {
        Bundle state = new Bundle();
        state.putString("phase", "javascript_webview_profile");
        state.putString("javascript_user_agent_chrome_version", "unavailable");
        state.putString("javascript_user_agent_android_version", "unavailable");
        state.putBoolean("javascript_chrome_major_matches_installed_webview", false);
        state.putBoolean("client_hints_available", false);
        state.putString("client_hints_platform", "unavailable");
        state.putString("client_hints_browser_brand", "unavailable");
        state.putString("client_hints_browser_major", "unavailable");
        state.putString("client_hints_full_browser_version", "unavailable");
        state.putString("client_hints_full_brand_version", "unavailable");
        state.putString("client_hints_platform_version", "unavailable");
        state.putBoolean("client_hints_high_entropy_api_supported", false);
        state.putBoolean("client_hints_high_entropy_complete", false);
        state.putBoolean("client_hints_high_entropy_error", false);
        state.putString("client_hints_high_entropy_error_type", "none");
        state.putBoolean("javascript_ua_profile_probe_error", true);
        state.putString("javascript_user_agent_probe_error_type", safeProbeErrorType(errorType));
        state.putBoolean("client_hints_high_entropy_timed_out", false);
        state.putBoolean("javascript_ua_profile_coherent", false);
        return state;
    }

    private Bundle inspectLiveSpotifyCssTheme(WebView webView) throws InterruptedException {
        JSONObject probe;
        try {
            probe = new JSONObject(evaluateJavascriptAndWait(webView, LIVE_SPOTIFY_CSS_PROBE));
        } catch (org.json.JSONException error) {
            Bundle failed = new Bundle();
            failed.putString("phase", "live_spotify_webview_css_probe");
            failed.putBoolean("fixture_test_only", false);
            failed.putBoolean("existing_spotify_webview_observed", true);
            failed.putBoolean("live_spotify_css_probe_completed", false);
            failed.putBoolean("live_spotify_css_probe_error", true);
            failed.putString("live_spotify_css_probe_error_type", safeExceptionType(error));
            failed.putString("live_spotify_origin_category", "other");
            failed.putString("live_spotify_route_category", "other");
            failed.putBoolean("live_spotify_host_confirmed", false);
            failed.putBoolean("live_webview_stylesheet_marker_present", false);
            failed.putBoolean("live_webview_css_theme_applicable", false);
            failed.putBoolean("live_webview_css_tokens_valid", false);
            failed.putInt("live_webview_css_token_count", 0);
            failed.putBoolean("live_webview_home_present", false);
            failed.putBoolean("live_webview_home_active", false);
            failed.putBoolean("live_webview_home_display_flex", false);
            failed.putBoolean("live_webview_source_main_present", false);
            failed.putBoolean("live_webview_bridge_present", false);
            failed.putBoolean("live_webview_bridge_media_callback_present", false);
            failed.putBoolean("live_webview_bridge_diag_callback_present", false);
            failed.putBoolean("authenticated_home_test_performed", false);
            return failed;
        }
        String host = probe.optString("host", "other");
        boolean probeError = probe.optBoolean("probe_error", true);
        JSONObject tokens = probe.optJSONObject("tokens");
        String[] requiredTokens = new String[] {
                "--mel-bg", "--mel-bg-2", "--mel-surface-light", "--mel-surface-light-2",
                "--mel-surface-light-3", "--mel-text-mute-a", "--mel-text-mute-c",
                "--mel-accent", "--mel-accent-wash-11", "--mel-home-status-wash",
                "--mel-home-status-stroke", "--mel-home-status-error-wash", "--mel-home-status-error-stroke"
        };
        boolean tokensValid = tokens != null && !probeError;
        for (String name : requiredTokens) {
            String value = tokens == null ? "" : tokens.optString(name, "").trim();
            if (value.isEmpty() || value.toLowerCase().contains("var(")) tokensValid = false;
        }
        boolean spotifyHost = "open.spotify.com".equals(host) || "accounts.spotify.com".equals(host);
        boolean cssThemeApplicable = "open.spotify.com".equals(host);
        boolean stylesheetPresent = probe.optBoolean("style_present") && probe.optBoolean("style_marker_present");
        Bundle state = new Bundle();
        state.putString("phase", "live_spotify_webview_css_probe");
        state.putBoolean("fixture_test_only", false);
        state.putBoolean("existing_spotify_webview_observed", true);
        state.putBoolean("live_spotify_css_probe_completed", true);
        state.putBoolean("live_spotify_css_probe_error", probeError);
        state.putString("live_spotify_css_probe_error_type", safeProbeErrorType(
                probe.optString("probe_error_type", probeError ? "ProbeError" : "none")));
        state.putString("live_spotify_origin_category", host);
        state.putString("live_spotify_route_category", probe.optString("route_category", "other"));
        state.putBoolean("live_spotify_host_confirmed", spotifyHost);
        state.putBoolean("live_webview_stylesheet_marker_present", stylesheetPresent);
        state.putBoolean("live_webview_css_theme_applicable", cssThemeApplicable);
        state.putBoolean("live_webview_css_tokens_valid", cssThemeApplicable && stylesheetPresent && tokensValid);
        state.putInt("live_webview_css_token_count", tokens == null ? 0 : tokens.length());
        state.putBoolean("live_webview_home_present", probe.optBoolean("home_present"));
        state.putBoolean("live_webview_home_active", probe.optBoolean("home_active"));
        state.putBoolean("live_webview_home_display_flex", probe.optBoolean("home_display_flex"));
        state.putBoolean("live_webview_source_main_present", probe.optBoolean("source_main_present"));
        state.putBoolean("live_webview_bridge_present", probe.optBoolean("bridge_present"));
        state.putBoolean("live_webview_bridge_media_callback_present", probe.optBoolean("bridge_media_callback"));
        state.putBoolean("live_webview_bridge_diag_callback_present", probe.optBoolean("bridge_diag_callback"));
        state.putBoolean("authenticated_home_test_performed", false);
        if (tokens != null) {
            state.putString("live_css_mel_bg", tokens.optString("--mel-bg", ""));
            state.putString("live_css_mel_bg_2", tokens.optString("--mel-bg-2", ""));
            state.putString("live_css_mel_surface_light", tokens.optString("--mel-surface-light", ""));
            state.putString("live_css_mel_surface_light_2", tokens.optString("--mel-surface-light-2", ""));
            state.putString("live_css_mel_surface_light_3", tokens.optString("--mel-surface-light-3", ""));
            state.putString("live_css_mel_text_mute_a", tokens.optString("--mel-text-mute-a", ""));
            state.putString("live_css_mel_text_mute_c", tokens.optString("--mel-text-mute-c", ""));
            state.putString("live_css_mel_accent", tokens.optString("--mel-accent", ""));
            state.putString("live_css_mel_accent_wash_11", tokens.optString("--mel-accent-wash-11", ""));
            state.putString("live_css_mel_home_status_wash", tokens.optString("--mel-home-status-wash", ""));
            state.putString("live_css_mel_home_status_stroke", tokens.optString("--mel-home-status-stroke", ""));
            state.putString("live_css_mel_home_status_error_wash", tokens.optString("--mel-home-status-error-wash", ""));
            state.putString("live_css_mel_home_status_error_stroke", tokens.optString("--mel-home-status-error-stroke", ""));
        }
        return state;
    }

    private String userAgentVersion(String userAgent, String markerText) {
        if (userAgent == null || markerText == null) return null;
        int marker = userAgent.indexOf(markerText);
        if (marker < 0) return null;
        int start = marker + markerText.length();
        int end = start;
        while (end < userAgent.length()) {
            char value = userAgent.charAt(end);
            if ((value >= '0' && value <= '9') || value == '.') end++;
            else break;
        }
        if (end <= start) return null;
        return userAgent.substring(start, end);
    }

    private String majorVersion(String version) {
        if (version == null || version.isEmpty()) return null;
        int dot = version.indexOf('.');
        String major = dot < 0 ? version : version.substring(0, dot);
        if (major.isEmpty()) return null;
        for (int index = 0; index < major.length(); index++) {
            if (!Character.isDigit(major.charAt(index))) return null;
        }
        return major;
    }

    private String chromeMajor(String userAgent) {
        return majorVersion(userAgentVersion(userAgent, "Chrome/"));
    }

    private boolean awaitBooleanProbe(
            final WebView webView, final String script, final String statusKey) throws InterruptedException {
        final CountDownLatch received = new CountDownLatch(1);
        final String[] result = new String[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                webView.evaluateJavascript(script, new ValueCallback<String>() {
                    @Override
                    public void onReceiveValue(String value) {
                        result[0] = value;
                        received.countDown();
                    }
                });
            }
        });
        if (!received.await(10L, TimeUnit.SECONDS)) {
            throw new AssertionError("WebView probe timed out: " + statusKey);
        }
        if (!"true".equals(result[0]) && !"false".equals(result[0])) {
            throw new AssertionError("WebView probe returned no boolean result: " + statusKey);
        }
        boolean probeResult = "true".equals(result[0]);
        Bundle status = new Bundle();
        status.putString("phase", statusKey);
        status.putBoolean(statusKey, probeResult);
        sendStatus(1, status);
        return probeResult;
    }

    private boolean awaitLoginUiVisible(final WebView webView) throws InterruptedException {
        final CountDownLatch received = new CountDownLatch(1);
        final String[] result = new String[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                webView.evaluateJavascript(LOGIN_DOM_PROBE, new ValueCallback<String>() {
                    @Override
                    public void onReceiveValue(String value) {
                        result[0] = value;
                        received.countDown();
                    }
                });
            }
        });
        if (!received.await(10L, TimeUnit.SECONDS)) {
            throw new AssertionError("Spotify login DOM probe timed out");
        }
        boolean loginVisible = "true".equals(result[0]);
        Bundle probeState = new Bundle();
        probeState.putString("phase", "login_dom_probe");
        probeState.putBoolean("login_dom_probe_completed", true);
        probeState.putBoolean("login_ui_visible_in_webview_dom", loginVisible);
        sendStatus(1, probeState);
        if (!loginVisible) {
            throw new AssertionError("The clean unauthenticated WebView has no visible login UI");
        }
        return true;
    }

    private Bundle inspectLoginSurface(Activity activity, WebView webView, boolean loginDomVisible) throws Exception {
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");

        // Reproduce the prior recovery transition: an error can mark the WebView
        // container INVISIBLE. revealWebUi must restore the same loaded WebView.
        Method loginAction = activity.getClass().getMethod("revealLoginWebUi");
        Method showNetworkError = activity.getClass().getMethod("D", Boolean.TYPE);
        Method revealWebUi = activity.getClass().getMethod("revealWebUi");
        String originalUrl = webView.getUrl();
        loginAction.invoke(activity);
        if (!readBooleanField(activity, "nativeLoginWebRequested")) {
            throw new AssertionError("Explicit login action did not request Web ownership");
        }
        showNetworkError.invoke(activity, Boolean.TRUE);
        if (webContainer.getVisibility() != View.INVISIBLE) {
            throw new AssertionError("Network-error transition did not hide the WebView container as expected");
        }
        revealWebUi.invoke(activity);
        if (webContainer.getVisibility() != View.VISIBLE) {
            throw new AssertionError("WebView container remained hidden after revealWebUi recovery");
        }

        Rect webBounds = visibleBounds(webView);
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean nativeHomeHidden = nativeRoot.getVisibility() == View.GONE;
        boolean samePage = equalsNullable(originalUrl, webView.getUrl());
        if (webBounds == null || !splashHidden || !nativeHomeHidden || !samePage || !loginDomVisible) {
            throw new AssertionError("Unauthenticated login surface is not visibly backed by the original WebView");
        }

        Bundle state = new Bundle();
        state.putString("phase", "login_without_session");
        state.putBoolean("login_ui_visible_in_webview_dom", true);
        state.putBoolean("webview_visible_and_measured", true);
        state.putBoolean("network_error_transition_recovered", true);
        state.putBoolean("original_webview_url_preserved", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("native_home_hidden", true);
        state.putBoolean("explicit_login_owner_requested", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "webview_visible", webBounds);
        return state;
    }

    private void captureEmptyHomeUiEvidence() throws Exception {
        captureUiEvidence("melodix-preview-home-empty.xml", "melodix-preview-home-native-error.png", "empty-Home");
    }

    private Bundle verifyNativeRouteOwnerMatrix(
            final Activity activity, final WebView webView, final String originalUrl) throws Exception {
        final String[] snapshots = { "home", "search", "library", "detail", "detail_return", "player", "player_return", "late_callback_watchdog" };
        final String[] routes = { "home", "search", "library", "detail", "", "player", "", "search" };
        Class<?> bridgeClass = activity.getClassLoader().loadClass("com.melodix.music.AndBridge");
        final Object bridge = bridgeClass.getConstructor(Context.class).newInstance(activity);
        final Method routeCallback = bridgeClass.getMethod("onNativeUiRoute", String.class);
        final Method backCallback = activity.getClass().getMethod("onNativeBackClick", View.class);
        final Method latePageFinished = activity.getClass().getMethod("showNativeUiFrom", String.class, String.class);
        Bundle matrix = new Bundle();
        matrix.putString("phase", "native_route_owner_matrix");
        matrix.putBoolean("native_route_matrix_test_only", true);
        matrix.putBoolean("native_route_matrix_completed", false);
        matrix.putBoolean("authenticated_home_test_performed", false);

        for (int index = 0; index < snapshots.length; index++) {
            final String snapshot = snapshots[index];
            final String route = routes[index];
            final Throwable[] dispatchFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        if ("detail_return".equals(snapshot) || "player_return".equals(snapshot)) {
                            backCallback.invoke(activity, (Object) null);
                        } else if ("late_callback_watchdog".equals(snapshot)) {
                            // Reproduce a late, sanitized page-finished request,
                            // immediately followed by a route callback. The real
                            // delayed layout watcher must observe the newer route.
                            latePageFinished.invoke(activity, "page-finished", "webview");
                            routeCallback.invoke(bridge, route);
                        } else {
                            routeCallback.invoke(bridge, route);
                        }
                    } catch (Throwable error) {
                        dispatchFailure[0] = error;
                    }
                }
            });
            if (dispatchFailure[0] != null) {
                throw new AssertionError("Native route callback failed for the bounded route matrix", dispatchFailure[0]);
            }

            final String expectedRoute = ("detail_return".equals(snapshot) || "player_return".equals(snapshot))
                    ? "home" : route;
            if ("home".equals(expectedRoute)) {
                // Keep every Home return in an explicit, non-private error state;
                // the empty payload exercises the real native empty renderer.
                dispatchEmptyHomeThroughAndBridge(activity);
                awaitNativeHomeErrorReady(activity);
            }
            Bundle surface = awaitNativeRouteOwner(activity, webView, originalUrl, expectedRoute, 5000L);
            Thread.sleep("late_callback_watchdog".equals(snapshot) ? 800L : 250L);
            waitForIdleSync();
            final Bundle[] settledSurface = new Bundle[1];
            final Throwable[] settledFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        settledSurface[0] = inspectNativeRouteOwner(activity, webView, originalUrl, expectedRoute);
                    } catch (Throwable error) {
                        settledFailure[0] = error;
                    }
                }
            });
            if (settledFailure[0] != null) {
                throw new AssertionError("A delayed route callback or visibility watcher changed the native owner", settledFailure[0]);
            }
            surface = settledSurface[0];

            String fileRoute = snapshot.replace('_', '-');
            captureUiEvidence(
                    "melodix-preview-native-route-" + fileRoute + ".xml",
                    "melodix-preview-native-route-" + fileRoute + ".png",
                    "Native-route");
            Bundle sample = new Bundle(surface);
            sample.putString("phase", "native_route_owner_matrix_sample");
            sample.putString("native_route", expectedRoute);
            sample.putString("native_route_snapshot", snapshot);
            sample.putBoolean("native_route_" + snapshot + "_owner_verified", true);
            sample.putBoolean("native_route_" + snapshot + "_webview_mounted", true);
            sample.putBoolean("native_route_" + snapshot + "_dock_visible", true);
            sendStatus(1, sample);
            matrix.putBoolean("native_route_" + snapshot + "_owner_verified", true);
            matrix.putBoolean("native_route_" + snapshot + "_webview_mounted", true);
        }
        matrix.putBoolean("native_route_matrix_completed", true);
        matrix.putBoolean("late_native_callback_owner_verified", true);
        matrix.putBoolean("late_visibility_watchdog_owner_verified", true);
        matrix.putString("native_route_matrix_categories", "home,search,library,detail,player");
        return matrix;
    }

    private Bundle awaitNativeRouteOwner(
            final Activity activity, final WebView webView, final String originalUrl,
            final String expectedRoute, long timeoutMillis) throws Exception {
        long deadline = SystemClock.elapsedRealtime() + timeoutMillis;
        Throwable lastFailure = null;
        while (SystemClock.elapsedRealtime() < deadline) {
            final Bundle[] state = new Bundle[1];
            final Throwable[] failure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (expectedRoute.equals(readStringField(activity, "nativeCurrentScreen"))) {
                            state[0] = inspectNativeRouteOwner(activity, webView, originalUrl, expectedRoute);
                        }
                    } catch (Throwable error) {
                        failure[0] = error;
                    }
                }
            });
            if (failure[0] != null) lastFailure = failure[0];
            if (state[0] != null) return state[0];
            Thread.sleep(50L);
        }
        throw new AssertionError("Native root, dock, WebView, or requested route failed its measured owner check",
                lastFailure);
    }

    private Bundle inspectNativeRouteOwner(
            Activity activity, WebView webView, String originalUrl, String expectedRoute) throws Exception {
        View mainRootView = optionalView(activity, "main");
        ViewGroup mainRoot = mainRootView instanceof ViewGroup ? (ViewGroup) mainRootView : null;
        View hScroll = optionalView(activity, "hScrollView");
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        Rect rootBounds = visibleBounds(nativeRoot);
        Rect dockBounds = visibleBounds(nativeHomeTab);
        Rect webBounds = visibleBounds(webView);
        boolean rootVisible = rootBounds != null;
        boolean dockVisible = dockBounds != null;
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean webContainerVisible = webContainer.getVisibility() == View.VISIBLE;
        boolean webViewMounted = webView != null && webView.getParent() != null;
        boolean sameWebViewUrl = equalsNullable(originalUrl, webView.getUrl());
        int width = mainRoot == null ? 0 : mainRoot.getWidth();
        int height = mainRoot == null ? 0 : mainRoot.getHeight();
        int[] location = new int[2];
        if (mainRoot != null) mainRoot.getLocationOnScreen(location);
        int centerX = location[0] + width / 2;
        int centerY = location[1] + height / 2;
        boolean rootCoversCenter = rootBounds != null && rootBounds.contains(centerX, centerY);
        boolean rootCoversDock = rootBounds != null && dockBounds != null && rootBounds.contains(dockBounds);
        String frontmost = frontmostFullscreenSurface(hScroll, nativeRoot, splash, mainRoot, width, height);
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        requireUnauthenticatedSession(activity);
        if (!expectedRoute.equals(currentScreen) || !rootVisible || !dockVisible || !splashHidden
                || !webContainerVisible || !webViewMounted || webBounds == null || !sameWebViewUrl
                || !rootCoversCenter || !rootCoversDock || !"native_root".equals(frontmost)) {
            throw new AssertionError("The requested native route is not the measured foreground shell above the mounted WebView");
        }
        Bundle state = new Bundle();
        state.putBoolean("native_route_owner_verified", true);
        state.putBoolean("native_route_webview_mounted", true);
        state.putBoolean("native_route_dock_visible", true);
        state.putBoolean("native_route_root_covers_center", true);
        state.putBoolean("native_route_root_covers_dock", true);
        state.putBoolean("native_route_layout_frontmost", true);
        state.putBoolean("original_webview_url_preserved", true);
        putBounds(state, "native_root_visible", rootBounds);
        putBounds(state, "native_dock_visible", dockBounds);
        putBounds(state, "webview_mounted", webBounds);
        if ("home".equals(expectedRoute)) {
            state.putAll(inspectEmptyHomeNativeError(activity, webView, originalUrl));
        }
        return state;
    }

    private void captureNativeHomeTimeline(
            final Activity activity, final WebView webView, final String originalUrl,
            final String phaseTag, final boolean expectError) throws Exception {
        if (!("cold_home".equals(phaseTag) || "empty_home".equals(phaseTag))) {
            throw new AssertionError("Unsupported native Home timeline phase");
        }
        final long[] checkpoints = { 200L, 1000L, 3000L, 8000L, 20000L };
        final String[] labels = { "200ms", "1s", "3s", "8s", "20s" };
        final long timelineStart = SystemClock.elapsedRealtime();
        for (int index = 0; index < checkpoints.length; index++) {
            long waitMillis = timelineStart + checkpoints[index] - SystemClock.elapsedRealtime();
            if (waitMillis > 0L) Thread.sleep(waitMillis);

            final Bundle[] observedState = new Bundle[1];
            final Throwable[] inspectionFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        observedState[0] = expectError
                                ? inspectEmptyHomeNativeError(activity, webView, originalUrl)
                                : inspectHomeStatus(activity, webView, originalUrl);
                    } catch (Throwable error) {
                        inspectionFailure[0] = error;
                    }
                }
            });
            if (inspectionFailure[0] != null) {
                throw new AssertionError("Native Home owner changed during the " + phaseTag + " timeline", inspectionFailure[0]);
            }

            String hierarchyName = "melodix-preview-" + phaseTag + "-" + labels[index] + ".xml";
            String screenshotName = "melodix-preview-" + phaseTag + "-" + labels[index] + ".png";
            captureUiEvidence(hierarchyName, screenshotName, "Home-owner timeline");
            long observedElapsed = SystemClock.elapsedRealtime() - timelineStart;
            if (observedElapsed < checkpoints[index] || observedElapsed - checkpoints[index] > 2500L) {
                throw new AssertionError("Native Home timeline screenshot missed its bounded checkpoint");
            }

            Bundle sample = new Bundle();
            sample.putString("phase", phaseTag + "_timeline_sample");
            sample.putString("native_timeline_checkpoint", labels[index]);
            sample.putLong("native_timeline_observed_elapsed_ms", observedElapsed);
            sample.putBoolean(phaseTag + "_timeline_" + labels[index] + "_native_owner_verified", true);
            sample.putBoolean(phaseTag + "_timeline_" + labels[index] + "_webview_mounted", true);
            sendStatus(1, sample);
        }
    }

    private void captureHomeStatusUiEvidence() throws Exception {
        captureUiEvidence("melodix-preview-home-status.xml", "melodix-preview-home-status.png", "Home-status");
    }

    private void captureWebHomeRendererEvidence() throws Exception {
        captureUiEvidence("melodix-preview-web-home-app.xml", "melodix-preview-web-home-app.png", "Web-Home /app renderer");
    }

    private WebView createWebHomeRendererFixture(final Activity activity) throws Exception {
        final CountDownLatch pageFinished = new CountDownLatch(1);
        final WebView[] created = new WebView[1];
        final Throwable[] failure = new Throwable[1];
        final String html = "<!doctype html><html lang=\"en\"><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">" +
                "<script>window.SF_CONFIG={guiMode:'csshack'};window.__sfMediaLibSessionProofKnown=true;window.__sfMediaLibSessionProven=true;window.__sfNativeUiSessionProven=false;window.__sfMelodixHomeTestMode=true;</script></head><body>" +
                "<main id=\"main-view\"><section data-testid=\"shelf\"><h2>Route test shelf</h2>" +
                "<div data-testid=\"card\"><a href=\"/playlist/test-only-route-fixture-playlist\"><span data-testid=\"card-title\">Route fixture playlist</span><span data-testid=\"card-subtitle\">Fixture-only playlist subtitle</span></a></div>" +
                "<div data-testid=\"card\"><a href=\"/album/test-only-route-fixture-album\"><span data-testid=\"card-title\">Route fixture album</span><span data-testid=\"card-subtitle\">Fixture-only album subtitle</span></a></div>" +
                "</section></main></body></html>";
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                try {
                    View root = activity.findViewById(android.R.id.content);
                    if (!(root instanceof ViewGroup)) throw new AssertionError("Activity content root is not a ViewGroup");
                    WebView rendererView = new WebView(activity);
                    created[0] = rendererView;
                    rendererView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                    rendererView.setFocusable(true);
                    rendererView.setFocusableInTouchMode(true);
                    rendererView.setBackgroundColor(0xFF101311);
                    WebSettings settings = rendererView.getSettings();
                    settings.setBlockNetworkLoads(true);
                    settings.setJavaScriptEnabled(true);
                    settings.setDomStorageEnabled(false);
                    rendererView.setWebViewClient(new WebViewClient() {
                        @Override
                        public void onPageFinished(WebView view, String url) {
                            pageFinished.countDown();
                        }
                    });
                    ((ViewGroup) root).addView(rendererView, new ViewGroup.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                    rendererView.requestFocus();
                    rendererView.loadDataWithBaseURL(
                            "https://open.spotify.com/app", html, "text/html", "UTF-8",
                            "https://open.spotify.com/app");
                } catch (Throwable error) {
                    failure[0] = error;
                }
            }
        });
        if (failure[0] != null) {
            removeWebHomeRendererFixture(created[0]);
            throw new AssertionError("Could not create isolated Android Web Home fixture", failure[0]);
        }
        if (created[0] == null) throw new AssertionError("Isolated Android Web Home fixture was not attached");
        try {
            if (!pageFinished.await(15L, TimeUnit.SECONDS)) {
                throw new AssertionError("Isolated /app Web Home fixture did not finish loading");
            }
        } catch (InterruptedException interrupted) {
            removeWebHomeRendererFixture(created[0]);
            Thread.currentThread().interrupt();
            throw interrupted;
        } catch (AssertionError error) {
            removeWebHomeRendererFixture(created[0]);
            throw error;
        }
        return created[0];
    }

    private WebView createNativeUiShellHandoffFixture(final Activity activity) throws Exception {
        final CountDownLatch pageFinished = new CountDownLatch(1);
        final WebView[] created = new WebView[1];
        final Throwable[] failure = new Throwable[1];
        final String html = "<!doctype html><html lang=\"fr\"><head>" +
                "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">" +
                "<title>Fixture Home</title></head><body>" +
                "<main id=\"main-view\"><section data-testid=\"shelf\"><h2>Fixture only</h2></section></main>" +
                "</body></html>";
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                try {
                    View root = activity.findViewById(android.R.id.content);
                    if (!(root instanceof ViewGroup)) throw new AssertionError("Activity content root is not a ViewGroup");
                    WebView rendererView = new WebView(activity);
                    created[0] = rendererView;
                    rendererView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                    rendererView.setFocusable(false);
                    rendererView.setFocusableInTouchMode(false);
                    rendererView.setClickable(false);
                    rendererView.setAlpha(0.0f);
                    rendererView.setBackgroundColor(0x00000000);
                    WebSettings settings = rendererView.getSettings();
                    settings.setBlockNetworkLoads(true);
                    settings.setJavaScriptEnabled(true);
                    settings.setDomStorageEnabled(false);
                    rendererView.addJavascriptInterface(new NativeUiShellTestBridge(activity), "AndBridge");
                    rendererView.setWebViewClient(new WebViewClient() {
                        @Override
                        public void onPageFinished(WebView view, String url) {
                            pageFinished.countDown();
                        }
                    });
                    ((ViewGroup) root).addView(rendererView, 0, new ViewGroup.LayoutParams(1, 1));
                    rendererView.loadDataWithBaseURL(
                            "https://open.spotify.com/", html, "text/html", "UTF-8",
                            "https://open.spotify.com/");
                } catch (Throwable error) {
                    failure[0] = error;
                }
            }
        });
        if (failure[0] != null) {
            removeWebHomeRendererFixture(created[0]);
            throw new AssertionError("Could not create isolated JavaScript shell handoff fixture", failure[0]);
        }
        if (created[0] == null) throw new AssertionError("JavaScript shell handoff fixture was not attached");
        try {
            if (!pageFinished.await(15L, TimeUnit.SECONDS)) {
                throw new AssertionError("Isolated Spotify-origin Home fixture did not finish loading");
            }
        } catch (InterruptedException interrupted) {
            removeWebHomeRendererFixture(created[0]);
            Thread.currentThread().interrupt();
            throw interrupted;
        } catch (AssertionError error) {
            removeWebHomeRendererFixture(created[0]);
            throw error;
        }
        return created[0];
    }

    private void installPackagedNativeUiShell(WebView webView, Activity activity) throws Exception {
        String shellSource = readPackagedAsset(activity, "native_ui_shell.js");
        if (!shellSource.contains("window.__sfNativeUiRefresh") ||
                !shellSource.contains("function unprovenHomeStateRow")) {
            throw new AssertionError("The Preview APK does not contain the expected packaged native UI shell");
        }
        String script = "window.__sfMediaLibStatus='loading';" +
                "window.__sfMediaLibError='';" +
                "window.__sfMediaLibSessionProofKnown=false;" +
                "window.__sfMediaLibSessionProven=false;" +
                "delete window.mediaLib;" + shellSource + ";true;";
        evaluateJavascriptAndWait(webView, script);
    }

    private Bundle inspectJavascriptHomeHandoff(
            Activity activity, WebView webView, String originalUrl, String shellStateJson) throws Exception {
        JSONObject shellState = new JSONObject(shellStateJson);
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        View nativeContent = requiredView(activity, "nativeContent");
        View statusView = readViewField(activity, "nativeHomeStatusView");
        Rect rootBounds = visibleBounds(nativeRoot);
        Rect statusBounds = visibleBounds(statusView);
        boolean statusAttached = readBooleanField(activity, "nativeHomeStatusAttached");
        boolean unprovenStatusAttached = readBooleanField(activity, "nativeHomeSessionUnprovenStatusAttached");
        boolean cardsAttached = readBooleanField(activity, "nativeHomeCardsAttached");
        boolean contentReady = readBooleanField(activity, "nativeHomeContentReady");
        boolean statusTitleVisible = containsText(statusView, "Connexion à Spotify");
        boolean statusSubtitleVisible = containsText(statusView, "Vérification de la session");
        boolean statusActionClickable = statusView != null && statusView.isClickable();
        boolean rootVisible = rootBounds != null;
        boolean webContainerVisible = webContainer.getVisibility() == View.VISIBLE;
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean homeTabVisible = nativeHomeTab.isShown();
        boolean statusIsChild = statusView != null && statusView.getParent() == nativeContent;
        boolean originalUrlPreserved = equalsNullable(originalUrl, webView.getUrl());
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        requireUnauthenticatedSession(activity);
        if (shellState.optBoolean("proofKnown", true) || shellState.optBoolean("proofProven", true)
                || shellState.optBoolean("takeoverProven", true) || !shellState.optBoolean("readyNotified", false)
                || !shellState.optBoolean("homeStateSent", false) || !shellState.optBoolean("homeDataSent", false)
                || !shellState.optBoolean("homeSessionUnproven", false) || shellState.optInt("homeRows", -1) != 0
                || !"home".equals(shellState.optString("lastRoute"))
                || shellState.optBoolean("hasPrivateLibrary", true)
                || !rootVisible || statusBounds == null || !statusAttached || !unprovenStatusAttached
                || cardsAttached || !contentReady || !statusTitleVisible || !statusSubtitleVisible
                || !statusActionClickable || !splashHidden || !homeTabVisible || !webContainerVisible
                || !statusIsChild || !originalUrlPreserved || !"home".equals(currentScreen)) {
            throw new AssertionError("JavaScript handoff did not show a real status-only native Home without session proof");
        }
        Bundle state = new Bundle();
        state.putString("phase", "javascript_home_handoff");
        state.putBoolean("native_shell_handoff_from_packaged_javascript", true);
        state.putBoolean("native_ready_callback_sent", true);
        state.putBoolean("home_status_payload_sent", true);
        state.putBoolean("playlist_or_card_injected", false);
        state.putBoolean("native_home_cards_attached", false);
        state.putBoolean("native_home_status_attached", true);
        state.putBoolean("native_home_status_visible", true);
        state.putBoolean("native_home_status_login_action_clickable", true);
        state.putBoolean("native_home_content_ready", true);
        state.putBoolean("native_root_visible", true);
        state.putBoolean("native_home_tab_visible", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("webview_container_visible_under_native_root", true);
        state.putBoolean("original_webview_url_preserved", true);
        putBounds(state, "native_status_visible", statusBounds);
        putBounds(state, "native_root_visible", rootBounds);
        return state;
    }

    private WebView createMobileViewportFixture(final Activity activity, final int viewportWidth) throws Exception {
        final CountDownLatch pageFinished = new CountDownLatch(1);
        final WebView[] created = new WebView[1];
        final Throwable[] failure = new Throwable[1];
        final String html = "<!doctype html><html lang=\"en\"><head><meta charset=\"utf-8\">" +
                "<meta name=\"viewport\" content=\"width=" + viewportWidth + ",initial-scale=1.0,viewport-fit=cover\">" +
                "<style>html,body{margin:0;padding:0;min-height:100%;}#global-nav-bar{display:flex;width:100%;height:56px;}" +
                "#main-view{min-height:100vh;overflow-y:auto;}#Desktop_LeftSidebar_Id{position:fixed;left:0;top:56px;width:100vw;bottom:0;overflow-y:auto;}</style>" +
                "<script>window.SF_CONFIG={guiMode:'csshack',touchInput:true,screenWidth:" + viewportWidth + ",screenHeight:900};</script>" +
                "</head><body><header id=\"global-nav-bar\"></header>" +
                "<aside id=\"Desktop_LeftSidebar_Id\" aria-hidden=\"true\"><div style=\"height:960px\"></div></aside>" +
                "<main id=\"main-view\"><div class=\"contentSpacing\"><div style=\"height:1200px\"></div></div></main>" +
                "<main id=\"sf-melodix-home\"><button class=\"sf-melodix-home__card\" type=\"button\" aria-label=\"Layout hit target\"></button>" +
                "<div aria-hidden=\"true\" style=\"height:960px;min-height:960px;flex:none\"></div></main>" +
                "<nav id=\"sf-mobile-nav\" role=\"navigation\">" +
                "<button class=\"sf-mobile-nav__item\" data-sf-mobile-action=\"home\" type=\"button\"><svg aria-hidden=\"true\"></svg><span>Home</span></button>" +
                "<button class=\"sf-mobile-nav__item\" data-sf-mobile-action=\"search\" type=\"button\"><svg aria-hidden=\"true\"></svg><span>Search</span></button>" +
                "<button class=\"sf-mobile-nav__item\" data-sf-mobile-action=\"library\" type=\"button\"><svg aria-hidden=\"true\"></svg><span>Library</span></button></nav>" +
                "<aside data-testid=\"now-playing-bar\"><div><div data-testid=\"CoverSlotCollapsed__container\"></div>" +
                "<div data-testid=\"now-playing-widget\"><span class=\"sf-track-info\"></span></div></div>" +
                "<div><div data-testid=\"general-controls\"><button data-testid=\"control-button-playpause\" type=\"button\" aria-label=\"Playback control target\"></button></div></div></aside>" +
                "<div id=\"sf-fs-player\" style=\"display:none\"><button class=\"sf-fs-min\" type=\"button\"></button>" +
                "<button class=\"sf-fs-play\" type=\"button\"></button></div></body></html>";
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                try {
                    View root = activity.findViewById(android.R.id.content);
                    if (!(root instanceof ViewGroup)) throw new AssertionError("Activity content root is not a ViewGroup");
                    float density = activity.getResources().getDisplayMetrics().density;
                    if (!(density > 0.0f) || Float.isInfinite(density)) {
                        throw new AssertionError("Android display density is unavailable for the viewport fixture");
                    }
                    int fixtureWidthPixels = Math.max(1, (int) Math.floor(viewportWidth * density));
                    WebView rendererView = new WebView(activity);
                    created[0] = rendererView;
                    rendererView.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
                    rendererView.setFocusable(false);
                    rendererView.setFocusableInTouchMode(false);
                    rendererView.setClickable(false);
                    rendererView.setAlpha(0.0f);
                    rendererView.setBackgroundColor(0xFF101311);
                    WebSettings settings = rendererView.getSettings();
                    settings.setBlockNetworkLoads(true);
                    settings.setJavaScriptEnabled(true);
                    settings.setDomStorageEnabled(false);
                    // Match the primary Spotify WebView configuration in smali/m9.smali.
                    settings.setUseWideViewPort(false);
                    settings.setLoadWithOverviewMode(false);
                    settings.setTextZoom(100);
                    rendererView.setWebViewClient(new WebViewClient() {
                        @Override
                        public void onPageFinished(WebView view, String url) {
                            pageFinished.countDown();
                        }
                    });
                    // Keep the isolated measurement surface outside the visible app window.
                    // It remains attached and laid out, but cannot obscure or take focus from Spotify.
                    ((ViewGroup) root).addView(rendererView, new ViewGroup.LayoutParams(
                            fixtureWidthPixels, ViewGroup.LayoutParams.MATCH_PARENT));
                    rendererView.setTranslationX(Math.max(0, root.getWidth()));
                    rendererView.loadDataWithBaseURL(
                            "https://open.spotify.com/app", html, "text/html", "UTF-8",
                            "https://open.spotify.com/app");
                } catch (Throwable error) {
                    failure[0] = error;
                }
            }
        });
        if (failure[0] != null) {
            removeWebHomeRendererFixture(created[0]);
            throw new AssertionError("Could not create isolated mobile viewport fixture", failure[0]);
        }
        if (created[0] == null) throw new AssertionError("Mobile viewport fixture was not attached");
        try {
            if (!pageFinished.await(15L, TimeUnit.SECONDS)) {
                throw new AssertionError("Mobile viewport fixture did not finish loading");
            }
        } catch (InterruptedException interrupted) {
            removeWebHomeRendererFixture(created[0]);
            Thread.currentThread().interrupt();
            throw interrupted;
        } catch (AssertionError error) {
            removeWebHomeRendererFixture(created[0]);
            throw error;
        }
        return created[0];
    }

    private void installPackagedMobileViewportCss(
            WebView webView, Activity activity, int viewportWidth, int safeTopInsetDp) throws Exception {
        String cssSource = readPackagedAsset(activity, "css_hacks.css");
        if (!cssSource.contains("SF_MELODIX_HOME_STYLES_V1")) {
            throw new AssertionError("The exact Preview APK is missing the mobile shell CSS marker");
        }
        String script = "(function(){window.SF_CONFIG={guiMode:'csshack',touchInput:true,screenWidth:" + viewportWidth +
                ",screenHeight:900,statusBarHeight:" + safeTopInsetDp + "};" +
                "document.documentElement.style.setProperty('--sf-safe-area-top'," + JSONObject.quote(safeTopInsetDp + "px") + ");" +
                "var style=document.getElementById('sf-custom-style');if(!style){style=document.createElement('style');" +
                "style.id='sf-custom-style';document.head.appendChild(style);}style.textContent=" + JSONObject.quote(cssSource) + ";" +
                "document.body.className='sf-mobile-shell sf-fullscreen-disabled sf-melodix-home-active';" +
                "var home=document.getElementById('sf-melodix-home'),nav=document.getElementById('global-nav-bar');" +
                "if(home&&nav){home.style.setProperty('--sf-melodix-home-top',Math.ceil(nav.getBoundingClientRect().bottom)+'px');" +
                "home.style.setProperty('--sf-melodix-home-extra-safe-top','0px');}return true;})()";
        if (!"true".equals(evaluateJavascriptAndWait(webView, script))) {
            throw new AssertionError("Could not install packaged mobile CSS into the isolated viewport fixture");
        }
    }

    private Bundle runMobileViewportMatrix(
            final Activity activity, final WebView originalWebView, final String originalUrl) throws Exception {
        Bundle result = new Bundle();
        result.putString("phase", "mobile_viewport_layout_matrix");
        result.putBoolean("mobile_viewport_matrix_fixture_test_only", true);
        result.putBoolean("authenticated_home_test_performed", false);
        result.putString("mobile_viewport_matrix_widths_css_px", "360,384,393,412");
        result.putInt("mobile_viewport_matrix_case_count", MOBILE_VIEWPORT_MATRIX_WIDTHS.length);
        boolean measurementsComplete = true;
        boolean compactPassed = true;
        boolean libraryPassed = true;
        boolean expandedPassed = true;
        Bundle nativeInsets = measureAndroidWindowInsets(activity);
        result.putAll(nativeInsets);
        Bundle insetStatus = new Bundle(nativeInsets);
        insetStatus.putString("phase", "mobile_viewport_android_system_insets");
        insetStatus.putBoolean("mobile_viewport_matrix_fixture_test_only", true);
        insetStatus.putBoolean("authenticated_home_test_performed", false);
        sendStatus(1, insetStatus);
        int safeTopInsetDp = nativeInsets.getBoolean("android_window_insets_available", false)
                ? Math.max(0, Math.min(256, (int) Math.round(nativeInsets.getDouble("android_status_bar_inset_css_px", 0))))
                : statusBarInsetDp(activity);

        for (int viewportWidth : MOBILE_VIEWPORT_MATRIX_WIDTHS) {
            String stage = "fixture_create";
            notePhase("mobile_viewport_" + viewportWidth + "_" + stage);
            WebView fixture = null;
            try {
                fixture = createMobileViewportFixture(activity, viewportWidth);
                stage = "css_install";
                notePhase("mobile_viewport_" + viewportWidth + "_" + stage);
                installPackagedMobileViewportCss(fixture, activity, viewportWidth, safeTopInsetDp);
                stage = "probe_execute";
                notePhase("mobile_viewport_" + viewportWidth + "_" + stage);
                JSONObject probe = new JSONObject(evaluateJavascriptAndWait(fixture, MOBILE_VIEWPORT_LAYOUT_PROBE));
                stage = "probe_validate";
                notePhase("mobile_viewport_" + viewportWidth + "_" + stage);
                if (probe.optBoolean("probe_error", true) || !probe.optBoolean("fixture_test_only", false)) {
                    throw new AssertionError("Android WebView mobile viewport probe did not return fixture-only measurements");
                }
                org.json.JSONArray states = probe.optJSONArray("states");
                JSONObject compact = findViewportState(states, "compact");
                JSONObject libraryOpen = findViewportState(states, "library-open");
                JSONObject expanded = findViewportState(states, "expanded");
                if (compact == null || libraryOpen == null || expanded == null || states.length() != 3) {
                    throw new AssertionError("Android WebView mobile viewport probe returned an incomplete layout state set");
                }
                putViewportStateMetrics(result, viewportWidth, compact);
                putViewportStateMetrics(result, viewportWidth, libraryOpen);
                putViewportStateMetrics(result, viewportWidth, expanded);

                JSONObject compactViewport = compact.optJSONObject("viewport");
                JSONObject libraryViewport = libraryOpen.optJSONObject("viewport");
                JSONObject expandedViewport = expanded.optJSONObject("viewport");
                boolean widthMeasured = widthMatches(compactViewport, viewportWidth)
                        && widthMatches(libraryViewport, viewportWidth)
                        && widthMatches(expandedViewport, viewportWidth)
                        && boundedNumber(compactViewport, "visualWidth", -1) > 0
                        && boundedNumber(compactViewport, "visualScale", -1) > 0;
                String compactFailureCodes = compactViewportLayoutFailureCodes(compact, viewportWidth);
                String libraryFailureCodes = libraryViewportLayoutFailureCodes(libraryOpen, viewportWidth);
                String expandedFailureCodes = expandedViewportLayoutFailureCodes(expanded, viewportWidth);
                boolean compactCasePassed = compactFailureCodes.isEmpty();
                boolean libraryCasePassed = libraryFailureCodes.isEmpty();
                boolean expandedCasePassed = expandedFailureCodes.isEmpty();
                measurementsComplete &= widthMeasured;
                compactPassed &= compactCasePassed;
                libraryPassed &= libraryCasePassed;
                expandedPassed &= expandedCasePassed;
                result.putBoolean("mobile_viewport_" + viewportWidth + "_width_measured", widthMeasured);
                result.putBoolean("mobile_viewport_" + viewportWidth + "_compact_geometry_passed", compactCasePassed);
                result.putBoolean("mobile_viewport_" + viewportWidth + "_library_navigation_passed", libraryCasePassed);
                result.putBoolean("mobile_viewport_" + viewportWidth + "_expanded_overlay_passed", expandedCasePassed);
                String widthPrefix = "mobile_viewport_" + viewportWidth + "_";
                result.putString(widthPrefix + "compact_failure_codes", compactFailureCodes.isEmpty() ? "none" : compactFailureCodes);
                result.putString(widthPrefix + "library_failure_codes", libraryFailureCodes.isEmpty() ? "none" : libraryFailureCodes);
                result.putString(widthPrefix + "expanded_failure_codes", expandedFailureCodes.isEmpty() ? "none" : expandedFailureCodes);
                sendMobileViewportCaseStatus(viewportWidth, widthMeasured, compact, libraryOpen, expanded,
                        compactCasePassed, libraryCasePassed, expandedCasePassed,
                        compactFailureCodes, libraryFailureCodes, expandedFailureCodes);
                stage = "primary_webview_check";
            } catch (Throwable error) {
                reportMobileViewportFailure(viewportWidth, stage, error);
                if (error instanceof InterruptedException) Thread.currentThread().interrupt();
                if (error instanceof Exception) throw (Exception) error;
                if (error instanceof Error) throw (Error) error;
                throw new AssertionError("Android WebView mobile viewport measurement failed", error);
            } finally {
                removeWebHomeRendererFixture(fixture);
            }
            notePhase("mobile_viewport_" + viewportWidth + "_primary_webview_check");
            if (!originalWebViewStatePreserved(activity, originalWebView, originalUrl)) {
                reportMobileViewportFailure(viewportWidth, "primary_webview_check",
                        new AssertionError("The original Spotify WebView was not preserved"));
                throw new AssertionError("The isolated mobile viewport fixture changed or obscured the original Spotify WebView");
            }
        }

        result.putBoolean("mobile_viewport_matrix_measurements_complete", measurementsComplete);
        result.putBoolean("mobile_viewport_compact_geometry_passed", compactPassed);
        result.putBoolean("mobile_viewport_library_navigation_passed", libraryPassed);
        result.putBoolean("mobile_viewport_expanded_overlay_passed", expandedPassed);
        result.putBoolean("mobile_viewport_layout_contract_passed",
                measurementsComplete && compactPassed && libraryPassed && expandedPassed);
        result.putBoolean("original_login_webview_url_preserved", true);
        result.putBoolean("original_login_webview_still_visible", true);
        if (!measurementsComplete) {
            result.putString("phase", "mobile_viewport_matrix_width_validation_failed");
            result.putString("mobile_viewport_failure_type", "WidthMeasurementIncomplete");
            notePhase("mobile_viewport_matrix_width_validation_failed");
            sendStatus(2, result);
            throw new AssertionError("The Android WebView viewport-width matrix did not measure every requested CSS width");
        }
        if (!compactPassed || !libraryPassed || !expandedPassed) {
            result.putString("phase", "mobile_viewport_layout_contract_validation_failed");
            result.putString("mobile_viewport_failure_type", "LayoutContractMismatch");
            notePhase("mobile_viewport_layout_contract_validation_failed");
            sendStatus(2, result);
            throw new AssertionError("The Android WebView mobile layout contract failed at one or more measured widths");
        }
        return result;
    }

    private void sendMobileViewportCaseStatus(
            int width, boolean widthMeasured, JSONObject compact, JSONObject libraryOpen, JSONObject expanded,
            boolean compactPassed, boolean libraryPassed, boolean expandedPassed,
            String compactFailureCodes, String libraryFailureCodes, String expandedFailureCodes) {
        Bundle status = new Bundle();
        String prefix = "mobile_viewport_" + width + "_";
        status.putString("phase", "mobile_viewport_case_complete");
        status.putInt("mobile_viewport_current_width_css_px", width);
        status.putBoolean("mobile_viewport_matrix_fixture_test_only", true);
        status.putBoolean("authenticated_home_test_performed", false);
        status.putBoolean(prefix + "width_measured", widthMeasured);
        status.putBoolean(prefix + "compact_geometry_passed", compactPassed);
        status.putBoolean(prefix + "library_navigation_passed", libraryPassed);
        status.putBoolean(prefix + "expanded_overlay_passed", expandedPassed);
        status.putString(prefix + "compact_failure_codes", compactFailureCodes.isEmpty() ? "none" : compactFailureCodes);
        status.putString(prefix + "library_failure_codes", libraryFailureCodes.isEmpty() ? "none" : libraryFailureCodes);
        status.putString(prefix + "expanded_failure_codes", expandedFailureCodes.isEmpty() ? "none" : expandedFailureCodes);
        JSONObject compactViewport = compact.optJSONObject("viewport");
        JSONObject compactSafeArea = compact.optJSONObject("safeArea");
        JSONObject compactOverlap = compact.optJSONObject("overlap");
        putProbeNumber(status, prefix + "compact_inner_width_css_px", compactViewport, "innerWidth");
        putProbeNumber(status, prefix + "compact_inner_height_css_px", compactViewport, "innerHeight");
        putProbeNumber(status, prefix + "compact_visual_width_css_px", compactViewport, "visualWidth");
        putProbeNumber(status, prefix + "compact_visual_scale", compactViewport, "visualScale");
        putProbeNumber(status, prefix + "compact_device_pixel_ratio", compactViewport, "devicePixelRatio");
        putProbeNumber(status, prefix + "compact_safe_top_css_px", compactSafeArea, "topCustomInsetCssPx");
        putProbeNumber(status, prefix + "compact_bottom_inset_inferred_css_px", compactSafeArea, "bottomInsetInferredCssPx");
        putProbeNumber(status, prefix + "compact_dock_player_overlap_y_css_px", compactOverlap, "dockPlayerVerticalPx");
        JSONObject compactSurfaces = compact.optJSONObject("surfaces");
        JSONObject compactDock = surfaceState(compactSurfaces, "mobileNavigation");
        JSONObject compactPlayer = surfaceState(compactSurfaces, "player");
        status.putBoolean(prefix + "compact_dock_visible", surfaceVisible(compactDock));
        status.putBoolean(prefix + "compact_player_visible", surfaceVisible(compactPlayer));
        status.putString(prefix + "compact_dock_z_index", safeZIndex(compactDock == null ? null : compactDock.optJSONObject("style")));
        status.putString(prefix + "compact_player_z_index", safeZIndex(compactPlayer == null ? null : compactPlayer.optJSONObject("style")));
        JSONObject libraryOverlap = libraryOpen.optJSONObject("overlap");
        putProbeNumber(status, prefix + "library_dock_player_overlap_y_css_px", libraryOverlap, "dockPlayerVerticalPx");
        putProbeNumber(status, prefix + "library_sidebar_player_overlap_y_css_px", libraryOverlap, "sidebarPlayerVerticalPx");
        JSONObject libraryHits = libraryOpen.optJSONObject("hitTargets");
        status.putString(prefix + "library_sidebar_center_owner", safeProbeCategory(libraryHits, "sidebarCenterOwner"));
        JSONObject expandedHits = expanded.optJSONObject("hitTargets");
        status.putString(prefix + "expanded_center_owner", safeProbeCategory(expandedHits, "viewportCenterOwner"));
        sendStatus(1, status);
    }

    private void reportMobileViewportFailure(int width, String stage, Throwable error) {
        String safeStage = stage != null && stage.matches("[a-z0-9_]{1,32}") ? stage : "unknown";
        String errorType = safeProbeErrorType(error == null ? "Error" : error.getClass().getSimpleName());
        notePhase("mobile_viewport_" + width + "_" + safeStage + "_failed");
        Bundle status = new Bundle();
        status.putString("phase", "mobile_viewport_" + width + "_" + safeStage + "_failed");
        status.putInt("mobile_viewport_current_width_css_px", width);
        status.putString("mobile_viewport_failure_type", errorType);
        status.putBoolean("mobile_viewport_matrix_fixture_test_only", true);
        status.putBoolean("authenticated_home_test_performed", false);
        sendStatus(2, status);
        Log.e(HARNESS_TAG, "mobile viewport failure width=" + width + " stage=" + safeStage + " type=" + errorType);
    }

    private JSONObject findViewportState(org.json.JSONArray states, String name) {
        if (states == null) return null;
        for (int index = 0; index < states.length(); index++) {
            JSONObject state = states.optJSONObject(index);
            if (state != null && name.equals(state.optString("name", ""))) return state;
        }
        return null;
    }

    private boolean widthMatches(JSONObject viewport, int expectedWidth) {
        return viewport != null && Math.abs(boundedNumber(viewport, "innerWidth", -10000) - expectedWidth) <= 1.0;
    }

    private String compactViewportLayoutFailureCodes(JSONObject state, int expectedWidth) {
        if (state == null) return "state_missing";
        StringBuilder failures = new StringBuilder();
        if (!widthMatches(state.optJSONObject("viewport"), expectedWidth)) appendViewportFailureCode(failures, false, "width");
        JSONObject surfaces = state.optJSONObject("surfaces");
        JSONObject nav = surfaceState(surfaces, "mobileNavigation");
        JSONObject player = surfaceState(surfaces, "player");
        JSONObject home = surfaceState(surfaces, "home");
        JSONObject hitTargets = state.optJSONObject("hitTargets");
        JSONObject overlap = state.optJSONObject("overlap");
        JSONObject safeArea = state.optJSONObject("safeArea");
        JSONObject viewport = state.optJSONObject("viewport");
        JSONObject dockRect = nav == null ? null : nav.optJSONObject("rect");
        JSONObject playerRect = player == null ? null : player.optJSONObject("rect");
        double bottomInset = boundedNumber(safeArea, "bottomInsetInferredCssPx", 0);
        double expectedPlayerBottomGap = 78.0 + bottomInset;
        double expectedHomeBottomGap = 154.0 + bottomInset;
        JSONObject scroll = state.optJSONObject("scroll");
        appendViewportFailureCode(failures, surfaceVisible(nav), "nav_visible");
        appendViewportFailureCode(failures, surfaceVisible(player), "player_visible");
        appendViewportFailureCode(failures, surfaceVisible(home), "home_visible");
        appendViewportFailureCode(failures, surfacePosition(nav, "fixed"), "nav_fixed");
        appendViewportFailureCode(failures, surfacePosition(player, "fixed"), "player_fixed");
        appendViewportFailureCode(failures, surfacePosition(home, "fixed"), "home_fixed");
        appendViewportFailureCode(failures, dockRect != null && playerRect != null, "dock_player_bounds");
        appendViewportFailureCode(failures, dockRect != null
                && boundedNumber(dockRect, "height", -1) >= 72.0 + bottomInset - 1.0, "dock_height");
        appendViewportFailureCode(failures, Math.abs(boundedNumber(safeArea, "navBottomGapCssPx", 10000)) <= 1.0, "nav_bottom_gap");
        appendViewportFailureCode(failures, Math.abs(boundedNumber(safeArea, "playerBottomGapCssPx", 10000) - expectedPlayerBottomGap) <= 2.0, "player_bottom_gap");
        appendViewportFailureCode(failures, playerRect != null
                && Math.abs(boundedNumber(playerRect, "height", -1) - 68.0) <= 2.0, "player_height");
        appendViewportFailureCode(failures, Math.abs(boundedNumber(safeArea, "homeBottomGapCssPx", 10000) - expectedHomeBottomGap) <= 2.0, "home_bottom_gap");
        appendViewportFailureCode(failures, boundedNumber(overlap, "dockPlayerVerticalPx", 10000) <= 1.0, "dock_player_overlap");
        appendViewportFailureCode(failures, navigationTargetsReachable(hitTargets), "nav_targets");
        appendViewportFailureCode(failures, hitTargetMeetsMinimum(hitTargets == null ? null : hitTargets.optJSONObject("playPause"), 44), "play_target");
        appendViewportFailureCode(failures, hitTargetMeetsMinimum(hitTargets == null ? null : hitTargets.optJSONObject("homeCard"), 44), "home_card_target");
        appendViewportFailureCode(failures, boundedNumber(scroll, "documentHorizontalOverflow", 10000) <= 1.0, "document_overflow");
        appendViewportFailureCode(failures, boundedNumber(scroll, "bodyHorizontalOverflow", 10000) <= 1.0, "body_overflow");
        appendViewportFailureCode(failures, boundedNumber(scroll, "homeHorizontalOverflow", 10000) <= 1.0, "home_overflow");
        appendViewportFailureCode(failures, boundedNumber(scroll, "homeVerticalOverflow", 0) > 0, "home_scroll");
        appendViewportFailureCode(failures, boundedNumber(viewport, "innerHeight", 0) > 0, "viewport_height");
        return failures.toString();
    }

    private String libraryViewportLayoutFailureCodes(JSONObject state, int expectedWidth) {
        if (state == null) return "state_missing";
        StringBuilder failures = new StringBuilder();
        if (!widthMatches(state.optJSONObject("viewport"), expectedWidth)) appendViewportFailureCode(failures, false, "width");
        JSONObject surfaces = state.optJSONObject("surfaces");
        JSONObject nav = surfaceState(surfaces, "mobileNavigation");
        JSONObject sidebar = surfaceState(surfaces, "sidebar");
        JSONObject hitTargets = state.optJSONObject("hitTargets");
        JSONObject overlap = state.optJSONObject("overlap");
        JSONObject scroll = state.optJSONObject("scroll");
        JSONObject viewport = state.optJSONObject("viewport");
        JSONObject safeArea = state.optJSONObject("safeArea");
        JSONObject sidebarRect = sidebar == null ? null : sidebar.optJSONObject("rect");
        double bottomInset = boundedNumber(safeArea, "bottomInsetInferredCssPx", 0);
        double sidebarBottomGap = sidebarRect == null ? -1
                : boundedNumber(viewport, "innerHeight", 0) - boundedNumber(sidebarRect, "bottom", 0);
        appendViewportFailureCode(failures, surfaceVisible(nav), "nav_visible");
        appendViewportFailureCode(failures, surfaceVisible(sidebar), "sidebar_visible");
        appendViewportFailureCode(failures, surfacePosition(nav, "fixed"), "nav_fixed");
        appendViewportFailureCode(failures, navigationTargetsReachable(hitTargets), "nav_targets");
        appendViewportFailureCode(failures, "desktop-sidebar".equals(safeProbeCategory(hitTargets, "sidebarCenterOwner")), "sidebar_hit");
        appendViewportFailureCode(failures, boundedNumber(scroll, "sidebarVerticalOverflow", 0) > 0, "sidebar_scroll");
        appendViewportFailureCode(failures, Math.abs(sidebarBottomGap - (154.0 + bottomInset)) <= 2.0, "sidebar_bottom_gap");
        appendViewportFailureCode(failures, boundedNumber(overlap, "dockPlayerVerticalPx", 10000) <= 1.0, "dock_player_overlap");
        appendViewportFailureCode(failures, boundedNumber(overlap, "sidebarPlayerVerticalPx", 10000) <= 1.0, "sidebar_player_overlap");
        return failures.toString();
    }

    private String expandedViewportLayoutFailureCodes(JSONObject state, int expectedWidth) {
        if (state == null) return "state_missing";
        StringBuilder failures = new StringBuilder();
        if (!widthMatches(state.optJSONObject("viewport"), expectedWidth)) appendViewportFailureCode(failures, false, "width");
        JSONObject viewport = state.optJSONObject("viewport");
        JSONObject surfaces = state.optJSONObject("surfaces");
        JSONObject full = surfaceState(surfaces, "fullscreenPlayer");
        JSONObject nav = surfaceState(surfaces, "mobileNavigation");
        JSONObject rect = full == null ? null : full.optJSONObject("rect");
        JSONObject hits = state.optJSONObject("hitTargets");
        JSONObject fullPlay = hits == null ? null : hits.optJSONObject("fullscreenPlay");
        appendViewportFailureCode(failures, surfaceVisible(full), "fullscreen_visible");
        appendViewportFailureCode(failures, surfacePosition(full, "fixed"), "fullscreen_fixed");
        appendViewportFailureCode(failures, rect != null, "fullscreen_bounds");
        appendViewportFailureCode(failures, rect != null && Math.abs(boundedNumber(rect, "left", 10000)) <= 1.0, "fullscreen_left");
        appendViewportFailureCode(failures, rect != null && Math.abs(boundedNumber(rect, "top", 10000)) <= 1.0, "fullscreen_top");
        appendViewportFailureCode(failures, rect != null
                && boundedNumber(rect, "width", -1) >= boundedNumber(viewport, "innerWidth", 10000) - 1.0, "fullscreen_width");
        appendViewportFailureCode(failures, rect != null
                && boundedNumber(rect, "height", -1) >= boundedNumber(viewport, "innerHeight", 10000) - 1.0, "fullscreen_height");
        // The mobile CSS intentionally keeps the bottom dock above the fullscreen player.
        // Validate both layers by their real hit targets instead of treating the dock as hidden.
        appendViewportFailureCode(failures, surfaceVisible(nav), "dock_visible");
        appendViewportFailureCode(failures, surfacePosition(nav, "fixed"), "dock_fixed");
        appendViewportFailureCode(failures, navigationTargetsReachable(hits), "dock_targets");
        appendViewportFailureCode(failures, "fullscreen-player".equals(safeProbeCategory(hits, "viewportCenterOwner")), "fullscreen_hit");
        appendViewportFailureCode(failures, hitTargetMeetsMinimum(fullPlay, 44), "fullscreen_play_target");
        appendViewportFailureCode(failures, fullPlay != null && fullPlay.optBoolean("reachable", false)
                && "fullscreen-player".equals(safeProbeCategory(fullPlay, "owner")), "fullscreen_play_hit");
        return failures.toString();
    }

    private void appendViewportFailureCode(StringBuilder failures, boolean passed, String code) {
        if (passed || failures == null || code == null) return;
        int count = 1;
        for (int index = 0; index < failures.length(); index++) {
            if (failures.charAt(index) == ',') count++;
        }
        if (count > 6) return;
        if (failures.length() > 0) failures.append(',');
        failures.append(code);
    }

    private boolean navigationTargetsReachable(JSONObject hitTargets) {
        if (hitTargets == null) return false;
        org.json.JSONArray targets = hitTargets.optJSONArray("navigation");
        if (targets == null || targets.length() != 3) return false;
        for (int index = 0; index < targets.length(); index++) {
            JSONObject target = targets.optJSONObject(index);
            if (!hitTargetMeetsMinimum(target, 44)
                    || !target.optBoolean("reachable", false)
                    || !"mobile-navigation".equals(safeProbeCategory(target, "owner"))) return false;
        }
        return true;
    }

    private boolean hitTargetMeetsMinimum(JSONObject target, double minimumCssPx) {
        return target != null && target.optBoolean("available", true)
                && boundedNumber(target, "width", -1) >= minimumCssPx
                && boundedNumber(target, "height", -1) >= minimumCssPx;
    }

    private JSONObject surfaceState(JSONObject surfaces, String name) {
        return surfaces == null ? null : surfaces.optJSONObject(name);
    }

    private boolean surfaceVisible(JSONObject surface) {
        return surface != null && surface.optBoolean("present", false) && surface.optBoolean("visible", false);
    }

    private boolean surfacePosition(JSONObject surface, String position) {
        JSONObject style = surface == null ? null : surface.optJSONObject("style");
        return style != null && position.equals(safeProbeCategory(style, "position"));
    }

    private String safeProbeCategory(JSONObject object, String name) {
        if (object == null) return "unavailable";
        Object value = object.opt(name);
        if (!(value instanceof String)) return "unavailable";
        String text = (String) value;
        return text.matches("[a-z-]{1,32}") ? text : "other";
    }

    private double boundedNumber(JSONObject object, String name, double fallback) {
        if (object == null) return fallback;
        Object value = object.opt(name);
        if (!(value instanceof Number)) return fallback;
        double number = ((Number) value).doubleValue();
        if (Double.isNaN(number) || Double.isInfinite(number)) return fallback;
        return Math.max(-10000.0, Math.min(10000.0, number));
    }

    private Bundle measureAndroidWindowInsets(final Activity activity) {
        final Bundle result = new Bundle();
        result.putBoolean("android_window_insets_available", false);
        result.putBoolean("android_window_bar_visibility_available", false);
        final float density = activity.getResources().getDisplayMetrics().density;
        result.putDouble("android_display_density_scale", density > 0 ? Math.min(10.0, density) : 0);
        try {
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    WindowInsets windowInsets = activity.getWindow().getDecorView().getRootWindowInsets();
                    if (windowInsets == null) return;
                    int statusTopPx;
                    int statusBottomPx;
                    int navigationTopPx;
                    int navigationBottomPx;
                    if (Build.VERSION.SDK_INT >= 30) {
                        Insets status = windowInsets.getInsets(WindowInsets.Type.statusBars());
                        Insets navigation = windowInsets.getInsets(WindowInsets.Type.navigationBars());
                        statusTopPx = status.top;
                        statusBottomPx = status.bottom;
                        navigationTopPx = navigation.top;
                        navigationBottomPx = navigation.bottom;
                        result.putBoolean("android_window_bar_visibility_available", true);
                        result.putBoolean("android_status_bar_visible", windowInsets.isVisible(WindowInsets.Type.statusBars()));
                        result.putBoolean("android_navigation_bar_visible", windowInsets.isVisible(WindowInsets.Type.navigationBars()));
                    } else {
                        statusTopPx = windowInsets.getSystemWindowInsetTop();
                        statusBottomPx = 0;
                        navigationTopPx = 0;
                        navigationBottomPx = windowInsets.getSystemWindowInsetBottom();
                    }
                    int topPx = Math.max(0, Math.min(10000, statusTopPx));
                    int bottomPx = Math.max(0, Math.min(10000, navigationBottomPx));
                    result.putBoolean("android_window_insets_available", true);
                    result.putInt("android_status_bar_inset_px", topPx);
                    result.putInt("android_status_bar_bottom_inset_px", Math.max(0, Math.min(10000, statusBottomPx)));
                    result.putInt("android_navigation_bar_top_inset_px", Math.max(0, Math.min(10000, navigationTopPx)));
                    result.putInt("android_navigation_bar_inset_px", bottomPx);
                    result.putDouble("android_status_bar_inset_css_px", density > 0 ? Math.min(10000.0, topPx / density) : 0);
                    result.putDouble("android_navigation_bar_inset_css_px", density > 0 ? Math.min(10000.0, bottomPx / density) : 0);
                }
            });
        } catch (Throwable ignored) {
            result.putBoolean("android_window_insets_available", false);
        }
        return result;
    }

    private int statusBarInsetDp(Activity activity) {
        try {
            int resourceId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
            if (resourceId == 0) return 0;
            float density = activity.getResources().getDisplayMetrics().density;
            if (density <= 0) return 0;
            return Math.max(0, Math.min(256, Math.round(activity.getResources().getDimensionPixelSize(resourceId) / density)));
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private boolean originalWebViewStatePreserved(final Activity activity, final WebView originalWebView, final String originalUrl) {
        final boolean[] preserved = new boolean[1];
        try {
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    preserved[0] = originalWebView != null
                            && equalsNullable(originalUrl, originalWebView.getUrl())
                            && visibleBounds(originalWebView) != null;
                }
            });
        } catch (Throwable ignored) {
            return false;
        }
        return preserved[0];
    }

    private void putViewportStateMetrics(Bundle bundle, int width, JSONObject probeState) {
        String stateName = safeProbeCategory(probeState, "name");
        String prefix = "mobile_viewport_" + width + "_" + stateName + "_";
        JSONObject viewport = probeState.optJSONObject("viewport");
        JSONObject safeArea = probeState.optJSONObject("safeArea");
        JSONObject surfaces = probeState.optJSONObject("surfaces");
        JSONObject overlap = probeState.optJSONObject("overlap");
        JSONObject hits = probeState.optJSONObject("hitTargets");
        JSONObject scroll = probeState.optJSONObject("scroll");
        putProbeNumber(bundle, prefix + "inner_width_css_px", viewport, "innerWidth");
        putProbeNumber(bundle, prefix + "inner_height_css_px", viewport, "innerHeight");
        putProbeNumber(bundle, prefix + "screen_width_css_px", viewport, "screenWidth");
        putProbeNumber(bundle, prefix + "screen_height_css_px", viewport, "screenHeight");
        putProbeNumber(bundle, prefix + "visual_width_css_px", viewport, "visualWidth");
        putProbeNumber(bundle, prefix + "visual_height_css_px", viewport, "visualHeight");
        putProbeNumber(bundle, prefix + "visual_scale", viewport, "visualScale");
        putProbeNumber(bundle, prefix + "device_pixel_ratio", viewport, "devicePixelRatio");
        bundle.putString(prefix + "orientation", safeProbeCategory(viewport, "orientation"));
        bundle.putBoolean(prefix + "portrait_media_query", viewport != null
                && probeState.optJSONObject("media") != null && probeState.optJSONObject("media").optBoolean("portrait", false));
        bundle.putBoolean(prefix + "viewport_fit_cover", safeArea != null && safeArea.optBoolean("viewportFitCover", false));
        putProbeNumber(bundle, prefix + "safe_top_css_px", safeArea, "topCustomInsetCssPx");
        putProbeNumber(bundle, prefix + "nav_bottom_gap_css_px", safeArea, "navBottomGapCssPx");
        putProbeNumber(bundle, prefix + "home_bottom_gap_css_px", safeArea, "homeBottomGapCssPx");
        putProbeNumber(bundle, prefix + "bottom_inset_inferred_css_px", safeArea, "bottomInsetInferredCssPx");
        putProbeNumber(bundle, prefix + "player_bottom_gap_css_px", safeArea, "playerBottomGapCssPx");
        putProbeNumber(bundle, prefix + "dock_player_overlap_y_css_px", overlap, "dockPlayerVerticalPx");
        putProbeNumber(bundle, prefix + "sidebar_player_overlap_y_css_px", overlap, "sidebarPlayerVerticalPx");
        putProbeNumber(bundle, prefix + "home_player_overlap_y_css_px", overlap, "homePlayerVerticalPx");
        bundle.putBoolean(prefix + "dock_player_intersecting", overlap != null && overlap.optBoolean("dockPlayerIntersecting", false));
        bundle.putBoolean(prefix + "sidebar_player_intersecting", overlap != null && overlap.optBoolean("sidebarPlayerIntersecting", false));
        putViewportSurfaceMetrics(bundle, prefix + "dock_", surfaceState(surfaces, "mobileNavigation"));
        putViewportSurfaceMetrics(bundle, prefix + "player_", surfaceState(surfaces, "player"));
        putViewportSurfaceMetrics(bundle, prefix + "home_", surfaceState(surfaces, "home"));
        putViewportSurfaceMetrics(bundle, prefix + "sidebar_", surfaceState(surfaces, "sidebar"));
        putViewportSurfaceMetrics(bundle, prefix + "fullscreen_", surfaceState(surfaces, "fullscreenPlayer"));
        putProbeNumber(bundle, prefix + "document_horizontal_overflow_css_px", scroll, "documentHorizontalOverflow");
        putProbeNumber(bundle, prefix + "body_horizontal_overflow_css_px", scroll, "bodyHorizontalOverflow");
        putProbeNumber(bundle, prefix + "main_horizontal_overflow_css_px", scroll, "mainHorizontalOverflow");
        putProbeNumber(bundle, prefix + "main_vertical_overflow_css_px", scroll, "mainVerticalOverflow");
        putProbeNumber(bundle, prefix + "home_horizontal_overflow_css_px", scroll, "homeHorizontalOverflow");
        putProbeNumber(bundle, prefix + "home_vertical_overflow_css_px", scroll, "homeVerticalOverflow");
        putProbeNumber(bundle, prefix + "sidebar_vertical_overflow_css_px", scroll, "sidebarVerticalOverflow");
        bundle.putString(prefix + "sidebar_center_owner", safeProbeCategory(hits, "sidebarCenterOwner"));
        bundle.putBoolean(prefix + "navigation_targets_reachable", navigationTargetsReachable(hits));
        JSONObject playPause = hits == null ? null : hits.optJSONObject("playPause");
        putProbeNumber(bundle, prefix + "play_pause_target_width_css_px", playPause, "width");
        putProbeNumber(bundle, prefix + "play_pause_target_height_css_px", playPause, "height");
        bundle.putString(prefix + "play_pause_target_owner", safeProbeCategory(playPause, "owner"));
        JSONObject homeCard = hits == null ? null : hits.optJSONObject("homeCard");
        putProbeNumber(bundle, prefix + "home_card_target_width_css_px", homeCard, "width");
        putProbeNumber(bundle, prefix + "home_card_target_height_css_px", homeCard, "height");
        bundle.putString(prefix + "home_card_target_owner", safeProbeCategory(homeCard, "owner"));
        bundle.putString(prefix + "viewport_center_owner", safeProbeCategory(hits, "viewportCenterOwner"));
    }

    private void putViewportSurfaceMetrics(Bundle bundle, String prefix, JSONObject surface) {
        bundle.putBoolean(prefix + "present", surface != null && surface.optBoolean("present", false));
        bundle.putBoolean(prefix + "visible", surface != null && surface.optBoolean("visible", false));
        JSONObject style = surface == null ? null : surface.optJSONObject("style");
        bundle.putString(prefix + "position", safeProbeCategory(style, "position"));
        bundle.putString(prefix + "display", safeProbeCategory(style, "display"));
        bundle.putString(prefix + "z_index", safeZIndex(style));
        JSONObject rect = surface == null ? null : surface.optJSONObject("rect");
        putProbeNumber(bundle, prefix + "left_css_px", rect, "left");
        putProbeNumber(bundle, prefix + "top_css_px", rect, "top");
        putProbeNumber(bundle, prefix + "right_css_px", rect, "right");
        putProbeNumber(bundle, prefix + "bottom_css_px", rect, "bottom");
        putProbeNumber(bundle, prefix + "width_css_px", rect, "width");
        putProbeNumber(bundle, prefix + "height_css_px", rect, "height");
    }

    private String safeZIndex(JSONObject style) {
        if (style == null) return "unavailable";
        Object value = style.opt("zIndex");
        if (value instanceof Number) {
            return String.valueOf(Math.max(-10000, Math.min(10000, ((Number) value).intValue())));
        }
        return "auto".equals(value) || "other".equals(value) ? (String) value : "unavailable";
    }

    private void putProbeNumber(Bundle bundle, String key, JSONObject object, String name) {
        if (object == null) return;
        Object value = object.opt(name);
        if (!(value instanceof Number)) return;
        double number = ((Number) value).doubleValue();
        if (Double.isNaN(number) || Double.isInfinite(number)) return;
        bundle.putDouble(key, Math.max(-10000.0, Math.min(10000.0, number)));
    }

    private void installPackagedWebHomeRenderer(WebView webView, Activity activity) throws Exception {
        String rendererSource = readPackagedAsset(activity, "melodix_home.js");
        String cssSource = readPackagedAsset(activity, "css_hacks.css");
        if (!rendererSource.contains("SF_MELODIX_HOME_STYLES_V1") || !cssSource.contains("SF_MELODIX_HOME_STYLES_V1")) {
            throw new AssertionError("The exact Preview APK is missing the Home renderer or CSS marker");
        }
        evaluateJavascriptAndWait(webView, rendererSource);
        // Match c91's first-page CSS injection: css_hacks.css plus the dark-mode
        // overlay, runtime body classes, then the style-ready event. A clean
        // install has E/Q/R/T=false in AppSingleton, so the overlay is empty,
        // sf-video-bg and sf-fullscreen-disabled are active, and the status-bar
        // class is absent. o6 repeats the CSS/body-class update without the
        // event; the renderer's stylesheet observer covers that settings path.
        String darkModeCss = "";
        String bodyModeCommands = "document.body.classList.remove('sf-canvas-blur', 'sf-video-bg', " +
                "'sf-fullscreen-enabled', 'sf-fullscreen-disabled', 'sf-hide-canvas', 'sf-statusbar-hidden');" +
                "document.body.classList.add('sf-video-bg');" +
                "document.body.classList.add('sf-fullscreen-disabled');";
        String cssInjection = "(function() {  let style = document.getElementById('sf-custom-style'); " +
                "if(!style) { style = document.createElement('style'); style.id = 'sf-custom-style'; " +
                "document.head.appendChild(style); }  style.textContent = " + JSONObject.quote(cssSource) +
                " + " + JSONObject.quote(darkModeCss) + ";  " + bodyModeCommands +
                "; try { window.dispatchEvent(new Event('sf-melodix-home-styles-ready')); } catch (_) {} })();";
        evaluateJavascriptAndWait(webView, cssInjection);
    }

    private String readPackagedAsset(Context context, String name) throws Exception {
        try (InputStream input = context.getAssets().open(name);
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) >= 0) output.write(buffer, 0, read);
            return output.toString("UTF-8");
        }
    }

    private String evaluateJavascriptAndWait(final WebView webView, final String script) throws InterruptedException {
        final CountDownLatch received = new CountDownLatch(1);
        final String[] result = new String[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                webView.evaluateJavascript(script, new ValueCallback<String>() {
                    @Override
                    public void onReceiveValue(String value) {
                        result[0] = value;
                        received.countDown();
                    }
                });
            }
        });
        if (!received.await(15L, TimeUnit.SECONDS)) {
            throw new AssertionError("Packaged Home renderer script did not return from Android WebView");
        }
        return result[0];
    }

    private void awaitWebHomeRendererVisible(WebView webView) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 15000L;
        while (System.currentTimeMillis() < deadline) {
            if ("true".equals(evaluateJavascriptAndWait(webView, WEB_HOME_RENDERER_VISIBLE_PROBE))) return;
            waitForIdleSync();
            Thread.sleep(100L);
        }
        sendWebHomeRendererDiagnostics(webView);
        throw new AssertionError("Packaged Home renderer did not visibly activate on the native /app recovery route");
    }

    private Bundle inspectWebHomeColorStates(WebView webView) {
        Bundle state = new Bundle();
        state.putString("phase", "web_home_computed_color_contrast_fixture");
        state.putBoolean("web_home_color_contrast_fixture_test_only", false);
        state.putBoolean("authenticated_home_test_performed", false);
        state.putBoolean("web_home_color_probe_completed", false);
        state.putBoolean("web_home_color_probe_error", false);
        state.putString("web_home_color_probe_error_type", "none");
        state.putBoolean("web_home_dark_theme_computed", false);
        state.putBoolean("web_home_light_theme_available", false);
        state.putBoolean("web_home_color_state_scenarios_complete", false);
        state.putBoolean("web_home_all_states_wcag_aa_pass", false);
        state.putBoolean("web_home_color_probe_validation_passed", false);
        try {
            JSONObject probe = new JSONObject(evaluateJavascriptAndWait(webView, WEB_HOME_COLOR_STATES_PROBE));
            boolean probeError = probe.optBoolean("probe_error", true);
            boolean fixtureOnly = probe.optBoolean("fixture_test_only");
            boolean darkTheme = "dark".equals(probe.optString("theme_mode"));
            boolean lightThemeAvailable = probe.optBoolean("light_theme_available");
            org.json.JSONArray scenarios = probe.optJSONArray("scenarios");
            boolean scenariosComplete = scenarios != null && scenarios.length() == 5;
            state.putBoolean("web_home_color_contrast_fixture_test_only", fixtureOnly);
            state.putBoolean("web_home_color_probe_completed", !probeError);
            state.putBoolean("web_home_color_probe_error", probeError);
            state.putString("web_home_color_probe_error_type", safeProbeErrorType(
                    probe.optString("probe_error_type", probeError ? "ProbeError" : "none")));
            state.putBoolean("web_home_dark_theme_computed", darkTheme);
            state.putBoolean("web_home_light_theme_available", lightThemeAvailable);
            state.putBoolean("web_home_color_state_scenarios_complete", scenariosComplete);

            String[] names = new String[] { "normal", "loading", "empty", "error", "partial" };
            String[] expectedStatus = new String[] { "none", "loading", "empty", "error", "error" };
            int[] expectedCards = new int[] { 2, 0, 0, 0, 2 };
            String[] colors = new String[] {
                    "background_base", "background_gradient_peak", "home_text", "brand", "greeting",
                    "section_title", "card_title", "card_subtitle", "gradient_token", "status_background",
                    "status_title", "status_body", "retry_button_text", "retry_button_background", "retry_focus_outline"
            };
            String[] ratios = new String[] {
                    "home_text", "brand", "greeting", "section_title", "card_title", "card_subtitle",
                    "status_title", "status_body", "retry_button_text", "retry_button_fill", "retry_focus_outline"
            };
            boolean validationPass = fixtureOnly && darkTheme && !lightThemeAvailable && scenariosComplete;
            boolean allContrastPass = scenariosComplete;
            for (int index = 0; index < names.length; index++) {
                JSONObject scenario = scenarios == null ? null : scenarios.optJSONObject(index);
                String name = names[index];
                if (scenario == null) {
                    scenariosComplete = false;
                    validationPass = false;
                    allContrastPass = false;
                    state.putBoolean("web_home_" + name + "_state_visible", false);
                    state.putBoolean("web_home_" + name + "_state_wcag_aa_pass", false);
                    state.putBoolean("web_home_" + name + "_state_partial_data", false);
                    state.putInt("web_home_" + name + "_state_card_count", 0);
                    state.putString("web_home_" + name + "_state_library_status", "missing");
                    continue;
                }
                boolean visible = scenario.optBoolean("home_visible");
                boolean scenarioContrastPass = scenario.optBoolean("all_contrast_pass");
                int cardCount = scenario.optInt("card_count", -1);
                boolean partial = scenario.optBoolean("partial_data");
                String statusName = scenario.optString("status_state", "missing");
                boolean scenarioStructureValid = visible && cardCount == expectedCards[index] &&
                        expectedStatus[index].equals(statusName) && partial == "partial".equals(name) &&
                        scenario.optBoolean("background_gradient_present");
                if (!scenarioStructureValid || !scenarioContrastPass) validationPass = false;
                state.putBoolean("web_home_" + name + "_state_visible", visible);
                state.putBoolean("web_home_" + name + "_state_partial_data", partial);
                state.putInt("web_home_" + name + "_state_card_count", Math.max(0, Math.min(3, cardCount)));
                state.putString("web_home_" + name + "_state_library_status", statusName);
                JSONObject colorValues = scenario.optJSONObject("colors");
                if (colorValues != null) {
                    for (String color : colors) {
                        String value = colorValues.optString(color, "");
                        if (!value.isEmpty()) state.putString("web_home_" + name + "_color_" + color, value);
                    }
                }
                JSONObject ratiosForState = scenario.optJSONObject("contrast_ratios");
                String[] requiredRatios = "normal".equals(name)
                        ? new String[] { "home_text", "brand", "greeting", "section_title", "card_title", "card_subtitle" }
                        : "loading".equals(name) || "empty".equals(name)
                                ? new String[] { "home_text", "brand", "greeting", "status_title", "status_body" }
                                : "error".equals(name)
                                        ? new String[] { "home_text", "brand", "greeting", "status_title", "status_body", "retry_button_text", "retry_button_fill" }
                                        : new String[] { "home_text", "brand", "greeting", "section_title", "card_title", "card_subtitle", "status_title", "status_body", "retry_button_text", "retry_button_fill" };
                boolean requiredRatiosPresent = ratiosForState != null && ratiosForState.length() > 0;
                for (String required : requiredRatios) {
                    if (ratiosForState == null || !ratiosForState.has(required) || ratiosForState.isNull(required)) {
                        requiredRatiosPresent = false;
                    }
                }
                if (!requiredRatiosPresent) validationPass = false;
                boolean stateContrastPass = scenarioContrastPass && requiredRatiosPresent;
                for (String ratioName : ratios) {
                    if (ratiosForState == null || !ratiosForState.has(ratioName) || ratiosForState.isNull(ratioName)) continue;
                    double ratio = ratiosForState.optDouble(ratioName, Double.NaN);
                    if (Double.isNaN(ratio) || Double.isInfinite(ratio)) {
                        stateContrastPass = false;
                        validationPass = false;
                        continue;
                    }
                    state.putDouble("web_home_" + name + "_contrast_" + ratioName, ratio);
                    if (ratio < 4.5) stateContrastPass = false;
                }
                if (!stateContrastPass) allContrastPass = false;
                state.putBoolean("web_home_" + name + "_state_wcag_aa_pass", stateContrastPass);
            }
            state.putBoolean("web_home_color_state_scenarios_complete", scenariosComplete);
            state.putBoolean("web_home_all_states_wcag_aa_pass", allContrastPass);
            state.putBoolean("web_home_color_probe_validation_passed", validationPass && allContrastPass && scenariosComplete);
        } catch (InterruptedException error) {
            Thread.currentThread().interrupt();
            state.putBoolean("web_home_color_probe_error", true);
            state.putString("web_home_color_probe_error_type", safeExceptionType(error));
        } catch (Throwable error) {
            state.putBoolean("web_home_color_probe_error", true);
            state.putString("web_home_color_probe_error_type", safeExceptionType(error));
        }
        state.putString("web_home_color_probe_validation_summary", summarizeWebHomeColorProbe(state));
        return state;
    }

    private String summarizeWebHomeColorProbe(Bundle state) {
        StringBuilder summary = new StringBuilder();
        summary.append("completed=").append(state.getBoolean("web_home_color_probe_completed"))
                .append(",error=").append(state.getBoolean("web_home_color_probe_error"))
                .append(":").append(state.getString("web_home_color_probe_error_type", "none"))
                .append(",validated=").append(state.getBoolean("web_home_color_probe_validation_passed"))
                .append(",scenarios_complete=").append(state.getBoolean("web_home_color_state_scenarios_complete"))
                .append(",dark=").append(state.getBoolean("web_home_dark_theme_computed"))
                .append(",light_available=").append(state.getBoolean("web_home_light_theme_available"));
        String[] names = new String[] { "normal", "loading", "empty", "error", "partial" };
        String[] ratioNames = new String[] {
                "home_text", "brand", "greeting", "section_title", "card_title", "card_subtitle",
                "status_title", "status_body", "retry_button_text", "retry_button_fill", "retry_focus_outline"
        };
        for (String name : names) {
            String statusName = state.getString("web_home_" + name + "_state_library_status", "missing");
            if (!("none".equals(statusName) || "loading".equals(statusName) || "empty".equals(statusName) ||
                    "error".equals(statusName) || "missing".equals(statusName))) statusName = "other";
            double minRatio = Double.POSITIVE_INFINITY;
            String minRatioName = "none";
            for (String ratioName : ratioNames) {
                String key = "web_home_" + name + "_contrast_" + ratioName;
                if (!state.containsKey(key)) continue;
                double ratio = state.getDouble(key, Double.NaN);
                if (!Double.isNaN(ratio) && !Double.isInfinite(ratio) && ratio < minRatio) {
                    minRatio = ratio;
                    minRatioName = ratioName;
                }
            }
            summary.append(';').append(name)
                    .append(":visible=").append(state.getBoolean("web_home_" + name + "_state_visible"))
                    .append(",cards=").append(state.getInt("web_home_" + name + "_state_card_count"))
                    .append(",status=").append(statusName)
                    .append(",partial=").append(state.getBoolean("web_home_" + name + "_state_partial_data"))
                    .append(",AA=").append(state.getBoolean("web_home_" + name + "_state_wcag_aa_pass"))
                    .append(",min=");
            if (Double.isInfinite(minRatio)) summary.append("none");
            else summary.append(minRatioName).append(':').append(Math.round(minRatio * 100.0) / 100.0);
        }
        return summary.toString();
    }

    private String safeProbeErrorType(String value) {
        String errorType = value == null ? "ProbeError" : value;
        return errorType.matches("[A-Za-z0-9_$]{1,48}") ? errorType : "ProbeError";
    }

    private String safeExceptionType(Throwable error) {
        String errorType = error == null ? "Error" : error.getClass().getSimpleName();
        return errorType.matches("[A-Za-z0-9_$]{1,48}") ? errorType : "Error";
    }

    private void sendWebHomeRendererDiagnostics(WebView webView) {
        Bundle state = new Bundle();
        state.putString("phase", "web_home_renderer_diagnostic_probe");
        try {
            JSONObject probe = new JSONObject(evaluateJavascriptAndWait(
                    webView, WEB_HOME_RENDERER_DIAGNOSTIC_PROBE));
            state.putBoolean("web_home_probe_diagnostics_available", true);
            state.putBoolean("web_home_probe_fixture_test_only", true);
            state.putBoolean("web_home_probe_route_app", probe.optBoolean("route_app"));
            state.putBoolean("web_home_probe_mode_csshack", probe.optBoolean("mode_csshack"));
            state.putBoolean("web_home_probe_main_view_present", probe.optBoolean("main_view_present"));
            state.putInt("web_home_probe_raw_anchor_count", Math.max(0, Math.min(3, probe.optInt("raw_anchor_count"))));
            state.putInt("web_home_probe_root_resource_count", Math.max(0, Math.min(3, probe.optInt("root_resource_count"))));
            state.putInt("web_home_probe_source_card_count", Math.max(0, Math.min(3, probe.optInt("source_card_count"))));
            state.putBoolean("web_home_probe_root_selector_is_main_view", probe.optBoolean("root_selector_is_main_view"));
            state.putBoolean("web_home_probe_styles_ready", probe.optBoolean("styles_ready"));
            state.putBoolean("web_home_probe_decision_rendered_status", probe.optBoolean("decision_rendered_status"));
            state.putBoolean("web_home_probe_decision_content_root_missing", probe.optBoolean("decision_content_root_missing"));
            state.putBoolean("web_home_probe_decision_styles_not_ready", probe.optBoolean("decision_styles_not_ready"));
            state.putBoolean("web_home_probe_decision_fullscreen_open", probe.optBoolean("decision_fullscreen_open"));
            state.putBoolean("web_home_probe_style_probe_completed", probe.optBoolean("style_probe_completed"));
            state.putBoolean("web_home_probe_renderer_style_probe_marker_present", probe.optBoolean("renderer_style_probe_marker_present"));
            state.putBoolean("web_home_probe_renderer_style_probe_computed_style_available", probe.optBoolean("renderer_style_probe_computed_style_available"));
            state.putBoolean("web_home_probe_renderer_style_probe_home_display_flex", probe.optBoolean("renderer_style_probe_home_display_flex"));
            state.putBoolean("web_home_probe_renderer_style_probe_home_position_fixed", probe.optBoolean("renderer_style_probe_home_position_fixed"));
            state.putBoolean("web_home_probe_renderer_style_probe_home_visibility_visible", probe.optBoolean("renderer_style_probe_home_visibility_visible"));
            state.putBoolean("web_home_probe_renderer_style_probe_home_opacity_nonzero", probe.optBoolean("renderer_style_probe_home_opacity_nonzero"));
            state.putBoolean("web_home_probe_renderer_style_probe_home_z_index_high", probe.optBoolean("renderer_style_probe_home_z_index_high"));
            state.putBoolean("web_home_probe_renderer_style_probe_main_hidden", probe.optBoolean("renderer_style_probe_main_hidden"));
            state.putBoolean("web_home_probe_renderer_style_probe_error", probe.optBoolean("renderer_style_probe_error"));
            state.putBoolean("web_home_probe_style_probe_home_display_flex", probe.optBoolean("style_probe_home_display_flex"));
            state.putBoolean("web_home_probe_style_probe_home_position_fixed", probe.optBoolean("style_probe_home_position_fixed"));
            state.putBoolean("web_home_probe_style_probe_home_visibility_visible", probe.optBoolean("style_probe_home_visibility_visible"));
            state.putBoolean("web_home_probe_style_probe_home_opacity_nonzero", probe.optBoolean("style_probe_home_opacity_nonzero"));
            state.putBoolean("web_home_probe_style_probe_home_z_index_high", probe.optBoolean("style_probe_home_z_index_high"));
            state.putBoolean("web_home_probe_style_probe_main_hidden", probe.optBoolean("style_probe_main_hidden"));
            state.putBoolean("web_home_probe_init_attempted", probe.optBoolean("init_attempted"));
            state.putBoolean("web_home_probe_style_marker_present", probe.optBoolean("style_marker_present"));
            state.putBoolean("web_home_probe_active_class", probe.optBoolean("active_class"));
            state.putBoolean("web_home_probe_home_exists", probe.optBoolean("home_exists"));
            state.putInt("web_home_probe_card_count", Math.max(0, Math.min(3, probe.optInt("home_card_count"))));
            state.putBoolean("web_home_probe_home_display_flex", probe.optBoolean("home_display_flex"));
            state.putBoolean("web_home_probe_home_position_fixed", probe.optBoolean("home_position_fixed"));
            state.putBoolean("web_home_probe_home_visible", probe.optBoolean("home_visible"));
            state.putBoolean("web_home_probe_source_hidden", probe.optBoolean("source_hidden"));
            state.putBoolean("web_home_probe_brand_has_bounds", probe.optBoolean("brand_has_bounds"));
            state.putBoolean("web_home_probe_first_card_has_bounds", probe.optBoolean("first_card_has_bounds"));
        } catch (Throwable error) {
            if (error instanceof InterruptedException) Thread.currentThread().interrupt();
            state.putBoolean("web_home_probe_diagnostics_available", false);
        }
        sendStatus(1, state);
    }

    private Bundle inspectWebHomeRenderer(
            Activity activity, WebView rendererWebView, String originalUrl, WebView originalWebView) {
        Rect rendererBounds = visibleBounds(rendererWebView);
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        boolean loginPagePreserved = equalsNullable(originalUrl, originalWebView.getUrl());
        boolean originalWebViewVisible = visibleBounds(originalWebView) != null;
        if (rendererBounds == null || !loginPagePreserved || !originalWebViewVisible
                || nativeRoot.getVisibility() != View.GONE || splash.getVisibility() != View.GONE) {
            throw new AssertionError("The isolated /app renderer surface obscured or changed the original login WebView");
        }
        Bundle state = new Bundle();
        state.putString("phase", "web_home_renderer_app_route");
        state.putBoolean("authenticated_home_test_performed", false);
        state.putBoolean("home_renderer_fixture_test_only", true);
        state.putBoolean("web_home_route_app", true);
        state.putBoolean("web_home_dom_and_computed_styles_visible", true);
        state.putBoolean("web_home_source_hidden_after_renderer_visible", true);
        state.putBoolean("web_home_fixture_resource_links_visible", true);
        state.putBoolean("original_login_webview_url_preserved", true);
        state.putBoolean("original_login_webview_still_visible", true);
        state.putBoolean("native_root_hidden_under_fixture", true);
        state.putBoolean("splash_hidden", true);
        putBounds(state, "web_home_visible", rendererBounds);
        return state;
    }

    private void removeWebHomeRendererFixture(final WebView webView) {
        if (webView == null) return;
        try {
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    if (webView.getParent() instanceof ViewGroup) {
                        ((ViewGroup) webView.getParent()).removeView(webView);
                    }
                    webView.stopLoading();
                    webView.setWebViewClient(null);
                    webView.destroy();
                }
            });
        } catch (Throwable ignored) {}
    }

    private void captureUiEvidence(String hierarchyName, String screenshotName, String phase) throws Exception {
        String phasePrefix;
        if ("empty-Home".equals(phase)) {
            phasePrefix = "capture_empty_home";
        } else if ("Home-status".equals(phase)) {
            phasePrefix = "capture_home_status";
        } else if ("Native-route".equals(phase)) {
            phasePrefix = "capture_native_route_owner";
        } else if ("Web-Home /app renderer".equals(phase)) {
            phasePrefix = "capture_web_home_renderer";
        } else {
            phasePrefix = "capture_ui_evidence";
        }

        notePhase(phasePrefix + "_automation_setup");
        UiAutomation automation = getUiAutomation();
        AccessibilityServiceInfo serviceInfo = new AccessibilityServiceInfo();
        serviceInfo.eventTypes = AccessibilityEvent.TYPES_ALL_MASK;
        serviceInfo.feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC;
        serviceInfo.flags = AccessibilityServiceInfo.FLAG_INCLUDE_NOT_IMPORTANT_VIEWS
                | AccessibilityServiceInfo.FLAG_REPORT_VIEW_IDS
                | AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS;
        automation.setServiceInfo(serviceInfo);

        AccessibilityNodeInfo root = null;
        for (int attempt = 0; attempt < 3 && root == null; attempt++) {
            notePhase(phasePrefix + "_get_hierarchy");
            root = automation.getRootInActiveWindow();
            if (root == null && attempt < 2) {
                waitForIdleSync();
                Thread.sleep(100L);
            }
        }
        if (root == null) {
            throw new AssertionError("Android UI hierarchy was unavailable during the " + phase + " phase");
        }
        notePhase(phasePrefix + "_serialize_hierarchy");
        StringBuilder hierarchy = new StringBuilder("<?xml version=\"1.0\" encoding=\"UTF-8\"?><hierarchy>");
        try {
            appendAccessibilityNodeXml(hierarchy, root);
        } finally {
            root.recycle();
        }
        hierarchy.append("</hierarchy>");
        notePhase(phasePrefix + "_write_hierarchy");
        try (FileOutputStream output = getTargetContext().openFileOutput(hierarchyName, Context.MODE_PRIVATE)) {
            output.write(hierarchy.toString().getBytes("UTF-8"));
        }

        Bitmap screenshot = null;
        for (int attempt = 0; attempt < 3 && screenshot == null; attempt++) {
            notePhase(phasePrefix + "_take_screenshot");
            screenshot = automation.takeScreenshot();
            if (screenshot == null && attempt < 2) {
                waitForIdleSync();
                Thread.sleep(100L);
            }
        }
        if (screenshot == null) {
            throw new AssertionError("Android screenshot was unavailable during the " + phase + " phase");
        }
        notePhase(phasePrefix + "_write_screenshot");
        try {
            try (FileOutputStream output = getTargetContext().openFileOutput(screenshotName, Context.MODE_PRIVATE)) {
                if (!screenshot.compress(Bitmap.CompressFormat.PNG, 100, output)) {
                    throw new AssertionError("Could not encode the " + phase + " screenshot");
                }
            }
        } finally {
            screenshot.recycle();
        }
    }

    private void appendAccessibilityNodeXml(StringBuilder xml, AccessibilityNodeInfo node) {
        Rect bounds = new Rect();
        node.getBoundsInScreen(bounds);
        xml.append("<node");
        appendXmlAttribute(xml, "class", node.getClassName());
        appendXmlAttribute(xml, "package", node.getPackageName());
        appendXmlAttribute(xml, "resource-id", node.getViewIdResourceName());
        appendXmlAttribute(xml, "text", node.getText());
        appendXmlAttribute(xml, "content-desc", node.getContentDescription());
        appendXmlAttribute(xml, "bounds", bounds.toShortString());
        appendXmlAttribute(xml, "visible-to-user", String.valueOf(node.isVisibleToUser()));
        xml.append(">");
        for (int index = 0; index < node.getChildCount(); index++) {
            AccessibilityNodeInfo child = node.getChild(index);
            if (child == null) continue;
            try {
                appendAccessibilityNodeXml(xml, child);
            } finally {
                child.recycle();
            }
        }
        xml.append("</node>");
    }

    private void appendXmlAttribute(StringBuilder xml, String name, CharSequence value) {
        xml.append(' ').append(name).append("=\"")
                .append(escapeXml(value == null ? "" : value.toString()))
                .append('"');
    }

    private String escapeXml(String value) {
        return value.replace("&", "&amp;")
                .replace("\"", "&quot;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("'", "&apos;");
    }

    private void dispatchEmptyHomeThroughAndBridge(Activity activity) throws Exception {
        ClassLoader loader = activity.getClassLoader();
        Class<?> bridgeClass = loader.loadClass("com.melodix.music.AndBridge");
        Object bridge = bridgeClass.getConstructor(Context.class).newInstance(activity);
        Method route = bridgeClass.getMethod("onNativeUiRoute", String.class);
        Method data = bridgeClass.getMethod("onNativeUiData", String.class, String.class);

        // This is an empty control payload, not a synthetic playlist/card. It
        // exercises the native no-content fallback without requesting readiness.
        route.invoke(bridge, "home");
        data.invoke(bridge, "home", "[]");
    }

    private void requestExplicitLoginWebUi(Activity activity) throws Exception {
        Method loginAction = activity.getClass().getMethod("revealLoginWebUi");
        loginAction.invoke(activity);
        if (!readBooleanField(activity, "nativeLoginWebRequested")) {
            throw new AssertionError("Explicit login action did not retain Web ownership");
        }
    }

    private void clearLoginOwnerForNativeShellFixture(final Activity activity) throws Exception {
        final Throwable[] failure = new Throwable[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                try {
                    Field loginOwner = activity.getClass().getDeclaredField("nativeLoginWebRequested");
                    loginOwner.setAccessible(true);
                    loginOwner.setBoolean(activity, false);
                } catch (Throwable error) {
                    failure[0] = unwrapInvocationTarget(error);
                }
            }
        });
        if (failure[0] instanceof Exception) throw (Exception) failure[0];
        if (failure[0] instanceof Error) throw (Error) failure[0];
        if (failure[0] != null) throw new AssertionError("Could not prepare the isolated native shell fixture");
    }

    private boolean verifyLoginSpaExitBeforeHomeFixture(final Activity activity) throws Exception {
        final boolean[] loginSpaExitObserved = new boolean[1];
        final Throwable[] probeFailure = new Throwable[1];
        runOnMainSync(new Runnable() {
            @Override
            public void run() {
                try {
                    if (!readBooleanField(activity, "nativeLoginWebRequested")) {
                        throw new AssertionError("The login owner was not active before the SPA exit probe");
                    }
                    Method pathProbe = activity.getClass().getMethod("isLoginWebPath");
                    boolean stillOnLoginPath = Boolean.TRUE.equals(pathProbe.invoke(activity));
                    if (stillOnLoginPath) {
                        // A real /login or accounts-origin path is still an allowed login
                        // surface. Reset only this test fixture's UI gate; do not navigate,
                        // clear cookies, or write the observed page URL to diagnostics.
                        Field loginOwner = activity.getClass().getDeclaredField("nativeLoginWebRequested");
                        loginOwner.setAccessible(true);
                        loginOwner.setBoolean(activity, false);
                        loginSpaExitObserved[0] = false;
                        return;
                    }
                    Method routeCallback = activity.getClass().getMethod("postNativeUiRoute", String.class);
                    routeCallback.invoke(activity, "home");
                    if (readBooleanField(activity, "nativeLoginWebRequested")) {
                        throw new AssertionError("A non-login SPA route did not return ownership to native Home");
                    }
                    loginSpaExitObserved[0] = true;
                } catch (Throwable error) {
                    probeFailure[0] = unwrapInvocationTarget(error);
                }
            }
        });
        if (probeFailure[0] instanceof Exception) throw (Exception) probeFailure[0];
        if (probeFailure[0] instanceof Error) throw (Error) probeFailure[0];
        if (probeFailure[0] != null) throw new AssertionError("Login SPA exit probe failed");
        return loginSpaExitObserved[0];
    }

    private void dispatchHomeStatusThroughAndBridge(Activity activity) throws Exception {
        ClassLoader loader = activity.getClassLoader();
        Class<?> bridgeClass = loader.loadClass("com.melodix.music.AndBridge");
        Object bridge = bridgeClass.getConstructor(Context.class).newInstance(activity);
        Method route = bridgeClass.getMethod("onNativeUiRoute", String.class);
        Method data = bridgeClass.getMethod("onNativeUiData", String.class, String.class);
        String statusOnlyPayload = "[{\"kind\":\"state\",\"state\":\"loading\",\"sessionUnproven\":true,"
                + "\"title\":\"Connexion à Spotify…\","
                + "\"subtitle\":\"État de connexion non confirmé.\","
                + "\"section\":\"Connexion Spotify\",\"image\":\"\","
                + "\"uri\":\"melodix:action:open-login\"}]";
        if (statusOnlyPayload.contains("spotify:") || statusOnlyPayload.contains("playlist")) {
            throw new AssertionError("The status renderer fixture must not contain Spotify resources");
        }
        // This test-only non-playlist payload never invokes onNativeUiReady or
        // sets auth/readiness flags; the renderer must attach it and the native
        // measurement path must prove visibility before readiness can appear.
        route.invoke(bridge, "home");
        data.invoke(bridge, "home", statusOnlyPayload);
    }

    private void dispatchUnprovenHomeOwnerCallback(Activity activity) throws Exception {
        ClassLoader loader = activity.getClassLoader();
        Class<?> bridgeClass = loader.loadClass("com.melodix.music.AndBridge");
        Object bridge = bridgeClass.getConstructor(Context.class).newInstance(activity);
        Method owner = bridgeClass.getMethod("onMelodixHomeVisibility", boolean.class, boolean.class);
        // This negative owner signal must not erase a currently attached
        // session-unproven status-only Home state.
        owner.invoke(bridge, false, false);
    }

    private void awaitNativeHomeStatusReady(final Activity activity) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 10000L;
        while (System.currentTimeMillis() < deadline) {
            final boolean[] ready = new boolean[1];
            final Throwable[] failure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        ready[0] = readBooleanField(activity, "nativeHomeStatusAttached")
                                && readBooleanField(activity, "nativeHomeSessionUnprovenStatusAttached")
                                && readBooleanField(activity, "nativeHomeContentReady");
                    } catch (Throwable error) {
                        failure[0] = error;
                    }
                }
            });
            if (failure[0] != null) throw new AssertionError("Could not read Home status visibility state");
            if (ready[0]) return;
            waitForIdleSync();
            Thread.sleep(100L);
        }
        throw new AssertionError("Native Home status view did not become measured and visible");
    }

    private void awaitNativeHomeErrorReady(Activity activity) throws Exception {
        for (int attempt = 0; attempt < 60; attempt++) {
            final boolean[] ready = new boolean[1];
            final Throwable[] failure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        ready[0] = readBooleanField(activity, "nativeHomeStatusAttached")
                                && !readBooleanField(activity, "nativeHomeSessionUnprovenStatusAttached")
                                && readBooleanField(activity, "nativeHomeContentReady");
                    } catch (Throwable error) {
                        failure[0] = error;
                    }
                }
            });
            if (failure[0] != null) throw new AssertionError("Could not read native Home error visibility state");
            if (ready[0]) return;
            waitForIdleSync();
            Thread.sleep(100L);
        }
        throw new AssertionError("Native Home error/retry view did not become measured and visible");
    }

    private Bundle inspectHomeStatus(Activity activity, WebView webView, String originalUrl) throws Exception {
        View mainRootView = optionalView(activity, "main");
        ViewGroup mainRoot = mainRootView instanceof ViewGroup ? (ViewGroup) mainRootView : null;
        View hScroll = optionalView(activity, "hScrollView");
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        View nativeContent = requiredView(activity, "nativeContent");
        View statusView = readViewField(activity, "nativeHomeStatusView");

        Rect rootBounds = visibleBounds(nativeRoot);
        Rect statusBounds = visibleBounds(statusView);
        Rect webBounds = visibleBounds(webView);
        boolean rootVisible = rootBounds != null;
        boolean statusAttached = readBooleanField(activity, "nativeHomeStatusAttached");
        boolean unprovenStatusAttached = readBooleanField(activity, "nativeHomeSessionUnprovenStatusAttached");
        boolean cardsAttached = readBooleanField(activity, "nativeHomeCardsAttached");
        boolean contentReady = readBooleanField(activity, "nativeHomeContentReady");
        boolean titleVisible = containsText(statusView, "Connexion à Spotify")
                || containsText(statusView, "Connexion Spotify non confirmée")
                || containsText(statusView, "Connexion Spotify impossible à vérifier")
                || containsText(statusView, "Chargement de votre accueil")
                || containsText(statusView, "Votre accueil n’a pas pu être chargé");
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean homeTabVisible = nativeHomeTab.isShown();
        boolean webContainerVisible = webContainer.getVisibility() == View.VISIBLE;
        boolean webViewMounted = webView != null && webView.getParent() != null;
        boolean statusIsChild = statusView != null && statusView.getParent() == nativeContent;
        boolean sameWebViewUrl = equalsNullable(originalUrl, webView.getUrl());
        int screenWidth = mainRoot == null ? 0 : mainRoot.getWidth();
        int screenHeight = mainRoot == null ? 0 : mainRoot.getHeight();
        String frontmost = frontmostFullscreenSurface(hScroll, nativeRoot, splash, mainRoot,
                screenWidth, screenHeight);
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        requireUnauthenticatedSession(activity);
        if (!rootVisible || statusBounds == null || !statusAttached || !unprovenStatusAttached
                || cardsAttached || !contentReady || !titleVisible || !splashHidden || !homeTabVisible
                || !webContainerVisible || !webViewMounted || webBounds == null || !statusIsChild
                || !sameWebViewUrl || !"native_root".equals(frontmost) || !"home".equals(currentScreen)) {
            throw new AssertionError("The non-playlist Home status view was not attached, measured, foremost, and visible");
        }

        Bundle state = new Bundle();
        state.putString("phase", "home_status_renderer");
        state.putBoolean("home_status_payload_fixture_non_playlist", true);
        state.putBoolean("playlist_or_card_injected", false);
        state.putBoolean("native_home_cards_attached", false);
        state.putBoolean("native_home_status_attached", true);
        state.putBoolean("native_home_status_visible", true);
        state.putBoolean("native_home_status_message_visible_in_hierarchy", true);
        state.putBoolean("native_home_content_ready", true);
        state.putBoolean("native_root_visible", true);
        state.putBoolean("native_home_tab_visible", true);
        state.putBoolean("native_root_is_foremost_surface", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("webview_mounted_under_native_root", true);
        state.putBoolean("webview_container_visible_under_native_root", true);
        state.putBoolean("original_webview_url_preserved", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "native_status_visible", statusBounds);
        putBounds(state, "native_root_visible", rootBounds);
        putBounds(state, "webview_mounted", webBounds);
        return state;
    }

    private boolean containsText(View view, String expected) {
        if (view == null) return false;
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            return text != null && text.toString().contains(expected);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                if (containsText(group.getChildAt(index), expected)) return true;
            }
        }
        return false;
    }

    private Bundle inspectEmptyHomeNativeError(Activity activity, WebView webView, String originalWebViewUrl)
            throws Exception {
        View mainRootView = optionalView(activity, "main");
        ViewGroup mainRoot = mainRootView instanceof ViewGroup ? (ViewGroup) mainRootView : null;
        View hScroll = optionalView(activity, "hScrollView");
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        View nativeContent = requiredView(activity, "nativeContent");
        View statusView = readViewField(activity, "nativeHomeStatusView");

        Rect webBounds = visibleBounds(webView);
        Rect rootBounds = visibleBounds(nativeRoot);
        Rect statusBounds = visibleBounds(statusView);
        boolean rootVisible = rootBounds != null;
        boolean statusAttached = readBooleanField(activity, "nativeHomeStatusAttached");
        boolean unprovenStatusAttached = readBooleanField(activity, "nativeHomeSessionUnprovenStatusAttached");
        boolean cardsAttached = readBooleanField(activity, "nativeHomeCardsAttached");
        boolean contentReady = readBooleanField(activity, "nativeHomeContentReady");
        boolean titleVisible = containsText(statusView, "Votre accueil n’a pas pu être chargé");
        boolean retryMessageVisible = containsText(statusView, "Touchez pour réessayer");
        boolean retryActionClickable = statusView != null && statusView.isClickable();
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean homeTabVisible = nativeHomeTab.isShown();
        boolean webContainerMounted = webContainer.getVisibility() == View.VISIBLE
                && webView != null && webView.getParent() != null;
        boolean statusIsChild = statusView != null && statusView.getParent() == nativeContent;
        boolean sameWebViewUrl = equalsNullable(originalWebViewUrl, webView.getUrl());
        int screenWidth = mainRoot == null ? 0 : mainRoot.getWidth();
        int screenHeight = mainRoot == null ? 0 : mainRoot.getHeight();
        String frontmost = frontmostFullscreenSurface(hScroll, nativeRoot, splash, mainRoot,
                screenWidth, screenHeight);
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        requireUnauthenticatedSession(activity);
        if (webBounds == null || !rootVisible || statusBounds == null || !statusAttached
                || unprovenStatusAttached || cardsAttached || !contentReady || !titleVisible
                || !retryMessageVisible || !retryActionClickable || !splashHidden || !homeTabVisible
                || !webContainerMounted || !statusIsChild || !sameWebViewUrl
                || !"native_root".equals(frontmost) || !"home".equals(currentScreen)) {
            throw new AssertionError("Empty Home did not show a measured native error/retry state above the mounted WebView");
        }

        Bundle state = new Bundle();
        state.putString("phase", "empty_home_native_error_state");
        state.putString("final_screen_owner", "native-home");
        state.putBoolean("home_payload_empty", true);
        state.putBoolean("playlist_or_card_injected", false);
        state.putBoolean("native_home_cards_attached", false);
        state.putBoolean("native_home_status_attached", true);
        state.putBoolean("native_home_status_visible", true);
        state.putBoolean("native_home_error_message_visible", true);
        state.putBoolean("native_home_status_message_visible_in_hierarchy", true);
        state.putBoolean("native_home_retry_action_clickable", true);
        state.putBoolean("native_home_content_ready", true);
        state.putBoolean("native_root_visible", true);
        state.putBoolean("native_home_tab_visible", true);
        state.putBoolean("native_root_is_foremost_surface", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("webview_mounted_under_native_root", true);
        state.putBoolean("webview_container_visible_under_native_root", true);
        state.putBoolean("original_webview_url_preserved", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "native_status_visible", statusBounds);
        putBounds(state, "native_root_visible", rootBounds);
        putBounds(state, "webview_mounted", webBounds);
        return state;
    }

    private Rect visibleBounds(View view) {
        if (view == null || view.getVisibility() != View.VISIBLE || !view.isShown()
                || view.getWidth() <= 0 || view.getHeight() <= 0) {
            return null;
        }
        Rect bounds = new Rect();
        if (!view.getGlobalVisibleRect(bounds) || bounds.width() <= 0 || bounds.height() <= 0) {
            return null;
        }
        return bounds;
    }

    private void putBounds(Bundle state, String prefix, Rect bounds) {
        state.putInt(prefix + "_left_px", bounds.left);
        state.putInt(prefix + "_top_px", bounds.top);
        state.putInt(prefix + "_right_px", bounds.right);
        state.putInt(prefix + "_bottom_px", bounds.bottom);
        state.putInt(prefix + "_width_px", bounds.width());
        state.putInt(prefix + "_height_px", bounds.height());
    }

    private boolean equalsNullable(String left, String right) {
        return left == null ? right == null : left.equals(right);
    }

    private WebView findWebView(Activity activity) {
        try {
            Field field = activity.getClass().getDeclaredField("G");
            field.setAccessible(true);
            Object value = field.get(activity);
            return value instanceof WebView ? (WebView) value : null;
        } catch (Throwable error) {
            return null;
        }
    }

    private View requiredView(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", TARGET_PACKAGE);
        if (id == 0) throw new AssertionError("Required view id missing: " + name);
        View view = activity.findViewById(id);
        if (view == null) throw new AssertionError("Required view missing: " + name);
        return view;
    }

    private boolean readBooleanField(Activity activity, String name) throws Exception {
        Field field = activity.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.getBoolean(activity);
    }

    private View readViewField(Activity activity, String name) throws Exception {
        Field field = activity.getClass().getDeclaredField(name);
        field.setAccessible(true);
        Object value = field.get(activity);
        return value instanceof View ? (View) value : null;
    }

    private String readStringField(Activity activity, String name) throws Exception {
        Field field = activity.getClass().getDeclaredField(name);
        field.setAccessible(true);
        Object value = field.get(activity);
        return value == null ? "" : String.valueOf(value);
    }
}
