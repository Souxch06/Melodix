/**
 * PreferencesContext — le chargement Paramètres réel :
 *  1. Au démarrage, les réglages restaurés s'appliquent AU MOTEUR audio
 *     (volume au démarrage, lecture en arrière-plan) — pas de décor.
 *  2. Chaque setter persiste immédiatement dans le stockage local.
 *  3. Le basculement de langue expose le dictionnaire anglais complet.
 */
import * as React from 'react';
import { Pressable, Text } from 'react-native';

import { fireEvent, render, waitFor } from '@testing-library/react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';

import { translations } from '@data';

import { PREFERENCES_STORAGE_KEY } from '../../services/preferences';
import { PreferencesProvider, usePreferences } from '../PreferencesContext';

// Le moteur audio est branché mais simulé (jamais démarré en test). Les
// jest.fn sont créés DANS la factory (exécutée avant les const du fichier).
jest.mock('../../services/player', () => ({
  melodixPlayer: {
    setVolume: jest.fn(async () => {}),
    setStaysActiveInBackground: jest.fn(async () => {}),
  },
}));

const { melodixPlayer: mockPlayer } = jest.requireMock('../../services/player');
const mockSetVolume: jest.Mock = mockPlayer.setVolume;
const mockSetBackground: jest.Mock = mockPlayer.setStaysActiveInBackground;

const Consumer = () => {
  const prefs = usePreferences();

  return (
    <>
      <Text testID="title">{prefs.t.settingsTitle}</Text>
      <Text testID="loading">{String(prefs.loading)}</Text>
      <Text testID="volume">{String(prefs.startupVolume)}</Text>
      <Text testID="background">{String(prefs.backgroundAudio)}</Text>
      <Text testID="accent">{prefs.accentHex}</Text>
      <Pressable onPress={() => prefs.setLanguage('en')} testID="set-en">
        <Text>en</Text>
      </Pressable>
      <Pressable onPress={() => prefs.setStartupVolume(70)} testID="set-volume">
        <Text>volume</Text>
      </Pressable>
      <Pressable
        onPress={() => prefs.setBackgroundAudio(false)}
        testID="set-background"
      >
        <Text>background</Text>
      </Pressable>
      <Pressable onPress={() => prefs.setAccent('violet')} testID="set-accent">
        <Text>accent</Text>
      </Pressable>
    </>
  );
};

const renderWithProvider = () =>
  render(
    <PreferencesProvider>
      <Consumer />
    </PreferencesProvider>
  );

describe('PreferencesProvider — restauration et application réelle', () => {
  beforeEach(async () => {
    await AsyncStorage.clear();
    mockSetVolume.mockClear();
    mockSetBackground.mockClear();
  });

  it('démarre sur les défauts (français, titre « Paramètres ») sans réglage stocké', async () => {
    const { getByTestId } = renderWithProvider();

    await waitFor(() =>
      expect(getByTestId('loading').props.children).toBe('false')
    );

    expect(getByTestId('title').props.children).toBe('Paramètres');
    expect(getByTestId('volume').props.children).toBe('100');
    expect(getByTestId('background').props.children).toBe('true');
    expect(getByTestId('accent').props.children).toBe('#1ed760');
    // Application RÉELLE au moteur : volume 100 % (échelle 0..1).
    expect(mockSetVolume).toHaveBeenCalledWith(1);
    expect(mockSetBackground).toHaveBeenCalledWith(true);
  });

  it('restaure les réglages stockés et applique volume/arrière-plan au moteur', async () => {
    await AsyncStorage.setItem(
      PREFERENCES_STORAGE_KEY,
      JSON.stringify({
        language: 'en',
        themeMode: 'dark',
        accent: 'bleu',
        backgroundAudio: false,
        startupVolume: 30,
      })
    );

    const { getByTestId } = renderWithProvider();

    await waitFor(() =>
      expect(getByTestId('loading').props.children).toBe('false')
    );

    // Anglais restauré : le dictionnaire expose les vraies clés EN.
    expect(getByTestId('title').props.children).toBe('Settings');
    expect(getByTestId('volume').props.children).toBe('30');
    expect(getByTestId('background').props.children).toBe('false');
    expect(getByTestId('accent').props.children).toBe('#3b82f6');
    // 30 % stockés → 0.3 côté expo-av (ÉCHELLE RÉELLE du moteur).
    expect(mockSetVolume).toHaveBeenCalledWith(0.3);
    expect(mockSetBackground).toHaveBeenCalledWith(false);
  });

  it('le basculement de langue donne le dictionnaire anglais complet et persiste', async () => {
    const { getByTestId } = renderWithProvider();

    await waitFor(() =>
      expect(getByTestId('loading').props.children).toBe('false')
    );

    fireEvent.press(getByTestId('set-en'));

    expect(getByTestId('title').props.children).toBe('Settings');

    await waitFor(() => {
      expect(AsyncStorage.setItem).toHaveBeenCalledWith(
        PREFERENCES_STORAGE_KEY,
        expect.stringContaining('"language":"en"')
      );
    });
  });

  it('chaque setter persiste ET applique le réglage moteur correspondant', async () => {
    const { getByTestId } = renderWithProvider();

    await waitFor(() =>
      expect(getByTestId('loading').props.children).toBe('false')
    );

    fireEvent.press(getByTestId('set-volume'));
    expect(mockSetVolume).toHaveBeenCalledWith(0.7);

    fireEvent.press(getByTestId('set-background'));
    expect(mockSetBackground).toHaveBeenCalledWith(false);

    fireEvent.press(getByTestId('set-accent'));
    expect(getByTestId('accent').props.children).toBe('#a855f7');

    await waitFor(() => {
      const writes = (AsyncStorage.setItem as jest.Mock).mock.calls.filter(
        ([key]) => key === PREFERENCES_STORAGE_KEY
      );
      expect(writes.some(([, raw]) => raw.includes('"startupVolume":70'))).toBe(
        true
      );
      expect(
        writes.some(([, raw]) => raw.includes('"backgroundAudio":false'))
      ).toBe(true);
      expect(writes.some(([, raw]) => raw.includes('"accent":"violet"'))).toBe(
        true
      );
    });
  });

  it('le dictionnaire par défaut reste celui de l application (FR)', () => {
    expect(translations.settingsTitle).toBe('Paramètres');
  });
});
