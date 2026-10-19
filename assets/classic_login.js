(function() {
    const viewportContent = 'width=device-width, initial-scale=1, viewport-fit=cover';
    let viewport = document.querySelector('meta[name="viewport"]');
    if (!viewport) {
        viewport = document.createElement('meta');
        viewport.name = 'viewport';
        if (document.head) document.head.appendChild(viewport);
    }
    if (viewport) viewport.setAttribute('content', viewportContent);

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
