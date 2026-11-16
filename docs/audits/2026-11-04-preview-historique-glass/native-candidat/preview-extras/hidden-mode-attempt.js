(function(kind, nativeTitle, control, diagnostic, request) {
    'use strict';
    // Invoked only by a user tap when the control is absent/unknown. Open only
    // a unique, explicitly closed known view toggle; no guessing or navigation.
    var prior=window.__sfPreviewHiddenMode;
    if(prior && prior.status==='working') return JSON.stringify({started:false,reason:'busy'});
    var buttons=document.querySelectorAll('button[data-testid="now-playing-view-button"], [role="button"][data-testid="now-playing-view-button"]');
    function pressed(b) {
        var a=b.getAttribute('aria-pressed'),c=b.getAttribute('aria-checked');
        if(a!==null&&c!==null&&a!==c)return 'unknown';
        var v=a!==null?a:c;return v==='true'||v==='false'?v:'unknown';
    }
    if(buttons.length!==1)return JSON.stringify({started:false,reason:buttons.length?'ambiguous':'absent'});
    var toggle=buttons[0];
    if(!toggle.isConnected || toggle.disabled || toggle.getAttribute('aria-disabled')==='true' || pressed(toggle)!=='false')return JSON.stringify({started:false,reason:'view-state'});
    var attempt={id:request,status:'working',reason:'opening',sent:false,close:'pending',diagnostic:''};
    window.__sfPreviewHiddenMode=attempt;
    function close() {
        try {
            var now=document.querySelectorAll('button[data-testid="now-playing-view-button"], [role="button"][data-testid="now-playing-view-button"]');
            if(now.length===1 && now[0]===toggle && toggle.isConnected && pressed(toggle)==='true') {
                toggle.click();attempt.close=pressed(toggle)==='false'?'confirmed':'requested';
            } else attempt.close=pressed(toggle)==='false'?'already-closed':'unconfirmed';
        } catch (_) {attempt.close='unconfirmed';}
        attempt.status='done';
    }
    attempt.cleanup=close;
    try {toggle.click();} catch (_) {attempt.reason='view-command';close();return JSON.stringify({started:false,reason:'view-command'});}
    setTimeout(function(){
        if(attempt.status!=='working')return;
        try {
            if(pressed(toggle)!=='true'){attempt.reason='view-not-confirmed';close();return;}
            var q=JSON.parse(control(kind,'query','','',''));
            attempt.diagnostic=diagnostic(kind);
            if(q.state!=='true'&&q.state!=='false'&&q.state!=='mixed'){attempt.reason=q.reason||'absent';close();return;}
            if(kind==='like' && (q.state!=='false'||!q.track||!q.title||q.title!==nativeTitle)) {attempt.reason=q.state==='true'?'already-liked':'identity';close();return;}
            var result=JSON.parse(control(kind,'invoke',q.state,q.track||'',q.title||''));
            attempt.sent=!!result.sent;attempt.reason=attempt.sent?'sent':'not-sent';
            // Sample the page again after the action, before closing the view.
            setTimeout(function(){if(attempt.status!=='working')return;try{attempt.diagnostic=diagnostic(kind);}catch(_){}close();},300);
        }catch(_){attempt.reason='error';close();}
    },500);
    return JSON.stringify({started:true});
})
