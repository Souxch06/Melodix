import * as React from 'react';
import { render } from '@testing-library/react-native';

import { translations } from '@data';

import { firstNameOf, Greeting, greetingForHour } from '../Greeting';

jest.mock('@context', () => ({
  useUserData: () => ({
    userData: { id: 'u1', displayName: 'Julien Martin', imageURL: '' },
    sessionStatus: 'spotify',
  }),
}));

describe('Greeting — salutation personnalisée de l accueil', () => {
  afterEach(() => {
    jest.restoreAllMocks();
  });

  it("extrait le prénom du nom d'affichage Spotify", () => {
    expect(firstNameOf('Julien Martin')).toBe('Julien');
    expect(firstNameOf('Mélomane')).toBe('Mélomane');
    expect(firstNameOf('  Ana Lucía  Díaz ')).toBe('Ana');
  });

  it("choisit le message selon l'heure locale", () => {
    expect(greetingForHour(8, 'Julien')).toBe(
      translations.homeGreetingMorning('Julien')
    );
    expect(greetingForHour(20, 'Julien')).toBe(
      translations.homeGreetingEvening('Julien')
    );
    expect(greetingForHour(23, 'Julien')).toBe(
      translations.homeGreetingNight('Julien')
    );
    expect(greetingForHour(2, 'Julien')).toBe(
      translations.homeGreetingNight('Julien')
    );
  });

  it('affiche « Bonsoir, Julien 👋 » à 20 h + la question d écoute', () => {
    jest.spyOn(Date.prototype, 'getHours').mockReturnValue(20);

    const { getByTestId } = render(<Greeting />);

    expect(getByTestId('home-greeting-text').props.children).toBe(
      'Bonsoir, Julien 👋'
    );
    expect(getByTestId('home-greeting-prompt').props.children).toBe(
      'Qu’est-ce que tu veux écouter ?'
    );
  });

  it('affiche « Bonjour, Julien 👋 » à 9 h', () => {
    jest.spyOn(Date.prototype, 'getHours').mockReturnValue(9);

    const { getByTestId } = render(<Greeting />);

    expect(getByTestId('home-greeting-text').props.children).toBe(
      'Bonjour, Julien 👋'
    );
  });
});
