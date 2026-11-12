#!/usr/bin/env python3
"""Replay the unchanged strict launcher acceptance on a fresh offline emulator.

Only observational log markers are added to the in-memory script around the
exit tap. Never change its predicate or its return status. Capture only the
closed redacted MDX journal and error categories, not raw URLs or console text.
"""
import json
import os
import pathlib
import re
import subprocess
import sys
import threading
import time
import xml.etree.ElementTree as ET
from startup_timing_journal import allowed_entry

OUT = pathlib.Path('evidence')
OUT.mkdir(exist_ok=True)
EVENTS = []
SAMPLES = []
PHASE = 'before-exit'
START = time.monotonic()
PROBE_READY = threading.Event()


def safe_event(line):
    probe = re.search(r'MDXDOM\s*\(\s*\d+\)\s*:\s*(.*)$', line)
    if probe and re.fullmatch(r'(?:probe=(?:ready|unavailable)|web=absent|activity=(?:resumed|paused)|progress=(?:[0-9]|[1-9][0-9]|100) nativehost=(?:none|accounts|player|other) host=(?:accounts|player|chrome-error|about|other) ready=(?:loading|interactive|complete|other) started=(?:undefined|true|false|other) bootstrap=(?:undefined|true|false|other) home=(?:true|false) interface=(?:true|false))', probe.group(1)):
        return 'DOM ' + probe.group(1)
    match = re.search(r'MDXTRACE\s*\(\s*\d+\)\s*:\s*(sid=[0-9a-f]{8} t=\d+ .*)$', line)
    if match and allowed_entry(match.group(1)) and re.search(
            r' (?:navigation |session-state |proof |proof-guard |stage |perf (?:activity-|webview-|page-loaded)|js-shell-ready|bridge-js-started|bridge-bootstrap-ready|home-data stage=)', match.group(1)):
        return match.group(1)
    match = re.search(r'MDXDEMOREPLAY\s*\(\s*\d+\)\s*:\s*(before-exit|after-exit)$', line)
    if match:
        return 'MARK ' + match.group(1)
    return None


def mark(name):
    global PHASE
    PHASE = name
    EVENTS.append('host_ms=%d MARK %s' % ((time.monotonic() - START) * 1000, name))


def observe_node_sample(items):
    """Passive summary of the same snapshot consumed by the strict predicate."""
    relevant = []
    for n in items:
        ident = n.get('resource-id', '').split('/')[-1]
        cls = n.get('class', '')
        if ident in ('sessionTitle', 'nativeSettingsButton') or cls == 'android.webkit.WebView':
            relevant.append({'id': ident if ident in ('sessionTitle', 'nativeSettingsButton') else '',
                             'class': cls, 'package': n.get('package', ''), 'bounds': n.get('bounds', ''),
                             'children': len(n), 'element_truth': bool(n)})
    session = next((n for n in items if n.get('resource-id', '').endswith(':id/sessionTitle')), None)
    settings = next((n for n in items if n.get('resource-id', '').endswith(':id/nativeSettingsButton')), None)
    # Reproduce the original predicate on the actual XML elements, including
    # ElementTree's child-count-based truthiness; this is observation only.
    legacy = session or settings
    texts = {n.get('text', '') for n in items}
    state = {'phase': PHASE, 'views': relevant,
             'legacy_predicate_matches': legacy is not None,
             'intended_predicate_matches': session is not None or settings is not None,
             'login_labels': sorted(texts & {'Welcome back', 'Email', 'Continue', 'Sign up'}),
             'demo_entry': 'Essayer le mode démo' in texts}
    now = round((time.monotonic() - START) * 1000)
    if not SAMPLES or state != SAMPLES[-1]['state'] or now - SAMPLES[-1]['host_ms'] >= 15000:
        SAMPLES.append({'host_ms': now, 'state': state})


def start_dom_probe():
    # Instrumentation is installed only on a fresh CI emulator, signed with the
    # same Preview key; original test157 bytes and auth state remain untouched.
    subprocess.Popen(['adb', 'shell', 'am', 'instrument', '-w',
                      'com.melodix.diagnostic/com.melodix.diagnostic.DemoReturnProbe'],
                     stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not PROBE_READY.wait(20):
        EVENTS.append('host_ms=%d DOM probe=not-ready' % ((time.monotonic() - START) * 1000))


def replay_source(source):
    target = "    tap(wait(lambda n: text_node(n, 'Quitter la démo'), 'demo exit'))"
    if source.count(target) != 1:
        raise RuntimeError('acceptance exit anchor changed: refusing diagnostic replay')
    source = source.replace(target, "    mark('before-exit')\n" + target + "\n    mark('after-exit')")
    sample = "    return list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))"
    if source.count(sample) != 1:
        raise RuntimeError('acceptance snapshot anchor changed: refusing diagnostic replay')
    source = source.replace(sample, "    items = list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))\n    observe_node_sample(items)\n    return items")
    if os.environ.get('MELODIX_DEMO_DOM_PROBE') == '1':
        force = "    adb('shell', 'am', 'force-stop', pkg)"
        if source.count(force) != 1:
            raise RuntimeError('acceptance force-stop anchor changed')
        source = source.replace(force, force + "\n    start_dom_probe()")
    return source


def collect_ui():
    def adb(*args):
        return subprocess.run(['adb', *args], stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                              check=True, timeout=30).stdout
    adb('shell', 'uiautomator', 'dump', '/sdcard/demo-observe.xml')
    xml = adb('shell', 'cat', '/sdcard/demo-observe.xml')
    nodes = list(ET.fromstring(xml[xml.index(b'<?xml'):]).iter('node'))
    texts = {n.get('text', '') for n in nodes}
    ids = {n.get('resource-id', '').split('/')[-1] for n in nodes}
    return {'sessionTitle': 'sessionTitle' in ids,
            'nativeSettingsButton': 'nativeSettingsButton' in ids,
            'webview_accessible': any(n.get('class') == 'android.webkit.WebView' for n in nodes),
            'login_labels_observed': sorted(texts & {'Welcome back', 'Email', 'Continue',
                                                       'Continue with Google', 'Sign up'}),
            # Accessibility does not expose HTML IDs or JavaScript variables.
            'html_home_selector': 'NOT MEASURED', 'bridgeStarted': 'NOT MEASURED',
            'bridgeBootstrapReady': 'NOT MEASURED'}


def main():
    subprocess.run(['adb', 'logcat', '-c'], check=True)
    proc = subprocess.Popen(['adb', 'logcat', '-v', 'brief', '-s',
                             'MDXTRACE:I', 'MDXDOM:I', 'MDXDEMOREPLAY:I', 'chromium:I', 'AndroidRuntime:E'],
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True, errors='replace')
    events, errors = EVENTS, {'android_fatal': 0, 'android_classes': set(), 'javascript_errors': 0,
                          'javascript_classes': set()}
    def read_logs():
        for line in proc.stdout:
            event = safe_event(line.rstrip())
            if event == 'DOM probe=ready': PROBE_READY.set()
            if event and len(events) < 360:
                events.append('host_ms=%d %s' % ((time.monotonic() - START) * 1000, event))
            if 'AndroidRuntime' in line:
                if 'FATAL EXCEPTION' in line: errors['android_fatal'] += 1
                errors['android_classes'].update(re.findall(r'\b(?:[A-Za-z_$][\w$]*\.)*[A-Za-z_$][\w$]*(?:Exception|Error)\b', line))
            if 'chromium' in line.lower() and re.search(r'uncaught|javascript error|console.*error', line, re.I):
                errors['javascript_errors'] += 1
                errors['javascript_classes'].update(re.findall(r'\b(?:TypeError|ReferenceError|SyntaxError|RangeError|URIError|EvalError)\b', line))
    thread = threading.Thread(target=read_logs, daemon=True); thread.start()
    status = 0
    try:
        source = pathlib.Path('scripts/capture_launcher_acceptance.py').read_text()
        sys.argv = ['scripts/capture_launcher_acceptance.py', str(OUT)]
        exec(compile(replay_source(source), 'scripts/capture_launcher_acceptance.py', 'exec'),
             {'__name__': '__main__', 'mark': mark, 'observe_node_sample': observe_node_sample, 'start_dom_probe': start_dom_probe})
    except Exception as exc:
        print('::error title=Diagnostic replay::strict acceptance failed: ' + type(exc).__name__, flush=True)
        status = 1
    finally:
        try:
            ui = collect_ui()
            SAMPLES.append({'host_ms': round((time.monotonic() - START) * 1000), 'state': {'phase': 'final-independent', 'ui': ui}})
        except Exception as exc:
            ui = {'error': type(exc).__name__, 'html_home_selector': 'NOT MEASURED',
                  'bridgeStarted': 'NOT MEASURED', 'bridgeBootstrapReady': 'NOT MEASURED'}
        time.sleep(2)
        proc.terminate(); thread.join(timeout=5)
        errors['android_classes'] = sorted(errors['android_classes'])
        errors['javascript_classes'] = sorted(errors['javascript_classes'])
        (OUT / 'ui-samples.json').write_text(json.dumps(SAMPLES, ensure_ascii=False, indent=2) + '\n')
        (OUT / 'journal-safe.txt').write_text('\n'.join(events) + '\n')
        (OUT / 'diagnostic-summary.json').write_text(json.dumps({'ui': ui, 'errors': errors,
                'strict_acceptance_exit': status}, ensure_ascii=False, indent=2) + '\n')
        print('::notice title=Diagnostic UI::' + json.dumps(ui, ensure_ascii=False), flush=True)
        print('::notice title=Diagnostic errors::' + json.dumps(errors), flush=True)
        for i in range(0, len(SAMPLES), 5):
            print('::notice title=Diagnostic UI samples %03d::%s' % (i // 5, json.dumps(SAMPLES[i:i+5], ensure_ascii=False)), flush=True)
        # Group bounded, allowlisted journal lines into annotations accessible via GitHub API.
        for i in range(0, len(events), 12):
            print('::notice title=Diagnostic journal %03d::%s' % (i // 12, ' | '.join(events[i:i+12])), flush=True)
    return status


if __name__ == '__main__':
    sys.exit(main())
