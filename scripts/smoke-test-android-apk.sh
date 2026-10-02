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

echo "::notice title=Installation Android réelle::installation + lancement + service foreground + MediaSession + notification + arrière-plan réussis sur Android 14 x86_64 (pid=$PID)"
if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
  echo "- Android 14 : installation, lancement, FGS média, MediaSession, notification système et survie arrière-plan vérifiés" >> "$GITHUB_STEP_SUMMARY"
fi
