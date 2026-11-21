#!/usr/bin/env python3
"""Allow the pinned manifest fallback only with evidence of expiry or deletion."""
import json
import sys
from pathlib import Path

ARTIFACT_ID = 14156257401
RUN_ID = 43701210947


def classify(metadata, pages, download_code):
    # A successful metadata response takes precedence over the listing. A
    # contradictory or incomplete response is not evidence for the fallback.
    if metadata is not None:
        if not isinstance(metadata, dict) or metadata.get('id') != ARTIFACT_ID:
            raise ValueError('métadonnées de référence invalides')
        run = metadata.get('workflow_run')
        if not isinstance(run, dict) or run.get('id') != RUN_ID:
            raise ValueError('run de référence non confirmé')
        if metadata.get('expired') is True:
            return 'expirée (métadonnées GitHub)'
        raise ValueError('référence existante ou expiration non établie')
    # A 404 by itself can mean missing permissions. A successful paginated list
    # for the known run, with a consistent total and no matching artifact,
    # supplies independent evidence of deletion.
    if download_code != '404' or not isinstance(pages, list) or not pages:
        raise ValueError('absence ou expiration non prouvée')
    artifacts = []
    totals = set()
    for page in pages:
        if not isinstance(page, dict) or type(page.get('total_count')) is not int or page['total_count'] < 0 or not isinstance(page.get('artifacts'), list):
            raise ValueError('liste des artefacts incomplète ou invalide')
        totals.add(page['total_count'])
        for item in page['artifacts']:
            if not isinstance(item, dict) or type(item.get('id')) is not int:
                raise ValueError('entrée de liste invalide')
            artifacts.append(item['id'])
    if len(totals) != 1 or len(artifacts) != next(iter(totals)) or len(set(artifacts)) != len(artifacts):
        raise ValueError('pagination des artefacts incomplète ou incohérente')
    if ARTIFACT_ID in artifacts:
        raise ValueError('référence encore présente dans le run')
    return 'absente (404 et liste complète du run de référence)'


def read_json(path):
    try:
        text = Path(path).read_text(encoding='utf8')
    except FileNotFoundError:
        return None
    except OSError as exc:
        raise ValueError('lecture des preuves impossible') from exc
    try:
        return json.loads(text)
    except ValueError as exc:
        raise ValueError('preuve JSON invalide') from exc


if __name__ == '__main__':
    if len(sys.argv) != 4:
        raise SystemExit('usage: fallback_reference_9016.py METADATA LISTING DOWNLOAD_CODE')
    try:
        print(classify(read_json(sys.argv[1]), read_json(sys.argv[2]), sys.argv[3]))
    except ValueError as exc:
        print('Repli manifeste refusé : ' + str(exc), file=sys.stderr)
        sys.exit(1)
