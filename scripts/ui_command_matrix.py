#!/usr/bin/env python3
"""Join the static wiring audit with what the device walk actually observed.

A button being present, or a handler being wired, is not evidence that the
command works. This emits one row per command with its carrier, the function it
calls, the layer it reaches, the conditions it needs, the observed result taken
from the navigation trace, and a state that never claims more than was seen.

Usage: ui_command_matrix.py RUN_ID [--out docs/audits/command-matrix.md]
"""
import json
import pathlib
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent

# carrier view -> (command label, handler, needs, observed-from steps)
COMMANDS = [
    ("Onglet Accueil", "nativeHomeTab", "onNativeHomeClick", "aucune", ["home", "home-again", "stress-settled"]),
    ("Onglet Bibliothèque", "nativeLibraryTab", "onNativeLibraryClick", "session pour le contenu", ["library"]),
    ("Onglet Recherche", "nativeSearchTab", "onNativeSearchClick", "aucune", ["search"]),
    ("Bouton Paramètres", "nativeSettingsButton", "onNativeSettingsClick", "aucune pour l'écran", ["settings", "settings-again"]),
    ("Retour interne (flèche)", "nativeBackButton", "onNativeBackClick", "écran poussé", ["back-from-settings", "back-once"]),
    ("Retour système Android", "touche KEYCODE_BACK", "onNativeBackClick", "écran poussé ou onglet racine", ["back-from-settings", "back-from-library", "back-from-search", "back-settled"]),
    ("Filtre de bibliothèque", "nativeLibraryCategories", "onNativeLibraryCategoryClick", "session", ["library"]),
    ("Tuile de genre", "nativeGenreScroll", "onNativeGenreClick", "session pour les résultats", ["browse-tile"]),
    ("Validation de recherche", "nativeSearchInput", "onNativeSearchSubmit", "session", []),
    ("Ligne playlist / album", "nativeContent", "openNativeRow", "session", []),
    ("Lecture / pause", "nativePlayerPlayPauseButton", "onNativePlayPauseClick", "session + piste", ["player"]),
    ("Suivant", "nativePlayerNextButton", "onNativePlayerNextClick", "session + file", ["player"]),
    ("Précédent", "nativePlayerPreviousButton", "onNativePlayerPreviousClick", "session + file", ["player"]),
    ("Aléatoire / répétition", "nativePlayerShuffleButton", "onNativePlayerShuffleClick", "session + piste", ["player"]),
    ("Agrandir le lecteur", "nativeMiniPlayer", "onNativePlayerExpandClick", "session + piste", ["mini-player", "player"]),
]

STATES = {
    "observed": "**1 — Opérationnelle, vérifiée sur appareil**",
    "partial": "**2 — Câblée, résultat non vérifié**",
    "session": "**3 — En attente de session authentifiée**",
    "failed": "**4 — En échec**",
    "untested": "**5 — Non testée**",
}


def wiring():
    out = subprocess.run([sys.executable, str(ROOT / "scripts/ui_wiring_audit.py")],
                         capture_output=True, text=True, cwd=ROOT)
    table = {}
    for line in out.stdout.splitlines():
        parts = line.split()
        if len(parts) >= 3 and parts[0] in ("wired", "native", "navigation"):
            table[parts[1]] = {"layer": parts[0], "reaches": parts[2]}
    return table


def verdicts(run, profile):
    f = ROOT / "docs/audits" / f"ui-qa-{run}" / profile / f"navigation-{profile}.json"
    if not f.is_file():
        return {}
    return {s["step"]: s for s in json.loads(f.read_text())}


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    run = sys.argv[1]
    w = wiring()
    v = {p: verdicts(run, p) for p in ("phone", "tablet")}
    lines = [f"# Matrice des 15 commandes — run `{run}`", "",
             "Générée par `scripts/ui_command_matrix.py` : croisement du câblage statique",
             "et des verdicts **observés** par le parcours sur appareil. Un bouton présent",
             "n'est jamais déclaré fonctionnel sans résultat visible vérifié.", "",
             "| # | Commande | Composant porteur | Fonction appelée | Couche atteinte | Conditions | Résultat observé (tél / tab) | État |",
             "|---|---|---|---|---|---|---|---|"]
    counts = {}
    for i, (label, carrier, handler, needs, steps) in enumerate(COMMANDS, 1):
        info = w.get(handler) or {"layer": "?", "reaches": "?"}
        seen = {}
        for p in ("phone", "tablet"):
            got = [v[p][s]["verdict"] for s in steps if s in v[p]]
            seen[p] = ", ".join(dict.fromkeys(got)) or "aucune étape"
        allv = [v[p][s]["verdict"] for s in steps for p in ("phone", "tablet") if s in v[p]]
        if not steps:
            state = "session" if "session" in needs else "untested"
        elif allv and all(x == "reached" for x in allv):
            # A reached screen proves the command changed the screen. Commands
            # whose payload needs a session stay unproven even when reached.
            state = "session" if "session" in needs else "observed"
        elif any(x == "blocked_no_session" for x in allv):
            state = "session"
        elif any(x in ("wrong_screen", "not_reached", "unreadable") for x in allv):
            state = "failed"
        else:
            state = "partial"
        counts[state] = counts.get(state, 0) + 1
        lines.append(f"| {i} | {label} | `{carrier}` | `{handler}` | {info['layer']} → `{info['reaches']}` | {needs} | {seen['phone']} / {seen['tablet']} | {STATES[state]} |")
    lines += ["", "## Répartition", ""]
    for k, label in STATES.items():
        lines.append(f"- {label} : **{counts.get(k, 0)}**")
    lines += ["", "## Limite explicite", "",
              "Les commandes marquées « en attente de session » ont un câblage confirmé et,",
              "pour certaines, un appui délivré, mais **aucun résultat musical observé**.",
              "Elles ne sont pas déclarées fonctionnelles. La validation se fait via",
              "`melodix-authenticated-validation-matrix.md`, connexion manuelle par l'utilisateur.", ""]
    text = "\n".join(lines)
    if "--out" in sys.argv:
        out = pathlib.Path(sys.argv[sys.argv.index("--out") + 1])
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(text)
        print(f"écrit: {out}")
    else:
        print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
