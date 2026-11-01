package com.melodix.test;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.app.Activity;
import android.app.Instrumentation;
import android.app.UiAutomation;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
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
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Android integration test for the exact Preview APK built by the same CI run.
 *
 * It verifies the unauthenticated WebView/login surface and empty-Home fallback,
 * exercises the native status renderer with a status-only payload, and runs the
 * packaged Web Home renderer in an isolated local Android WebView fixture at
 * the native recovery route /app. The fixture is test-only; its explicit
 * renderer-session flag exercises the takeover gate but does not represent
 * Spotify authentication. It supplies no account content, Spotify credentials,
 * or cookies and does not claim an authenticated Home test.
 */
public final class HomeRenderInstrumentation extends Instrumentation {
    private static final String TARGET_PACKAGE = "com.melodix.music.preview";
    private static final String HARNESS_TAG = "MelodixHarness";
    private static final long WEBVIEW_SETTLE_TIMEOUT_MS = 60000L;
    private static final long REQUIRED_STABLE_MS = 1800L;
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
            "var status=String(window.__sfMediaLibStatus||'absent');if(['absent','pending','loading','ready','error'].indexOf(status)<0)status='other';" +
            "var bridge=window.AndBridge||null;var linkCount=main?Math.min(main.querySelectorAll('a[href]').length,3):0;" +
            "return {probe_error:false,host:host,route_category:route,style_present:!!style," +
            "style_marker_present:!!(style&&String(style.textContent||'').indexOf('SF_MELODIX_HOME_STYLES_V1')>=0)," +
            "tokens:tokens,home_present:!!home,home_active:!!(document.body&&document.body.classList.contains('sf-melodix-home-active'))," +
            "home_display_flex:!!(home&&getComputedStyle(home).display==='flex'),source_main_present:!!main," +
            "source_anchor_count:linkCount,session_proven:window.__sfNativeUiSessionProven===true," +
            "library_status:status,raw_item_count:Math.min(Math.max(0,Number(window.__sfMediaLibRawItemCount)||0),3)," +
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
            "var sessionProven=window.__sfMelodixHomeSessionProven===true;" +
            "var libraryStatus=String(window.__sfMelodixHomeLibraryStatus||'absent');" +
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
            "session_proven:sessionProven," +
            "library_status:['absent','pending','loading','ready','error'].indexOf(libraryStatus)>=0?libraryStatus:'other'," +
            "decision_session_unproven:decision==='session-unproven'," +
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

            failurePhase = "verify_unauthenticated_session";
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
                        loginFailure[0] = error;
                    }
                }
            });
            if (loginFailure[0] != null) throw loginFailure[0];
            sendStatus(1, loginState[0]);

            failurePhase = "live_spotify_css_runtime_probe";
            notePhase(failurePhase);
            Bundle liveCssState = inspectLiveSpotifyCssTheme(webView);
            sendStatus(1, liveCssState);
            if (!liveCssState.getBoolean("live_webview_css_tokens_valid") ||
                    liveCssState.getBoolean("live_webview_home_active")) {
                throw new AssertionError("The existing Spotify WebView did not retain valid Home theme tokens without taking over the unauthenticated login surface");
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
            failurePhase = "empty_home_fallback_visibility";
            notePhase(failurePhase);
            waitForIdleSync();
            Thread.sleep(250L);

            final Bundle[] fallbackState = new Bundle[1];
            final Throwable[] fallbackFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        fallbackState[0] = inspectEmptyHomeFallback(activity, webView);
                    } catch (Throwable error) {
                        fallbackFailure[0] = error;
                    }
                }
            });
            if (fallbackFailure[0] != null) throw fallbackFailure[0];

            failurePhase = "capture_empty_home_evidence";
            notePhase(failurePhase);
            captureEmptyHomeUiEvidence();
            Log.i(HARNESS_TAG, "empty_home_evidence_captured");

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

            // Clear the status through the same bridge path and confirm that
            // the already-loaded unauthenticated Spotify login returns intact.
            failurePhase = "restore_login_after_status";
            notePhase(failurePhase);
            final Throwable[] clearFailure = new Throwable[1];
            runOnMainSync(new Runnable() {
                @Override
                public void run() {
                    try {
                        dispatchEmptyHomeThroughAndBridge(activity);
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
                        restoredState[0] = inspectEmptyHomeFallback(activity, webView);
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
                throw new AssertionError("Status renderer did not restore the existing login WebView");
            }
            restoredState[0].putBoolean("login_surface_restored_after_status", true);

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
            Log.e(HARNESS_TAG, "failure phase=" + failurePhase + " type=" + failure.getClass().getSimpleName());
            Bundle status = new Bundle();
            status.putString("overall", "failed");
            status.putString("failure_phase", failurePhase);
            status.putString("failure_type", failure.getClass().getSimpleName());
            sendStatus(2, status);
            finish(Activity.RESULT_CANCELED, status);
        }
    }

    private void notePhase(String phase) {
        Log.i(HARNESS_TAG, "phase=" + phase);
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
        state.putBoolean("client_hints_high_entropy_error",
                probe.optBoolean("client_hints_high_entropy_error"));
        state.putString("client_hints_high_entropy_error_type",
                safeProbeErrorType(probe.optString("client_hints_high_entropy_error_type", "none")));
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
            failed.putBoolean("live_webview_css_tokens_valid", false);
            failed.putInt("live_webview_css_token_count", 0);
            failed.putBoolean("live_webview_home_present", false);
            failed.putBoolean("live_webview_home_active", false);
            failed.putBoolean("live_webview_home_display_flex", false);
            failed.putBoolean("live_webview_session_proof", false);
            failed.putString("live_webview_library_status", "unknown");
            failed.putInt("live_webview_raw_item_count_capped", 0);
            failed.putInt("live_webview_source_anchor_count_capped", 0);
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
        state.putBoolean("live_webview_css_tokens_valid", spotifyHost && stylesheetPresent && tokensValid);
        state.putInt("live_webview_css_token_count", tokens == null ? 0 : tokens.length());
        state.putBoolean("live_webview_home_present", probe.optBoolean("home_present"));
        state.putBoolean("live_webview_home_active", probe.optBoolean("home_active"));
        state.putBoolean("live_webview_home_display_flex", probe.optBoolean("home_display_flex"));
        state.putBoolean("live_webview_session_proof", probe.optBoolean("session_proven"));
        state.putString("live_webview_library_status", probe.optString("library_status", "absent"));
        state.putInt("live_webview_raw_item_count_capped", Math.max(0, Math.min(3, probe.optInt("raw_item_count"))));
        state.putInt("live_webview_source_anchor_count_capped", Math.max(0, Math.min(3, probe.optInt("source_anchor_count"))));
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
        probeState.putBoolean("authenticated_session", false);
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
        Method showNetworkError = activity.getClass().getMethod("D", Boolean.TYPE);
        Method revealWebUi = activity.getClass().getMethod("revealWebUi");
        String originalUrl = webView.getUrl();
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
        state.putBoolean("authenticated_session", false);
        state.putBoolean("login_ui_visible_in_webview_dom", true);
        state.putBoolean("webview_visible_and_measured", true);
        state.putBoolean("network_error_transition_recovered", true);
        state.putBoolean("original_webview_url_preserved", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("native_home_hidden", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "webview_visible", webBounds);
        return state;
    }

    private void captureEmptyHomeUiEvidence() throws Exception {
        captureUiEvidence("melodix-preview-home-fallback.xml", "melodix-preview-home-empty.png", "empty-Home");
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
                "<script>window.SF_CONFIG={guiMode:'csshack'};window.__sfNativeUiSessionProven=true;window.__sfMelodixHomeTestMode=true;</script></head><body>" +
                "<main id=\"main-view\"><section data-testid=\"shelf\"><h2>Route test shelf</h2>" +
                "<div data-testid=\"card\"><a href=\"/playlist/test-only-route-fixture-playlist\"><span data-testid=\"card-title\">Route fixture playlist</span></a></div>" +
                "<div data-testid=\"card\"><a href=\"/album/test-only-route-fixture-album\"><span data-testid=\"card-title\">Route fixture album</span></a></div>" +
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
            if (probeError) return state;

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
        return state;
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
            state.putBoolean("web_home_probe_route_app", probe.optBoolean("route_app"));
            state.putBoolean("web_home_probe_mode_csshack", probe.optBoolean("mode_csshack"));
            state.putBoolean("web_home_probe_main_view_present", probe.optBoolean("main_view_present"));
            state.putInt("web_home_probe_raw_anchor_count", Math.max(0, Math.min(3, probe.optInt("raw_anchor_count"))));
            state.putInt("web_home_probe_root_resource_count", Math.max(0, Math.min(3, probe.optInt("root_resource_count"))));
            state.putInt("web_home_probe_source_card_count", Math.max(0, Math.min(3, probe.optInt("source_card_count"))));
            state.putBoolean("web_home_probe_root_selector_is_main_view", probe.optBoolean("root_selector_is_main_view"));
            state.putBoolean("web_home_probe_styles_ready", probe.optBoolean("styles_ready"));
            state.putBoolean("web_home_probe_session_proven", probe.optBoolean("session_proven"));
            state.putString("web_home_probe_library_status", probe.optString("library_status", "absent"));
            state.putBoolean("web_home_probe_decision_session_unproven", probe.optBoolean("decision_session_unproven"));
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
        state.putBoolean("authenticated_session", false);
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

    private void dispatchHomeStatusThroughAndBridge(Activity activity) throws Exception {
        ClassLoader loader = activity.getClassLoader();
        Class<?> bridgeClass = loader.loadClass("com.melodix.music.AndBridge");
        Object bridge = bridgeClass.getConstructor(Context.class).newInstance(activity);
        Method route = bridgeClass.getMethod("onNativeUiRoute", String.class);
        Method data = bridgeClass.getMethod("onNativeUiData", String.class, String.class);
        String statusOnlyPayload = "[{\"kind\":\"state\",\"state\":\"loading\","
                + "\"title\":\"Chargement de votre accueil…\","
                + "\"subtitle\":\"État de test du renderer natif.\","
                + "\"section\":\"Accueil\",\"image\":\"\",\"uri\":\"\"}]";
        if (statusOnlyPayload.contains("spotify:") || statusOnlyPayload.contains("playlist")) {
            throw new AssertionError("The status renderer fixture must not contain Spotify resources");
        }
        // This test-only non-playlist payload never invokes onNativeUiReady or
        // sets auth/readiness flags; the renderer must attach it and the native
        // measurement path must prove visibility before readiness can appear.
        route.invoke(bridge, "home");
        data.invoke(bridge, "home", statusOnlyPayload);
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

    private Bundle inspectHomeStatus(Activity activity, WebView webView, String originalUrl) throws Exception {
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        View nativeContent = requiredView(activity, "nativeContent");
        View statusView = readViewField(activity, "nativeHomeStatusView");

        Rect rootBounds = visibleBounds(nativeRoot);
        Rect statusBounds = visibleBounds(statusView);
        boolean rootVisible = rootBounds != null;
        boolean statusAttached = readBooleanField(activity, "nativeHomeStatusAttached");
        boolean cardsAttached = readBooleanField(activity, "nativeHomeCardsAttached");
        boolean contentReady = readBooleanField(activity, "nativeHomeContentReady");
        boolean titleVisible = containsText(statusView, "Chargement de votre accueil");
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean homeTabVisible = nativeHomeTab.isShown();
        boolean webContainerVisible = webContainer.getVisibility() == View.VISIBLE;
        boolean statusIsChild = statusView != null && statusView.getParent() == nativeContent;
        boolean sameWebViewUrl = equalsNullable(originalUrl, webView.getUrl());
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        requireUnauthenticatedSession(activity);
        if (!rootVisible || statusBounds == null || !statusAttached || cardsAttached || !contentReady
                || !titleVisible || !splashHidden || !homeTabVisible || !webContainerVisible
                || !statusIsChild || !sameWebViewUrl || !"home".equals(currentScreen)) {
            throw new AssertionError("The non-playlist Home status view was not attached, measured, and visible");
        }

        Bundle state = new Bundle();
        state.putString("phase", "home_status_renderer");
        state.putBoolean("authenticated_session", false);
        state.putBoolean("home_status_payload_fixture_non_playlist", true);
        state.putBoolean("playlist_or_card_injected", false);
        state.putBoolean("native_home_cards_attached", false);
        state.putBoolean("native_home_status_attached", true);
        state.putBoolean("native_home_status_visible", true);
        state.putBoolean("native_home_status_message_visible_in_hierarchy", true);
        state.putBoolean("native_home_content_ready", true);
        state.putBoolean("native_root_visible", true);
        state.putBoolean("native_home_tab_visible", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("webview_container_visible_under_native_root", true);
        state.putBoolean("original_webview_url_preserved", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "native_status_visible", statusBounds);
        putBounds(state, "native_root_visible", rootBounds);
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

    private Bundle inspectEmptyHomeFallback(Activity activity, WebView webView) throws Exception {
        View nativeRoot = requiredView(activity, "nativeRoot");
        View splash = requiredView(activity, "splashOverlay");
        View webContainer = requiredView(activity, "webViewContainer");
        View nativeHomeTab = requiredView(activity, "nativeHomeTab");
        View nativeContent = requiredView(activity, "nativeContent");

        Rect webBounds = visibleBounds(webView);
        boolean rootHidden = nativeRoot.getVisibility() == View.GONE;
        boolean homeTabNotShown = !nativeHomeTab.isShown();
        boolean splashHidden = splash.getVisibility() == View.GONE;
        boolean webContainerVisible = webContainer.getVisibility() == View.VISIBLE;
        boolean noHomeCardsAttached = !readBooleanField(activity, "nativeHomeCardsAttached");
        boolean noHomeStatusAttached = !readBooleanField(activity, "nativeHomeStatusAttached");
        boolean noVisibleHomeContent = !readBooleanField(activity, "nativeHomeContentReady");
        boolean noNativeChildren = nativeContent instanceof LinearLayout
                && ((LinearLayout) nativeContent).getChildCount() == 0;
        String currentScreen = readStringField(activity, "nativeCurrentScreen");
        if (webBounds == null || !rootHidden || !homeTabNotShown || !splashHidden
                || !webContainerVisible || !noHomeCardsAttached || !noHomeStatusAttached
                || !noVisibleHomeContent || !noNativeChildren || !"home".equals(currentScreen)) {
            throw new AssertionError("Empty Home did not fail safely back to the visible WebView");
        }

        requireUnauthenticatedSession(activity);
        Bundle state = new Bundle();
        state.putString("phase", "empty_home_fallback");
        state.putBoolean("authenticated_session", false);
        state.putBoolean("home_payload_empty", true);
        state.putBoolean("playlist_or_card_injected", false);
        state.putBoolean("native_home_cards_attached", false);
        state.putBoolean("native_home_status_attached", false);
        state.putBoolean("native_home_content_ready", false);
        state.putBoolean("native_content_container_empty", true);
        state.putBoolean("native_root_hidden", true);
        state.putBoolean("native_home_tab_not_shown", true);
        state.putBoolean("splash_hidden", true);
        state.putBoolean("webview_container_visible", true);
        state.putBoolean("webview_visible_and_measured", true);
        state.putBoolean("page_load_complete", webView.getProgress() == 100);
        putBounds(state, "webview_visible", webBounds);
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
