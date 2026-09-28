import * as React from 'react';
import { Redirect } from 'expo-router';

import { runAccountlessMigration, loadSession } from '@services';

/**
 * Point d'entrée.
 * 1. La migration des données existantes est jouée (favoris → bibliothèque
 *    locale, purge des stores obsolètes) sans jamais bloquer le démarrage ;
 * 2. une session Spotify persistante valide évite l'écran de connexion ;
 * 3. sinon, l'utilisateur arrive sur l'écran de connexion (le lien « Explorer
 *    sans compte » de cet écran garde l'accès libre à Melodix).
 */
export default function App() {
  const [target, setTarget] = React.useState<'/login' | '/home' | null>(null);

  React.useEffect(() => {
    let cancelled = false;

    (async () => {
      try {
        await runAccountlessMigration();
      } catch (error) {
        // La migration ne doit JAMAIS bloquer le démarrage (voir service).
        console.warn('Migration de démarrage interrompue', error);
      }

      const session = await loadSession();
      if (!cancelled) {
        setTarget(session ? '/home' : '/login');
      }
    })();

    return () => {
      cancelled = true;
    };
  }, []);

  if (!target) {
    return null;
  }

  return <Redirect href={{ pathname: target as '/login' | '/home', params: {} }} />;
}
