import * as React from 'react';
import { Pressable, View } from 'react-native';

import { fireEvent, render, waitFor } from '@testing-library/react-native';

import { UserDataProvider, useUserData } from '../UserDataContext';

const mockActions = {
  loadSession: jest.fn(),
  clearSession: jest.fn(async () => {}),
  clearPlaybackSession: jest.fn(async () => {}),
  stopPlayback: jest.fn(async () => {}),
  getCurrentUser: jest.fn(),
  invalidateUserPlaylistsCache: jest.fn(async () => {}),
};

jest.mock('@services', () => ({
  loadSession: (...args: never[]) => mockActions.loadSession(...(args as [])),
  clearSession: (...args: never[]) => mockActions.clearSession(...(args as [])),
  clearPlaybackSession: (...args: never[]) =>
    mockActions.clearPlaybackSession(...(args as [])),
  melodixPlayer: {
    stop: (...args: never[]) => mockActions.stopPlayback(...(args as [])),
  },
}));

jest.mock('@api', () => ({
  getCurrentUser: (...args: never[]) =>
    mockActions.getCurrentUser(...(args as [])),
  invalidateUserPlaylistsCache: (...args: never[]) =>
    mockActions.invalidateUserPlaylistsCache(...(args as [])),
}));

const spotifyUser = (id: string) => ({
  id,
  type: 'user' as const,
  displayName: `Spotify ${id}`,
  imageURL: '',
});

const deferred = <T,>() => {
  let resolve!: (value: T) => void;
  const promise = new Promise<T>((done) => {
    resolve = done;
  });
  return { promise, resolve };
};

const Probe = () => {
  const { userData, sessionStatus, signOut, reloadUserData } = useUserData();
  return (
    <>
      <View
        testID="user-state"
        // @ts-expect-error — props de vérification uniquement en test
        status={sessionStatus}
        userId={userData.id}
      />
      <Pressable testID="sign-out" onPress={() => void signOut()} />
      <Pressable testID="reload" onPress={() => void reloadUserData()} />
    </>
  );
};

describe('UserDataContext — réponses Spotify obsolètes', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    mockActions.loadSession.mockResolvedValue({ accessToken: 'stored' });
    mockActions.clearSession.mockResolvedValue(undefined);
    mockActions.clearPlaybackSession.mockResolvedValue(undefined);
    mockActions.stopPlayback.mockResolvedValue(undefined);
    mockActions.invalidateUserPlaylistsCache.mockResolvedValue(undefined);
  });

  it('un profil initial lent ne réapparaît jamais après déconnexion', async () => {
    const profile = deferred<ReturnType<typeof spotifyUser>>();
    mockActions.getCurrentUser.mockReturnValueOnce(profile.promise);

    const { getByTestId } = render(
      <UserDataProvider>
        <Probe />
      </UserDataProvider>
    );

    await waitFor(() =>
      expect(getByTestId('user-state').props.status).toBe('spotify')
    );
    fireEvent.press(getByTestId('sign-out'));
    await waitFor(() =>
      expect(getByTestId('user-state').props.status).toBe('local')
    );
    expect(mockActions.stopPlayback).toHaveBeenCalledTimes(1);
    expect(mockActions.clearPlaybackSession).toHaveBeenCalledTimes(1);
    expect(mockActions.clearSession).toHaveBeenCalledTimes(1);
    expect(mockActions.invalidateUserPlaylistsCache).toHaveBeenCalledTimes(1);

    profile.resolve(spotifyUser('stale'));
    await Promise.resolve();

    expect(getByTestId('user-state').props).toMatchObject({
      status: 'local',
      userId: 'melodix-local-user',
    });
  });

  it('un reload en vol ne remplace pas le profil local après déconnexion', async () => {
    mockActions.getCurrentUser.mockResolvedValueOnce(spotifyUser('initial'));
    const reload = deferred<ReturnType<typeof spotifyUser>>();
    mockActions.getCurrentUser.mockReturnValueOnce(reload.promise);

    const { getByTestId } = render(
      <UserDataProvider>
        <Probe />
      </UserDataProvider>
    );
    await waitFor(() =>
      expect(getByTestId('user-state').props.userId).toBe('initial')
    );

    fireEvent.press(getByTestId('reload'));
    fireEvent.press(getByTestId('sign-out'));
    await waitFor(() =>
      expect(getByTestId('user-state').props.status).toBe('local')
    );

    reload.resolve(spotifyUser('stale-reload'));
    await Promise.resolve();

    expect(getByTestId('user-state').props).toMatchObject({
      status: 'local',
      userId: 'melodix-local-user',
    });
  });
});
