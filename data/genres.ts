/**
 * Genres « Parcourir » — catalogue STATIQUE local.
 * Remplace l'ancien /browse/categories de Spotify (qui exigeait un compte).
 *
 * Remarque : au 28/09/2026, aucun écran ne consomme encore
 * getBrowseCategories ; le catalogue est là pour garder la surface d'API
 * fonctionnelle (future section « Parcourir »). imageURL est volontairement
 * vide : le composant consommateur devra fournir un visuel de repli.
 */

import { BrowseCategoryModel } from '@models';

export const BROWSE_GENRES: BrowseCategoryModel[] = [
  { id: 'electronic', title: 'Électronique', imageURL: '' },
  { id: 'hiphop', title: 'Hip-Hop / Rap', imageURL: '' },
  { id: 'pop', title: 'Pop', imageURL: '' },
  { id: 'rock', title: 'Rock', imageURL: '' },
  { id: 'jazz', title: 'Jazz', imageURL: '' },
  { id: 'classical', title: 'Classique', imageURL: '' },
  { id: 'ambient', title: 'Ambient', imageURL: '' },
  { id: 'world', title: 'Musiques du monde', imageURL: '' },
];
