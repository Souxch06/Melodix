import * as fs from 'fs';
import * as path from 'path';

import {
  getSpotifyWebPhysicalValidation,
  getSpotifyWebPhysicalValidationEvidence,
  isSpotifyWebPlaybackEnabled,
  recordSpotifyWebPhysicalValidation,
  resetSpotifyWebPlaybackFeatureForTesting,
  resolveSpotifyWebPlaybackActivation,
  setSpotifyWebPlaybackEnabled,
} from '../../../services/playbackBackend/spotifyWebFeature';

const ROOT = path.resolve(__dirname, '../../..');

const read = (relative: string): string =>
  fs.readFileSync(path.join(ROOT, relative), 'utf8');

describe('feature flag Spotify Web : désactivé par défaut, double verrou', () => {
  afterEach(() => {
    resetSpotifyWebPlaybackFeatureForTesting();
  });

  it('le défaut absolu est un flag false et une porte physique fermée', () => {
    expect(isSpotifyWebPlaybackEnabled()).toBe(false);
    expect(getSpotifyWebPhysicalValidation()).toBe('NOT_TESTED');
    expect(getSpotifyWebPhysicalValidationEvidence()).toBeNull();
  });

  it('flag désactivé → la sélection ne contient QUE le moteur actuel', () => {
    const decision = resolveSpotifyWebPlaybackActivation();
    expect(decision.active).toBe(false);
    expect(decision.engines).toEqual(['audius-youtube']);
    expect(decision.blockers).toEqual([
      'flag-local-desactive',
      'validation-physique-non-consignee',
    ]);
  });

  it('flag activé SANS validation physique → toujours le moteur actuel seul', () => {
    setSpotifyWebPlaybackEnabled(true);
    expect(isSpotifyWebPlaybackEnabled()).toBe(true);
    const decision = resolveSpotifyWebPlaybackActivation();
    expect(decision.active).toBe(false);
    expect(decision.engines).toEqual(['audius-youtube']);
    expect(decision.blockers).toEqual(['validation-physique-non-consignee']);
  });

  it('la porte refuse une validation sans preuve documentée', () => {
    expect(() => recordSpotifyWebPhysicalValidation(true, '   ')).toThrow(
      /preuve documentée/
    );
    expect(() => recordSpotifyWebPhysicalValidation(true, null)).toThrow(
      /preuve documentée/
    );
    expect(getSpotifyWebPhysicalValidation()).toBe('NOT_TESTED');
  });

  it('double verrou levé → Spotify Web s’INSÈRE sans retirer le fallback', () => {
    recordSpotifyWebPhysicalValidation(
      true,
      'phone-run 2026-10-XX: audio réel + source media-session consignés dans docs/SPOTIFY-WEB-PHYSICAL-TEST.md'
    );
    setSpotifyWebPlaybackEnabled(true);
    const decision = resolveSpotifyWebPlaybackActivation();
    expect(decision.active).toBe(true);
    expect(decision.blockers).toEqual([]);
    // Insertion devant le moteur existant : Audius → YouTube reste présent.
    expect(decision.engines).toEqual(['spotify-web', 'audius-youtube']);
    expect(decision.engines[decision.engines.length - 1]).toBe(
      'audius-youtube'
    );
  });

  it('une porte refermée désactive immédiatement, même flag à true', () => {
    recordSpotifyWebPhysicalValidation(true, 'preuve temporaire');
    setSpotifyWebPlaybackEnabled(true);
    expect(resolveSpotifyWebPlaybackActivation().active).toBe(true);
    recordSpotifyWebPhysicalValidation(false, null);
    const decision = resolveSpotifyWebPlaybackActivation();
    expect(decision.active).toBe(false);
    expect(decision.engines).toEqual(['audius-youtube']);
    expect(getSpotifyWebPhysicalValidationEvidence()).toBeNull();
  });

  it('la bascule du flag n’est pas une preuve de lecture : aucun état fabriqué', () => {
    setSpotifyWebPlaybackEnabled(true);
    // Aucun objet backend n’est instancié ni piloté par le module de flag ;
    // sa seule surface est décisionnelle. On vérifie l’absence d’effets :
    expect(isSpotifyWebPlaybackEnabled()).toBe(true);
    expect(resolveSpotifyWebPlaybackActivation().active).toBe(false);
  });
});

describe('garde-fou : le flag n’est PAS câblé au lecteur de production', () => {
  const PLAYER_SOURCES = [
    'context/PlayerContext.tsx',
    'services/player.ts',
    'services/mediaBridge.ts',
    'services/playbackSession.ts',
  ];

  it.each(PLAYER_SOURCES)(
    '%s n’importe ni n’invoque le mécanisme de sélection Spotify Web',
    (relative) => {
      const source = read(relative);
      expect(source).not.toMatch(/spotifyWebFeature/);
      expect(source).not.toMatch(/SpotifyWebBackend/);
      expect(source).not.toMatch(
        /resolveSpotifyWebPlaybackActivation|setSpotifyWebPlaybackEnabled/
      );
    }
  );

  it('l’ordre de cascade audio Audius → YouTube reste la source de vérité', () => {
    const source = read('services/audio/index.ts');
    expect(source).toMatch(/const ORDER = \['audius', 'youtube'\]/);
  });

  it('SpotifyWebBackend n’est construit qu’en dehors du lecteur (prototype)', () => {
    const consumers = [
      'screens/SpotifyWebPrototypeScreen.tsx',
      'app/settings/spotify-web-player.tsx',
    ];
    for (const consumer of consumers) {
      expect(fs.existsSync(path.join(ROOT, consumer))).toBe(true);
    }
    const playerSource = read('services/player.ts');
    expect(playerSource).not.toMatch(/new SpotifyWebBackend/);
  });
});
