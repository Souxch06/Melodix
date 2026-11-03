#!/usr/bin/env python3
"""Capture and redact a single Android verifier diagnostic for one CI launch.

Raw exception text is read only in the runner process and app-private prefs.
Only this normalized, allowlisted JSON report is written or uploaded.
"""
from __future__ import annotations

import argparse
import json
import pathlib
import re
import subprocess
import sys
import xml.etree.ElementTree as ET
from typing import Any

PACKAGE = "com.melodix.music.preview"
SOURCE_ALLOWLIST = {
    "signature-check",
    "main-content-view",
    "uncaught-exception",
    "direct-record",
}
SENSITIVE_MARKER_RE = re.compile(
    r"(?i)(?:access[_-]?token|refresh[_-]?token|authorization|set-cookie|cookie|bearer|client[_-]?secret)"
)
URL_RE = re.compile(r"(?i)\b(?:https?|wss?)://[^\s)>,]+")
SPOTIFY_URI_RE = re.compile(r"(?i)\bspotify:[^\s)>,]+")
PRIVATE_PATH_RE = re.compile(r"/(?:data/(?:app|user|data)|storage/emulated)/[^\s)>,;?&]+")
ANDROID_DECLARATION_PATH_RE = re.compile(
    r"\s*\(declaration of\b[^)]*?\bappears in\s+/data/app/[^)]*\)",
    re.IGNORECASE,
)
DEX_TARGET_CLASS_RE = re.compile(r"\bL(com/melodix/music/[A-Za-z0-9_$/]+);")
QUERY_RE = re.compile(r"[?&][^\s)>,]+")
LONG_VALUE_RE = re.compile(r"(?<![A-Za-z0-9])[A-Za-z0-9_+/=-]{48,}(?![A-Za-z0-9])")
SAFE_CLASS_RE = re.compile(r"com\.melodix\.music(?:\.[A-Za-z0-9_$]+)+")
SAFE_METHOD_RE = re.compile(r"[A-Za-z0-9_$<>]{1,80}")
SAFE_RUN_RE = re.compile(r"[0-9a-f]{16}")
SAFE_SOURCE_REF_RE = re.compile(r"[0-9a-f]{40}")
SAFE_TYPE_ATOM_RE = re.compile(
    r"(?:\[*(?:[BCDFIJSZV]|L[A-Za-z0-9_/$]+;)|[A-Za-z_$][A-Za-z0-9_.$/$]*(?:\[\])*)"
    r"|(?:null|zero|conflict|unknown|undefined|top|bottom|<unknown>)",
    re.IGNORECASE,
)
SAFE_TYPE_RE = re.compile(
    r"(?:(?:Reference|Uninitialized Reference):\s*)?" + SAFE_TYPE_ATOM_RE.pattern,
    re.IGNORECASE,
)
EMAIL_RE = re.compile(r"(?i)\b[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,190}\.[A-Z]{2,24}\b")
METHOD_REFERENCE_RE = re.compile(
    r"\b(com\.melodix\.music(?:\.[A-Za-z0-9_$]+)+)\.([A-Za-z0-9_$<>]{1,80})\s*\("
)
INSTRUCTION_OFFSET_RE = re.compile(
    r"\b(?:dex[_ ]pc|code[_ ]offset|instruction[_ ]offset|pc)\s*(?:=|:)?\s*(0x[0-9a-f]{1,8}|[0-9]{1,10})\b",
    re.IGNORECASE,
)

REGISTER_TYPE_PATTERNS = (
    re.compile(
        r"\bregister\s+(v\d+)\s+(?:has|is)\s+(?:of\s+)?type\s+(.+?)\s+but\s+expected\s+(?:type\s+)?(.+?)(?=$|[\r\n])",
        re.IGNORECASE,
    ),
    re.compile(
        r"\b(v\d+)\s+(?:has|is)\s+(?:of\s+)?type\s+(.+?)\s+but\s+expected\s+(?:type\s+)?(.+?)(?=$|[\r\n])",
        re.IGNORECASE,
    ),
)
EXPECTED_FOUND_PATTERNS = (
    re.compile(
        r"\bexpected\s+(?:type\s+)?(.+?)\s+but\s+(?:found|got)\s+(.+?)\s+(?:in\s+)?register\s+(v\d+)\b",
        re.IGNORECASE,
    ),
    re.compile(
        r"\bexpected\s+(?:type\s+)?(.+?)\s+but\s+(?:found|got)\s+(.+?)\s+\((v\d+)\)",
        re.IGNORECASE,
    ),
)


def _adb(*args: str, timeout: int = 12) -> str:
    try:
        result = subprocess.run(
            ["adb", *args],
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            check=False,
            timeout=timeout,
        )
    except (OSError, subprocess.TimeoutExpired):
        return ""
    return result.stdout.decode("utf-8", errors="replace")


def _preferences_values(xml_text: str) -> dict[str, str]:
    if not xml_text:
        return {}
    try:
        root = ET.fromstring(xml_text)
    except ET.ParseError:
        return {}
    values: dict[str, str] = {}
    for node in root:
        name = node.get("name")
        if not name:
            continue
        if node.tag == "string":
            values[name] = node.text or ""
        elif node.tag in ("long", "int", "boolean", "float"):
            values[name] = node.get("value", "")
    return values


def _safe_component(dump: str, labels: tuple[str, ...]) -> str | None:
    for line in reversed(dump.splitlines()):
        if not any(label in line for label in labels):
            continue
        match = re.search(r"([A-Za-z0-9_.]+)/([A-Za-z0-9_.$]+)", line)
        if not match:
            continue
        package, activity = match.groups()
        if not re.fullmatch(r"[A-Za-z0-9_.]{1,160}", package):
            continue
        if not re.fullmatch(r"[A-Za-z0-9_.$]{1,200}", activity):
            continue
        simple_activity = activity.rsplit(".", 1)[-1].lstrip(".")
        if package == PACKAGE and simple_activity == "MainActivity":
            return f"{PACKAGE}/MainActivity"
        return "other"
    return None


def _safe_type(value: str) -> str | None:
    value = re.sub(r"\s+", " ", value.strip())
    # Strip only explanatory suffixes; keep DEX descriptor semicolons intact.
    value = re.split(
        r"\s+(?:at|in)\s+(?:(?:code|instruction)\s+)?offset\s+(?:0x[0-9a-f]+|[0-9]+)\b|"
        r"\s+(?:at|in)\s+(?:register\s+)?v\d+\b|\s+\(declaration\b",
        value,
        maxsplit=1,
        flags=re.I,
    )[0]
    if len(value) > 128 or not SAFE_TYPE_RE.fullmatch(value):
        return None
    return value


def _contains_sensitive_marker(message: str | None) -> bool:
    return bool(message and (
        SENSITIVE_MARKER_RE.search(message)
        or URL_RE.search(message)
        or SPOTIFY_URI_RE.search(message)
        or PRIVATE_PATH_RE.search(message)
        or QUERY_RE.search(message)
        or LONG_VALUE_RE.search(message)
        or EMAIL_RE.search(message)
    ))


def _parse_register_error(message: str) -> dict[str, str] | None:
    for pattern in REGISTER_TYPE_PATTERNS:
        match = pattern.search(message)
        if match:
            register, actual, expected = match.groups()
            actual_type = _safe_type(actual)
            expected_type = _safe_type(expected)
            if actual_type and expected_type:
                return {
                    "failure_kind": "register-type-mismatch",
                    "register": register.lower(),
                    "actual_type": actual_type,
                    "expected_type": expected_type,
                }
    for pattern in EXPECTED_FOUND_PATTERNS:
        match = pattern.search(message)
        if match:
            expected, actual, register = match.groups()
            actual_type = _safe_type(actual)
            expected_type = _safe_type(expected)
            if actual_type and expected_type:
                return {
                    "failure_kind": "register-type-mismatch",
                    "register": register.lower(),
                    "actual_type": actual_type,
                    "expected_type": expected_type,
                }
    register = re.search(r"\bregister\s+(v\d+)\b", message, re.IGNORECASE)
    if register:
        return {"register": register.group(1).lower()}
    return None


def _technical_message(
    message: str | None,
    register_details: dict[str, str] | None,
    instruction_offset: int | None,
    sensitive: bool,
) -> tuple[str, str]:
    if message is None or not message.strip() or message == "__VERIFY_ERROR_MESSAGE_UNAVAILABLE__":
        return (
            "VerifyError was recorded, but no exception message was available to the diagnostic capture.",
            "message-unavailable",
        )
    if sensitive:
        return (
            "VerifyError text was withheld because it did not pass the diagnostic privacy checks.",
            "sensitive-content-suppressed",
        )

    details: list[str] = []
    if register_details and register_details.get("register"):
        register = register_details["register"]
        actual_type = register_details.get("actual_type")
        expected_type = register_details.get("expected_type")
        if actual_type and expected_type:
            details.append(
                f"register {register} has actual type {actual_type} but expected type {expected_type}"
            )
        else:
            details.append(f"register {register} was identified, but its types were not safely parsed")
    if instruction_offset is not None:
        details.append(f"instruction offset 0x{instruction_offset:x}")
    if details:
        return "VerifyError diagnostic: " + "; ".join(details) + ".", "structured-message-available"
    return (
        "VerifyError message was present but no whitelisted register, type, or instruction-offset fields could be extracted; raw text omitted.",
        "message-present-unparsed-omitted",
    )


def _method_signature(source_root: pathlib.Path, class_name: str | None, method_name: str | None) -> str | None:
    if not class_name or not method_name or not SAFE_CLASS_RE.fullmatch(class_name) or not SAFE_METHOD_RE.fullmatch(method_name):
        return None
    relative = pathlib.Path("smali", *class_name.split("." )).with_suffix(".smali")
    file_path = source_root / relative
    try:
        text = file_path.read_text(encoding="utf-8")
    except (OSError, UnicodeError):
        return None
    escaped_name = re.escape(method_name)
    pattern = re.compile(
        rf"^\.method\s+(?P<flags>.*?)\s+{escaped_name}(?P<signature>\([^)]*\)\S+)$",
        re.MULTILINE,
    )
    match = pattern.search(text)
    if not match:
        return None
    signature = match.group("signature")
    if len(signature) > 256 or not re.fullmatch(r"\([A-Za-z0-9_/$;\[\]]*\)[A-Za-z0-9_/$;\[\]]+", signature):
        return None
    return signature


def _method_references(message: str, source_root: pathlib.Path, sensitive: bool) -> list[dict[str, str | None]]:
    if sensitive or not message:
        return []
    references: list[dict[str, str | None]] = []
    seen: set[tuple[str, str]] = set()
    for match in METHOD_REFERENCE_RE.finditer(message):
        class_name, method_name = match.groups()
        key = (class_name, method_name)
        if key in seen or not SAFE_CLASS_RE.fullmatch(class_name) or not SAFE_METHOD_RE.fullmatch(method_name):
            continue
        seen.add(key)
        references.append({
            "class": class_name,
            "method": method_name,
            "signature": _method_signature(source_root, class_name, method_name),
        })
        if len(references) >= 8:
            break
    return references


def _instruction_offset(message: str, sensitive: bool) -> int | None:
    if sensitive or not message:
        return None
    match = INSTRUCTION_OFFSET_RE.search(message)
    if not match:
        return None
    value = match.group(1)
    try:
        offset = int(value, 16 if value.lower().startswith("0x") else 10)
    except ValueError:
        return None
    return offset if 0 <= offset <= 0xFFFFFFFF else None


def _capture_adb() -> dict[str, str]:

    return {
        "prefs_xml": _adb("exec-out", "run-as", PACKAGE, "cat", "shared_prefs/melodix_native.xml", timeout=10),
        "logcat": _adb("logcat", "-d", "-t", "4000", "-s", "MDXVERIFY:I", timeout=15),
        "activity_dump": _adb("shell", "dumpsys", "activity", "activities", timeout=12),
        "window_dump": _adb("shell", "dumpsys", "window", timeout=12),
        "pid": _adb("shell", "pidof", "-s", PACKAGE, timeout=8).strip(),
        "sdk": _adb("shell", "getprop", "ro.build.version.sdk", timeout=8).strip(),
    }


def build_report(
    *,
    run_id: str,
    source_ref: str,
    source_root: pathlib.Path,
    captures: dict[str, str],
) -> dict[str, Any]:
    run_id = run_id.lower()
    source_ref = source_ref.lower()
    valid_run = bool(SAFE_RUN_RE.fullmatch(run_id))
    valid_source = bool(SAFE_SOURCE_REF_RE.fullmatch(source_ref))
    values = _preferences_values(captures.get("prefs_xml", ""))
    error_class = values.get("last_verify_exception", "")
    target_class = values.get("last_verify_class", "")
    target_method = values.get("last_verify_method", "")
    target_class = target_class if SAFE_CLASS_RE.fullmatch(target_class) else None
    target_method = target_method if SAFE_METHOD_RE.fullmatch(target_method) else None
    source = values.get("last_verify_source", "")
    source = source if source in SOURCE_ALLOWLIST else None
    pref_run_id = values.get("last_verify_run_id", "")
    pref_run_id_matches = bool(valid_run and pref_run_id == run_id)
    state = values.get("last_verify_state", "")
    is_verify_error = error_class == "VerifyError" or bool(target_class or target_method)
    logcat = captures.get("logcat", "")
    armed_log = bool(valid_run and re.search(rf"verify-capture state=armed run_id={re.escape(run_id)}(?:\s|$)", logcat))
    recorded_log = bool(valid_run and re.search(rf"verify-capture state=recorded run_id={re.escape(run_id)}(?:\s|$)", logcat))
    # The exact nonce and state in app-private SharedPreferences are durable
    # evidence from this launch. Logcat is only corroborating telemetry: the
    # sanitizer reads it after a long foreground observation, so the ring
    # buffer may no longer contain the early arm line.
    correlation_state = "recorded" if is_verify_error else "armed"
    current_launch_correlated = pref_run_id_matches and state == correlation_state
    arm_log_at_launch = captures.get("arm_log_seen_at_launch", "unknown")
    arm_log_seen_at_launch = True if arm_log_at_launch == "true" else False if arm_log_at_launch == "false" else None

    raw_message = values.get("last_verify_message")
    contains_sensitive_marker = _contains_sensitive_marker(raw_message)
    register_details = None if contains_sensitive_marker else _parse_register_error(raw_message or "")
    method_references = _method_references(raw_message or "", source_root, contains_sensitive_marker)
    instruction_offset = _instruction_offset(raw_message or "", contains_sensitive_marker)
    technical_message, message_status = _technical_message(
        raw_message,
        register_details,
        instruction_offset,
        contains_sensitive_marker,
    )
    if register_details and register_details.get("register"):
        failure_kind = register_details.get("failure_kind", "verifier-register-error")
    elif is_verify_error:
        failure_kind = "unparsed-verify-error"
    else:
        failure_kind = "none"
    signature = _method_signature(source_root, target_class, target_method)
    if state == "recorded":
        diagnostic_state = "recorded-current-launch" if current_launch_correlated else "recorded-uncorrelated"
    elif state == "armed":
        diagnostic_state = "armed-current-launch" if current_launch_correlated else "armed-uncorrelated"
    elif state == "arm-pending":
        diagnostic_state = "pending-not-consumed"
    elif is_verify_error:
        diagnostic_state = "verify-error-not-recorded"
    else:
        diagnostic_state = "capture-not-recorded"

    sdk = captures.get("sdk", "")
    sdk = sdk if re.fullmatch(r"[0-9]{1,3}", sdk) else None
    pid = captures.get("pid", "").strip()
    process_alive = bool(re.fullmatch(r"[0-9]{1,10}", pid))
    activity_dump = captures.get("activity_dump", "")
    window_dump = captures.get("window_dump", "")
    resumed = _safe_component(activity_dump, ("mResumedActivity", "topResumedActivity", "ResumedActivity"))
    focused = _safe_component(window_dump, ("mCurrentFocus", "mFocusedApp"))
    expected_activity = f"{PACKAGE}/MainActivity"
    main_resumed = resumed == expected_activity or resumed == f"{PACKAGE}/.MainActivity"

    stage = values.get("last_stage", "")
    stage = stage if re.fullmatch(r"[A-Za-z0-9_.-]{1,64}", stage) else None
    elapsed = values.get("last_verify_elapsed_ms", "")
    elapsed_ms = int(elapsed) if elapsed.isdigit() and len(elapsed) <= 16 else None

    report: dict[str, Any] = {
        "schema_version": 2,
        "source_commit": source_ref if valid_source else "invalid-source-ref",
        "run_id": run_id if valid_run else "invalid-run-id",
        "android_api": int(sdk) if sdk is not None else None,
        "capture_armed_log_seen": armed_log,
        "arm_log_seen_at_launch": arm_log_seen_at_launch,
        "verify_record_log_seen": recorded_log,
        "preference_run_id_matches": pref_run_id_matches,
        "current_launch_correlated": current_launch_correlated,
        "verify_error_detected": is_verify_error,
        "verify_exception_class": "VerifyError" if is_verify_error else None,
        "androidruntime_verify_error_seen": False,
        "record_source": source,
        "target_class": target_class,
        "target_method": target_method,
        "target_method_signature": signature,
        "method_references": method_references,
        "instruction_offset": instruction_offset,
        "failure_kind": failure_kind,
        "register": register_details.get("register") if register_details else None,
        "actual_type": register_details.get("actual_type") if register_details else None,
        "expected_type": register_details.get("expected_type") if register_details else None,
        "technical_message": technical_message if is_verify_error else None,
        "message_status": message_status if is_verify_error else "not-applicable",
        "diagnostic_state": diagnostic_state,
        "verify_elapsed_realtime_ms": elapsed_ms,
        "process_alive": process_alive,
        "resumed_component": resumed,
        "focused_component": focused,
        "main_activity_resumed": main_resumed,
        "last_stage": stage,
    }
    return report


EARLY_ANDROIDRUNTIME_KEYS = {
    "schema_version",
    "source_commit",
    "run_id",
    "androidruntime_verify_error_seen",
    "verify_error_detected",
    "target_class",
    "target_method",
    "target_method_signature",
    "method_references",
    "instruction_offset",
    "failure_kind",
    "register",
    "actual_type",
    "expected_type",
    "technical_message",
    "message_status",
}


def _androidruntime_verify_message(logcat: str) -> str | None:
    lines = logcat.splitlines()
    for index, line in enumerate(lines):
        if not re.search(r"\b(?:java\.lang\.)?VerifyError\b", line):
            continue
        previous_lines = lines[max(0, index - 4):index]
        process_lines = [prior for prior in previous_lines if re.search(r"\bProcess:\s*", prior)]
        app_process_seen = bool(
            process_lines
            and re.search(r"\bProcess:\s*com\.melodix\.music\.preview(?:\s|,|$)", process_lines[-1])
        )
        app_class_in_error = bool(
            PACKAGE in line or SAFE_CLASS_RE.search(line) or DEX_TARGET_CLASS_RE.search(line)
        )
        if not (app_process_seen or app_class_in_error):
            continue

        message_lines = [line]
        for continuation in lines[index + 1:index + 5]:
            if not continuation.strip():
                break
            if re.search(
                r"\b(?:Verifier rejected class|failed to verify|register\s+v\d+|expected\s+(?:type\s+)?|"
                r"(?:found|got)\s+|(?:dex[_ ]pc|code[_ ]offset|instruction[_ ]offset|pc)\s*(?:=|:)?\s*)",
                continuation,
                re.IGNORECASE,
            ):
                message_lines.append(continuation)
                continue
            break

        message = "\n".join(message_lines)
        # Android's generated class-path suffix is runtime metadata, not part
        # of the verifier finding. Drop it before the normal privacy scanner;
        # any other private path remains fail-closed.
        message = ANDROID_DECLARATION_PATH_RE.sub("", message)
        message = re.sub(
            r"(?m)^[VDIWEF]/AndroidRuntime(?:\s*\([^)]*\))?:\s*",
            "",
            message,
        )
        return message[:4096]
    return None


def _early_androidruntime_report(
    *,
    logcat: str,
    run_id: str,
    source_ref: str,
    source_root: pathlib.Path,
) -> dict[str, Any]:
    message = _androidruntime_verify_message(logcat)
    valid_run = bool(SAFE_RUN_RE.fullmatch(run_id.lower()))
    valid_source = bool(SAFE_SOURCE_REF_RE.fullmatch(source_ref.lower()))
    empty: dict[str, Any] = {
        "schema_version": 1,
        "source_commit": source_ref.lower() if valid_source else "invalid-source-ref",
        "run_id": run_id.lower() if valid_run else "invalid-run-id",
        "androidruntime_verify_error_seen": message is not None,
        "verify_error_detected": message is not None,
        "target_class": None,
        "target_method": None,
        "target_method_signature": None,
        "method_references": [],
        "instruction_offset": None,
        "failure_kind": "unparsed-verify-error" if message is not None else "none",
        "register": None,
        "actual_type": None,
        "expected_type": None,
        "technical_message": None,
        "message_status": "not-applicable",
    }
    if message is None:
        return empty

    # Reuse the same strict parser as the app-private capture. Only the
    # synthetic allowlisted XML is passed to it; raw AndroidRuntime text never
    # leaves this Python process or reaches a file, annotation, or artifact.
    sensitive = _contains_sensitive_marker(message)
    references = _method_references(message, source_root, sensitive)
    target_class = references[0]["class"] if references else None
    target_method = references[0]["method"] if references else None
    if not sensitive and not target_class:
        descriptor = DEX_TARGET_CLASS_RE.search(message)
        if descriptor:
            target_class = descriptor.group(1).replace("/", ".")
        else:
            java_class = SAFE_CLASS_RE.search(message)
            if java_class:
                target_class = java_class.group(0)

    escaped_message = (
        message.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
    )
    escaped_class = (target_class or "").replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    escaped_method = (target_method or "").replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
    escaped_run = run_id.lower() if valid_run else "invalid-run-id"
    synthetic_prefs = (
        "<map>"
        "<string name=\"last_verify_exception\">VerifyError</string>"
        f"<string name=\"last_verify_class\">{escaped_class}</string>"
        f"<string name=\"last_verify_method\">{escaped_method}</string>"
        f"<string name=\"last_verify_run_id\">{escaped_run}</string>"
        "<string name=\"last_verify_state\">arm-pending</string>"
        f"<string name=\"last_verify_message\">{escaped_message}</string>"
        "</map>"
    )
    parsed = build_report(
        run_id=escaped_run,
        source_ref=source_ref,
        source_root=source_root,
        captures={"prefs_xml": synthetic_prefs, "logcat": ""},
    )
    empty.update({key: parsed.get(key) for key in (
        "target_class",
        "target_method",
        "target_method_signature",
        "method_references",
        "instruction_offset",
        "failure_kind",
        "register",
        "actual_type",
        "expected_type",
        "technical_message",
        "message_status",
    )})
    empty["verify_error_detected"] = bool(parsed.get("verify_error_detected"))
    empty["androidruntime_verify_error_seen"] = bool(parsed.get("verify_error_detected"))
    return empty


def _valid_early_androidruntime_report(
    value: Any,
    *,
    run_id: str,
    source_ref: str,
) -> bool:
    if not isinstance(value, dict) or set(value) != EARLY_ANDROIDRUNTIME_KEYS:
        return False
    if value.get("schema_version") != 1 or value.get("run_id") != run_id.lower():
        return False
    if value.get("source_commit") != source_ref.lower():
        return False
    if not isinstance(value.get("androidruntime_verify_error_seen"), bool):
        return False
    if not isinstance(value.get("verify_error_detected"), bool):
        return False
    return value["androidruntime_verify_error_seen"] == value["verify_error_detected"]


def _merge_early_androidruntime_report(
    report: dict[str, Any],
    early: Any,
    *,
    run_id: str,
    source_ref: str,
) -> dict[str, Any]:
    if not _valid_early_androidruntime_report(early, run_id=run_id, source_ref=source_ref):
        return report
    if not early["androidruntime_verify_error_seen"]:
        return report

    report["androidruntime_verify_error_seen"] = True
    report["verify_error_detected"] = True
    report["verify_exception_class"] = "VerifyError"
    for key in ("target_class", "target_method", "target_method_signature"):
        if report.get(key) is None and early.get(key) is not None:
            report[key] = early[key]
    if not report.get("method_references") and isinstance(early.get("method_references"), list):
        report["method_references"] = early["method_references"]
    if report.get("instruction_offset") is None and isinstance(early.get("instruction_offset"), int):
        report["instruction_offset"] = early["instruction_offset"]

    if report.get("register") is None and isinstance(early.get("register"), str):
        report["register"] = early["register"]
    if report.get("actual_type") is None and isinstance(early.get("actual_type"), str):
        report["actual_type"] = early["actual_type"]
    if report.get("expected_type") is None and isinstance(early.get("expected_type"), str):
        report["expected_type"] = early["expected_type"]

    early_has_details = early.get("message_status") == "structured-message-available"
    primary_message_missing = report.get("message_status") in {
        "not-applicable",
        "message-unavailable",
        "message-present-unparsed-omitted",
    }
    if early_has_details and primary_message_missing:
        report["technical_message"] = early.get("technical_message")
        report["message_status"] = "structured-message-available"
        if early.get("failure_kind") == "register-type-mismatch":
            report["failure_kind"] = "register-type-mismatch"
    elif report.get("failure_kind") in {"none", "unparsed-verify-error"} and early.get("failure_kind") not in {
        "none",
        "unparsed-verify-error",
    }:
        report["failure_kind"] = early["failure_kind"]
    return report


def _read_json_file(path: pathlib.Path) -> Any:
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError):
        return None


def _stdin_captures() -> dict[str, str]:
    try:
        value = json.load(sys.stdin)
    except (json.JSONDecodeError, OSError):
        return {}
    if not isinstance(value, dict):
        return {}
    return {key: item if isinstance(item, str) else "" for key, item in value.items()}


def _safe_summary(report: dict[str, Any]) -> str:
    target = "none"
    if report.get("target_class") and report.get("target_method"):
        target = f"{report['target_class'].rsplit('.', 1)[-1]}.{report['target_method']}"

    def flag(name: str) -> str:
        value = report.get(name)
        return "unknown" if value is None else str(value).lower()

    return (
        f"verify_error_detected={flag('verify_error_detected')}; "
        f"androidruntime_verify_error_seen={flag('androidruntime_verify_error_seen')}; "
        f"preference_run_id_matches={flag('preference_run_id_matches')}; "
        f"arm_log_seen_at_launch={flag('arm_log_seen_at_launch')}; "
        f"capture_armed_log_seen={flag('capture_armed_log_seen')}; "
        f"current_launch_correlated={flag('current_launch_correlated')}; "
        f"diagnostic_state={report.get('diagnostic_state') or 'unknown'}; "
        f"failure_kind={report.get('failure_kind') or 'unknown'}; target={target}; "
        f"register={report.get('register') or 'none'}; "
        f"process_alive={flag('process_alive')}; "
        f"main_activity_resumed={flag('main_activity_resumed')}; "
        f"last_stage={report.get('last_stage') or 'unknown'}"
    )


def _early_androidruntime_summary(report: dict[str, Any]) -> str:
    target = "none"
    if report.get("target_class") and report.get("target_method"):
        target = f"{report['target_class'].rsplit('.', 1)[-1]}.{report['target_method']}"
    return (
        f"androidruntime_verify_error_seen={str(bool(report.get('androidruntime_verify_error_seen'))).lower()}; "
        f"failure_kind={report.get('failure_kind') or 'none'}; target={target}; "
        f"register={report.get('register') or 'none'}; "
        f"message_status={report.get('message_status') or 'not-applicable'}"
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--source-ref", required=True)
    parser.add_argument("--source-root", type=pathlib.Path, default=pathlib.Path(__file__).resolve().parents[1])
    parser.add_argument("--output", type=pathlib.Path)
    parser.add_argument(
        "--arm-log-seen-at-launch",
        choices=("true", "false", "unknown"),
        default="unknown",
        help="Safe boolean captured immediately after the explicit cold launch.",
    )
    parser.add_argument("--stdin-json", action="store_true", help="Read synthetic captures JSON from stdin (tests only).")
    parser.add_argument(
        "--androidruntime-stdin",
        action="store_true",
        help="Read AndroidRuntime logcat from stdin and write only normalized, allowlisted fields.",
    )
    parser.add_argument(
        "--early-androidruntime-report",
        type=pathlib.Path,
        help="Merge a run-scoped, already-redacted AndroidRuntime snapshot into the final report.",
    )
    args = parser.parse_args()
    if args.stdin_json and args.androidruntime_stdin:
        parser.error("--stdin-json and --androidruntime-stdin are mutually exclusive")
    if args.androidruntime_stdin:
        if args.output is None:
            parser.error("--output is required with --androidruntime-stdin")
        early = _early_androidruntime_report(
            logcat=sys.stdin.read(),
            run_id=args.run_id,
            source_ref=args.source_ref,
            source_root=args.source_root,
        )
        encoded = json.dumps(early, ensure_ascii=True, sort_keys=True, indent=2) + "\n"
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded, encoding="utf-8")
        print(_early_androidruntime_summary(early))
        return 0

    captures = _stdin_captures() if args.stdin_json else _capture_adb()
    captures["arm_log_seen_at_launch"] = args.arm_log_seen_at_launch
    report = build_report(
        run_id=args.run_id,
        source_ref=args.source_ref,
        source_root=args.source_root,
        captures=captures,
    )
    if args.early_androidruntime_report is not None:
        report = _merge_early_androidruntime_report(
            report,
            _read_json_file(args.early_androidruntime_report),
            run_id=args.run_id,
            source_ref=args.source_ref,
        )
    encoded = json.dumps(report, ensure_ascii=True, sort_keys=True, indent=2) + "\n"
    if args.stdin_json:
        sys.stdout.write(encoded)
    else:
        if args.output is None:
            parser.error("--output is required outside --stdin-json test mode")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(encoded, encoding="utf-8")
        print(_safe_summary(report))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
