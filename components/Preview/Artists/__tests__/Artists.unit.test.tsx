import * as React from 'react';
import { useRouter, useSegments } from 'expo-router';
import {
  render,
  fireEvent,
  RenderResult,
  within,
} from '@testing-library/react-native';
import { Artists, ArtistsPropsType } from '../Artists';

jest.mock('expo-router', () => ({
  useRouter: jest.fn(),
  useSegments: jest.fn(),
}));

enum TEST_IDS {
  ARTIST_IMAGE = 'artist-image',
  ARTIST_NAME = 'artist-name',
  ARTIST_LINK_ID_1 = 'artist-link-id_1',
  ARTIST_LINK_ID_2 = 'artist-link-id_2',
}

describe('Artists', () => {
  let container: RenderResult;
  const mockRouter = jest.fn();
  const defaultProps: ArtistsPropsType = {
    artists: [
      {
        type: 'artist',
        id: 'id_1',
        name: 'Artist Name 1 mock',
        imageURL: 'url 1',
      },
      {
        type: 'artist',
        id: 'id_2',
        name: 'Artist Name 2 mock',
        imageURL: 'url 2',
      },
    ],
  };

  beforeEach(() => {
    (useRouter as jest.Mock).mockReturnValue({ push: mockRouter });
    (useSegments as jest.Mock).mockReturnValue(['(tabs)', 'home']);
    container = render(<Artists {...defaultProps} />);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('renders correctly', () => {
    expect(container.getByTestId(TEST_IDS.ARTIST_LINK_ID_1)).toBeTruthy();
    expect(container.getByTestId(TEST_IDS.ARTIST_LINK_ID_2)).toBeTruthy();
  });

  describe('Navigation - Press logic', () => {
    it('navigates to the artist page of the current tab with given ID', () => {
      fireEvent.press(container.getByTestId(TEST_IDS.ARTIST_LINK_ID_1));
      expect(mockRouter).toHaveBeenCalledWith('/(tabs)/home/artist/id_1');
    });

    it('navigates to the second artist page with given ID', () => {
      fireEvent.press(container.getByTestId(TEST_IDS.ARTIST_LINK_ID_2));
      expect(mockRouter).toHaveBeenCalledWith('/(tabs)/home/artist/id_2');
    });
  });

  describe('UI', () => {
    it('passes properly props to Image component for each artist', () => {
      const images = container.getAllByTestId(TEST_IDS.ARTIST_IMAGE);

      images.forEach((image, index) => {
        // expo-image normalise `source` en tableau d'objets { uri }.
        const firstSource = Array.isArray(image.props.source)
          ? image.props.source[0]
          : image.props.source;
        expect(firstSource.uri).toEqual(defaultProps.artists![index].imageURL);
      });
    });

    it('displays artist name(s) inside Text components', () => {
      const texts = container.getAllByTestId(TEST_IDS.ARTIST_NAME);

      texts.forEach((text, index) => {
        expect(
          within(text).queryByText(defaultProps.artists![index].name)
        ).toBeTruthy();
      });
    });
  });

  describe('empty / fallback', () => {
    it('renders nothing when artists is null', () => {
      const { queryByTestId } = render(<Artists artists={null} />);
      expect(queryByTestId(TEST_IDS.ARTIST_IMAGE)).toBeNull();
    });

    it('renders nothing when an artist has an empty id (fallback state)', () => {
      const props: ArtistsPropsType = {
        artists: [{ type: 'artist', id: '', name: '', imageURL: '' }],
      };
      const { queryByTestId } = render(<Artists {...props} />);
      expect(queryByTestId(TEST_IDS.ARTIST_IMAGE)).toBeNull();
    });
  });
});
