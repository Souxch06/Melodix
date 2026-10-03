import * as React from 'react';
import { act, render, waitFor } from '@testing-library/react-native';

import { getRecommendations } from '@api';

import { Recommendations } from '../index';

jest.mock('@api', () => ({ getRecommendations: jest.fn() }));

jest.mock('../../Slider', () => {
  // Chargement dans la factory exigé par le hoisting de jest.mock.
  // eslint-disable-next-line @typescript-eslint/no-var-requires
  const ReactNative = require('react-native') as typeof import('react-native');
  return {
    Slider: ({ slides }: { slides: { title: string }[] | null }) => (
      <ReactNative.View>
        {slides?.map((slide) => (
          <ReactNative.Text key={slide.title}>{slide.title}</ReactNative.Text>
        ))}
      </ReactNative.View>
    ),
  };
});

const getRecommendationsMock = getRecommendations as jest.MockedFunction<
  typeof getRecommendations
>;

const album = (id: string, title: string) => ({
  id,
  type: 'album' as const,
  title,
  imageURL: '',
  subtitle: '',
});

describe('Recommendations — concurrence réseau', () => {
  beforeEach(() => getRecommendationsMock.mockReset());

  it("ignore la réponse d'un ancien seed arrivée après la réponse courante", async () => {
    let resolveOld!: (value: ReturnType<typeof album>[]) => void;
    const oldResponse = new Promise<ReturnType<typeof album>[]>((resolve) => {
      resolveOld = resolve;
    });

    getRecommendationsMock
      .mockReturnValueOnce(oldResponse)
      .mockResolvedValueOnce([album('new', 'Résultat courant')]);

    const screen = render(
      <Recommendations type="artist" seed="ancien-artiste" />
    );
    await waitFor(() => {
      expect(getRecommendationsMock).toHaveBeenCalledWith({
        artistSeed: 'ancien-artiste',
      });
    });
    screen.rerender(<Recommendations type="artist" seed="nouvel-artiste" />);

    await waitFor(() => {
      expect(screen.getByText('Résultat courant')).toBeTruthy();
    });

    await act(async () => {
      resolveOld([album('old', 'Résultat obsolète')]);
      await oldResponse;
    });

    expect(screen.queryByText('Résultat obsolète')).toBeNull();
    expect(screen.getByText('Résultat courant')).toBeTruthy();
  });

  it('un seed vide efface les résultats précédents sans requête', async () => {
    getRecommendationsMock.mockResolvedValue([album('a', 'Premier résultat')]);
    const screen = render(<Recommendations type="tracks" seed="track-1" />);

    await waitFor(() =>
      expect(screen.getByText('Premier résultat')).toBeTruthy()
    );
    screen.rerender(<Recommendations type="tracks" seed="" />);

    await waitFor(() =>
      expect(screen.queryByText('Premier résultat')).toBeNull()
    );
    expect(getRecommendationsMock).toHaveBeenCalledTimes(1);
  });
});
