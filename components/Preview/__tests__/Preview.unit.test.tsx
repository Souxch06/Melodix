/**
 * I-2 — CONTENU RÉEL des PlayerTrack produits par Preview : durée + album de
 * la source voyagent jusqu'à playQueue (lecture) et au menu « ⋯ », exactement
 * comme le badge de disponibilité (usePlaylistResolutions). Sans eux, le
 * matcher recroisait un morceau homonyme d'un autre album.
 */
import * as React from 'react';

import { FlatList } from 'react-native';
import { fireEvent, render } from '@testing-library/react-native';

import type { TrackModel } from '@models';
import type { PlayerTrack } from '@services';

import { Preview } from '../Preview';

const mockPlayQueue = jest.fn(
  async (_queue: PlayerTrack[], _startIndex: number) => {}
);
const mockTogglePlayPause = jest.fn(async () => {});

jest.mock('expo-router', () => ({
  useNavigation: () => ({ goBack: jest.fn() }),
}));

jest.mock('react-native-safe-area-context', () => ({
  useSafeAreaInsets: () => ({ top: 24, bottom: 34, left: 0, right: 0 }),
}));

jest.mock('@context', () => ({
  usePlayer: () => ({
    current: null,
    status: 'idle',
    hasActiveSession: false,
    playQueue: mockPlayQueue,
    togglePlayPause: mockTogglePlayPause,
    addToQueue: jest.fn(),
    playNext: jest.fn(),
  }),
  useUserData: () => ({ userData: { id: 'someone-else' } }),
}));

jest.mock('@hooks', () => ({
  useApplicationDimensions: () => ({ width: 400, height: 800 }),
}));

// Capture le morceau ouvert par le menu « ⋯ » pour en inspecter le contenu.
type CapturedTrack = {
  id: string;
  title: string;
  artists: string[];
  album: string | null;
  durationMillis: number | null;
  source: unknown;
} | null;

const mockCaptured: { current: CapturedTrack } = { current: null };

jest.mock('../../Player/QueueActionMenu', () => ({
  QueueActionMenu: ({ track }: { track: CapturedTrack }) => {
    mockCaptured.current = track;
    return null;
  },
}));

const baseProps = {
  id: 'src-id',
  imageURL: '',
  headerTitle: 'Header',
  summaryTitle: 'Source Title',
  summarySubtitle: 'Subtitle',
  summaryInfo: 'Info',
};

const mkTrack = (overrides: Partial<TrackModel> = {}): TrackModel => ({
  id: 't1',
  title: 'Song One',
  subtitle: 'Artist A, Artist B',
  imageURL: '',
  durationMs: 201_000,
  albumName: 'Album X',
  ...overrides,
});

beforeEach(() => {
  mockPlayQueue.mockClear();
  mockCaptured.current = null;
});

describe('Preview — PlayerTrack propagés (I-2)', () => {
  it('playlist : pression → playQueue avec durée + album du morceau', () => {
    const { getByText } = render(
      <Preview type="playlist" {...baseProps} tracks={[mkTrack()]} />
    );

    fireEvent.press(getByText('Song One'));

    expect(mockPlayQueue).toHaveBeenCalledTimes(1);
    const [queue, startIndex] = mockPlayQueue.mock.calls[0];
    expect(startIndex).toBe(0);
    expect(queue[0]).toMatchObject({
      id: 'spotify:t1',
      title: 'Song One',
      artists: ['Artist A', 'Artist B'],
      durationMillis: 201_000,
      album: 'Album X',
      source: { provider: null, id: 't1' },
    });
  });

  it('album : album retenu = titre de l album si la ligne n en porte pas', () => {
    const { getByText } = render(
      <Preview
        type="album"
        {...baseProps}
        summaryTitle="The Album"
        tracks={[mkTrack({ albumName: null })]}
      />
    );

    fireEvent.press(getByText('Song One'));

    const [queue] = mockPlayQueue.mock.calls[0];
    expect(queue[0].album).toBe('The Album');
  });

  it('album : albumName de la ligne reste prioritaire s il est explicite', () => {
    const { getByText } = render(
      <Preview
        type="album"
        {...baseProps}
        summaryTitle="The Album"
        tracks={[mkTrack({ id: 't9', title: 'Explicit', albumName: 'Other' })]}
      />
    );

    fireEvent.press(getByText('Explicit'));

    const [queue] = mockPlayQueue.mock.calls[0];
    expect(queue[0].album).toBe('Other');
  });

  it('source incomplète : durée/album null propagés, jamais d invention', () => {
    const { getByText } = render(
      <Preview
        type="playlist"
        {...baseProps}
        tracks={[mkTrack({ durationMs: null, albumName: null })]}
      />
    );

    fireEvent.press(getByText('Song One'));

    const [queue] = mockPlayQueue.mock.calls[0];
    expect(queue[0].durationMillis).toBeNull();
    expect(queue[0].album).toBeNull();
  });

  it('menu « ⋯ » : même contenu PlayerTrack que la lecture (badge = lecture)', () => {
    const { getAllByTestId } = render(
      <Preview
        type="playlist"
        {...baseProps}
        tracks={[mkTrack({ id: 't1', albumName: 'Album X' })]}
      />
    );

    fireEvent.press(getAllByTestId('track-actions')[0]);

    expect(mockCaptured.current).toMatchObject({
      id: 'spotify:t1',
      title: 'Song One',
      artists: ['Artist A', 'Artist B'],
      durationMillis: 201_000,
      album: 'Album X',
      source: { provider: null, id: 't1' },
    });
  });

  it('menu « ⋯ » album : repli sur le titre de l album pour les lignes nues', () => {
    const { getAllByTestId } = render(
      <Preview
        type="album"
        {...baseProps}
        summaryTitle="The Album"
        tracks={[mkTrack({ albumName: null, durationMs: null })]}
      />
    );

    fireEvent.press(getAllByTestId('track-actions')[0]);

    expect(mockCaptured.current?.album).toBe('The Album');
    expect(mockCaptured.current?.durationMillis).toBeNull();
  });
});

describe('Preview — pagination catalogue (I-6)', () => {
  it('fetchTracks est branché sur la FIN de liste, jamais sur le début', () => {
    const mockFetchTracks = jest.fn();
    const { UNSAFE_getByType } = render(
      <Preview
        type="playlist"
        {...baseProps}
        tracks={[mkTrack()]}
        fetchTracks={mockFetchTracks}
      />
    );

    const list = UNSAFE_getByType(FlatList);
    expect(list.props.onEndReached).toBe(mockFetchTracks);
    expect(list.props.onStartReached).toBeUndefined();
  });

  it('arrivée en bas → page suivante demandée (un appel par franchissement)', () => {
    const mockFetchTracks = jest.fn();
    const { UNSAFE_getByType } = render(
      <Preview
        type="playlist"
        {...baseProps}
        tracks={[mkTrack()]}
        fetchTracks={mockFetchTracks}
      />
    );

    const list = UNSAFE_getByType(FlatList);
    list.props.onEndReached();

    expect(mockFetchTracks).toHaveBeenCalledTimes(1);
  });

  it('sans fetchTracks : aucun déclencheur de pagination', () => {
    const { UNSAFE_getByType } = render(
      <Preview type="album" {...baseProps} tracks={[mkTrack()]} />
    );

    const list = UNSAFE_getByType(FlatList);
    expect(list.props.onEndReached).toBeUndefined();
    expect(list.props.onStartReached).toBeUndefined();
  });
});
