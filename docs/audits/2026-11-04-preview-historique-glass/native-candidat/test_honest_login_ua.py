#!/usr/bin/env python3
"""Regression: the login page gets the WebView's real UA; the desktop UA returns on the first sp_dc."""
import importlib.util, tempfile, unittest
from pathlib import Path
HERE = Path(__file__).parent
spec = importlib.util.spec_from_file_location('apply', HERE / 'apply_honest_login_ua.py'); apply = importlib.util.module_from_spec(spec); spec.loader.exec_module(apply)
D, LOGIN = apply.DESKTOP, apply.LOGIN
# Shapes copied from the shipped 1.2.2-d0f206b-glass smali (with the .line markers apktool leaves in).
M9 = f'''    :cond_8
    invoke-virtual {{p0}}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 293
    move-result-object v1

    .line 294
    const-string v0, "{D}"
    invoke-virtual {{v1, v0}}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    .line 295
    const-string v0, "{LOGIN}"
'''
C91 = '''    invoke-interface {v2, v5, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 72
    move-result-object v2

    .line 75
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 76
    :cond_2
    invoke-static {v1, v6, v3}, Lda1;->y(Ljava/lang/CharSequence;Ljava/lang/String;Z)Z
'''
class T(unittest.TestCase):
    def tree(self, m9=M9, c91=C91):
        d = Path(tempfile.mkdtemp()); (d/'smali').mkdir(); (d/'smali/m9.smali').write_text(m9); (d/'smali/c91.smali').write_text(c91); return d
    def test_login_page_uses_real_ua_and_desktop_ua_is_restored_after_login(self):
        out = apply.prepare(self.tree())
        m9 = out['smali/m9.smali']; self.assertIn('WebSettings;->getDefaultUserAgent', m9)
        login_block = m9[:m9.index(LOGIN)]; self.assertNotIn(D, login_block.split(':cond_8')[1].split('getDefaultUserAgent')[0])
        c91 = out['smali/c91.smali']; self.assertEqual(c91.count(D), 1)
        self.assertRegex(c91, r'putBoolean[\s\S]*?apply\(\)V[\s\S]*?setUserAgentString[\s\S]*?https://open\.spotify\.com/[\s\S]*?return-void[\s\S]*?:cond_2')
    def test_refuses_a_tree_it_does_not_recognise_and_a_second_application(self):
        with self.assertRaises(ValueError): apply.prepare(self.tree(m9='nothing'))
        t = self.tree(); out = apply.prepare(t)
        for n, s in out.items(): (t/n).write_text(s)
        with self.assertRaises(ValueError): apply.prepare(t)
if __name__ == '__main__': unittest.main()
