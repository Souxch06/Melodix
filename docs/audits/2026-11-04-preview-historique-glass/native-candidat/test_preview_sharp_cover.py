#!/usr/bin/env python3
import json
import subprocess
import unittest

from apply_preview_sharp_cover import ANCHORS, HELPER, ROW_SOURCE, patch

BASE = ("    function safeSpotifyImage(value) { return /^https:\\/\\/i\\.scdn\\.co\\//.test(value) ? value : ''; }\n"
        + "\n".join(a[0] for a in ANCHORS) + "\n")


class SharpCoverTest(unittest.TestCase):
    def test_patch_and_fail_closed(self):
        out = patch(BASE)
        self.assertEqual(out.count('= previewLargestImage(img);'), 2)
        with self.assertRaises(ValueError):
            patch(out)

    def test_row_srcset_picks_real_trusted_candidate(self):
        js = BASE.split('\n')[0] + "\nfunction extract(image,raw){\n" + ROW_SOURCE + "\n}\n" + r"""
function img(s){return {getAttribute:function(){return s;}};}
console.log(JSON.stringify([
 extract(img('https://i.scdn.co/64 64w, https://i.scdn.co/300 300w'), 'https://i.scdn.co/64'),
 extract(img('https://evil.example/x 640w'), 'https://i.scdn.co/64'),
 extract(img('https://i.scdn.co/large 1000w, https://i.scdn.co/2x 2x'), 'https://i.scdn.co/64'),
 extract(img(''), 'https://evil.example/x')
]));"""
        res=json.loads(subprocess.run(['node','-e',js],capture_output=True,text=True,check=True).stdout)
        self.assertEqual(res,['https://i.scdn.co/300','https://i.scdn.co/64','https://i.scdn.co/2x',''])

    def test_largest_listed_image_within_allowlist(self):
        js = BASE.split('\n')[0] + '\n' + HELPER + ' }\n' + '''
function img(src, srcset){ return {src: src, currentSrc: src, getAttribute: function(){ return srcset; }}; }
console.log(JSON.stringify([
  previewLargestImage(img('https://i.scdn.co/a64', 'https://i.scdn.co/a64 64w, https://i.scdn.co/a640 640w, https://i.scdn.co/a300 300w')),
  previewLargestImage(img('https://i.scdn.co/a64', '')),
  previewLargestImage(img('https://i.scdn.co/a64', 'https://evil.example/x 640w')),
  previewLargestImage(img('https://i.scdn.co/a64', 'https://i.scdn.co/huge 2000w, https://i.scdn.co/a300 300w')),
  previewLargestImage(img('https://i.scdn.co/image/ab67616d00004851abc', ''))
]));'''
        res = json.loads(subprocess.run(['node', '-e', js], capture_output=True, text=True, check=True).stdout)
        self.assertEqual(res, ['https://i.scdn.co/a640', 'https://i.scdn.co/a64', 'https://i.scdn.co/a64', 'https://i.scdn.co/a300', 'https://i.scdn.co/image/ab67616d0000b273abc'])


if __name__ == '__main__':
    unittest.main()
