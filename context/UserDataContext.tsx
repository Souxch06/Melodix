/**
 * Données de l'utilisateur courant, avec ou sans compte.
 *
 * États de session (voir context/spotifyIdentity.ts pour les règles) :
 * - 'local'              : aucun compte Spotify connecté (mode historique 3.0,
 *                          profil local synthétique — favoris et historique
 *                          restent 100 % local) ;
 * - 'spotify'            : compte connecté via OAuth PKCE ET profil du compte
 *                          VÉRIFIÉ (nom, photo, id Spotify réel) ;
 * - 'loading'            : restauration en cours — y compris le cas « session
 *                          trouvée, profil pas encore vérifié » ;
 * - 'spotify-unverified' : session stockée mais profil du compte indisponible
 *                          (réseau/401 transitoire) : état explicite, jamais
 *                          un compte local déguisé en compte Spotify.
 *
 * Invariant : `sessionStatus === 'spotify'` implique un `userData` Spotify
 * avec un identifiant réel — jamais `LOCAL_USER_ID`. Les écrans reçoivent
 * `spotifyDataPlan`, seule interprétation autorisée de cet état (chargement /
 * identité indisponible / local / compte vérifié).
 *
 * La session (tokens) est gérée par services/spotify/session (Keystore
 * chiffré). La déconnexion supprime tokens + cache playlists ; conservés :
 * favoris locaux, historique d'écoute, préférences (volume…).
 */
import * as React from 'react';

import { LOCAL_USER_ID } from '@config';
import { UserModel } from '@models';
import {
  clearPlaybackSession,
  clearSession,
  loadSession,
  melodixPlayer,
} from '@services';

import { getCurrentUser, invalidateUserPlaylistsCache } from '@api';

import {
  hasSpotifySession,
  isSpotifyAccountId,
  resolveSpotifyDataPlan,
  type SessionStatus,
  type SpotifyDataPlan,
} from './spotifyIdentity';

export { LOCAL_USER_ID };
export type { SessionStatus, SpotifyDataPlan };

export type UserDataProviderPropsType = {
  children: React.ReactNode;
};

export type UserContextType = {
  userData: UserModel;
  sessionStatus: SessionStatus;
  /**
   * Identité Spotify VÉRIFIÉE, ou `null`. Jamais `LOCAL_USER_ID`, jamais un
   * identifiant deviné : l'utiliser comme clé de cache est donc sûr.
   */
  spotifyAccountId: string | null;
  /** Seule interprétation autorisée de l'état pour charger des données. */
  spotifyDataPlan: SpotifyDataPlan;
  /** Rétention conservée : re-hydrate / retente la vérification du profil. */
  reloadUserData: () => Promise<void>;
  /** Le login a abouti : mémorise le profil et reflète 'spotify'. */
  applySpotifyUser: (user: UserModel) => void;
  /** Déconnexion complète : purge session + caches liés au compte. */
  signOut: () => Promise<void>;
};

const localUserData: UserModel = {
  id: LOCAL_USER_ID,
  type: 'user',
  displayName: 'Mélomane',
  imageURL: '',
};

export const UserDataContext = React.createContext<UserContextType>({
  userData: localUserData,
  sessionStatus: 'loading',
  spotifyAccountId: null,
  spotifyDataPlan: { kind: 'restoring' },
  reloadUserData: async () => {},
  applySpotifyUser: () => {},
  signOut: async () => {},
});

export const UserDataProvider = ({ children }: UserDataProviderPropsType) => {
  const [status, setStatus] = React.useState<SessionStatus>('loading');
  const [user, setUser] = React.useState<UserModel>(localUserData);
  // Invalide toute réponse profil appartenant à une ancienne session. Sans
  // ce jeton, un refresh lent pouvait remettre l'utilisateur Spotify après
  // une déconnexion déjà terminée.
  const accountGenerationRef = React.useRef(0);

  // Restauration au démarrage : une session persistante doit éviter de
  // repasser par l'écran de connexion à chaque lancement. L'état 'spotify'
  // n'est publié qu'APRÈS vérification du profil : tant que `getCurrentUser`
  // n'a pas répondu, on reste en 'loading' (aucun écran ne peut prendre
  // `localUserData` pour le compte connecté).
  React.useEffect(() => {
    let cancelled = false;

    const generation = accountGenerationRef.current;

    (async () => {
      const session = await loadSession();

      if (cancelled || generation !== accountGenerationRef.current) {
        return;
      }

      if (!session) {
        setStatus('local');
        return;
      }

      try {
        const freshUser = await getCurrentUser();

        if (cancelled || generation !== accountGenerationRef.current) {
          return;
        }

        if (!isSpotifyAccountId(freshUser?.id)) {
          // Réponse sans identifiant Spotify exploitable : session présente,
          // identité non établie — état explicite, jamais un faux 'spotify'.
          setUser(localUserData);
          setStatus('spotify-unverified');
          return;
        }

        setUser({ ...freshUser, id: freshUser.id.trim() });
        setStatus('spotify');
      } catch (error) {
        // Session présente mais profil inaccessible (offline, 401
        // transitoire) : état explicite 'spotify-unverified'. L'utilisateur
        // n'est PAS déconnecté et aucun écran ne reçoit d'identité locale.
        if (!cancelled && generation === accountGenerationRef.current) {
          console.warn('Initial Spotify profile refresh failed', error);
          setUser(localUserData);
          setStatus('spotify-unverified');
        }
      }
    })();

    return () => {
      cancelled = true;
    };
  }, []);

  const applySpotifyUser = React.useCallback((spotifyUser: UserModel) => {
    accountGenerationRef.current += 1;

    if (!isSpotifyAccountId(spotifyUser?.id)) {
      // Refus explicite : ne jamais promouvoir un profil sans identifiant
      // réel (ni le profil local) en compte Spotify connecté.
      console.warn('Ignored Spotify user without a real account id');
      setUser(localUserData);
      setStatus('spotify-unverified');
      return;
    }

    setUser({ ...spotifyUser, id: spotifyUser.id.trim() });
    setStatus('spotify');
  }, []);

  const signOut = React.useCallback(async () => {
    // Invalidation SYNCHRONE avant les I/O : aucun refresh déjà en vol ne
    // peut gagner la course pendant la purge SecureStore/cache.
    accountGenerationRef.current += 1;

    // La déconnexion est aussi une frontière de lecture. `stop()` invalide
    // immédiatement toute résolution en vol, décharge le son puis projette
    // l'état vide vers le bridge natif (notification + MediaSession arrêtées).
    // La purge explicite couvre également une carte « Reprendre » chargée
    // avant que le moteur n'ait eu un morceau courant.
    const cleanup = await Promise.allSettled([
      melodixPlayer.stop(),
      clearPlaybackSession(),
      clearSession(),
      invalidateUserPlaylistsCache(),
    ]);

    // SecureStore traite déjà sa suppression en best-effort. Les autres
    // nettoyages ne doivent jamais laisser l'ancienne identité à l'écran si
    // un stockage secondaire est momentanément indisponible.
    if (cleanup.some((result) => result.status === 'rejected')) {
      console.warn('Some local sign-out cleanup could not be completed');
    }
    setUser(localUserData);
    setStatus('local');
  }, []);

  /**
   * - 'spotify' : re-hydrate le profil (un échec ne remet pas en cause une
   *   identité DÉJÀ vérifiée) ;
   * - 'spotify-unverified' : RETENTE la vérification de l'identité ;
   * - 'local' / 'loading' : sans objet.
   */
  const reloadUserData = React.useCallback(async () => {
    if (status === 'local' || status === 'loading') {
      return;
    }

    const generation = accountGenerationRef.current;
    const wasVerified = status === 'spotify';

    try {
      const freshUser = await getCurrentUser();

      if (generation !== accountGenerationRef.current) {
        return;
      }

      if (!isSpotifyAccountId(freshUser?.id)) {
        setUser(localUserData);
        setStatus('spotify-unverified');
        return;
      }

      setUser({ ...freshUser, id: freshUser.id.trim() });
      setStatus('spotify');
    } catch (error) {
      if (generation !== accountGenerationRef.current) {
        return;
      }

      if (wasVerified) {
        // Identité déjà établie : le refresh échoue, elle reste valable.
        console.warn('Profile refresh failed', error);
        return;
      }

      console.warn('Spotify identity verification failed', error);
      setStatus('spotify-unverified');
    }
  }, [status]);

  const spotifyAccountId = React.useMemo(
    () =>
      status === 'spotify' && isSpotifyAccountId(user.id)
        ? user.id.trim()
        : null,
    [status, user.id]
  );

  const spotifyDataPlan = React.useMemo(
    () => resolveSpotifyDataPlan(status, spotifyAccountId),
    [status, spotifyAccountId]
  );

  const value = React.useMemo<UserContextType>(
    () => ({
      userData: user,
      sessionStatus: status,
      spotifyAccountId,
      spotifyDataPlan,
      reloadUserData,
      applySpotifyUser,
      signOut,
    }),
    [
      user,
      status,
      spotifyAccountId,
      spotifyDataPlan,
      reloadUserData,
      applySpotifyUser,
      signOut,
    ]
  );

  return (
    <UserDataContext.Provider value={value}>
      {children}
    </UserDataContext.Provider>
  );
};

/** Accès aux informations/état du compte (voir usePlayer pour le pattern). */
export const useUserData = (): UserContextType =>
  React.useContext(UserDataContext);

/** Session Spotify stockée (profil vérifié ou non) — utilitaire partagé. */
export { hasSpotifySession, isSpotifyAccountId };
