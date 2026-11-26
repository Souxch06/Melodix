#!/usr/bin/env python3
"""Show Spotify's login page the WebView's real User-Agent; keep the desktop UA for the web player.

Logged out, m9 set a forged 'Windows Chrome 134' UA before loading accounts.spotify.com, while the
WebView still sent Android client hints, X-Requested-With and touch input. That contradictory
fingerprint is what reCAPTCHA scores: every login from the app (human-typed included) got
'Oops! Something went wrong' on the Android 16 emulator. Now:
 - m9 (logged out): WebSettings.getDefaultUserAgent(context) for the login page;
 - c91.onPageFinished, on the logged-out -> logged-in transition (sp_dc first seen): set the desktop
   UA back and reload open.spotify.com, so the web player keeps the UA Melodix expects.
Google sign-in keeps its own handling (google_spoof) and is unchanged.
"""
import re, sys
from pathlib import Path
DESKTOP = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36'
LOGIN = 'https://accounts.spotify.com/en/login?continue=https%3A%2F%2Fopen.spotify.com%2F&allow_signup=1'
L = r'(?:\s*\.line \d+)*'  # .line markers and blank lines between instructions
M9_OLD = re.compile(r'(:cond_8\n' + L + r'\s*invoke-virtual \{p0\}, Landroid/webkit/WebView;->getSettings\(\)Landroid/webkit/WebSettings;\n' + L + r'\s*move-result-object v1\n' + L + ')'
                    r'\s*const-string v0, "' + re.escape(DESKTOP) + r'"\n'
                    r'(' + L + r'\s*invoke-virtual \{v1, v0\}, Landroid/webkit/WebSettings;->setUserAgentString\(Ljava/lang/String;\)V\n' + L + r'\s*const-string v0, "' + re.escape(LOGIN) + '")')
M9_NEW = ('\\1\n    # Real WebView UA on the Spotify login page (a forged desktop UA fails reCAPTCHA).\n'
          '    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;\n    move-result-object v0\n'
          '    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;\n    move-result-object v0\n\\2')
C91_OLD = re.compile(r'(\s*invoke-interface \{v2, v5, v7\}, Landroid/content/SharedPreferences\$Editor;->putBoolean\(Ljava/lang/String;Z\)Landroid/content/SharedPreferences\$Editor;\n'
                     + L + r'\s*move-result-object v2\n' + L + r'\s*invoke-interface \{v2\}, Landroid/content/SharedPreferences\$Editor;->apply\(\)V\n)'
                     r'(' + L + r'\s*:cond_2\n\s*invoke-static \{v1, v6, v3\}, Lda1;->y)')
C91_NEW = ('\\1    # First sp_dc after a login: back to the desktop UA the web player expects, then reload it.\n'
           '    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;\n    move-result-object v2\n'
           '    const-string v5, "' + DESKTOP + '"\n'
           '    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V\n'
           '    const-string v2, "https://open.spotify.com/"\n    invoke-virtual {v0, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V\n    return-void\n\\2')
def patch(text, rx, new, name):
    found = len(rx.findall(text))
    if found != 1: raise ValueError(f'{name}: {found} anchors')
    return rx.sub(new, text, count=1)
def prepare(root):
    return {'smali/m9.smali': patch((root/'smali/m9.smali').read_text(encoding='utf8'), M9_OLD, M9_NEW, 'm9 login UA'),
            'smali/c91.smali': patch((root/'smali/c91.smali').read_text(encoding='utf8'), C91_OLD, C91_NEW, 'c91 login transition')}
if __name__ == '__main__':
    root = Path(sys.argv[1]); out = prepare(root)
    for n, t in out.items(): (root/n).write_text(t, encoding='utf8')
