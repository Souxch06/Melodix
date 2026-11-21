#!/usr/bin/env python3
import unittest
import tempfile
from pathlib import Path
from fallback_reference_9016 import classify, read_json, ARTIFACT_ID, RUN_ID

class GuardFallback(unittest.TestCase):
    def metadata(self, expired):
        return {'id': ARTIFACT_ID, 'expired': expired, 'workflow_run': {'id': RUN_ID}}
    def page(self, ids, total=None):
        return {'total_count': len(ids) if total is None else total, 'artifacts': [{'id': i} for i in ids]}
    def test_only_proven_expiry_allows_fallback(self):
        self.assertIn('expirée', classify(self.metadata(True), None, 'unknown'))
        for meta in (self.metadata(False), self.metadata(None), {'id': ARTIFACT_ID, 'expired': True}, {'id': 1, 'expired': True, 'workflow_run': {'id': RUN_ID}}):
            with self.assertRaises(ValueError): classify(meta, [self.page([])], '404')
    def test_deletion_requires_404_and_complete_consistent_run_listing(self):
        self.assertIn('absente', classify(None, [self.page([12, 34])], '404'))
        self.assertIn('absente', classify(None, [self.page([])], '404'))
        for pages, code in [(None, '404'), ([self.page([])], '403'), ([self.page([])], 'unknown'),
                            ([self.page([ARTIFACT_ID])], '404'), ([self.page([1], 2)], '404'),
                            ([self.page([1, 1])], '404'), ([{'total_count': 1, 'artifacts': [{}]}], '404')]:
            with self.assertRaises(ValueError): classify(None, pages, code)
    def test_corrupt_evidence_never_looks_like_missing_evidence(self):
        with tempfile.TemporaryDirectory() as d:
            p = Path(d) / 'meta.json'
            self.assertIsNone(read_json(p))
            p.write_text('{broken')
            with self.assertRaises(ValueError): read_json(p)

    def test_two_complete_pages_and_metadata_precedence(self):
        pages = [self.page([1, 2], 3), self.page([3], 3)]
        self.assertIn('absente', classify(None, pages, '404'))
        with self.assertRaises(ValueError): classify(self.metadata(False), pages, '404')

if __name__ == '__main__': unittest.main(verbosity=2)
