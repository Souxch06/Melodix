(function() {
    const viewportContent = 'width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no, viewport-fit=cover';
    let viewport = document.querySelector('meta[name="viewport"]');
    if (!viewport) {
        viewport = document.createElement('meta');
        viewport.name = 'viewport';
        if (document.head) document.head.appendChild(viewport);
    }
    if (viewport) viewport.setAttribute('content', viewportContent);

    let fixedStyle = document.getElementById && document.getElementById('sf-login-fixed-style');
    if (!fixedStyle) {
        fixedStyle = document.createElement('style');
        fixedStyle.id = 'sf-login-fixed-style';
        fixedStyle.textContent = `
html, body {
    box-sizing: border-box !important;
    width: 100% !important;
    height: 100% !important;
    max-width: 100vw !important;
    margin: 0 !important;
    overflow: hidden !important;
    overscroll-behavior: none !important;
    touch-action: pan-y !important;
}
body {
    position: fixed !important;
    inset: 0 !important;
}
#root {
    box-sizing: border-box !important;
    width: 100% !important;
    height: 100% !important;
    max-height: 100dvh !important;
    overflow-x: hidden !important;
    overflow-y: auto !important;
    overscroll-behavior: contain !important;
    -webkit-overflow-scrolling: touch !important;
    touch-action: pan-y !important;
}
`;
        (document.head || document.documentElement).appendChild(fixedStyle);
    }

    if (!window.__sfLoginGesturesLocked && typeof document.addEventListener === 'function') {
        window.__sfLoginGesturesLocked = true;
        const blockGestureZoom = (event) => {
            if (event && event.cancelable) event.preventDefault();
        };
        document.addEventListener('gesturestart', blockGestureZoom, { passive: false });
        document.addEventListener('gesturechange', blockGestureZoom, { passive: false });
        document.addEventListener('gestureend', blockGestureZoom, { passive: false });
        document.addEventListener('touchmove', (event) => {
            if (event && event.touches && event.touches.length > 1 && event.cancelable) {
                event.preventDefault();
            }
        }, { passive: false });
        document.addEventListener('wheel', (event) => {
            if (event && event.ctrlKey && event.cancelable) event.preventDefault();
        }, { passive: false });
    }

    let gl = document.querySelector('section>div>div>div>div>a:first-child:not(.fuckd)') ||
             document.querySelector('a[data-testid="login-username-password"]:not(.fuckd)');
    if (gl) {
        let cl = document.createElement('a');
        cl.className = 'fuckd';
        cl.innerText = 'Email + Password Classic Login';
        cl.style.cssText = 'display:block;box-sizing:border-box;width:100%;max-width:100%;min-height:44px;padding:10px;margin:10px 0;color:white;font-weight:bold;text-align:center;text-decoration:none;border:1px solid #ddd;background:#339;border-radius:30px';
        cl.href = window.location.href.includes('?') ? window.location.href + '&allow_password=1' : window.location.href + '?allow_password=1';
        gl.parentNode.insertBefore(cl, gl);
    }
})();
