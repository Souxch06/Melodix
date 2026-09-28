import * as React from 'react';
import { Redirect } from 'expo-router';

import { runAccountlessMigration } from '@services';

/**
 * Point d'entrée : Melodix 3.0 n'a PLUS de gate de connexion.
 * On joue la migration des données existantes (favoris invité → bibliothèque
 * locale, purge des anciens stores de session), puis on entre directement
 * dans l'application.
 */
export default function App() {
  const [isReady, setIsReady] = React.useState(false);

  React.useEffect(() => {
    (async () => {
      try {
        await runAccountlessMigration();
      } catch (error) {
        // La migration ne doit JAMAIS bloquer le démarrage (voir service).
        console.warn('Migration de démarrage interrompue', error);
      } finally {
        setIsReady(true);
      }
    })();
  }, []);

  if (!isReady) {
    return null;
  }

  return <Redirect href={{ pathname: '/home', params: {} }} />;
}
