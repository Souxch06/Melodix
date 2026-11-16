#!/usr/bin/env python3
import contextlib, hashlib, io, tempfile, unittest, zipfile
from pathlib import Path
import diagnose_signed_9016 as d

def z(entries):
    b=io.BytesIO()
    with zipfile.ZipFile(b,'w') as x:
        for name,value in entries: x.writestr(name,value)
    return b.getvalue()

class GuardDiagnostic(unittest.TestCase):
    def setUp(self):
        self.t=tempfile.TemporaryDirectory(); self.root=Path(self.t.name)
        self.oldhash=d.ZIP_SHA256;self.oldassets=d.ASSET_SHA256
        self.files={f'assets/file{i}':('file%d'%i).encode() for i in range(7)}
        d.ASSET_SHA256={name:hashlib.sha256(value).hexdigest() for name,value in self.files.items()}
        self.apk=z(list(self.files.items()));self.bundle=z([(d.APK_NAME,self.apk)])
        d.ZIP_SHA256=hashlib.sha256(self.bundle).hexdigest()
        (self.root/'reference.zip').write_bytes(self.bundle);(self.root/'candidate.apk').write_bytes(self.apk)
    def tearDown(self):d.ZIP_SHA256=self.oldhash;d.ASSET_SHA256=self.oldassets;self.t.cleanup()
    def run_guard(self):return d.diagnose(self.root/'reference.zip',self.root/'candidate.apk',self.root/'error',self.root/'metadata')
    def test_success_reports_seven_and_sha(self):
        found,sha,rows,errors=self.run_guard();self.assertTrue(found);self.assertEqual(len(rows),7);self.assertFalse(errors);self.assertTrue(all(r[3]=='identique' for r in rows));self.assertEqual(sha,hashlib.sha256(self.apk).hexdigest())
        out=io.StringIO();summary=self.root/'summary'
        with contextlib.redirect_stdout(out):self.assertEqual(d.emit(found,sha,rows,errors,summary),0)
        self.assertIn('::notice',out.getvalue());self.assertIn('fichier',summary.read_text())
    def test_changed_file_and_reference_missing_fail_closed(self):
        changed=self.files.copy();changed['assets/file3']=b'different';(self.root/'candidate.apk').write_bytes(z(list(changed.items())))
        found,sha,rows,errors=self.run_guard();self.assertTrue(any('assets/file3: fichier différent' in e for e in errors));self.assertEqual(rows[3][3],'différent')
        (self.root/'reference.zip').unlink();(self.root/'metadata').write_text('{"expired":true}');(self.root/'error').write_text('HTTP 410')
        found,sha,rows,errors=self.run_guard();self.assertFalse(found);self.assertTrue(any('expirée=true' in e and 'HTTP 410' in e for e in errors));self.assertEqual(len(rows),7)
    def test_corrupt_zip_and_missing_or_duplicate_candidate_entries_fail(self):
        (self.root/'reference.zip').write_bytes(b'corrupt');self.assertTrue(any('intégrité ZIP invalide' in e for e in self.run_guard()[3]))
        (self.root/'reference.zip').write_bytes(self.bundle);(self.root/'candidate.apk').write_bytes(z(list(self.files.items())[:-1]));self.assertTrue(any('extraction impossible' in e for e in self.run_guard()[3]))
        (self.root/'candidate.apk').write_bytes(b'bad');self.assertTrue(any('extraction impossible' in e for e in self.run_guard()[3]))
if __name__=='__main__':unittest.main(verbosity=2)
