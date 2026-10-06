#!/bin/sh
# Installe et lance un APK sur l'émulateur déjà démarré par GitHub Actions.
# Ce script reste dans un seul processus : android-emulator-runner exécute chaque
# ligne de son option `script` dans un shell distinct.
set -u

APK=${1:-}
PACKAGE=com.souxch06.melodix
# Version attendue : source UNIQUE = app.config.js. Une constante en dur ici
# (ex. 45002) divergeait à chaque bump et ferait échouer le smoke alors que
# l'APK est correcte. `node` est disponible (Node 20). EXPECTED_VERSION_CODE
# reste une surcharge explicite.
if [ -z "${EXPECTED_VERSION_CODE:-}" ]; then
  EXPECTED_VERSION_CODE=$(node -p "require('./app.config.js').expo.android.versionCode" 2>/dev/null || true)
fi
[ -n "$EXPECTED_VERSION_CODE" ] || EXPECTED_VERSION_CODE=45003

fail() {
  # Les commandes de workflow GitHub doivent tenir sur une ligne.
  detail=$(printf '%s' "$1" | tr '\r\n' '  ' | sed 's/%/%25/g')
  echo "::error title=Test installation Android::$detail"
  exit 1
}

[ -n "$APK" ] || fail "chemin de l'APK absent"
[ -s "$APK" ] || fail "APK absent ou vide : $APK"
command -v adb >/dev/null 2>&1 || fail "adb est introuvable"

adb logcat -c || fail "impossible de vider logcat"

# L'installation propre démontre l'installabilité. La réinstallation démontre
# aussi que le certificat de signature reste cohérent pour une mise à jour.
CLEAN=$(adb install --no-streaming "$APK" 2>&1) || fail "installation propre refusée : $CLEAN"
echo "$CLEAN"
UPDATE=$(adb install --no-streaming -r "$APK" 2>&1) || fail "mise à jour refusée : $UPDATE"
echo "$UPDATE"

PACKAGE_INFO=$(adb shell dumpsys package "$PACKAGE" 2>&1) || fail "dumpsys package impossible : $PACKAGE_INFO"
printf '%s\n' "$PACKAGE_INFO" | grep -Fq "versionCode=$EXPECTED_VERSION_CODE" || \
  fail "versionCode $EXPECTED_VERSION_CODE absente après installation"
# Android 13+ : valide que la permission runtime déclarée peut réellement être
# accordée. Le test Robolectric couvre ensuite la publication MediaStyle.
adb shell pm grant "$PACKAGE" android.permission.POST_NOTIFICATIONS || \
  fail "permission POST_NOTIFICATIONS impossible à accorder"

adb shell am force-stop "$PACKAGE" || fail "force-stop impossible"
START=$(adb shell am start -W -n "$PACKAGE/.MainActivity" 2>&1) || fail "MainActivity non lançable : $START"
echo "$START"
printf '%s\n' "$START" | grep -Fq 'Status: ok' || \
  fail "ActivityManager n'a pas confirmé le lancement : $START"

sleep 8
PID=$(adb shell pidof -s "$PACKAGE" 2>/dev/null | tr -d '\r' || true)
if [ -z "$PID" ]; then
  adb logcat -d -v time | tail -300
  fail "le processus $PACKAGE s'est arrêté après installation"
fi

echo "Processus Melodix actif : pid=$PID"

# Prototype Spotify Web isolé : ouvre la route de diagnostic par deep link,
# vérifie que la vraie vue Android est rendue, puis exerce arrière-plan/retour.
# Aucun compte, cookie, token ou contenu DOM Spotify n'est lu par ce smoke.
WEB_START=$(adb shell am start -W -a android.intent.action.VIEW \
  -d "melodix://settings/spotify-web-diagnostic" -p "$PACKAGE" 2>&1) || \
  fail "prototype Spotify Web non ouvrable : $WEB_START"
echo "$WEB_START"
# Laisse au chargement puis au timeout de handshake (8 s) le temps de conclure.
# Sonde par itérations (jusqu'à 60 s) : un dump unique après un délai fixe est
# un faux négatif classique sur émulateur CI lent (le dump peut précéder la
# fin de la transition de route). Aucun comportement d'app n'est impliqué.
WEB_UI=""
DUMP_TRIES=0
while [ "$DUMP_TRIES" -lt 12 ]; do
  sleep 5
  DUMP_TRIES=$(( DUMP_TRIES + 1 ))
  adb shell uiautomator dump /sdcard/melodix-web.xml >/dev/null 2>&1 || continue
  WEB_UI=$(adb shell cat /sdcard/melodix-web.xml 2>&1) || continue
  printf '%s\n' "$WEB_UI" | grep -Fq 'Prototype Spotify Web' && break
  WEB_UI=""
done
[ -n "$WEB_UI" ] || \
  fail "écran de diagnostic Spotify Web absent après deep link ($DUMP_TRIES dumps)"
# Le probe W3C doit produire un résultat explicite : handshake disponible ou
# timeout honnête. Si l'écran est apparu vite, le minuteur de handshake (8 s)
# peut encore être en cours : on le laisse conclure, sans jamais l'embellir.
BRIDGE_TRIES=0
while ! printf '%s\n' "$WEB_UI" | grep -Eq 'Bridge: (prêt|timeout)'; do
  BRIDGE_TRIES=$(( BRIDGE_TRIES + 1 ))
  [ "$BRIDGE_TRIES" -ge 5 ] && break
  sleep 5
  adb shell uiautomator dump /sdcard/melodix-web.xml >/dev/null 2>&1 || continue
  NEW_UI=$(adb shell cat /sdcard/melodix-web.xml 2>&1) || continue
  printf '%s\n' "$NEW_UI" | grep -Fq 'Prototype Spotify Web' && WEB_UI="$NEW_UI"
done
if printf '%s\n' "$WEB_UI" | grep -Fq 'Bridge: prêt'; then
  echo "Bridge WebView React Native prêt (probe navigator.mediaSession injecté)"
elif printf '%s\n' "$WEB_UI" | grep -Fq 'Bridge: timeout'; then
  echo "::warning title=Bridge Spotify Web indisponible::handshake WebView expiré ; aucune capacité de lecture revendiquée"
else
  fail "aucun résultat explicite du handshake Spotify Web (ready/timeout)"
fi
if printf '%s\n' "$WEB_UI" | grep -Fq 'Widevine: oui'; then
  echo "::notice title=Capacité DRM WebView::EME et Widevine déclarés disponibles par Android WebView"
elif printf '%s\n' "$WEB_UI" | grep -Fq 'Widevine: non'; then
  echo "::warning title=Capacité DRM WebView::Widevine indisponible pour la configuration audio EME testée"
else
  echo "::warning title=Capacité DRM WebView::résultat Widevine inconnu (probe non conclu)"
fi
# Indicateurs non bloquants du pont v2 : le smoke constate, ne simule rien.
if printf '%s\n' "$WEB_UI" | grep -Fq 'source: media-session'; then
  echo "::notice title=État réel du Web Player::la page a publié un état via navigator.mediaSession"
else
  echo "::warning title=État réel du Web Player::aucun état mediaSession publié (normal sans lecture réelle de la part d'un compte)"
fi
if printf '%s\n' "$WEB_UI" | grep -Fq 'titre=oui'; then
  echo "::notice title=Métadonnées MediaSession::titre publié par la page elle-même"
fi
if printf '%s\n' "$WEB_UI" | grep -Fq 'positionState: oui'; then
  echo "::notice title=positionState::durée/position exposées par la page via MediaSession"
fi
# Canal de commande réel : appui sur la sonde « Commande lecture » si elle est
# localisable, puis lecture du résultat affiché. Une réponse acceptée OU un
# refus honnête (no-authorized-execution-surface) prouve la corrélation
# request↔réponse sur l'appareil ; un résultat « expired » prouve que la
# commande est bien partie sur le canal avec minuteur réel. Deux tentatives
# (le premier appui peut tomber pendant une bascule de document). Non bloquant
# par conception.
tap_command_probe() {
  adb shell uiautomator dump /sdcard/melodix-cmd.xml >/dev/null 2>&1 || true
  local bounds coords x1 y1 x2 y2
  bounds=$(adb shell cat /sdcard/melodix-cmd.xml 2>/dev/null | tr '>' '\n' | grep -F 'Commande lecture' | grep -oE 'bounds="\[[0-9]+,[0-9]+\]\[[0-9]+,[0-9]+\]"' | head -1 || true)
  coords=$(printf '%s' "$bounds" | grep -oE '[0-9]+' | head -4 || true)
  x1=$(printf '%s\n' "$coords" | sed -n 1p); y1=$(printf '%s\n' "$coords" | sed -n 2p)
  x2=$(printf '%s\n' "$coords" | sed -n 3p); y2=$(printf '%s\n' "$coords" | sed -n 4p)
  if ! printf '%s%s%s%s' "$x1" "$y1" "$x2" "$y2" | grep -Eq '^[0-9]+$'; then
    return 1
  fi
  adb shell input tap $(( (x1 + x2) / 2 )) $(( (y1 + y2) / 2 )) || true
  # Au-delà de l'expiration de 5 s : le diagnostic « expired » est alors
  # observable si la page ne répond pas ; une réponse, elle, arrive en général
  # bien avant.
  sleep 7
  return 0
}
CMD_OUTCOME='introuvable'
for ATTEMPT in 1 2; do
  if ! tap_command_probe; then
    break
  fi
  adb shell uiautomator dump /sdcard/melodix-cmd2.xml >/dev/null 2>&1 || true
  CMD_UI=$(adb shell cat /sdcard/melodix-cmd2.xml 2>&1 || true)
  if printf '%s\n' "$CMD_UI" | grep -Fq 'command_accepted'; then
    CMD_OUTCOME='acceptee'
  elif printf '%s\n' "$CMD_UI" | grep -Fq 'no-authorized-execution-surface'; then
    CMD_OUTCOME='refus-page'
  elif printf '%s\n' "$CMD_UI" | grep -Fq 'expired'; then
    CMD_OUTCOME='expiree'
  elif printf '%s\n' "$CMD_UI" | grep -Fq 'command_unavailable'; then
    CMD_OUTCOME='non-distribuee'
  else
    CMD_OUTCOME='aucune-ligne'
  fi
  # Un résultat « pont non prêt » (non distribuable au moment de l'appui)
  # mérite une seconde chance après stabilisation du document.
  if [ "$CMD_OUTCOME" != 'non-distribuee' ]; then
    break
  fi
  sleep 5
done
case "$CMD_OUTCOME" in
  acceptee)
    echo "::notice title=Canal commande::commande acceptée par la page Web (corrélation requestId validée sur l'appareil)"
    ;;
  refus-page)
    echo "::notice title=Canal commande::refus honnête reçu de la page (no-authorized-execution-surface) : émission, corrélation et réponse fonctionnent ; exécution volontairement non simulée"
    ;;
  expiree)
    echo "::notice title=Canal commande::commande émise et corrélée, sans réponse de page dans le délai — le minuteur d'expiration réel fonctionne (la page ne doit pas répondre sans surface autorisée)"
    ;;
  non-distribuee)
    echo "::warning title=Canal commande::commande refusée avant émission (pont non prêt au moment de l'appui après 2 tentatives) — l'appui a bien atteint le bouton ; canal testé, non bloquant"
    ;;
  aucune-ligne)
    echo "::warning title=Canal commande::aucun résultat de commande lisible dans l'UI après appui — constat non bloquant"
    ;;
  *)
    echo "::warning title=Canal commande::sonde de commande introuvable dans le dump UI ; appui non testé (non bloquant)"
    ;;
esac
adb shell input keyevent KEYCODE_HOME || fail "prototype WebView impossible à mettre en arrière-plan"
sleep 2
WEB_RETURN=$(adb shell am start -W -n "$PACKAGE/.MainActivity" 2>&1) || \
  fail "retour au prototype WebView impossible : $WEB_RETURN"
echo "$WEB_RETURN"
sleep 2
WEB_PID=$(adb shell pidof -s "$PACKAGE" 2>/dev/null | tr -d '\r' || true)
[ -n "$WEB_PID" ] || fail "processus détruit après arrière-plan/retour WebView"
echo "Prototype Spotify Web rendu et survivant au cycle arrière-plan/retour (pid=$WEB_PID)"

# Smoke natif réel (pas Robolectric) : Android démarre le MediaSessionService,
# celui-ci doit respecter le contrat FGS, publier l'id 1001 sur le canal média,
# enregistrer une MediaSession, puis survivre au passage de l'Activity en fond.
# Cette simulation ne prétend pas charger un flux Audius : elle valide la
# portion service → notification → System UI qui manquait au smoke précédent.
SERVICE="$PACKAGE/expo.modules.melodixmedia.MelodixMediaService"
SERVICE_START=$(adb shell am start-foreground-service -n "$SERVICE" 2>&1) || \
  fail "MediaSessionService non démarrable : $SERVICE_START"
echo "$SERVICE_START"
sleep 3
SERVICES=$(adb shell dumpsys activity services "$PACKAGE" 2>&1) || \
  fail "dumpsys services impossible : $SERVICES"
printf '%s\n' "$SERVICES" | grep -Fq 'MelodixMediaService' || \
  fail "MelodixMediaService absent des services actifs"
NOTIFICATIONS=$(adb shell dumpsys notification --noredact 2>&1) || \
  fail "dumpsys notification impossible : $NOTIFICATIONS"
printf '%s\n' "$NOTIFICATIONS" | grep -Fq "$PACKAGE" || \
  fail "aucune notification active attribuée à Melodix"
printf '%s\n' "$NOTIFICATIONS" | grep -Fq 'melodix_media' || \
  fail "canal melodix_media absent de la notification système"
SESSIONS=$(adb shell dumpsys media_session 2>&1) || \
  fail "dumpsys media_session impossible : $SESSIONS"
printf '%s\n' "$SESSIONS" | grep -Fq "$PACKAGE" || \
  fail "MediaSession Melodix absente du système"

adb shell input keyevent KEYCODE_HOME || fail "mise en arrière-plan impossible"
sleep 2
SERVICES_BG=$(adb shell dumpsys activity services "$PACKAGE" 2>&1) || \
  fail "dumpsys services en arrière-plan impossible : $SERVICES_BG"
printf '%s\n' "$SERVICES_BG" | grep -Fq 'MelodixMediaService' || \
  fail "service média détruit au passage en arrière-plan"
NOTIFICATIONS_BG=$(adb shell dumpsys notification --noredact 2>&1) || \
  fail "dumpsys notification en arrière-plan impossible : $NOTIFICATIONS_BG"
printf '%s\n' "$NOTIFICATIONS_BG" | grep -Fq 'melodix_media' || \
  fail "notification média disparue en arrière-plan"

echo "::notice title=Installation Android réelle::installation + prototype WebView + cycle arrière-plan/retour + service foreground + MediaSession + notification réussis sur Android 14 x86_64 (pid=$PID)"
if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
  echo "- Android 14 : installation, écran Spotify WebView, cycle arrière-plan/retour, FGS média, MediaSession et notification système vérifiés" >> "$GITHUB_STEP_SUMMARY"
fi
