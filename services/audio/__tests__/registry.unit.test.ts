/**
 * Registre des providers audio — l'ARCHITECTURE de production verrouillée :
 *
 *   1. Audius  — source audio principale ;
 *   2. YouTube — fallback (uniquement quand Audius n'a rien).
 *
 * Jamais de provider « spotify » : Spotify sert les métadonnées et le
 * compte, l'AUDIO vient exclusivement des providers (interdiction
 * absolue : WebView/interception des flux commerciaux).
 */
import {
  DEFAULT_AUDIO_PROVIDER_ID,
  getAudioProvider,
  getAudioProviders,
  __testSetAudioProviders,
} from '../index';

describe('audio registry — ordre de cascade et frontières', () => {
  it("ordre EXACT : Audius d'abord, YouTube en fallback (jamais l'inverse)", () => {
    expect(getAudioProviders().map((provider) => provider.id)).toEqual([
      'audius',
      'youtube',
    ]);
  });

  it('Spotify n est PAS un provider audio : demande enregistrée → repli Audius', () => {
    // Un id non enregistré ne peut JAMAIS servir d audio — le défaut
    // Audius protège l app d un routage vers une source interdite.
    expect(getAudioProvider('spotify').id).toBe('audius');
  });

  it('sans identifiant (undefined / null / vide), le défaut est Audius', () => {
    expect(DEFAULT_AUDIO_PROVIDER_ID).toBe('audius');
    expect(getAudioProvider().id).toBe('audius');
    expect(getAudioProvider(null).id).toBe('audius');
    expect(getAudioProvider('').id).toBe('audius');
  });

  it('les ids enregistrés rappellent leur propre provider (nid natif replays)', () => {
    expect(getAudioProvider('audius').id).toBe('audius');
    expect(getAudioProvider('youtube').id).toBe('youtube');
  });

  it('la liste de cascade est figée : aucun doublon, deux providers au plus', () => {
    const ids = getAudioProviders().map((provider) => provider.id);
    expect(new Set(ids).size).toBe(ids.length);
    expect(ids.length).toBeLessThanOrEqual(2);
  });

  it('injection de test : __testSetAudioProviders restaure un registre sain', () => {
    // Capturés AVANT l'injection : après remplacement, le défaut « audius »
    // n'existe plus dans le registre de test (getAudioProvider repliendrait
    // sur undefined).
    const realAudius = getAudioProvider('audius');
    const realYouTube = getAudioProvider('youtube');
    const sentinel = {
      id: 'sentinel',
      displayName: 'Sentinel',
      matches: async () => [],
      resolveMatch: async () => null,
      resolveSource: async () => null,
    };
    __testSetAudioProviders({ sentinel });
    // L'ordre de la cascade est figé dans le code (['audius','youtube']) :
    // un provider injecté sous un autre id ne la contamine JAMAIS — et,
    // vide ici, la cascade ne peut en tout état de cause pas rappeler
    // de « spotify » imaginaire.
    expect(getAudioProviders()).toEqual([]);
    expect(getAudioProvider('sentinel').displayName).toBe('Sentinel');
    // Restauration : les suites qui tournent après retrouvent l architecture réelle.
    __testSetAudioProviders({ audius: realAudius, youtube: realYouTube });
    expect(getAudioProviders().map((provider) => provider.id)).toEqual([
      'audius',
      'youtube',
    ]);
  });
});
