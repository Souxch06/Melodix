#!/usr/bin/env python3
"""Static checks for the signed-candidate comparison gate, not a CI run."""
from pathlib import Path
import unittest

WORKFLOW = Path(__file__).resolve().parents[4] / '.github/workflows/preview-apk.yml'

class CandidateGate(unittest.TestCase):
    def test_both_new_tags_are_routed_to_the_historical_candidate(self):
        text = WORKFLOW.read_text()
        job = text.split('  historical-glass-preview:', 1)[1]
        header = job.split('    steps:', 1)[0]
        for tag in ('9018', '9019'):
            self.assertIn(f"inputs.release_tag == 'v1.2.2-test.{tag}-preview'", header)
        self.assertIn('PLAYER_PATCH:', job)
        self.assertIn('PLAYLIST_TAP_PATCH:', job)
        self.assertIn('test -f "$audit/native-candidat/apply_preview_player.py"', job)
        self.assertIn('test -f "$audit/native-candidat/apply_preview_playlist_tap.py"', job)

    def test_comparison_and_unconditional_failure_gate_precede_upload(self):
        text = WORKFLOW.read_text()
        job = text.split('  historical-glass-preview:', 1)[1]
        comparison = job.split('      - name: Compare protected bytes with original signed 9016 artifact', 1)[1].split('      - name: Require signed 9016 comparison for candidate APKs', 1)[0]
        gate = job.split('      - name: Require signed 9016 comparison for candidate APKs', 1)[1].split('      - name: Upload Preview artifact only (no release)', 1)[0]
        for tag in ('9017', '9018', '9019'):
            self.assertIn(f"v1.2.2-test.{tag}-preview", comparison)
            self.assertIn(f"v1.2.2-test.{tag}-preview", gate)
        for snippet in ('id: compare_signed_9016', 'set -euo pipefail', '14156257401/zip',
                        'compare_9016_artifact.py', 'preview-output/Melodix-Preview-historique-glass.apk',
                        'protected-assets-vs-9016.tsv', 'echo "verified=true" >> "$GITHUB_OUTPUT"'):
            self.assertIn(snippet, comparison)
        for snippet in ('always()', 'steps.compare_signed_9016.outcome', 'steps.compare_signed_9016.outputs.verified',
                        'test "$COMPARISON_OUTCOME" = success', 'test "$COMPARISON_VERIFIED" = true',
                        'len(ASSET_SHA256) == 7', "r['sha256_candidate'] == r['sha256_9016']"):
            self.assertIn(snippet, gate)
        self.assertNotRegex(comparison, r'continue-on-error|\|\|\s*true')
        self.assertNotRegex(gate, r'continue-on-error|\|\|\s*true')

if __name__ == '__main__': unittest.main(verbosity=2)
