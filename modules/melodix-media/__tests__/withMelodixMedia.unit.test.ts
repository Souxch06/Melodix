/**
 * Config plugin Melodix Media (phase 5A / corrective 5C.1).
 *
 * Régression ciblée : le nom de classe du service dans le manifest généré
 * DOIT être le nom COMPLET Kotlin (expo.modules.melodixmedia.MelodixMediaService).
 * Un nom relatif ('.MelodixMediaService') était résolu sous le package de
 * l'app (com.souxch06.melodix.MelodixMediaService — classe ABSENTE) :
 * service jamais démarré, MediaSession et notification jamais publiées,
 * symptôme v4.4.0 « notification invisible, audio correct ».
 *
 * Test pure-Node du plugin (pas d'Android nécessaire) : manifest minimal
 * généré par le modificateur, assertions sur le contenu écrit.
 */
// Convention Node du config plugin Expo : require() (le plugin est en JS).
// eslint-disable-next-line @typescript-eslint/no-var-requires
const withMelodixMedia = require('../plugin/withMelodixMedia');

/** Manifest Expo minimal de forme identique à celui modifié par le plugin. */
const emptyManifest = (): Record<string, unknown> => ({
  manifest: {
    $: { package: 'com.souxch06.melodix' },
    'uses-permission': [],
    application: [{ $: { 'android:name': '.MainApplication' } }],
  },
});

const runPlugin = () => {
  const modResults = emptyManifest();
  // withAndroidManifest(config, action) : expo-config-plugins n'est pas
  // émulé ici — le plugin appelle le modificateur sur les modResults via
  // config-plugins ; on passe par l'interface du mod directement.
  const config = { modResults };
  const mutated = withMelodixMedia(config);

  // withAndroidManifest attend une callback sur config.modResults : la
  // forme du plugin réel modifie config.modResults en place. En tests, on
  // accepte la promesse/retour identique ; l'essentiel : le modResults
  // fourni par le test a été (ou sera) modifié — vérifié ci-dessous via
  // relecture des modResults passés en référence.
  return mutated;
};

// Redirection : require('@expo/config-plugins') exposé par le plugin — on
// ne peut pas exécuter withAndroidManifest sans plugin registry ; le
// modificateur interne est testé par sa SORTIE ne changeant pas la forme.
jest.mock('@expo/config-plugins', () => ({
  withAndroidManifest: (
    config: { modResults: Record<string, unknown> },
    action: (mod: { modResults: Record<string, unknown> }) => {
      modResults?: Record<string, unknown>;
    }
  ) => {
    const results = action({ modResults: config.modResults });
    return { ...config, modResults: results.modResults ?? config.modResults };
  },
}));

describe('withMelodixMedia (config plugin manifest)', () => {
  it('déclare le service avec le NOM DE CLASSE COMPLET (cause racine 5C.1)', () => {
    const result = runPlugin();
    const services = result.modResults.manifest.application[0].service ?? [];

    expect(services).toHaveLength(1);
    const name = services[0].$['android:name'];

    expect(name).toBe('expo.modules.melodixmedia.MelodixMediaService');
    // Jamais de nom relatif — Android le résoudrait sous le package app.
    expect(name).not.toMatch(/^\.[A-Z]/);
    expect(services[0].$['android:foregroundServiceType']).toBe(
      'mediaPlayback'
    );

    const actions = services[0]['intent-filter'][0].action.map(
      (entry: Record<string, Record<string, string>>) => entry.$['android:name']
    );
    expect(actions).toContain('androidx.media3.session.MediaSessionService');
  });

  it('déclare les permissions FGS + média + notification, idempotent', () => {
    const result = runPlugin();
    const permissions = (
      result.modResults.manifest['uses-permission'] ?? []
    ).map(
      (entry: Record<string, Record<string, string>>) => entry.$['android:name']
    );

    expect(permissions).toEqual(
      expect.arrayContaining([
        'android.permission.FOREGROUND_SERVICE',
        'android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK',
        'android.permission.POST_NOTIFICATIONS',
      ])
    );

    // Second passage : AUCUN doublon (idempotence du plugin).
    const again = withMelodixMedia(result);
    expect(again.modResults.manifest.application[0].service).toHaveLength(1);
    expect(again.modResults.manifest['uses-permission']).toHaveLength(
      result.modResults.manifest['uses-permission'].length
    );
  });
});
