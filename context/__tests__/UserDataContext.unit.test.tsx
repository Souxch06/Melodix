/**
 * CONTEXTE UTILISATEUR — identité Spotify fiable.
 *
 * Règle testée ici, au niveau de la SOURCE DE VÉRITÉ (et pas seulement des
 * écrans) : `sessionStatus === 'spotify'` implique toujours un `userData`
 * Spotify avec un identifiant RÉEL. Il est donc impossible d'obtenir
 * « session Spotify + profil pas encore récupéré + profil local ».
 */
import * as React from 'react';
import { Pressable, View } from 'react-native';

import {
  fireEvent,
  render,
  screen,
  waitFor,
} from '@testing-library/react-native';

import {
  LOCAL_USER_ID,
  UserDataProvider,
  useUserData,
} from '../UserDataContext';

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
  let reject!: (reason?: unknown) => void;
  const promise = new Promise<T>((done, fail) => {
    resolve = done;
    reject = fail;
  });
  return { promise, resolve, reject };
};

type ObservedState = {
  status: string;
  userId: string;
  accountId: string;
  planKind: string;
};

/**
 * Le harnais n'utilise que des props RÉELLES de React Native : l'état observé
 * est encodé dans le testID (aucune prop inventée, aucun `as any`). Le
 * contexte réel est celui du provider, pas un stub.
 */
const Probe = () => {
  const {
    userData,
    sessionStatus,
    spotifyAccountId,
    spotifyDataPlan,
    signOut,
    reloadUserData,
    applySpotifyUser,
  } = useUserData();

  return (
    <>
      <View
        testID={`user-state|${sessionStatus}|${userData.id}|${
          spotifyAccountId ?? 'none'
        }|${spotifyDataPlan.kind}`}
      />
      <Pressable testID="sign-out" onPress={() => void signOut()} />
      <Pressable testID="reload" onPress={() => void reloadUserData()} />
      <Pressable
        testID="apply-a"
        onPress={() => applySpotifyUser(spotifyUser('account-a'))}
      />
      <Pressable
        testID="apply-b"
        onPress={() => applySpotifyUser(spotifyUser('account-b'))}
      />
      <Pressable
        testID="apply-local-profile"
        onPress={() =>
          applySpotifyUser({
            id: LOCAL_USER_ID,
            type: 'user',
            displayName: 'Mélomane',
            imageURL: '',
          })
        }
      />
    </>
  );
};

const observedState = (): ObservedState => {
  const node = screen.getByTestId(/^user-state\|/);
  const [, status, userId, accountId, planKind] = String(
    node.props.testID
  ).split('|');

  return { status, userId, accountId, planKind };
};

const renderProvider = () =>
  render(
    <UserDataProvider>
      <Probe />
    </UserDataProvider>
  );

describe('UserDataContext — identité Spotify pendant la restauration', () => {
  beforeEach(() => {
    jest.clearAllMocks();
    mockActions.loadSession.mockResolvedValue({ accessToken: 'stored' });
    mockActions.clearSession.mockResolvedValue(undefined);
    mockActions.clearPlaybackSession.mockResolvedValue(undefined);
    mockActions.stopPlayback.mockResolvedValue(undefined);
    mockActions.invalidateUserPlaylistsCache.mockResolvedValue(undefined);
  });

  it("restauration réussie : 'spotify' seulement APRÈS un profil au vrai id", async () => {
    const profile = deferred<ReturnType<typeof spotifyUser>>();
    mockActions.getCurrentUser.mockReturnValueOnce(profile.promise);

    renderProvider();

    // Session trouvée, profil pas encore vérifié : état de chargement, et
    // SURTOUT pas « spotify » avec l'identité locale.
    await waitFor(() => expect(observedState().status).toBe('loading'));
    expect(observedState()).toMatchObject({
      userId: LOCAL_USER_ID,
      accountId: 'none',
      planKind: 'restoring',
    });

    profile.resolve(spotifyUser('account-a'));

    await waitFor(() => expect(observedState().status).toBe('spotify'));
    expect(observedState()).toMatchObject({
      userId: 'account-a',
      accountId: 'account-a',
      planKind: 'spotify',
    });
  });

  it('échec de getCurrentUser : état explicite, identité inexploitable', async () => {
    mockActions.getCurrentUser.mockRejectedValueOnce(new Error('offline'));

    renderProvider();

    await waitFor(() =>
      expect(observedState().status).toBe('spotify-unverified')
    );
    expect(observedState()).toMatchObject({
      userId: LOCAL_USER_ID,
      accountId: 'none',
      planKind: 'identity-unavailable',
    });
    // La session n'est PAS purgée : l'utilisateur n'est pas déconnecté.
    expect(mockActions.clearSession).not.toHaveBeenCalled();
  });

  it('réponse sans id Spotify exploitable : refus explicite, jamais un faux compte', async () => {
    mockActions.getCurrentUser.mockResolvedValueOnce({
      id: LOCAL_USER_ID,
      type: 'user',
      displayName: 'Mélomane',
      imageURL: '',
    });

    renderProvider();

    await waitFor(() =>
      expect(observedState().status).toBe('spotify-unverified')
    );
    expect(observedState()).toMatchObject({
      userId: LOCAL_USER_ID,
      accountId: 'none',
    });
  });

  it('aucune session stockée : mode invité local (comportement historique)', async () => {
    mockActions.loadSession.mockResolvedValueOnce(null);

    renderProvider();

    await waitFor(() => expect(observedState().status).toBe('local'));
    expect(observedState()).toMatchObject({
      userId: LOCAL_USER_ID,
      accountId: 'none',
      planKind: 'local',
    });
    expect(mockActions.getCurrentUser).not.toHaveBeenCalled();
  });

  it('reloadUserData depuis spotify-unverified retente et identifie le compte', async () => {
    mockActions.getCurrentUser.mockRejectedValueOnce(new Error('offline'));

    renderProvider();
    await waitFor(() =>
      expect(observedState().status).toBe('spotify-unverified')
    );

    mockActions.getCurrentUser.mockResolvedValueOnce(spotifyUser('account-a'));
    fireEvent.press(screen.getByTestId('reload'));

    await waitFor(() => expect(observedState().status).toBe('spotify'));
    expect(observedState()).toMatchObject({
      userId: 'account-a',
      accountId: 'account-a',
    });
  });

  it('changement de compte A → déconnexion → B : B remplace bien A', async () => {
    mockActions.loadSession.mockResolvedValueOnce(null);

    renderProvider();
    await waitFor(() => expect(observedState().status).toBe('local'));

    fireEvent.press(screen.getByTestId('apply-a'));
    await waitFor(() => expect(observedState().status).toBe('spotify'));
    expect(observedState().accountId).toBe('account-a');

    fireEvent.press(screen.getByTestId('sign-out'));
    await waitFor(() => expect(observedState().status).toBe('local'));
    expect(observedState()).toMatchObject({
      userId: LOCAL_USER_ID,
      accountId: 'none',
    });

    fireEvent.press(screen.getByTestId('apply-b'));
    await waitFor(() => expect(observedState().status).toBe('spotify'));
    expect(observedState()).toMatchObject({
      userId: 'account-b',
      accountId: 'account-b',
    });
  });

  it('applySpotifyUser refuse un profil local (jamais un compte Spotify)', async () => {
    mockActions.loadSession.mockResolvedValueOnce(null);

    renderProvider();
    await waitFor(() => expect(observedState().status).toBe('local'));

    fireEvent.press(screen.getByTestId('apply-local-profile'));

    await waitFor(() =>
      expect(observedState().status).toBe('spotify-unverified')
    );
    expect(observedState()).toMatchObject({ accountId: 'none' });
  });

  it('un profil initial lent ne réapparaît jamais après déconnexion', async () => {
    const profile = deferred<ReturnType<typeof spotifyUser>>();
    mockActions.getCurrentUser.mockReturnValueOnce(profile.promise);

    renderProvider();

    await waitFor(() => expect(observedState().status).toBe('loading'));
    fireEvent.press(screen.getByTestId('sign-out'));
    await waitFor(() => expect(observedState().status).toBe('local'));
    expect(mockActions.stopPlayback).toHaveBeenCalledTimes(1);
    expect(mockActions.clearPlaybackSession).toHaveBeenCalledTimes(1);
    expect(mockActions.clearSession).toHaveBeenCalledTimes(1);
    expect(mockActions.invalidateUserPlaylistsCache).toHaveBeenCalledTimes(1);

    profile.resolve(spotifyUser('stale'));
    await Promise.resolve();

    expect(observedState()).toMatchObject({
      status: 'local',
      userId: LOCAL_USER_ID,
      accountId: 'none',
    });
  });

  it('un reload en vol ne remplace pas le profil local après déconnexion', async () => {
    mockActions.getCurrentUser.mockResolvedValueOnce(spotifyUser('initial'));
    const reload = deferred<ReturnType<typeof spotifyUser>>();
    mockActions.getCurrentUser.mockReturnValueOnce(reload.promise);

    renderProvider();
    await waitFor(() => expect(observedState().userId).toBe('initial'));

    fireEvent.press(screen.getByTestId('reload'));
    fireEvent.press(screen.getByTestId('sign-out'));
    await waitFor(() => expect(observedState().status).toBe('local'));

    reload.resolve(spotifyUser('stale-reload'));
    await Promise.resolve();

    expect(observedState()).toMatchObject({
      status: 'local',
      userId: LOCAL_USER_ID,
      accountId: 'none',
    });
  });
});
