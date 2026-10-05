import * as React from 'react';
import { useLocalSearchParams } from 'expo-router';

import { SeeAllScreen } from '@screens';

/**
 * « Tout afficher » d'une section de l'accueil.
 * `kind` = clé de source (voir SEE_ALL_SOURCES), `seed` = artiste optionnel
 * pour les recommandations dérivées. Un `kind` inconnu affiche un état
 * explicite (jamais un écran blanc).
 */
export default function SeeAll() {
  const { kind, seed } = useLocalSearchParams<{
    kind?: string;
    seed?: string;
  }>();

  return <SeeAllScreen kind={kind ?? ''} seed={seed} />;
}
