#!/usr/bin/env python3
"""Combine phase-isolated, already-redacted AndroidRuntime reports.

This helper accepts only the strict sidecar schema emitted by
sanitize_verify_diagnostic.py. It never reads raw logcat or app-private data.
"""
from __future__ import annotations

import argparse
import json
import pathlib
import re
import sys
from typing import Any

EARLY_REPORT_KEYS = {
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
HISTORICAL_SOURCE_REF = "ec6ef63f9d6638a70bb8e7877d7b798598c250a2"
HISTORICAL_APK_SHA256 = "ce756a4beead4d0bb3128b339034d70fafab620ac89a189e5042d484f8348375"
HISTORICAL_APK_VERSION_CODE = 1021015
HISTORICAL_APK_VERSION_NAME = "1.2.2-ec6ef63"
SOURCE_RE = re.compile(r"[0-9a-f]{40}\Z")
NONCE_RE = re.compile(r"[0-9a-f]{16}\Z")
SHA256_RE = re.compile(r"[0-9a-f]{64}\Z")
CLASS_RE = re.compile(r"com\.melodix\.music(?:\.[A-Za-z0-9_$]+)+\Z")
METHOD_RE = re.compile(r"[A-Za-z0-9_$<>]{1,80}\Z")
SIGNATURE_RE = re.compile(r"\([A-Za-z0-9_/$;\[\]]*\)[A-Za-z0-9_/$;\[\]]+\Z")
TYPE_RE = re.compile(
    r"(?:(?:Reference|Uninitialized Reference):\s*)?"
    r"(?:\[*(?:[BCDFIJSZV]|L[A-Za-z0-9_/$]+;)|"
    r"[A-Za-z_$][A-Za-z0-9_.$/$]*(?:\[\])*|"
    r"null|zero|conflict|unknown|undefined|top|bottom|<unknown>)\Z",
    re.IGNORECASE,
)
REGISTER_RE = re.compile(r"v[0-9]{1,5}\Z")
ALLOWED_FAILURE_KINDS = {
    "none",
    "register-type-mismatch",
    "verifier-register-error",
    "unparsed-verify-error",
}
ALLOWED_MESSAGE_STATUSES = {
    "not-applicable",
    "structured-message-available",
    "message-unavailable",
    "sensitive-content-suppressed",
    "message-present-unparsed-omitted",
}
FORBIDDEN_PATTERNS = {
    "credential_marker": re.compile(
        r"(?i)access[_-]?token|refresh[_-]?token|authorization|set-cookie|cookie|bearer|client[_-]?secret"
    ),
    "uri": re.compile(r"(?i)(?:https?|wss?)://|\bspotify:"),
    "private_path": re.compile(r"/(?:data/(?:app|user|data)|storage/emulated)/"),
    "private_query": re.compile(r"[?&][^\s)>,]+"),
    "opaque_value": re.compile(r"(?<![A-Za-z0-9])[A-Za-z0-9_+/=-]{48,}(?![A-Za-z0-9])"),
    "email": re.compile(r"(?i)\b[A-Z0-9._%+-]{1,64}@[A-Z0-9.-]{1,190}\.[A-Z]{2,24}\b"),
}


def _optional_string(value: Any, pattern: re.Pattern[str], label: str) -> None:
    if value is not None and (not isinstance(value, str) or not pattern.fullmatch(value)):
        raise ValueError(f"invalid sanitized field: {label}")


def _validate_report(path: pathlib.Path, *, source_ref: str, run_id: str) -> dict[str, Any]:
    try:
        report = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise ValueError("sanitized launch report is unreadable") from exc
    if not isinstance(report, dict) or set(report) != EARLY_REPORT_KEYS:
        raise ValueError("sanitized launch report does not match the exact sidecar schema")
    if report.get("schema_version") != 1:
        raise ValueError("unsupported sanitized launch report schema")
    if report.get("source_commit") != source_ref or report.get("run_id") != run_id:
        raise ValueError("sanitized launch report source/nonce mismatch")
    seen = report.get("androidruntime_verify_error_seen")
    detected = report.get("verify_error_detected")
    if not isinstance(seen, bool) or not isinstance(detected, bool) or seen != detected:
        raise ValueError("sanitized VerifyError flags are inconsistent")
    if report.get("failure_kind") not in ALLOWED_FAILURE_KINDS:
        raise ValueError("invalid sanitized failure kind")
    if report.get("message_status") not in ALLOWED_MESSAGE_STATUSES:
        raise ValueError("invalid sanitized message status")
    _optional_string(report.get("target_class"), CLASS_RE, "target_class")
    _optional_string(report.get("target_method"), METHOD_RE, "target_method")
    _optional_string(report.get("target_method_signature"), SIGNATURE_RE, "target_method_signature")
    _optional_string(report.get("register"), REGISTER_RE, "register")
    _optional_string(report.get("actual_type"), TYPE_RE, "actual_type")
    _optional_string(report.get("expected_type"), TYPE_RE, "expected_type")
    offset = report.get("instruction_offset")
    if offset is not None and (not isinstance(offset, int) or isinstance(offset, bool) or not 0 <= offset <= 0xFFFFFFFF):
        raise ValueError("invalid sanitized instruction offset")
    message = report.get("technical_message")
    if message is not None and (not isinstance(message, str) or len(message) > 512):
        raise ValueError("invalid sanitized technical message")
    references = report.get("method_references")
    if not isinstance(references, list) or len(references) > 8:
        raise ValueError("invalid sanitized method-reference list")
    for reference in references:
        if not isinstance(reference, dict) or set(reference) != {"class", "method", "signature"}:
            raise ValueError("invalid sanitized method reference")
        _optional_string(reference.get("class"), CLASS_RE, "method_references.class")
        _optional_string(reference.get("method"), METHOD_RE, "method_references.method")
        _optional_string(reference.get("signature"), SIGNATURE_RE, "method_references.signature")
    encoded = json.dumps(report, ensure_ascii=True, sort_keys=True)
    hits = [name for name, pattern in FORBIDDEN_PATTERNS.items() if pattern.search(encoded)]
    if hits:
        raise ValueError("sanitized launch report failed privacy scan: " + ",".join(hits))
    return report


def build_report(args: argparse.Namespace) -> dict[str, Any]:
    source_ref = args.source_ref.lower()
    run_id = args.run_id.lower()
    apk_sha256 = args.apk_sha256.lower()
    if not SOURCE_RE.fullmatch(source_ref):
        raise ValueError("source_ref must be a full lowercase commit SHA")
    if source_ref != HISTORICAL_SOURCE_REF:
        raise ValueError("source_ref is not the historical P0 source SHA")
    if not NONCE_RE.fullmatch(run_id):
        raise ValueError("run_id must be a 16-character lowercase launch nonce")
    if not SHA256_RE.fullmatch(apk_sha256) or apk_sha256 != HISTORICAL_APK_SHA256:
        raise ValueError("apk_sha256 is not the verified historical instrumentation APK digest")
    if args.artifact_run_id != "41653545783":
        raise ValueError("unexpected historical artifact run ID")
    if args.artifact_name != "Melodix-Preview-v1.2.2-test96-instrumentation.apk":
        raise ValueError("unexpected historical artifact name")
    if not 0 <= args.initial_start_status <= 255 or not 0 <= args.relaunch_start_status <= 255:
        raise ValueError("Activity start status must be an exit code")

    initial = _validate_report(pathlib.Path(args.initial_report), source_ref=source_ref, run_id=run_id)
    relaunch = _validate_report(pathlib.Path(args.relaunch_report), source_ref=source_ref, run_id=run_id)
    report: dict[str, Any] = {
        "schema_version": 1,
        "source_commit": source_ref,
        "diagnostic_run_id": run_id,
        "apk_source_run_id": args.artifact_run_id,
        "apk_artifact_name": args.artifact_name,
        "apk_version_code": HISTORICAL_APK_VERSION_CODE,
        "apk_version_name": HISTORICAL_APK_VERSION_NAME,
        "apk_debuggable": True,
        "apk_sha256": apk_sha256,
        "authenticated_spotify_test": "not_performed",
        "launches": {
            "initial": {
                "logcat_cleared_before_launch": True,
                "activity_start_exit_code": args.initial_start_status,
                "androidruntime": initial,
            },
            "post_permission_force_stop_relaunch": {
                "bluetooth_connect_granted": args.bluetooth_connect_granted == "true",
                "force_stop_completed": True,
                "logcat_cleared_before_launch": True,
                "activity_start_exit_code": args.relaunch_start_status,
                "androidruntime": relaunch,
            },
        },
    }
    privacy_scan_payload = dict(report)
    # This digest is a required provenance field, not an opaque credential.
    # All free-form diagnostic fields were scanned before the digest was added.
    privacy_scan_payload.pop("apk_sha256", None)
    encoded = json.dumps(privacy_scan_payload, ensure_ascii=True, sort_keys=True)
    hits = [name for name, pattern in FORBIDDEN_PATTERNS.items() if pattern.search(encoded)]
    if hits:
        raise ValueError("combined report failed privacy scan: " + ",".join(hits))
    return report


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-ref", required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--artifact-run-id", required=True)
    parser.add_argument("--artifact-name", required=True)
    parser.add_argument("--apk-sha256", required=True)
    parser.add_argument("--initial-report", required=True)
    parser.add_argument("--relaunch-report", required=True)
    parser.add_argument("--initial-start-status", type=int, required=True)
    parser.add_argument("--relaunch-start-status", type=int, required=True)
    parser.add_argument("--bluetooth-connect-granted", choices=("true", "false"), required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    output = pathlib.Path(args.output)
    try:
        report = build_report(args)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    except (OSError, ValueError) as exc:
        output.unlink(missing_ok=True)
        print(f"redacted_replay_report=failed; reason={exc}", file=sys.stderr)
        return 1
    print("redacted_replay_report=validated; launches=2; raw_androidruntime_retained=false")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
