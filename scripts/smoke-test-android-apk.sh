#!/bin/sh
# Installe et lance un APK sur l'émulateur déjà démarré par GitHub Actions.
# Ce script reste dans un seul processus : android-emulator-runner exécute chaque
# ligne de son option `script` dans un shell distinct.
set -u

APK=${1:-}
PACKAGE=com.souxch06.melodix
EXPECTED_VERSION_CODE=44008

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
  -d "melodix://settings/spotify-web-player" -p "$PACKAGE" 2>&1) || \
  fail "prototype Spotify Web non ouvrable : $WEB_START"
echo "$WEB_START"
# Laisse au chargement puis au timeout de handshake (8 s) le temps de conclure.
sleep 15
adb shell uiautomator dump /sdcard/melodix-web.xml >/dev/null 2>&1 || \
  fail "hiérarchie UI du prototype inaccessible"
WEB_UI=$(adb shell cat /sdcard/melodix-web.xml 2>&1) || \
  fail "lecture hiérarchie UI prototype impossible : $WEB_UI"
printf '%s\n' "$WEB_UI" | grep -Fq 'Prototype Spotify Web' || \
  fail "écran de diagnostic Spotify Web absent après deep link"
# Le probe W3C doit produire un résultat explicite : handshake disponible ou
# timeout honnête. Cela ne prétend toujours pas valider une lecture connectée.
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
# request↔réponse sur l'appareil. Non bloquant par conception.
adb shell uiautomator dump /sdcard/melodix-cmd.xml >/dev/null 2>&1 || true
BOUNDS=$(adb shell cat /sdcard/melodix-cmd.xml 2>/dev/null | tr '>' '\n' | grep -F 'Commande lecture' | grep -oE 'bounds="\[[0-9]+,[0-9]+\]\[[0-9]+,[0-9]+\]"' | head -1 || true)
COORDS=$(printf '%s' "$BOUNDS" | grep -oE '[0-9]+' | head -4 || true)
X1=$(printf '%s\n' "$COORDS" | sed -n 1p); Y1=$(printf '%s\n' "$COORDS" | sed -n 2p)
X2=$(printf '%s\n' "$COORDS" | sed -n 3p); Y2=$(printf '%s\n' "$COORDS" | sed -n 4p)
if printf '%s%s%s%s' "$X1" "$Y1" "$X2" "$Y2" | grep -Eq '^[0-9]+$'; then
  adb shell input tap $(( (X1 + X2) / 2 )) $(( (Y1 + Y2) / 2 )) || true
  sleep 3
  adb shell uiautomator dump /sdcard/melodix-cmd2.xml >/dev/null 2>&1 || true
  CMD_UI=$(adb shell cat /sdcard/melodix-cmd2.xml 2>&1 || true)
  if printf '%s\n' "$CMD_UI" | grep -Fq 'command_accepted'; then
    echo "::notice title=Canal commande::commande acceptée par la page Web (corrélation requestId validée sur l'appareil)"
  elif printf '%s\n' "$CMD_UI" | grep -Fq 'no-authorized-execution-surface'; then
    echo "::notice title=Canal commande::refus honnête reçu de la page (no-authorized-execution-surface) : émission, corrélation et réponse fonctionnent ; exécution volontairement non simulée"
  elif printf '%s\n' "$CMD_UI" | grep -Fq 'command_unavailable'; then
    echo "::warning title=Canal commande::commande non acceptée (pont non prêt, expirée ou non délivrée) — constat non bloquant"
  else
    echo "::warning title=Canal commande::aucun résultat de commande lisible dans l'UI après appui — constat non bloquant"
  fi
else
  echo "::warning title=Canal commande::sonde de commande introuvable dans le dump UI ; appui non testé (non bloquant)"
fi
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
