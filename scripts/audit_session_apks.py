#!/usr/bin/env python3
"""Read public APK identity/certificates, not account data.

Optional dependency: androguard==4.1.4 (install outside this checkout).
Usage: audit_session_apks.py releases/*.apk > audit.json
Certificates are extracted, not independently trust-validated by this script.
"""
import hashlib
import json
import sys
from pathlib import Path

from loguru import logger
logger.remove()
from androguard.core.apk import APK

rows = []
ns = {'android': 'http://schemas.android.com/apk/res/android'}
for arg in sys.argv[1:]:
    path = Path(arg)
    apk = APK(str(path))
    root = apk.get_android_manifest_xml()
    rows.append(dict(
        file=path.name, package=apk.get_package(),
        version_code=apk.get_androidversion_code(),
        version_name=apk.get_androidversion_name(),
        sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        certificate_sha256=sorted({hashlib.sha256(cert.dump()).hexdigest()
                                   for cert in apk.get_certificates()}),
        schemes=root.xpath('//data/@android:scheme', namespaces=ns),
        authorities=root.xpath('//provider/@android:authorities', namespaces=ns),
    ))
print(json.dumps(rows, indent=2))
