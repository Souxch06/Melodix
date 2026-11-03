# Native Home render-tree diagnostics — contract v1

The Android `native_home_render_tree_fixture` emits a bounded, test-only diagnostic trail. This is an observation contract; it does not change or repair the Home renderer.

## Artifacts

The harness writes to the Preview target package's private files directory:

- `files/melodix-preview-native-home-render-tree-diagnostics.json` — schema `melodix.native-home-render-tree.v1` (schema version 1), rewritten through a temporary file after each event. A completed prior snapshot is retained as `.previous` while the new report is published.
- `files/melodix-preview-native-home-render-tree.png` — the Home screenshot for the measured pixel region; on a fixture failure the failure-time screenshot replaces the success candidate.

The emulator workflow pulls both files immediately after `am instrument`, irrespective of the instrumentation exit code, and attempts the prior complete JSON snapshot if the current report path is missing. It uploads the artifacts with the redacted event log. `native-home-render-tree-log.txt` is a filtered `MelodixHarness` logcat view: event entries are one-line JSON and diagnostic-write notices expose only exception classes. The report embeds the redacted Android `main` / native-root hierarchy and pixel counts captured at the failure point when available.

## Event shape

Every event has:

- `event_id`, `phase_id`, and `event`;
- `monotonic_elapsed_realtime_ns` from Android's monotonic elapsed-realtime clock;
- `outcome` (`pass`, `fail`, `observed`, or `unavailable`);
- `expected` and `observed` JSON values.

The fixture records separate observations for payload construction and length/card/playlist counts, sender-side AndBridge transmission metadata, callback invocation, the app-side callback receipt marker, parse/model accept-or-reject markers, renderer entry/result, view creation, parent attachment, measured layout, global visibility, and screenshot pixels. Failure-time snapshots add observed creation/attachment/measurement/visibility events even when the fixture fails before its normal render checks. The renderer markers are read from `NativeCrashGuard.lastDiag()` through an allowlist; the raw diagnostic tail is never copied into the report.

For each measured view, the report records the Java class, numeric and resolved resource ID, child count, parent class and resource ID, measured and laid-out dimensions, Android visibility, `isShown`, alpha, on-screen coordinates, and `getGlobalVisibleRect` result/bounds. The hierarchy omits text and content descriptions; it is depth- and node-bounded. Synthetic-card/title counts are derived from the test-only sentinel title, and the fixture contains zero real playlists.

## Failure preservation and privacy

The failure object records the original thrown class, message, stack trace, active fixture phase, and last successful event ID. A secondary restoration failure is stored separately and attached as a suppressed exception; it cannot replace the primary fixture failure. The one-line failure log remains the stable contract `failure phase=<reportedFailurePhase> type=<original exception class>`; the same phase/type keys go into the instrumentation status bundle.

Exception text is redacted only for recognized credential, cookie, and URL patterns; `message_redacted` states whether this changed the original message. The fixture never serializes payload bodies, Spotify account content, page text, cookies, or tokens. The report and screenshot are test artifacts, not evidence of an authenticated Spotify Home or real playlist rendering.

## Checks

`tests/android/native_home_render_tree_diagnostics.schema.json` is the v1 structure. Before upload, CI validates the retrieved JSON against this Draft 2020-12 schema and scans the JSON/log text for credential, cookie, authorization, and URL patterns; it also validates the PNG and rejects text metadata. If the safety scan fails, diagnostic artifacts are omitted rather than exposed. Node/static tests verify that the Java harness, failure-status names, privacy boundary, separate malformed-payload expectation, schema validation, and workflow artifact retrieval continue to match this contract. These checks do not replace running the Android instrumentation on an emulator.
