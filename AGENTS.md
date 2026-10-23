# Instructions obligatoires pour les sessions Arena / Agents IA — Melodix

Ce fichier définit le protocole permanent applicable à **toutes les sessions Arena et agents de développement** intervenant sur `Souxch06/Melodix`.

---

## 1. Synchronisation automatique avec GitHub après chaque modification importante

L'utilisateur ne doit **jamais** avoir à demander manuellement « commit, push, compile et mets GitHub à jour » après une modification fonctionnelle ou technique significative.

### Protocole obligatoire avant de conclure une réponse comportant des modifications de code/config :

1. **Finaliser et relire le diff** :
   - Inspecter `git status` et `git diff` sur l'ensemble des fichiers modifiés.
   - Vérifier l'absence de régression Dalvik/Smali, JS bridge, navigation retour, session/logout et SSRF.
2. **Exécuter systématiquement la suite de validation locale** :
   ```bash
   ./scripts/verify-and-sync.sh
   ```
   *(Exécute l'intégralité de `node --test tests/*.test.js` — syntaxe JS, garde SSRF, interpréteur Smali, vérificateur statique CFG + treillis Dalvik `[D7]` sur les `3 804` fichiers `.smali`, et validation du patch Smali E2E.)*
3. **Commit descriptif et push automatique sur la branche de travail active** :
   ```bash
   ./scripts/verify-and-sync.sh --commit "<type>(<portée>): <description claire>" --push --wait-ci -- <nouveaux_fichiers_autorisés...>
   ```
   - Si l'arbre de travail est déjà intégralement synchronisé avec `origin/<branche>`, **ne jamais créer de commit vide ou artificiel**.
   - Attendre la fin effective des runs GitHub Actions déclenchés sur le **SHA exact à 40 caractères** (`HEAD`) et vérifier leurs statuts, annotations Check-Runs (`gh api repos/Souxch06/Melodix/check-runs/<job_id>/annotations`) et digests d'artefacts (`gh api repos/Souxch06/Melodix/actions/runs/<run_id>/artifacts`).
4. **Après une fonctionnalité majeure** :
   - Mettre à jour `CHANGELOG.md` (et la documentation technique impactée).
   - Mettre à jour le corps de la PR existante de la branche (`gh pr edit <numéro> --body-file ...`) **sans ouvrir une nouvelle PR à chaque commit**.
   - Fournir systématiquement dans la réponse finale : le SHA complet, les résultats réels des tests/builds, les limites non démontrées (ex. compte Spotify réel / Widevine sur téléphone physique), et les liens directs vers le commit, les runs GitHub Actions, les artefacts et la PR.

---

## 2. Séparation stricte entre développement continu et Releases officielles

- **Les pushes de développement ne publient jamais de Release** :
  - Chaque `push` sur toute branche hors `main` déclenche automatiquement :
    1. `.github/workflows/preview-apk.yml` (*Build Melodix Preview APK*) en lecture seule (`contents: read`) → génère et téléverse l'artefact `Melodix-Preview-<SHA40>` (APK signé `com.melodix.music.preview`, `.sha256`, `build-manifest-<SHA40>.json`, rapport TAP `node-tests-<SHA40>.tap`).
    2. `.github/workflows/test-preview-emulator.yml` (*Smoke test Preview APK on Android emulator*) en lecture seule (`contents: read`) → exécute les tests Node/Dalvik puis vérifie sur émulateur Android 15 (`API 35` x86_64) le démarrage à froid (Phase 1) et les parcours E2E complets (Phase 2), et téléverse `Melodix-Emulator-Verification-<SHA40>`.
- **Interdictions absolues sans instruction explicite de l'utilisateur** :
  - **Interdit** de modifier ou pousser directement sur `main`.
  - **Interdit** de réécrire l'historique Git (`git rebase`, `git commit --amend` sur commit poussé, `git push --force`).
  - **Interdit** de fusionner (`gh pr merge`) ou de fermer (`gh pr close`) une PR existante.
  - **Interdit** de créer, modifier, supprimer ou écraser une GitHub Release existante (notamment `v1.2.2-test.1-preview`, `id=416575911`) ou ses assets.
  - **Interdit** d'ajouter dans le code ou Git tout secret, token, keystore (`*.jks`, `*.keystore`, `*.p12`), cookie de session ou l'image non suivie `docs/previews/melodix-phone-ui-concept.png` (ne jamais utiliser `git add -A`).

---

## 3. Limites techniques réelles à toujours énoncer honnêtement

1. **Frontière d'autonomie entre Arena et GitHub Actions** :
   - Durant un tour actif, l'agent Arena **peut et doit** exécuter `verify-and-sync.sh --commit ... --push --wait-ci` avant de rendre la main.
   - En revanche, **en dehors d'un tour demandé par l'utilisateur**, Arena ne tourne pas en tâche de fond autonome et GitHub Actions ne peut pas accéder au disque local d'un bac à sable Arena pour pousser des modifications non commitées. Toute modification réalisée pendant un tour doit donc impérativement être validée, commitée et poussée **avant la fin de ce même tour**.
2. **Frontière de preuve de l'environnement CI** :
   - L'émulateur CI valide Android 15 (`API 35` x86_64). L'authentification réelle `accounts.spotify.com` avec un vrai compte et le déchiffrement audio matériel/logiciel Widevine DRM sur smartphone physique ARM64 ne doivent **jamais** être présentés comme validés sans essai réel sur téléphone.
