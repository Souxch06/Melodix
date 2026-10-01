import * as React from 'react';

import { Slider } from '../../Slider';

import { getUserTopArtists } from '@api';
import { LibraryItemModel } from '@models';
import { Shapes, Sizes } from '@config';
import { translations } from '@data';

export type TopArtistsPropsType = {};

export const TopArtists = () => {
  const [topArtists, setTopArtists] = React.useState<LibraryItemModel[] | null>(
    [
      ...Array(3).fill({
        id: '',
        type: 'artist',
        title: '',
        imageURL: '',
        subtitle: '',
      }),
    ]
  );

  React.useEffect(() => {
    (async () => {
      try {
        const topArtistsData = await getUserTopArtists();
        setTopArtists(topArtistsData);
      } catch (error) {
        setTopArtists(null);
        console.error(error);
      }
    })();
  }, []);

  // Hidden when Spotify refuses the request (e.g. missing permission).
  if (!topArtists?.length) {
    return null;
  }

  return (
    <Slider
      title={translations.yourTopArtists(topArtists.length)}
      slides={topArtists}
      size={Sizes.MEDIUM}
      shape={Shapes.CIRCLE}
      withShowAll={true}
      // Contrat (M-6) : pas de page artiste dans l'application — les cartes
      // sont donc EXPLICITEMENT inertes (no-op), jamais une navigation vers
      // une route stub /artist/{id}. À retirer le jour où la page existe.
      onSlidePress={() => undefined}
    />
  );
};
