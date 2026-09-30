/**
 * Config plugin Melodix Media (phase 5A) — manifest Android généré, JAMAIS
 * édité à la main (android/ reste non versionné, produit par prebuild).
 *
 * Idempotent CERTIFIÉ : chaque élément n'est inséré que s'il est absent —
 * `prebuild` répété ne crée aucun doublon.
 *
 * Permissions (le strict nécessaire à MediaSession/FGS, rien d'autre) :
 *  - FOREGROUND_SERVICE + FOREGROUND_SERVICE_MEDIA_PLAYBACK (Android 14+)
 *  - POST_NOTIFICATIONS (déclarée POUR 5C/5E ; la demande runtime n'est PAS
 *    faite en 5A — à cette phase, la permission reste silencieuse et la
 *    notification existera seulement si l'utilisateur l'accorde ensuite).
 *  - WAKE_LOCK NON ajouté volontairement : MediaSessionService/mediaPlayback
 *    n'en requiert pas (légitimité à réévaluer en 5E sur mesure réelle).
 */
/* eslint-disable @typescript-eslint/no-var-requires -- config plugin Node
   convention Expo : require() attendu (pas de build TS). */
const { withAndroidManifest } = require('@expo/config-plugins');

const PERMISSIONS = [
  'android.permission.FOREGROUND_SERVICE',
  'android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK',
  'android.permission.POST_NOTIFICATIONS',
];

/**
 * NOM DE CLASSE COMPLET — 5C.1 : un nom RELATIF ('.MelodixMediaService')
 * est résolu par Android sous le PACKAGE DE L'APP
 * (com.souxch06.melodix.MelodixMediaService), absent du DEX → le système
 * répondait « Unable to start service … not found » : aucune session,
 * aucune notification, et le try/catch du contrôleur ne voit rien (l'échec
 * survient côté am, pas à startForegroundService). Son continue malgré
 * tout via expo-av — symptôme exact v4.4.0. Le ComponentName du manifest
 * DOIT correspondre à la classe réelle du module.
 */
const SERVICE_NAME = 'expo.modules.melodixmedia.MelodixMediaService';

const ensureUsesPermission = (manifest, name) => {
  manifest['uses-permission'] = manifest['uses-permission'] ?? [];

  const alreadyDeclared = manifest['uses-permission'].some(
    (entry) => entry?.$?.['android:name'] === name
  );

  if (!alreadyDeclared) {
    manifest['uses-permission'].push({ $: { 'android:name': name } });
  }
};

/**
 * Déclare MediaSessionService (Media3) : type `mediaPlayback`, non exporté.
 * L'intent-filter `MediaSessionService` est REQUIS par AndroidX Media3.
 */
const ensureMediaService = (application) => {
  application.service = application.service ?? [];

  const exists = application.service.some(
    (service) => service?.$?.['android:name'] === SERVICE_NAME
  );

  if (exists) {
    return; // idempotence : rien à modifier
  }

  application.service.push({
    $: {
      'android:name': SERVICE_NAME,
      'android:exported': 'false',
      'android:foregroundServiceType': 'mediaPlayback',
    },
    'intent-filter': [
      {
        action: [
          {
            $: {
              'android:name': 'androidx.media3.session.MediaSessionService',
            },
          },
        ],
      },
    ],
  });
};

const withMelodixMedia = (config) =>
  withAndroidManifest(config, (mod) => {
    const manifest = mod.modResults.manifest;

    PERMISSIONS.forEach((permission) =>
      ensureUsesPermission(manifest, permission)
    );

    const application = manifest.application?.[0];

    if (application) {
      ensureMediaService(application);
    }

    return mod;
  });

module.exports = withMelodixMedia;
